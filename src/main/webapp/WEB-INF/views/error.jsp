<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="Oops" />
<%@ include file="/WEB-INF/views/common/header.jspf" %>

<main class="container text-center my-5 py-5">
  <div style="font-size:4rem">&#127859;</div>
  <h1 class="fw-bold">Something went wrong</h1>
  <p class="text-muted">The page you wanted is missing, restricted, or hit a problem.</p>
  <a class="btn btn-brand" href="${ctx}/home">Back to home</a>
</main>

<%@ include file="/WEB-INF/views/common/footer.jspf" %>
