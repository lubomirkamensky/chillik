<%@ Language = "Python" %>
<!--#include file="..\..\..\..\timetree\bin\asp\lib\MSXMLGate.py.asp"-->
<!--#include file="..\..\..\..\timetree\bin\asp\lib\MSFORMGate.py.asp"-->
<!--#include file="..\..\..\..\timetree\bin\asp\lib\MySQLGate.py.asp"-->
<!--#include file="..\..\..\..\timetree\bin\asp\lib\UTILITYGate.py.asp"-->
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="Expires" content="-1">
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<meta content="INDEX,NOFOLLOW" name="robots">
	<head>
	<body>
<%
import TimeTree2
start = utilitygate.getStart()


ID = 0
if str(Request.QueryString("tool_id")) <> "" and str(Request.QueryString("tool_id")) <> "None":
	ID = int(Request.QueryString("tool_id"))

cachepath="C:/timetree/cache/inbox/"
output = utilitygate.readCache(cachepath)
if output == None:
	sqlgate.cn = sqlgate.open("dsn=users;uid=root;pwd=securemarc")
	sqlgate.cn2 = ""
	requests = TimeTree2.inbox.Requests(utilitygate=utilitygate, xmlgate=xmlgate, sqlgate=sqlgate, formgate=formgate, session=Session.SessionID, user="aey", appname="chillik", cachepath=cachepath, project="chillik")
	output = requests.tools[ID].output(ID)
	utilitygate.writeCache(cachepath,output)

utilitygate.getTimeControl(start,"Celkem: ")
utilitygate.recordSystemUsage ("template","7",start)
%>
		<script type="text/javascript">
		<!--
		window.parent.RPC.enable("title");
		window.parent.RPC.fill(<%=output%>);
		window.parent.Bookmark.show('applications','inbox');
		-->
		</script>
	</body>
</html>