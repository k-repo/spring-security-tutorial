package org.slevin.controller;

import java.util.List;

import javax.validation.Valid;

import org.slevin.common.Account;
import org.slevin.common.Role;
import org.slevin.dao.AccountDao;
import org.slevin.dao.RoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/accounts")
public class AccountController {

	private static int PAGES_MAX = 5;
	
	@Autowired
	AccountDao accountDao;

	@Autowired
	RoleDao roleDao;

	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ModelAndView getAllAccountsView(@RequestParam(value="p", required = false) String p) throws Exception {
		ModelAndView mav = pagination(p);
		return mav;
	}

	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(value = "/searchAccount", method = RequestMethod.GET)
	public ModelAndView searchAccountView(@RequestParam("q") String q)
			throws Exception {

		ModelAndView mav = findAccountsWithSameUsername(q);
		return mav;
	}

	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView newAccountForm() {
		ModelAndView mav = prepareNewModelAccount();
		return mav;
	}


	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(value = "/saveAccount", method = RequestMethod.POST)
	public String create(@ModelAttribute("newAccount") @Valid Account account,
			BindingResult result,
			@RequestParam("confirmPassword") String confirmPassword,
			@RequestParam("role") String role,
			SessionStatus status, Model model) throws Exception {
		
		return validateAndSaveAccount(account, result, confirmPassword, role,
				status, model);
	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable Long id) throws Exception {
		ModelAndView mav = prepareUpdateAccount(id);
		return mav;
	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String update(@PathVariable Long id,
			@ModelAttribute("editAccount") @Valid Account  account, BindingResult result,
			@RequestParam("role") String role, 
			SessionStatus status, Model model) throws Exception {
		return updateAccount(id, account, result, role, status, model);

	}


	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable Long id) throws Exception {
		ModelAndView mav = deleteAccount(id);
		return mav;
	}
	
	/*
	 * Details of functions
	 */

	private String updateAccount(Long id, Account account,
			BindingResult result, String role, SessionStatus status, Model model)
			throws Exception {
		String error;
		if(result.hasErrors()){
			error = result.getFieldError().getDefaultMessage();
			model.addAttribute("error", error);
			model.addAttribute("editAccount", accountDao.findById(id));
			model.addAttribute("editRole",roleDao.findByProperty("name", role).get(0) );
			return "/accounts/editAccount";
		}

		Account accountTmp = accountDao.findById(id);
		Role roleAccount = roleDao.findByProperty("username",
				accountTmp.getUsername()).get(0);

		account.setPassword(accountTmp.getPassword());
		roleAccount.setName(role);
		accountDao.merge(account);
		roleDao.merge(roleAccount);
		status.setComplete();
		return "redirect:/accounts/all";
	}


	private ModelAndView deleteAccount(Long id) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/accounts/all");
		Role roleAccount = roleDao.findByProperty("username",
				accountDao.findById(id).getUsername()).get(0);
		roleDao.remove(roleAccount.getId());
		accountDao.remove(id);
		return mav;
	}
	
	
	
	private ModelAndView pagination(String p) throws Exception {
		Long PAGES_COUNT = accountDao.count();
		Long numberOfPages =  PAGES_COUNT/PAGES_MAX;
		Long numberOfPagesModulo =  PAGES_COUNT%PAGES_MAX;
		int previousPage=0;
        int nextPage=0;
        if(numberOfPagesModulo>0){
            numberOfPages++;
        }
		int page = 1;
		if(p != null){
            page = Integer.parseInt(p);
        }
        if(page == 1){
            previousPage = 1;
        } else if (page > 1){
            previousPage = page -1;
        }
        if(page == numberOfPages){
            nextPage = Integer.parseInt(numberOfPages+"");
        } else{
            nextPage = page +1;
        }
        
		ModelAndView mav = new ModelAndView("/accounts/showAllAccounts");
		List<Account> accounts = accountDao.findInRange((page-1)*PAGES_MAX, PAGES_MAX);
		mav.addObject("accounts", accounts);
		mav.addObject("numberOfPages", numberOfPages);
		mav.addObject("nextPage", nextPage);
		mav.addObject("previousPage", previousPage);
		return mav;
	}
	

	private String validateAndSaveAccount(Account account, BindingResult result,
			String confirmPassword, String role, SessionStatus status,
			Model model) throws Exception {
		
		String error = "";
		int errorType = 0;

		
		if(result.hasErrors()){
			error = result.getFieldError().getDefaultMessage();
			model.addAttribute("error", error);
			model.addAttribute("errorType", 3);
			return "accounts/newAccount";
		}
		
		Boolean confirmationPass = confirmPassword
				.equals(account.getPassword());
		int confirmSize = accountDao.findByProperty("username",
				account.getUsername()).size();
		
		
		
		if (confirmationPass && confirmSize == 0) {
			account.setPassword(Account.md5(account.getPassword()));
			accountDao.persist(account);
			Role roleAccount = new Role();
			roleAccount.setName(role);
			roleAccount.setUsername(account.getUsername());
			roleDao.persist(roleAccount);
			status.setComplete();
			return "redirect:/accounts/all";
		}	else {
		
			if (confirmSize > 0) {
				error = "Another user exist with the same username";
				errorType = 1;
			} else if (!confirmationPass) {
				error = "Please confirm your password's account";
				errorType = 2;
			}
			
			model.addAttribute("error", error);
			model.addAttribute("errorType", errorType);
			return "accounts/newAccount";
		}
	}
	
	private ModelAndView findAccountsWithSameUsername(String q)
			throws Exception {
		ModelAndView mav = new ModelAndView("/accounts/showAllAccounts");
		List<Account> accounts;
		if (q.equals("")) {
			accounts = accountDao.findAll();
		} else {
			accounts = accountDao.findByProperty("username", q);
		}
		mav.addObject("accounts", accounts);
		return mav;
	}
	
	private ModelAndView prepareNewModelAccount() {
		ModelAndView mav = new ModelAndView("/accounts/newAccount");
		Account account = new Account();
		mav.getModelMap().put("newAccount", account);
		return mav;
	}
	

	private ModelAndView prepareUpdateAccount(Long id) throws Exception {
		ModelAndView mav = new ModelAndView("/accounts/editAccount");
		Account account = accountDao.findById(id);
		Role role = roleDao.findByProperty("username", account.getUsername())
				.get(0);
		mav.addObject("editAccount", account);
		mav.addObject("editRole", role);
		return mav;
	}

}
