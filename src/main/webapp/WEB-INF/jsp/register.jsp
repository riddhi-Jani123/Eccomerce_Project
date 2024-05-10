<html lang="en">
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
        * {
            box-sizing: border-box;
        }
        body {
            background: #f6f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            font-family: 'Montserrat', sans-serif;
            height: 100vh;
            margin: -20px 0 50px;
        }
        h1 {
            font-weight: bold;
            margin-top: 20px;
        }
        h2 {
            text-align: center;
        }

        p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }
        span {
            font-size: 12px;
        }
        a {
            color: #333;
            font-size: 14px;
            text-decoration: none;
            margin: 15px 0;
        }
        button {
            border-radius: 20px;
            border: 1px solid #FF4B2B;
            background-color: #FF4B2B;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
        button:active {
            transform: scale(0.95);
        }
        button:focus {
            outline: none;
        }
        button.ghost {
            background-color: transparent;
            border-color: #FFFFFF;
        }
        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 20px;
            height: 100%;
            text-align: center;
        }
        input {
            background-color: #eee;
            border: none;
            padding: 15px 15px;
            margin: 10px 0;
            width: 100%;
            font-size:small!important;
            border-radius: 5px;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            /*adding */
            display: flex;
            align-items: center;
            /*adding */

            box-shadow: 0 14px 28px rgba(0,0,0,0.25),
            0 10px 10px rgba(0,0,0,0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            /*   min-height: 600px;
               height: auto;*/
        }
        .form-container {
            /*  position: absolute;*/
            position: relative;
            top: 0;
            /*  height: 100%;*/
            transition: all 0.6s ease-in-out;
        }
        .signIn-btn{
            background-color: transparent;
            border-radius: 20px;
            border: 1px solid #FFFFFF;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .container.right-panel-active .overlay-container{
            transform: translateX(-100%);
        }

        .overlay {
            background: #FF416C;
            background: -webkit-linear-gradient(to right, #FF4B2B, #FF416C);
            background: linear-gradient(to right, #FF4B2B, #FF416C);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: #FFFFFF;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }
        .social-container {
            margin-top: -10px;
            margin-bottom: 10px;
        }
        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }

        footer {
            background-color: #222;
            color: #fff;
            font-size: 14px;
            bottom: 0;
            position: fixed;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 999;
        }
        .signup-btn{
            margin-top: 20px;
        }
        footer p {
            margin: 10px 0;
        }

        footer i {
            color: red;
        }

        footer a {
            color: #3c97bf;
            text-decoration: none;
        }

    </style>
</head>
<body>
<div class="container" id="container">
    <div class="form-container sign-up-container">
        <form action="registerUser" method="post" id="registrationForm">
            <h1 style="margin-bottom: 20px" class="heading">Create Account</h1>
            <div class="social-container">
                <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                <a href="/oauth2/authorization/google" class="social"><i class="fab fa-google-plus-g"></i></a>
                <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <span>or use your email for registration</span>
            <input type="text" name="firstName" placeholder="First Name" required />
            <input type="text" name="lastName" placeholder="Last Name" required />
            <input type="text" name="username" placeholder="Username" required autocomplete="off"/>
            <input type="text" name="mobileNumber" placeholder="Mobile Number" pattern="[0-9]{10}" title="Mobile number must be 10 digits" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <c:if test="${not empty emailAlreadyExist}">
                <h3 style="color:red;">${emailAlreadyExist}</h3>
            </c:if>
            <c:if test="${not empty userNameAlreadyExist}">
                <h3 style="color:red;">${userNameAlreadyExist}</h3>
            </c:if>
            <button class="signup-btn">Sign Up</button>
        </form>
    </div>

    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <h1>Welcome Back!</h1>
                <p>To keep connected with us please login with your personal info</p>
                <a href="login" class="signIn-btn">Sign In</a>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="otpModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Enter OTP</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="otpForm">
                    <div class="form-group">
                        <label for="otpInput">OTP:</label>
                        <input type="text" class="form-control" id="otpInput" placeholder="Enter OTP" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<footer>
    <p>
        Created with <i class="fa fa-heart"></i> by
        <a target="_blank" href="https://florin-pop.com">Florin Pop</a>
        - Read how I created this and how you can join the challenge
        <a target="_blank" href="https://www.florin-pop.com/blog/2019/03/double-slider-sign-in-up-form/">here</a>.
    </p>
</footer>
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
    // JavaScript code to handle OTP generation, modal display, and OTP validation
    $(document).ready(function() {
        $("#registrationForm").submit(function(event) {
            event.preventDefault();
            var phoneNumber = $("input[name='mobileNumber']").val();
            // Perform OTP generation API call
            $.ajax({
                type: "GET",
                url: "/generateOTP", // Change to your endpoint URL for OTP generation
                data: { phoneNo: phoneNumber },
                success: function(response) {
                    // If OTP generation is successful, open the OTP modal
                    $("#otpModal").modal("show");
                },
                error: function() {
                    // Handle error case
                    alert("Error occurred while generating OTP.");
                }
            });
        });

        $("#otpForm").submit(function(event) {
            event.preventDefault();
            var otp = $("#otpInput").val();
            var phoneNumber = $("input[name='mobileNumber']").val();
            $.ajax({
                type: "POST",
                url: "/validateOTP", // Change to your endpoint URL for OTP validation
                data: { otp: otp, phoneNo: phoneNumber },
                success: function(response) {
                    console.log("response ",response)
                    if (response === "approved") {
                        // If OTP is valid, submit the registration form
                        $("#registrationForm").unbind('submit').submit();
                    } else {
                        // If OTP is invalid, show error message in the modal
                        $("#otpInput").val("");
                        $("#otpInput").attr("placeholder", "Invalid OTP. Please try again.");
                    }
                },
                error: function() {
                    // Handle error case
                    alert("Error occurred while validating OTP.");
                }
            });
        });
    });
</script>
</body>
</html>