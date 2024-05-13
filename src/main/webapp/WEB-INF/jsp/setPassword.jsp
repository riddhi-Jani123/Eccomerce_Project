<html lang="en">
<head>
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            margin-bottom: 10px;
        }
        .form-container {
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
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
            margin-top: 20px;
        }
        button:active {
            transform: scale(0.95);
        }
        button:focus {
            outline: none;
        }
        form {
            background-color: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }
        input {
            background-color: #eee;
            border: none;
            padding: 15px 15px;
            margin: 10px 0;
            width: 100%;
            border-radius: 5px;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0,0,0,0.25),
            0 10px 10px rgba(0,0,0,0.22);
            position: relative;
            overflow: hidden;
            width: 500px;
            max-width: 100%;
            min-height: 500px;
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
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 20px;
        }

    </style>

</head>
<body>

<div class="container" id="container">
    <div class="form-container">
        <form action="setPassword" method="post" onsubmit="return validateForm()">
            <h1>Set Password</h1>
            <input type="password" id="password" name="password" placeholder="Password" required />
            <input type="password" id="confirmPassword" name="confirmPassword"  placeholder="Confirm Password" required />
            <button type="submit">Set Password</button>
            <span id="errorMessage" class="error-message"></span>
        </form>
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
<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var errorMessage = document.getElementById("errorMessage");
        if (password.length < 8) {
           errorMessage.textContent = "Password must be at least 8 characters long";
           return false;
        }
        if (password !== confirmPassword) {
           errorMessage.textContent = "Password and Confirm Password must match";
           return false;
        }
        return true;
    }
</script>

</body>
</html>