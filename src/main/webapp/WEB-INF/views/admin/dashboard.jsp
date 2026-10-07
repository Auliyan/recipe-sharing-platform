<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Admin Dashboard" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container my-5">
  <h2 class="fw-bold mb-4">Admin Dashboard</h2>

  <div class="row g-3 mb-5">
    <div class="col-12 col-sm-6 col-lg-3"><div class="card stat-card stat-orange"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-orange"><i class="bi bi-people-fill"></i></div>
      <div><div class="text-muted small">Users</div><div class="stat-number">${totalUsers}</div></div>
    </div></div></div>
    <div class="col-12 col-sm-6 col-lg-3"><div class="card stat-card stat-green"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-green"><i class="bi bi-journal-richtext"></i></div>
      <div><div class="text-muted small">Total recipes</div><div class="stat-number">${totalRecipes}</div></div>
    </div></div></div>
    <div class="col-12 col-sm-6 col-lg-3"><div class="card stat-card stat-green"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-green"><i class="bi bi-check-circle-fill"></i></div>
      <div><div class="text-muted small">Approved</div><div class="stat-number">${approvedCount}</div></div>
    </div></div></div>
    <div class="col-12 col-sm-6 col-lg-3"><div class="card stat-card stat-yellow"><div class="card-body d-flex align-items-center gap-3">
      <div class="stat-icon icon-yellow"><i class="bi bi-hourglass-split"></i></div>
      <div><div class="text-muted small">Awaiting approval</div><div class="stat-number">${pendingCount}</div></div>
    </div></div></div>
  </div>

  <h4 class="section-title">Recipes awaiting approval</h4>
  <c:choose>
    <c:when test="${empty pendingRecipes}">
      <div class="alert alert-success">All caught up. No recipes are waiting.</div>
    </c:when>
    <c:otherwise>
      <div class="table-responsive mb-5">
        <table class="table table-hover align-middle bg-white shadow-sm">
          <thead class="table-light"><tr><th>Title</th><th>Author</th><th>Category</th><th class="text-end">Action</th></tr></thead>
          <tbody>
            <c:forEach var="r" items="${pendingRecipes}">
              <tr>
                <td><a href="${ctx}/recipe?id=${r.id}"><c:out value="${r.title}" /></a></td>
                <td><c:out value="${r.authorName}" /></td>
                <td><c:out value="${r.category}" /></td>
                <td class="text-end">
                  <form class="d-inline" action="${ctx}/admin/recipe-action" method="post">
                    <input type="hidden" name="id" value="${r.id}">
                    <button class="btn btn-success btn-sm" name="action" value="approve">Approve</button>
                    <button class="btn btn-outline-danger btn-sm" name="action" value="reject">Reject</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </c:otherwise>
  </c:choose>

  <h4 class="section-title">All users</h4>
  <div class="table-responsive">
    <table class="table table-hover align-middle bg-white shadow-sm">
      <thead class="table-light"><tr><th>#</th><th>Name</th><th>Email</th><th>Role</th></tr></thead>
      <tbody>
        <c:forEach var="u" items="${users}">
          <tr>
            <td>${u.id}</td>
            <td><c:out value="${u.name}" /></td>
            <td><c:out value="${u.email}" /></td>
            <td><span class="badge ${u.role == 'ADMIN' ? 'text-bg-dark' : 'text-bg-secondary'}">${u.role}</span></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
