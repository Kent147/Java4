<%-- 
    Document   : index
    Created on : Oct 1, 2019, 7:47:29 AM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login DEMO</title>
        <link rel="stylesheet" href="../css/stylelogin.css">
        <link href='../image/fpt.ico' rel='icon' />
        <script src="../scrpit/script.js"></script>
    </head>

    <body>
        <div class="contact-form">
            <img src="../image/avatar_register.png" class="avatar">
            <div class="header">
                <h2>Login DEMO</h2>
            </div>
            <form action='control_contact' method='POST' onsubmit='submitted = true;' target='hidden_iframe'>
                <div class="data">
                    <div class='form-group'>
                        <label class='control-label requiredField' for='name'>
                            <p>Username</p>
                            <em class='asteriskField'>*</em>
                            <div class='input-group'>
                                <input class='form-control' id='name' name='txtusername' placeholder='Userame' required='' type='text' />
                            </div>
                        </label>
                        <label class='control-label requiredField' for='pass'>
                            <p>Password</p>
                            <em class='asteriskField'>*</em>
                        </label>
                        <div class='input-group'>
                            <input class='form-control' id='name' name='txtpassword' placeholder='Password' required='' type='password' />
                        </div>
                        <br>
                        <div class='form-button'>
                            <button class='btn-login' name='btlogin' type='submit' value='login'> 
                                Login
                            </button>
                            <button class='btn-register' name='btregister' type='submit' value='register'> 
                                Register
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <footer>
        <hr class="line-footer">
        <div class='content'>Designer:<b> Kent §</b> Manager: <b>Login DEMO</b></div>
        <hr class="line-footer">
    </footer>


</html>
