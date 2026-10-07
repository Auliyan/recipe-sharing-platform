<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="${recipe.title}" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container my-5">
  <a href="${ctx}/recipes" class="text-decoration-none">&larr; Back to recipes</a>

  <div class="row g-4 mt-1">
    <div class="col-12 col-lg-5">
      <c:choose>
        <c:when test="${not empty recipe.imagePath}">
          <img class="img-fluid rounded-4 shadow-sm w-100" src="<c:out value='${recipe.imagePath}' />"
               alt="<c:out value='${recipe.title}' />">
        </c:when>
        <c:otherwise>
          <div class="recipe-placeholder rounded-4" style="height:320px;font-size:6rem">&#127858;</div>
        </c:otherwise>
      </c:choose>
    </div>

    <div class="col-12 col-lg-7">
      <span class="badge category-badge mb-2"><c:out value="${recipe.category}" /></span>
      <c:if test="${recipe.status != 'APPROVED'}">
        <span class="badge text-bg-warning mb-2">${recipe.status}</span>
      </c:if>
      <h1 class="fw-bold"><c:out value="${recipe.title}" /></h1>
      <p class="text-muted">Shared by <strong><c:out value="${recipe.authorName}" /></strong></p>
      <p class="lead"><c:out value="${recipe.description}" /></p>
    </div>
  </div>

  <div class="row g-4 mt-2">
    <div class="col-12 col-md-5">
      <div class="card stat-card stat-green h-100"><div class="card-body">
        <h4 class="mb-3">&#129364; Ingredients</h4>
        <div class="pre-line"><c:out value="${recipe.ingredients}" /></div>
      </div></div>
    </div>
    <div class="col-12 col-md-7">
      <div class="card stat-card stat-orange h-100"><div class="card-body">
        <h4 class="mb-3">&#128221; Instructions</h4>
        <div class="pre-line"><c:out value="${recipe.instructions}" /></div>
      </div></div>
    </div>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
