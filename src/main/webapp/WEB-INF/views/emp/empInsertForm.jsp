<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function empChk(){
		if(!frm.empno.value){
			alert("사번을 먼저 입력해주세요");
			frm.empno.focus();
			return false;
		}
		$.post('empChk.do', 'empno='+frm.empno.value, function(data){
			$('#empChk').html(data);
		});
	}
</script>
</head>
<body>
<div class="container" align="center">
<h2 class="text-primary">직원 정보 입력</h2>
<form action="empInsert.do" method="post" name="frm">
<table class="table table-bordered">
	<tr>
		<td>사번</td>
		<td><input type="number" name="empno" required="required" autofocus="autofocus">
			<input type="button" value="중복 체크" onclick="empChk()" class="btn btn-danger btn-sm">
			<div id="empChk" class="err"></div>
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="ename" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>업무</td>
		<td><input type="text" name="job" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>관리자 사번</td>
		<td>
			<select name="mgr">
				<c:forEach var="emp" items="${empList }">
					<option value="${emp.empno }">${emp.ename }(${emp.empno })</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="date" name="hiredate" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>연봉</td>
		<td><input type="number" name="sal" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>comm</td>
		<td><input type="number" name="comm" required="required" autofocus="autofocus"></td>
	</tr>
	<tr>
		<td>부서코드</td>
		<td>
			<select name="deptno">
				<c:forEach var="dept" items="${deptList}">
					<c:if test="${deptno==dept.deptno }">
						<option value="${dept.deptno}" selected="selected">
							${dept.dname}(${dept.deptno})</option>
					</c:if>
					<c:if test="${deptno!=dept.deptno }">
						<option value="${dept.deptno}">
							${dept.dname}(${dept.deptno})</option>
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="확인"></td>
	</tr>
</table>
</form>
<a href="empList.do?deptno=${deptno}" class="btn btn-info">직원 목록</a>
</div>
</body>
</html>