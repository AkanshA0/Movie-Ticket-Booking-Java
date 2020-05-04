<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Save movie</title>
</head>
<body>
<form action="./ImgUpload" method="post">
Enter movie name: <input type="text" name="mname" required="required"><p>
Enter movie cost: <input type="text" name="cost" required="required"><p>
Enter movie description: <textarea rows = "5" cols = "50" name = "mdesc" required="required"></textarea>
<br>
Movie Image<input type="file" name="image" required="required">
<td colspan=2><input type="submit" value="Submit"></td>
</form>

<a href="image.jsp">see image
</body>
</html>