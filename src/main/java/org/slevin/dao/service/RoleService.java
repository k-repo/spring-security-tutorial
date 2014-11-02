package org.slevin.dao.service;

import org.slevin.common.Role;
import org.slevin.dao.RoleDao;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Component
@Transactional
public class RoleService extends EntityService<Role> implements RoleDao{

}
