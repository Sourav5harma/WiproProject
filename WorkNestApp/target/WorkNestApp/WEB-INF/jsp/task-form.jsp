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

		<%-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="<c:url value='/'/>">WorkNest</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="nav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="<c:url value='/admin/login'/>">Admin</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='/user/login'/>">User</a></li>
      </ul>
    </div>
  </div>
</nav> --%>
		<div class="container my-4">

			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-sm">
						<div class="card-body">
							<h3 class="mb-3">Create Task</h3>
							<c:if test="${not empty error}">
								<div class="alert alert-danger">${error}</div>
							</c:if>
							<form method="post" action="<c:url value='/tasks/create'/>">
								<div class="mb-3">
									<label>Title</label><input name="title" class="form-control"
										required>
								</div>
								<div class="mb-3">
									<label>Description</label>
									<textarea name="description" class="form-control" rows="4"></textarea>
								</div>
								<div class="row">
									<div class="col-md-6 mb-3">
										<label>Start Date</label><input name="startDate" type="date"
											class="form-control">
									</div>
									<div class="col-md-6 mb-3">
										<label>Due Date</label><input name="dueDate" type="date"
											class="form-control">
									</div>
								</div>
								<div class="mb-3">
									<label>Assign To</label> <select name="assignedUserId"
										class="form-select" required>
										<c:forEach items="${users}" var="u">
											<option value="${u.userId}">${u.name}(${u.email})</option>
										</c:forEach>
									</select>
								</div>
								<button class="btn btn-primary">Create Task</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<footer>© 2025 WorkNest</footer>
</body>
</html>
