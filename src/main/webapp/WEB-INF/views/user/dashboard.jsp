<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="My Dashboard" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container my-5">
  <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center gap-2 mb-4">
    <h2 class="fw-bold mb-0">My Dashboard</h2>
    <a class="btn btn-brand" href="${ctx}/user/add-recipe"><i class="bi bi-plus-lg me-1"></i>Share a new recipe</a>
  </div>

  <c:if test="${param.added == '1'}">
    <div class="alert alert-success">Recipe submitted! It will appear on the site once an admin approves it.</div>
  </c:if>

  <div class="row g-3 mb-4">
    <div class="col-12 col-md-4"><div class="card stat-card stat-yellow"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-yellow"><i class="bi bi-hourglass-split"></i></div>
      <div><div class="text-muted small">Pending</div><div class="stat-number">${stats['PENDING']}</div></div>
    </div></div></div>
    <div class="col-12 col-md-4"><div class="card stat-card stat-green"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-green"><i class="bi bi-check-circle-fill"></i></div>
      <div><div class="text-muted small">Approved</div><div class="stat-number">${stats['APPROVED']}</div></div>
    </div></div></div>
    <div class="col-12 col-md-4"><div class="card stat-card stat-red"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-red"><i class="bi bi-x-circle-fill"></i></div>
      <div><div class="text-muted small">Rejected</div><div class="stat-number">${stats['REJECTED']}</div></div>
    </div></div></div>
  </div>

  <h4 class="section-title">My Recipes</h4>
  <c:choose>
    <c:when test="${empty myRecipes}">
      <div class="alert alert-info">You haven't shared any recipes yet.</div>
    </c:when>
    <c:otherwise>
      <div class="table-responsive">
        <table class="table table-hover align-middle bg-white rounded-3 shadow-sm">
          <thead class="table-light"><tr><th>Title</th><th>Category</th><th>Status</th><th></th></tr></thead>
          <tbody>
            <c:forEach var="r" items="${myRecipes}">
              <tr>
                <td><c:out value="${r.title}" /></td>
                <td><c:out value="${r.category}" /></td>
                <td>
                  <c:choose>
                    <c:when test="${r.status == 'APPROVED'}"><span class="badge text-bg-success">Approved</span></c:when>
                    <c:when test="${r.status == 'REJECTED'}"><span class="badge text-bg-danger">Rejected</span></c:when>
                    <c:otherwise><span class="badge text-bg-warning">Pending</span></c:otherwise>
                  </c:choose>
                </td>
                <td class="text-end"><a class="btn btn-outline-brand btn-sm" href="${ctx}/recipe?id=${r.id}">View</a></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:otherwise>
  </c:choose>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
