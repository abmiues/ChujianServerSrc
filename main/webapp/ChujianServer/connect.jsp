<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type"
			content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
   	<applet codebase="applet"
			archive="java-getopt-1.0.14.jar,log4j-java1.1.jar,properJavaRDP-1.1.jar,properJavaRDP14-1.1.jar"
			code="net.propero.rdp.applet.RdpApplet.class"
			width="1280" height="720" name="webrdp">
			<param name="width" value="1280" />
			<param name="height" value="720" />
			<param name="server" value="172.21.17.40" />
			<param name="port" value="3389" />
		</applet>
	</body>
</html>