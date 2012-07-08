package com.dev.mb.service;

import com.dev.mb.model.Role;

public interface RoleService {

	void save(Role role);
	void update(Role role);
	void delete(Role role);
	Role findByRoleName(String roleName);
	
}
