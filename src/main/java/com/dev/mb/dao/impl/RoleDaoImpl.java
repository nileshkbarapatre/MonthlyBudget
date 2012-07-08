package com.dev.mb.dao.impl;

import com.dev.mb.dao.RoleDao;
import com.dev.mb.model.Role;
import org.apache.log4j.Logger;
import javax.annotation.Resource;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
 
@Repository
public class RoleDaoImpl implements RoleDao {
	
	 @Resource
	 private SessionFactory sessionFactory;
	 private static Logger logger = Logger.getLogger("RoleDaoImpl");
	
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

	public void save(Role role) {
		// TODO Auto-generated method stub
		logger.info("Saving Role: "+ role.getRole_name() );
		sessionFactory.getCurrentSession().saveOrUpdate(role);
		logger.info("Role Saved : "+ role.getRole_name() );
	}

	public void update(Role role) {
		// TODO Auto-generated method stub
		logger.info("Updating Role: "+ role.getRole_name() );
		sessionFactory.getCurrentSession().update(role);
		logger.info("Role Updated : "+ role.getRole_name() );
	}

	public void delete(Role role) {
		// TODO Auto-generated method stub
		logger.info("Deleting Role: "+ role.getRole_name() );
		sessionFactory.getCurrentSession().delete(role);
		logger.info("Role Deleted : "+ role.getRole_name() );
	}

	public Role findByRoleName(String roleName) {
		// TODO Auto-generated method stub
		Role role = null;
		logger.info("Deleting Role: "+ roleName );
		sessionFactory.getCurrentSession().get(roleName, role);
		logger.info("Role Deleted : "+ roleName );
		return role;
	}

}
