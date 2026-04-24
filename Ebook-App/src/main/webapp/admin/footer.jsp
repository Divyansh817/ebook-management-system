<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ page isELIgnored="false"%>
<div class="container-fluid text-center text-white p-2 mt-2" style="background-color: #00838f; font-size: 0.8rem;">
  <c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
  
  <span style="font-weight: normal;">Designed and Developed by Divyansh</span>
</div>
