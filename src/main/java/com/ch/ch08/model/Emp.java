package com.ch.ch08.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Emp {

	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private int sal;
	private int comm;
	private int deptno;
	
	private String mgrName;
	//join용 부서정보
	private Dept dept;
	
}
