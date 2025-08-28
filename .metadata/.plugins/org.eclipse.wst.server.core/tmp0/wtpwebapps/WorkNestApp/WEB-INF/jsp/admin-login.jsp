<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>WorkNest</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #f6f3fa, #ebe3f8);
      color: #4b4453;
    }
    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #a88fd8;
      padding: 1rem 2rem;
    }
    nav .title {
      font-size: 1.6rem;
      font-weight: 700;
      color: white;
      letter-spacing: 1px;
    }
    nav .actions {
      display: flex;
      gap: 1rem;
    }
    nav .actions a {
      padding: 0.6rem 1.2rem;
      border-radius: 30px;
      background: white;
      color: #6a4ba8;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s ease;
    }
    nav .actions a:hover {
      background: #d3c2f7;
      color: white;
    }
    .hero {
      text-align: center;
      padding: 2rem 1rem;
      background: linear-gradient(135deg, #d3c2f7, #f1ebfc);
    }
    .hero h1 {
      font-size: 2rem;
      margin-bottom: 0.5rem;
      background: linear-gradient(to right, #6a4ba8, #a88fd8);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .hero p {
      font-size: 1rem;
      color: #5a5270;
      max-width: 600px;
      margin: 0 auto;
    }
    section {
      max-width: 600px;
      margin: 2rem auto;
      padding: 0 1rem;
    }
    h3 {
      text-align: center;
      margin-bottom: 1rem;
      background: linear-gradient(to right, #6a4ba8, #a88fd8);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    label {
      display: block;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }
    input {
      width: 100%;
      padding: 0.6rem;
      border-radius: 8px;
      border: 1px solid #ccc;
      margin-bottom: 1rem;
      font-size: 1rem;
    }
    .btn {
      width: 100%;
      padding: 0.7rem;
      border-radius: 8px;
      background: linear-gradient(135deg, #a88fd8, #6a4ba8);
      color: white;
      font-weight: 600;
      text-decoration: none;
      border: none;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .btn:hover {
      box-shadow: 0 6px 16px rgba(168,143,216,0.4);
      transform: translateY(-2px);
    }
    footer {
      background: #a88fd8;
      color: white;
      padding: 1rem;
      text-align: center;
      border-top-left-radius: 1rem;
      border-top-right-radius: 1rem;
      margin-top: auto;
    }
    .extra-link {
      display: block;
      text-align: center;
      margin-top: 1rem;
      font-weight: 600;
      color: #6a4ba8;
      text-decoration: none;
    }
    .extra-link:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <nav>
    <div class="title">WorkNest</div>
    <div class="actions">
      <a href="<c:url value='/admin/login'/>">Admin</a>
      <a href="<c:url value='/user/login'/>">User</a>
    </div>
  </nav>

  <div class="hero">
    <h1>Welcome to WorkNest</h1>
    <p>A calm lavender workspace where productivity meets elegance.</p>
  </div>

  <section>
    <h3>Admin Login</h3>
    <c:if test="${not empty error}">
      <div style="color:red; text-align:center; margin-bottom:1rem;">${error}</div>
    </c:if>

    <form method="post" action="<c:url value='/admin/login'/>">
      <label>Email</label>
      <input name="email" required>

      <label>Password</label>
      <input name="password" type="password" required>

      <button type="submit" class="btn">Login</button>
    </form>

    <a href="<c:url value='/admin/register'/>" class="extra-link">Create admin account</a>
  </section>

  <footer>© 2025 WorkNest</footer>
</body>
</html>
