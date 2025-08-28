<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>WorkNest</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
	rel="stylesheet">
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

.container {
	flex-grow: 1;
	max-width: 1000px;
	margin: 2rem auto;
	padding: 0 1.5rem;
}

.card {
	background: white;
	padding: 2rem;
	border-radius: 1.5rem;
	box-shadow: 0 6px 16px rgba(168, 143, 216, 0.25);
	transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 22px rgba(168, 143, 216, 0.35);
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

.btn {
	display: inline-block;
	padding: 0.7rem 1.5rem;
	border-radius: 50px;
	background: linear-gradient(135deg, #a88fd8, #6a4ba8);
	color: white;
	font-weight: 600;
	text-decoration: none;
	transition: all 0.3s ease;
}

.btn:hover {
	box-shadow: 0 6px 16px rgba(168, 143, 216, 0.4);
	transform: translateY(-2px);
}
</style>
</head>
<body>
	<nav>
		<div class="title">WorkNest</div>
		<div class="actions">
			<a href="<c:url value='/admin/login'/>">Admin</a> <a
				href="<c:url value='/user/login'/>">User</a>
		</div>
	</nav>
	<div class="hero">
		<h1>Welcome to WorkNest</h1>
		<p>A calm lavender workspace where productivity meets elegance.</p>
	</div>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand fw-bold" href="<c:url value='/'/>">WorkNest</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#nav">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="nav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/admin/login'/>">Admin</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value='/user/login'/>">User</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container my-4">

			<div class="d-flex justify-content-between align-items-center mb-3">
				<h3>Admin Dashboard</h3>
				<div>
					<a class="btn btn-outline-secondary"
						href="<c:url value='/tasks/new'/>">Create Task</a> <a
						class="btn btn-danger" href="<c:url value='/admin/logout'/>">Logout</a>
				</div>
			</div>

			<!-- Users Section -->
			<div class="card shadow-sm mb-4">
				<div class="card-header">Users</div>
				<div class="card-body p-0">
					<table class="table mb-0 table-striped">
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
										<form method="post"
											action="<c:url value='/user/delete/${u.userId}'/>"
											onsubmit="return confirm('Delete user?')">
											<button class="btn btn-sm btn-outline-danger">Delete</button>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Tasks Section -->
			<div class="card shadow-sm mb-4">
				<div class="card-header">Tasks</div>
				<div class="card-body">

					<h5 class="text-primary">Pending</h5>
					<c:forEach var="t" items="${pendingTasks}">
						<p>${t.title}- Assigned to: ${t.assignedUser.name}</p>
					</c:forEach>

					<h5 class="text-info mt-3">In Progress</h5>
					<c:forEach var="t" items="${inProgressTasks}">
						<p>${t.title}- Assigned to: ${t.assignedUser.name}</p>
					</c:forEach>

					<h5 class="text-success mt-3">Completed</h5>
					<c:forEach var="t" items="${completedTasks}">
						<p>${t.title}- Assigned to: ${t.assignedUser.name}</p>
					</c:forEach>

					<h5 class="text-danger mt-3">Delayed</h5>
					<c:forEach var="t" items="${delayedTasks}">
						<p>
							<span class="fw-bold text-danger">${t.title}</span> - Due:
							${t.dueDate}
						</p>
					</c:forEach>

				</div>
			</div>


			<footer>© 2025 WorkNest</footer>
</body>
</html>
