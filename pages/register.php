<?php

if (!empty($_COOKIE['sid'])) {
    // check session id in cookies
    session_id($_COOKIE['sid']);
}
session_start();
require_once '../classes/Auth.class.php';

?><!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Create Account</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
    <link rel="stylesheet" href="../css/main.css">
    </head>

  <body>
  <nav class="navbar navbar-expand-md navbar-light bg-white sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="../index.php">
      <img src="../img/logo.png" class="d-inline-block align-top">
      TaxiPark
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a href="../index.php" class="nav-link">About</a>
          </li>
          <li class="nav-item">
            <a href="job.php" class="nav-link">Job</a>
          </li>
          <li class="nav-item">
            <a href="vip.php" class="nav-link">Vip</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">Create Account</a>
          </li>
          <li class="nav-item">
            <a href="login.php" class="nav-link">Log In</a>
          </li>
        </ul>   
      </div>
    </div>
  </nav><br>
    <div class="container">

      <?php if (Auth\User::isAuthorized()): ?>
    
      <h1>Your are already registered!</h1>

      <form class="ajax" method="post" action="../ajax.php">
          <input type="hidden" name="act" value="logout">
          <div class="form-actions">
              <button class="btn btn-large btn-primary" type="submit">Logout</button>
          </div>
      </form>

      <?php else: ?>

      <form class="form-signin ajax" method="post" action="../ajax.php">
        <div class="main-error alert alert-error hide"></div>

        <h2 class="form-signin-heading">Please sign up</h2>
        <input name="username" type="text" class="input-block-level" placeholder="Username" autofocus>
        <input name="password1" type="password" class="input-block-level" placeholder="Password">
        <input name="password2" type="password" class="input-block-level" placeholder="Confirm password">
        <input type="hidden" name="act" value="register">
        <button class="btn btn-primary btn-lg btn-dark">Check in</button></a>
        <div class="alert alert-info" style="margin-top:15px;">
            <p>Already have account? <a href="login.php">Sign In.</a>
        </div>
      </form>

      <?php endif; ?>

    </div> <!-- /container -->

    <script src="../vendor/jquery-2.0.3.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/ajax-form.js"></script>

  </body>
</html>
