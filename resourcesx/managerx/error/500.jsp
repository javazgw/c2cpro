<%
	response.setStatus(500);

// 获取异常类
	Throwable ex = null;
	if (request.getAttribute("exception") != null) {
		ex = (Throwable) request.getAttribute("exception");
	} else if (request.getAttribute("javax.servlet.error.exception") != null) {
		ex = (Throwable) request.getAttribute("javax.servlet.error.exception");
	}

// 编译错误信息
	if (ex != null) {
		LoggerFactory.getLogger("400.jsp").warn(ex.toString(), ex);
		out.print(ex.toString());
	} else {
		out.print("未知错误.");
	}
%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>