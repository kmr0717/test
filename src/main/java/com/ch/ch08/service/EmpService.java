package com.ch.ch08.service;

import java.util.List;

import com.ch.ch08.model.Dept;
import com.ch.ch08.model.Emp;

public interface EmpService {

	List<Dept> list(int deptno);

	List<Emp> empList();

	Emp select(int empno);

	int insert(Emp emp);

	int update(Emp emp);

	int delete(int empno);

	List<Emp> allEmpList();

}
