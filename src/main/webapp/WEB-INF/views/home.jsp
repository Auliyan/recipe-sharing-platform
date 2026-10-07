<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Home" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<section class="hero">
  <div class="container text-center">
    <span class="eyebrow"><i class="bi bi-stars me-1"></i>Cook &middot; Share &middot; Enjoy</span>
    <h1 class="mb-3">Discover &amp; share recipes you'll love</h1>
    <p class="lead mb-4">Thousands of home-cooked ideas, shared by people who love food.</p>
    <form class="row g-2 justify-content-center" action="${ctx}/recipes" method="get">
      <div class="col-12 col-md-6">
        <input class="form-control form-control-lg" type="text" name="q"
               placeholder="Search by dish or ingredient...">
      </div>
      <div class="col-12 col-md-auto">
        <button class="btn btn-dark btn-lg w-100" type="submit"><i class="bi bi-search me-1"></i>Search</button>
      </div>
    </form>
  </div>
</section>

<main class="container my-5">
  <h2 class="section-title">Latest Recipes</h2>
  <c:choose>
    <c:when test="${empty latest}">
      <div class="alert alert-warning">No recipes yet. Sign up and share the first one!</div>
    </c:when>
    <c:otherwise>
      <div class="row g-4">
        <c:forEach var="r" items="${latest}">
          <%@ include file="/WEB-INF/views/common/recipe-card.jspf" %>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
  <div class="text-center mt-4">
    <a class="btn btn-brand btn-lg" href="${ctx}/recipes">Browse all recipes <i class="bi bi-arrow-right ms-1"></i></a>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
