<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="SignUpPackage.UserServlet" %>

<!DOCTYPE html>

<html>
<head>
	<link rel="stylesheet" href="styles.css">
</head>   
 
<style>
body {
  background-image: url('bg1.jpg');
  background-size: cover;
  background-color: rgba(0,0,0,0.6);
  background-blend-mode: multiply;
}

.bar {
  color: #333;
  width: 300px;
  height: 15px;
  text-align: center;
  background: #fafafa;
  border: 1px solid #ccc;
  padding: 25px;
  margin: 2.5% auto 0;
  position: relative;
}

.error {
  color: #ba3939;
  background: #ffe0e0;
  border: 1px solid #a33a3a;
}
</style>

<div style="text-align: center">
	<% if((boolean)request.getAttribute("isPageVisible")){ %>
	<div class="bar error">User Already Exists !</div>
	<%} else %>      <p>&nbsp</p>
</div>
<div class="form_wrapper">
  <div class="form_container"> 
    <div class="title_container">	
      <h2>Sign Up !</h2>
    </div>
    <div class="row clearfix">
      <div class="">
        <form name="addUserDetails" method="post">
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-envelope"></i></span>
            <input type="email" name="email" placeholder="Email" required />
          </div>
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
            <input type="password" name="password" placeholder="Password" required />
          </div>
          <div class="input_field"> <span><i aria-hidden="true" class="fa fa-lock"></i></span>
            <input type="password" name="password" placeholder="Re-type Password" required />
          </div>
          <div class="row clearfix">
            <div class="col_half">
              <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="name1" placeholder="First Name" />
              </div>
            </div>
            <div class="col_half">
              <div class="input_field"> <span><i aria-hidden="true" class="fa fa-user"></i></span>
                <input type="text" name="name2" placeholder="Last Name" required />
              </div>
            </div>
          </div>
            	<div class="input_field radio_option">
              <input type="radio" name="radiogroup1" id="rd1" value="male">
              <label for="rd1">Male</label>
              <input type="radio" name="radiogroup1" id="rd2" value="female">
              <label for="rd2">Female</label>
              </div>
              <div class="input_field select_option">
                <select name="country">
                  <option>Select a country</option>
                  <option>Option 1</option>
                  <option>Option 2</option>
                </select>
                <div class="select_arrow"></div>
              </div>
            <div class="input_field checkbox_option">
            	<input type="checkbox" id="cb1" name="cb1">
    			<label for="cb1" required>I agree with terms and conditions</label>
            </div>
            <div class="input_field checkbox_option">
            	<input type="checkbox" id="cb2" name="cb2">
    			<label for="cb2">I want to receive the newsletter</label>
            </div>
          <input class="button" type="submit" value="Register" id="submitBtn"/>
          <div style="text-align: center; margin-top: 7%">
          <a href="SignIn.jsp">Already Registered?</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
let checkBox = document.getElementById("cb1");
let button = document.getElementById("submitBtn");
button.disabled = true;
checkBox.addEventListener("change", stateHandle);

function stateHandle() {
    if(document.getElementById("cb1").checked) {
        button.disabled = false;
    } else {
        button.disabled = true;
    }
}
</script>
</html>