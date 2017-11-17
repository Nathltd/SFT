<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Baxany.com - Making Life Easier</title>
<link rel="stylesheet" type="text/css" href="../sys/style.css">
</head>

<body>
<div id="main">
<div id="headBanner">
<img src="../../images/banner1.jpg">
</div>
<div id="content">
<div id="menu">
</div>
<div id="details">
<br>
<cfform method="post">
<div class="field">
<label>Invalid Entry. Try Again.</label>
</div>

    <div class="field">
                  <label for="password">User ID:</label>
                  <cfinput type="text" name="username"  required="yes" message="Enter Password" autocomplete="off" tabindex="1" placeholder="User Id" class="textfield" autofocus>
               	</div>
                <div class="field">
                  <label for="password">Password:</label>
                  <cfinput type="password" name="password"  required="yes" message="Enter Password" autocomplete="off" tabindex="2" class="textfield" placeholder="cAse sEnSitive">
               	</div>
                <div class="button">
                  <cfinput type="submit" class="btn" name="login" value="Login" />

                </div>
    </cfform>
    </div>
</div>
<div id="footer"><cfoutput>#request.footer#</cfoutput><span>Powered by &nbsp;<a href="http://www.nathconcept.com">nathconcept.com</a></span></div>
</div>
</body>
</html>
