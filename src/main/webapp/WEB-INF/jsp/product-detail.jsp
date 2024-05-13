<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <link rel="stylesheet" type="text/css" href="/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="/icomoon/icomoon.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" media="all" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>

    html, body {
        height: 100%;
        width: 100%;
        margin: 0;
        font-family: 'Roboto', sans-serif;
    }
    .product-quantity {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .product-quantity label {
        margin-right: 10px;
        font-size: 16px;
        color: #43474D;
    }

    .quantity-input {
        border: 1px solid #ccc;
        border-radius: 6px;
        overflow: hidden;
    }

    .quantity-input input[type="number"] {
        padding: 8px;
        width: 60px; /* Adjust the width as needed */
        border: none;
        font-size: 16px;
        color: #333;
        outline: none;
    }


    .product-description {
        margin-bottom: 20px;
    }
    .price-label {
        font-size: 16px;
        color: #43474D;
        margin-right: 10px;
    }
    .price-value {
        font-size: 26px;
        font-weight: 300;
        color: #43474D;
        margin-right: 20px;
    }

    .button-group {
        display: flex;
    }

    .product-price {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }

    .product-price span {
        font-size: 26px;
        font-weight: 300;
        color: #43474D;
        margin-right: 20px;
    }

    .button-group {
        display: flex;
        margin-right: 20px;
    }

    .cart-btn,
    .buy-now-btn {
        display: inline-block;
        background-color: #7DC855;
        border-radius: 6px;
        font-size: 16px;
        color: #FFFFFF;
        text-decoration: none;
        padding: 12px 20px;
        margin-right: 10px;
        transition: all .5s;
    }


    .cart-btn i, .buy-now-btn i {
        color: #333; /* Icon color */
        font-size: 18px; /* Adjust icon size as needed */
    }

    .cart-btn:hover, .buy-now-btn:hover {
        background-color: rgba(0, 0, 0, 0.1); /* Light gray background color on hover */
    }

    .cart-btn:hover,
    .buy-now-btn:hover {
        background-color: #64af3d;
    }
    .wishlist {
        display: inline-block;
        position: relative; /* Position the container relative to its normal position */
    }

    .wishlist a {
        display: block;
        width: 30px; /* Adjust width as needed */
        height: 30px; /* Adjust height as needed */
        line-height: 30px; /* Center the heart icon vertically */
        text-align: center; /* Center the heart icon horizontally */
        border-radius: 50%; /* Ensure the container is a circle */
        background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
    }

    .wishlist i {
        color: lightblue; /* Heart icon color */
        font-size: 24px; /* Adjust icon size as needed */
    }
    .wishlist i:hover{
        color: red;
    }

    /* Size Selection */
    .product-size {
        margin-bottom: 20px;
    }
    .product-size span {
        display: block;
        margin-bottom: 10px;
    }
    .size-choose {
        display: flex;
    }
    .size-choose div {
        margin-right: 10px;
    }
    .size-choose input[type="radio"] {
        display: none;
    }
    .size-choose label {
        display: inline-block;
        width: 40px;
        height: 40px;
        background-color: #E1E8EE;
        border-radius: 6px;
        text-align: center;
        line-height: 40px;
        cursor: pointer;
    }
    .size-choose input[type="radio"]:checked + label {
        background-color: #7DC855;
        color: #fff;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 15px;
        display: flex;
    }
    .left-column {
        width: 65%;
        position: relative;
    }

    .right-column {
        width: 35%;
        margin-top: 60px;
    }
    .left-column img {
        width: 100%;
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
        transition: all 0.3s ease;
    }

    .left-column img.active {
        opacity: 1;
    }
    .product-description {
        border-bottom: 1px solid #E1E8EE;
        margin-bottom: 20px;
    }
    .product-description span {
        font-size: 12px;
        color: #358ED7;
        letter-spacing: 1px;
        text-transform: uppercase;
        text-decoration: none;
    }
    .product-name {
        font-size: 20px; /* Adjust the font size as needed */
        display: block;
        margin-bottom: 10px;
    }

    .product-description h1 {
        font-weight: 400; /* Adjust the font weight as needed */
        font-size: 32px; /* Adjust the font size as needed */
        color: #43484D;
        letter-spacing: -1px;
        margin-bottom: 10px;
    }

    .product-description p {
        font-size: 16px; /* Adjust the font size as needed */
        font-weight: 300;
        color: #86939E;
        line-height: 24px;
        margin-bottom: 20px;
    }

    .product-color {
        margin-bottom: 30px;
    }

    .color-choose div {
        display: inline-block;
    }

    .color-choose input[type="radio"] {
        display: none;
    }

    .color-choose input[type="radio"] + label span {
        display: inline-block;
        width: 40px;
        height: 40px;
        margin: -1px 4px 0 0;
        vertical-align: middle;
        cursor: pointer;
        border-radius: 50%;
        border: 2px solid #FFFFFF;
        box-shadow: 0 1px 3px 0 rgba(0,0,0,0.33);
    }
    .color-choose input[type="radio"]#red + label span {
        background-color: #C91524;
    }
    .color-choose input[type="radio"]#blue + label span {
        background-color: #314780;
    }
    .color-choose input[type="radio"]#black + label span {
        background-color: #323232;
    }

    .color-choose input[type="radio"]:checked + label span {
        background-image: url(images/check-icn.svg);
        background-repeat: no-repeat;
        background-position: center;
    }


    .cable-choose button {
        border: 2px solid #E1E8EE;
        border-radius: 6px;
        padding: 13px 20px;
        font-size: 14px;
        color: #5E6977;
        background-color: #fff;
        cursor: pointer;
        transition: all .5s;
    }

    .cable-choose button:hover,
    .cable-choose button:active,
    .cable-choose button:focus {
        border: 2px solid #86939E;
        outline: none;
    }


    .cable-config a {
        color: #358ED7;
        text-decoration: none;
        font-size: 12px;
        position: relative;
        margin: 10px 0;
        display: inline-block;
    }

    .cable-config a:before {
        content: "?";
        height: 15px;
        width: 15px;
        border-radius: 50%;
        border: 2px solid rgba(53, 142, 215, 0.5);
        display: inline-block;
        text-align: center;
        line-height: 16px;
        opacity: 0.5;
        margin-right: 5px;
    }




    .cart-btn {
        display: inline-block;
        background-color: #7DC855;
        border-radius: 6px;
        font-size: 16px;
        color: #FFFFFF;
        text-decoration: none;
        padding: 12px 30px;
        transition: all .5s;
    }
    .cart-btn:hover {
        background-color: #64af3d;
    }
    /* Responsive */
    @media (max-width: 940px) {
        .container {
            flex-direction: column;
            margin-top: 60px;
        }

        .left-column,
        .right-column {
            width: 100%;
        }

        .left-column img {
            width: 300px;
            right: 0;
            top: -65px;
            left: initial;
        }
    }

    @media (max-width: 535px) {
        .left-column img {
            width: 220px;
            top: -85px;
        }
    }
