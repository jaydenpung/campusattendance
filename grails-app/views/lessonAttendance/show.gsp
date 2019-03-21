
<%@ page import="campusattendance.LessonAttendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lessonAttendance.label', default: 'LessonAttendance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lessonAttendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lessonAttendance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lessonAttendance">
			
				<g:if test="${lessonAttendanceInstance?.lesson}">
				<li class="fieldcontain">
					<span id="lesson-label" class="property-label"><g:message code="lessonAttendance.lesson.label" default="Lesson" /></span>
					
						<span class="property-value" aria-labelledby="lesson-label"><g:link controller="lesson" action="show" id="${lessonAttendanceInstance?.lesson?.id}">${lessonAttendanceInstance?.lesson?.subject?.subjectName}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonAttendanceInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="lessonAttendance.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${lessonAttendanceInstance?.student?.id}">${lessonAttendanceInstance?.student?.name}</g:link></span>
					
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="attended-label" class="property-label"><g:message code="lessonAttendance.attended.label" default="Attended" /></span>
					<span class="property-value" aria-labelledby="attended-label"><g:formatBoolean boolean="${lessonAttendanceInstance?.attended}" /></span>
				</li>
			
			</ol>
			<g:form url="[resource:lessonAttendanceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${lessonAttendanceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
