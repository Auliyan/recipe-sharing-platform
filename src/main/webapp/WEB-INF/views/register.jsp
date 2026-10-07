<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Sign Up" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container">
  <div class="card auth-card">
    <div class="card-body p-4 p-md-5">
      <h2 class="text-center fw-bold mb-1">Join RecipeShare</h2>
      <p class="text-center text-muted mb-4">Create a free account in seconds</p>

      <c:if test="${not empty errors}">
        <div class="alert alert-danger">
          <ul class="mb-0 ps-3">
            <c:forEach var="e" items="${errors}"><li><c:out value="${e}" /></li></c:forEach>
          </ul>
        </div>
      </c:if>

      <form action="${ctx}/register" method="post">
        <div class="mb-3">
          <label class="form-label" for="name">Full name</label>
          <input class="form-control" type="text" id="name" name="name"
                 value="<c:out value='${name}' />" required>
        </div>
        <div class="mb-3">
          <label class="form-label" for="email">Email</label>
          <input class="form-control" type="email" id="email" name="email"
                 value="<c:out value='${email}' />" required>
        </div>
        <div class="mb-3">
          <label class="form-label" for="password">Password</label>
          <input class="form-control" type="password" id="password" name="password" minlength="6" required>
          <div class="form-text">At least 6 characters.</div>
        </div>
        <div class="mb-4">
          <label class="form-label" for="confirm">Confirm password</label>
          <input class="form-control" type="password" id="confirm" name="confirm" required>
        </div>
        <button class="btn btn-brand w-100 py-2" type="submit">Create Account</button>
      </form>
      <p class="text-center mt-4 mb-0">Already have an account? <a href="${ctx}/login">Log in</a></p>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