</style>
</head>
<body>
<main class="container">

    <!-- Left Column / Headphones Image -->
    <div class="left-column">
        <img data-image="black" src="images/black.png" alt="">
        <img data-image="blue" src="images/blue.png" alt="">
        <img data-image="red" class="active" src="images/red.png" alt="">
    </div>


    <!-- Right Column -->
    <div class="right-column">

        <!-- Product Description -->
        <div class="product-description">
            <h1 class="product-name">Headphones
                <div class="wishlist">
                    <a href="#"><i class="fas fa-heart"></i></a>
                </div>

            </h1>


            <h4>Beats EP</h4>
            <p>The preferred choice of a vast range of acclaimed DJs. Punchy, bass-focused sound and high isolation. Sturdy headband and on-ear cushions suitable for live performance</p>
        </div>

        <!-- Product Configuration -->
        <div class="product-configuration">

            <!-- Product Color -->
            <div class="product-color">
                <span>Color</span>

                <div class="color-choose">
                    <div>
                        <input data-image="red" type="radio" id="red" name="color" value="red" checked>
                        <label for="red"><span></span></label>
                    </div>
                    <div>
                        <input data-image="blue" type="radio" id="blue" name="color" value="blue">
                        <label for="blue"><span></span></label>
                    </div>
                    <div>
                        <input data-image="black" type="radio" id="black" name="color" value="black">
                        <label for="black"><span></span></label>
                    </div>
                </div>

            </div>

<%--            <!-- Quantity Selection -->--%>
<%--            <div class="quantity-select">--%>
<%--                <label for="quantity">Quantity</label>--%>
<%--                <input type="number" id="quantity" name="quantity" min="1" value="1">--%>
<%--            </div>--%>

            <div class="product-quantity">
                <label for="quantity">Quantity</label>
                <div class="quantity-input">
                    <input type="number" id="quantity" name="quantity" value="1" min="1">
                </div>
            </div>


            <!-- Size Selection -->
            <div class="product-size">
                <span>Size</span>
                <div class="size-choose">
                    <div>
                        <input data-image="small" type="radio" id="small" name="size" value="Small" checked>
                        <label for="small"><span>S</span></label>
                    </div>
                    <div>
                        <input data-image="medium" type="radio" id="medium" name="size" value="medium">
                        <label for="medium"><span>M</span></label>
                    </div>
                    <div>
                        <input data-image="large" type="radio" id="large" name="size" value="large">
                        <label for="large"><span>L</span></label>
                    </div>
                    <div>
                        <input data-image="XL" type="radio" id="XL" name="size" value="XL">
                        <label for="XL"><span>XL</span></label>
                    </div>
                </div>
            </div>



            <!-- Product Pricing -->
            <div class="product-price">
                <span class="price-label">Price:</span>
                <span class="price-value">148$</span>
            </div>
            <div class="button-group">
                <a href="#" class="cart-btn">Add to Cart &nbsp;&nbsp<i class="fas fa-shopping-cart"></i></a>
                <a href="#" class="buy-now-btn">Buy Now &nbsp;&nbsp;<i class="fas fa-credit-card"></i></a>
            </div>
    </div>
    </div>
</main>

<jsp:include page="footer.jsp" />
</body>
<script>
    $(document).ready(function() {

        $('.color-choose input').on('click', function() {
            var headphonesColor = $(this).attr('data-image');

            $('.active').removeClass('active');
            $('.left-column img[data-image = ' + headphonesColor + ']').addClass('active');
            $(this).addClass('active');
        });

    });
</script>