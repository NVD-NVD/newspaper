<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Simple 404 Page using HTML & CSS -->
<!-- Author: Godnon Dsilva -->

<!-- HTML5 -->
<!DOCTYPE html>
<html>
<head>
    <!-- Enter your title of the page -->
    <title>404 - Page not found</title>
    <!-- Link the CSS posted below to this page, change the href -->
    <link rel="stylesheet" href="/share/css/404.css" >
    <!--  Enter your website icon -->
    <link rel="icon" href="YOUR_WEBSITE_ICON_LINK">
    <!-- This one is very important, don't skip this part! -->
    <base href=""> <!-- Enter your website URL here -->

    <!-- Just some important metas, you can ignore these -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- If you want to learn more about them then visit https://www.w3schools.com/tags/tag_meta.asp -->
</head>
<body>
<main>
    <center>
        <br /><br /><br /><br /><br /><br />
        <h1>404 - Page not found!</h1>
        <p>Oops! Itseems like you're lost, let me help you find your way back home! :)<br />
            The following problems could be the case:<br><br>
            • The link is broken<br />
            • This page never existed<br />
            • This page has been removed<br /><br /><br /></p>
        <h3><a href="${pageContext.request.contextPath}/">Click here to go back home</a></h3>
        <br /><br /><br /><br />
    </center>
</main>
</body>
</html>
