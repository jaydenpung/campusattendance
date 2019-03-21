
<%@ page import="campusattendance.Lesson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lesson.label', default: 'Lesson')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lesson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lesson" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lesson">
			
				<g:if test="${lessonInstance?.dateTime}">
				<li class="fieldcontain">
					<span id="dateTime-label" class="property-label"><g:message code="lesson.dateTime.label" default="Date Time" /></span>
					
						<span class="property-value" aria-labelledby="dateTime-label"><g:formatDate date="${lessonInstance?.dateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonInstance?.staff}">
				<li class="fieldcontain">
					<span id="staff-label" class="property-label"><g:message code="lesson.staff.label" default="Staff" /></span>
					
						<span class="property-value" aria-labelledby="staff-label"><g:link controller="staff" action="show" id="${lessonInstance?.staff?.id}">${lessonInstance?.staff?.name}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="lesson.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:link controller="subject" action="show" id="${lessonInstance?.subject?.id}">${lessonInstance?.subject?.subjectName}</g:link></span>
					
				</li>
				</g:if>

				<g:if test="${lessonInstance?.lessonAttendances}">
				<li class="fieldcontain">
					<span id="lessonAttendances-label" class="property-label"><g:message code="lesson.lessonAttendances.label" default="Lesson Attendances" /></span>
					
						<g:each in="${lessonInstance.lessonAttendances}" var="l">
						<span class="property-value" aria-labelledby="lessonAttendances-label"><g:link controller="lessonAttendance" action="show" id="${l.id}">${l?.student.name} - ${l?.attended}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:lessonInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${lessonInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
