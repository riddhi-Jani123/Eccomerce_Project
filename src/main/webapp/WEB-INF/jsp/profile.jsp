<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Profile</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <style>
    /* Add your custom styles here */
    .profile-card {
      background-color: #f8f9fa;
      border: 1px solid #dee2e6;
      border-radius: 10px;
    }

    .profile-img {
      width: 150px;
      height: 150px;
      object-fit: cover;
    }

    .order-table th {
      font-weight: bold;
    }

    .order-table .badge {
      font-size: 0.9rem;
      padding: 8px 10px;
    }

    .section-title {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row mt-5">
      <div class="col-md-4">
        <div class="card profile-card">
          <div class="card-body text-center">
            <h5 class="card-title">User Profile</h5>
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa8eOtzML9_rNwhttfGEPAwYWexjbdjaZabQ&s" class="img-fluid rounded-circle profile-img mb-3" alt="User Avatar">
            <c:if test="${not empty sessionScope.user}">
            <p class="card-text">UserName: ${user.username}</p>
            <p class="card-text">FirstName: ${user.firstName}</p>
            <p class="card-text">LastName: ${user.lastName}</p>
            <p class="card-text">Email: ${user.email}</p>
            <c:if test="${not empty user.mobileNumber}">
            <p class="card-text">Phone: +91 ${user.mobileNumber}</p>
             </c:if>
            </c:if>
            <p class="card-text">Address: 123 Street, City, Country</p>
            <a href="#" class="btn btn-primary">Edit Profile</a>
          </div>
        </div>
      </div>
      <div class="col-md-8">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title section-title">My Orders</h5>
            <div class="table-responsive">
              <table class="table order-table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Order ID</th>
                    <th scope="col">Date</th>
                    <th scope="col">Total</th>
                    <th scope="col">Status</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="row">1</th>
                    <td>ORD123456</td>
                    <td>2024-05-01</td>
                    <td>$50.00</td>
                    <td><span class="badge badge-success">Shipped</span></td>
                  </tr>
                  <!-- Add more rows for other orders -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Additional sections -->
    <div class="row mt-5">
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title section-title">My Wishlist</h5>
            <ul class="list-group">
              <li class="list-group-item">Product 1</li>
              <li class="list-group-item">Product 2</li>
              <li class="list-group-item">Product 3</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card">
          <div class="card-body">
            <h5 class="card-title section-title">My Reviews</h5>
            <ul class="list-group">
              <li class="list-group-item">
                <p>Product 1</p>
                <p>Rating: 4/5</p>
              </li>
              <li class="list-group-item">
                <p>Product 2</p>
                <p>Rating: 5/5</p>
              </li>
              <li class="list-group-item">
                <p>Product 3</p>
                <p>Rating: 3/5</p>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS and dependencies (jQuery and Popper.js) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
