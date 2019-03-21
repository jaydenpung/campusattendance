
<%@ page import="campusattendance.Lesson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lesson.label', default: 'Lesson')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-lesson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-lesson" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dateTime" title="${message(code: 'lesson.dateTime.label', default: 'Date Time')}" />
					
						<th><g:message code="lesson.staff.label" default="Staff" /></th>
					
						<th><g:message code="lesson.subject.label" default="Subject" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${lessonInstanceList}" status="i" var="lessonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${lessonInstance.id}">${fieldValue(bean: lessonInstance, field: "dateTime")}</g:link></td>
					
						<td>${fieldValue(bean: lessonInstance, field: "staff.name")}</td>
					
						<td>${fieldValue(bean: lessonInstance, field: "subject.subjectName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${lessonInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
