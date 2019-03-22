
<%@ page import="campusattendance.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-student" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list student">
			
				<g:if test="${studentInstance?.studentId}">
				<li class="fieldcontain">
					<span id="studentId-label" class="property-label"><g:message code="student.studentId.label" default="Student Id" /></span>
					
						<span class="property-value" aria-labelledby="studentId-label"><g:fieldValue bean="${studentInstance}" field="studentId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="student.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${studentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="student.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${studentInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="student.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${studentInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="student.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${studentInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.icNumber}">
				<li class="fieldcontain">
					<span id="icNumber-label" class="property-label"><g:message code="student.icNumber.label" default="Ic Number" /></span>
					
						<span class="property-value" aria-labelledby="icNumber-label"><g:fieldValue bean="${studentInstance}" field="icNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.telephoneNumber}">
				<li class="fieldcontain">
					<span id="telephoneNumber-label" class="property-label"><g:message code="student.telephoneNumber.label" default="Telephone Number" /></span>
					
						<span class="property-value" aria-labelledby="telephoneNumber-label"><g:fieldValue bean="${studentInstance}" field="telephoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonAttendances}">
				<li class="fieldcontain">
					<span id="lessonAttendances-label" class="property-label"><g:message code="student.lessonAttendances.label" default="Lesson Attendances" /></span>
					
						<g:each in="${lessonAttendances}" var="l">
						<span class="property-value" aria-labelledby="lessonAttendances-label"><g:link controller="lessonAttendance" action="show" id="${l.id}">${l?.lesson?.subject?.subjectName} - ${l?.lesson?.dateTime} - ${l?.attended}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${studentInstance?.notifications}">
				<li class="fieldcontain">
					<span id="notifications-label" class="property-label"><g:message code="student.notifications.label" default="Notifications" /></span>
					
						<g:each in="${studentInstance.notifications}" var="n">
						<span class="property-value" aria-labelledby="notifications-label"><g:link controller="notification" action="show" id="${n.id}">${n?.message}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:studentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${studentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
