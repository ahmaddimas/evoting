<?php echo '<?xml version="1.0" encoding="UTF-8"?>' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link rel="stylesheet" href="<?php echo base_url("assets/bootstrap/css/bootstrap.css"); ?>"/>
    <script type="text/javascript" src="<?php echo base_url("assets/bootstrap/js/bootstrap.js"); ?>"></script>
    <script type="text/javascript" src="<?php echo base_url("assets/bootstrap/jquery-1.10.2.js"); ?>"></script>
    <link rel="stylesheet" href="<?php echo base_url("assets/bootstrap/loginstyle.css"); ?>"/>
    <title>SIMILA: Login</title>
</head>
<body>
<div class="container">
    <style>
        /*@import "bourbon";*/

        body {
            background: #eee !important;
        }

        .wrapper {
            margin-top: 80px;
            margin-bottom: 80px;
        }

        .form-signin {
            max-width: 380px;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0, 0, 0, 0.1);

        .form-signin-heading,
        .checkbox {
            margin-bottom: 30px;
        }

        .checkbox {
            font-weight: normal;
        }

        .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
        @include box-sizing(border-box);

        &
        :focus {
            z-index: 2;
        }

        }

        input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        input[type="password"] {
            margin-bottom: 20px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        }

    </style>
    <div class="wrapper">

        <!--<form class="form-signin">-->

        <?php echo form_open(current_url(), array('class' => 'form-signin')); ?>
        <h1><?php echo lang('login_heading'); ?></h1>
<!--        <p>--><?php //echo lang('login_subheading'); ?><!--</p>-->

        <div id="infoMessage"><?php echo $message; ?></div>


        <!-- <?php /*echo lang('login_identity_label', 'identity');*/ ?>
         --><?php /*echo form_input($identity);*/ ?>
        <label for="identity">Username:</label>
        <input name="identity" id="identity" type="text" class="form-control">

        <!-- <?php /*echo lang('login_password_label', 'password');*/ ?>
                --><?php /*echo form_input($password);*/ ?>
        <label for="password">Password:</label>
        <input name="password" value="" id="password" type="password" class="form-control">

        <?php echo lang('login_remember_label', 'remember'); ?>
        <?php echo form_checkbox('remember', '1', FALSE, 'id="remember"'); ?>

        <?php /*echo form_submit('submit', lang('login_submit_btn'));*/ ?>
        <input name="submit" value="Login" type="submit" class="btn btn-lg btn-primary btn-block">

<!--        <p><a href="forgot_password">--><?php //echo lang('login_forgot_password'); ?><!--</a></p>-->
        <?php echo form_close(); ?>

        <!-- </form>-->
    </div>
</div>
</body>
</html>