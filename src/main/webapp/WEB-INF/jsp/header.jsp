<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<header id="header">
    <div id="header-wrap">
        <nav class="secondary-nav border-bottom">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-md-4 header-contact">
                        <p>Let's talk! <strong>+57 444 11 00 35</strong>
                        </p>
                    </div>
                    <div class="col-md-4 shipping-purchase text-center">
                        <p>Free shipping on a purchase value of $200</p>
                    </div>
                    <div class="col-md-4 col-sm-12 user-items">
                        <ul class="d-flex justify-content-end list-unstyled">
                            <li>
                                <c:choose>
                                    <c:when test="${not empty sessionScope.user}">
                                        <a href="profile">
                                            <i class="icon icon-user"></i>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="login">
                                            <i class="icon icon-user"></i>
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                            <li>
                                <a href="cart">
                                    <i class="icon icon-shopping-cart"></i>
                                </a>
                            </li>
                            <li>
                                <a href="wishlist">
                                    <i class="icon icon-heart"></i>
                                </a>
                            </li>
                            <li class="user-items search-item pe-3">
                                <a href="#" class="search-button">
                                    <i class="icon icon-search"></i>
                                </a>
                            </li>
                            <li>
                                <a href="signout">
                                   <i class="fa fa-sign-out"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <nav class="primary-nav padding-small">
            <div class="container">
                <div class="row d-flex align-items-center">
                    <div class="col-lg-2 col-md-2">
                        <div class="main-logo">
                            <a href="index">
                                <img src="/images/main-logo.png" alt="logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-10 col-md-10">
                        <div class="navbar">

                            <div id="main-nav" class="stellarnav d-flex justify-content-end right">
                                <ul class="menu-list">

                                    <li class="menu-item has-sub">
                                        <a href="index" class="item-anchor active d-flex align-item-center" data-effect="Home">Home</a>
                                    </li>

                                    <li><a href="about" class="item-anchor" data-effect="About">About</a></li>

                                    <li class="menu-item has-sub">
                                        <a href="shop" class="item-anchor d-flex align-item-center" data-effect="Shop">Products</a>
                                    </li>

                                    <li><a href="contact" class="item-anchor" data-effect="Contact">Contact</a></li>

                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</header>
</body>
</html>