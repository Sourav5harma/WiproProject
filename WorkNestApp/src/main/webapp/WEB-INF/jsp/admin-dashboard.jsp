<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    footer {
      background: #a88fd8;
      color: white;
      padding: 1rem;
      text-align: center;
      border-top-left-radius: 1rem;
      border-top-right-radius: 1rem;
      margin-top: auto;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 1.5rem 0;
      border-radius: 1rem;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(168,143,216,0.25);
    }
    table th, table td {
      padding: 1rem;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    table th {
      background: #a88fd8;
      color: white;
    }
    table tr:nth-child(even) {
      background: #f6f3fa;
    }
    table tr:hover {
      background: #e9defc;
    }
    .btn {
      display: inline-block;
      padding: 0.5rem 1rem;
      border-radius: 8px;
      background: linear-gradient(135deg, #a88fd8, #6a4ba8);
      color: white;
      font-weight: 600;
      text-decoration: none;
      transition: all 0.3s ease;
      border: none;
      cursor: pointer;
    }
    .btn:hover {
      box-shadow: 0 6px 16px rgba(168,143,216,0.4);
      transform: translateY(-2px);
    }
    .container {
      max-width: 1000px;
      margin: 2rem auto;
      padding: 0 1.5rem;
    }
  </style>
  <title>Admin Dashboard - WorkNest</title>
</head>
<body>
  <nav>
    <div class="title">WorkNest</div>
    <div class="actions">
      <a href="javascript:history.back()">&#8592; Back</a>
      <a href="<c:url value='/admin/login'/>">Admin</a>
      <a href="<c:url value='/user/login'/>">User</a>
    </div>
  </nav>

  <div class="container">
    <h2>Admin Dashboard</h2>
    <div style="margin: 1rem 0;">
      <a class="btn" href="<c:url value='/tasks/new'/>">Create Task</a>
      <a class="btn" href="<c:url value='/admin/logout'/>">Logout</a>
    </div>

    <!-- Users Table -->
    <h3>Users</h3>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Role</th>
          <th style="width: 120px;">Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${users}" var="u">
          <tr>
            <td>${u.name}</td>
            <td>${u.email}</td>
            <td>${u.role}</td>
            <td>
              <form method="post" action="<c:url value='/user/delete/${u.userId}'/>" 
                    onsubmit="return confirm('Delete user?')">
                <button class="btn">Delete</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Tasks Table -->
    <h3>Tasks</h3>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Assigned To</th>
          <th>Status</th>
          <th>Due Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="t" items="${pendingTasks}">
          <tr>
            <td>${t.title}</td>
            <td>${t.assignedUser.name}</td>
            <td>Pending</td>
            <td>${t.dueDate}</td>
            <td></td>
          </tr>
        </c:forEach>

        <c:forEach var="t" items="${inProgressTasks}">
          <tr>
            <td>${t.title}</td>
            <td>${t.assignedUser.name}</td>
            <td>In Progress</td>
            <td>${t.dueDate}</td>
            <td></td>
          </tr>
        </c:forEach>

        <c:forEach var="t" items="${completedTasks}">
          <tr>
            <td>${t.title}</td>
            <td>${t.assignedUser.name}</td>
            <td>Completed</td>
            <td>${t.dueDate}</td>
            <td></td>
          </tr>
        </c:forEach>

        <c:forEach var="t" items="${delayedTasks}">
          <tr>
            <td><span style="color:red; font-weight:bold;">${t.title}</span></td>
            <td>${t.assignedUser.name}</td>
            <td style="color:red;">Delayed</td>
            <td>${t.dueDate}</td>
            <td>
              <form action="<c:url value='/admin/reassignTask'/>" method="post" style="display:flex; gap:.5rem; align-items:center;">
                <input type="hidden" name="taskId" value="${t.taskId}" />
                <select name="newUserId" style="padding:.4rem; border-radius:.6rem; border:1px solid #ddd;">
                  <c:forEach var="u" items="${users}">
                    <option value="${u.userId}">${u.name}</option>
                  </c:forEach>
                </select>
                <button type="submit" class="btn">Reassign</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <footer>© 2025 WorkNest</footer>
</body>
</html>
