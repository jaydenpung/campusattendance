
<%@ page import="campusattendance.LessonAttendance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lessonAttendance.label', default: 'LessonAttendance')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lessonAttendance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lessonAttendance" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="student" title="${message(code: 'lessonAttendance.student.label', default: 'Student')}" />
					
						<th><g:message code="lessonAttendance.lesson.label" default="Lesson" /></th>
					
						<th><g:message code="lessonAttendance.attended.label" default="Attended" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lessonAttendanceInstanceList}" status="i" var="lessonAttendanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lessonAttendanceInstance.id}">${fieldValue(bean: lessonAttendanceInstance, field: "student.name")}</g:link></td>
					
						<td>${fieldValue(bean: lessonAttendanceInstance, field: "lesson.subject.subjectName")}</td>

						<td>${fieldValue(bean: lessonAttendanceInstance, field: "attended")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lessonAttendanceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
