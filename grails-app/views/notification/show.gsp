
<%@ page import="campusattendance.Notification" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'notification.label', default: 'Notification')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-notification" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-notification" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list notification">
			
				<g:if test="${notificationInstance?.dateTime}">
				<li class="fieldcontain">
					<span id="dateTime-label" class="property-label"><g:message code="notification.dateTime.label" default="Date Time" /></span>
					
						<span class="property-value" aria-labelledby="dateTime-label"><g:formatDate date="${notificationInstance?.dateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificationInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="notification.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${notificationInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${notificationInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="notification.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${notificationInstance?.student?.id}">${notificationInstance?.student?.studentId} - ${notificationInstance?.student?.name}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:notificationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${notificationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
