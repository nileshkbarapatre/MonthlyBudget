package com.dev.mb.dao;

import com.dev.mb.model.Role;

public interface RoleDao {
	
	void save(Role role);
	void update(Role role);
	void delete(Role role);
	Role findByRoleName(String roleName);

}
