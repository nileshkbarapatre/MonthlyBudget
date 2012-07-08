package com.dev.mb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "role", catalog = "mb")
public class Role implements java.io.Serializable{
	
	private Integer role_id;
	private String role_name;
 
	public Role() {
	}
 
	public Role(Integer role_id, String role_name) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
	}
	
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "role_id", unique = true, nullable = false)
	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	@Column(name = "role_name", unique = true, nullable = false, length = 45)
	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

 
	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", role_name=" + role_name + "]";
	}
}
