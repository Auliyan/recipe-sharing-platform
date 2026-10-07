<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Login" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container">
  <div class="card auth-card">
    <div class="card-body p-4 p-md-5">
      <h2 class="text-center fw-bold mb-1">Welcome back</h2>
      <p class="text-center text-muted mb-4">Log in to share and save recipes</p>

      <c:if test="${param.registered == '1'}">
        <div class="alert alert-success">Account created! Please log in.</div>
      </c:if>
      <c:if test="${param.required == '1'}">
        <div class="alert alert-info">Please log in to continue.</div>
      </c:if>
      <c:if test="${not empty error}">
        <div class="alert alert-danger"><c:out value="${error}" /></div>
      </c:if>

      <form action="${ctx}/login" method="post">
        <div class="mb-3">
          <label class="form-label" for="email">Email</label>
          <input class="form-control" type="email" id="email" name="email"
                 value="<c:out value='${email}' />" required autofocus>
        </div>
        <div class="mb-4">
          <label class="form-label" for="password">Password</label>
          <input class="form-control" type="password" id="password" name="password" required>
        </div>
        <button class="btn btn-brand w-100 py-2" type="submit">Log In</button>
      </form>
      <p class="text-center mt-4 mb-0">New here? <a href="${ctx}/register">Create an account</a></p>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
