package org.slevin.dao.service;

import org.slevin.common.Account;
import org.slevin.dao.AccountDao;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component
@Transactional
public class AccountService extends EntityService<Account> implements AccountDao {

}
