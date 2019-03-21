
<%@ page import="campusattendance.Staff" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'staff.label', default: 'Staff')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-staff" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-staff" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list staff">
			
				<g:if test="${staffInstance?.staffPosition}">
				<li class="fieldcontain">
					<span id="staffPosition-label" class="property-label"><g:message code="staff.staffPosition.label" default="Staff Position" /></span>
					
						<span class="property-value" aria-labelledby="staffPosition-label"><g:fieldValue bean="${staffInstance}" field="staffPosition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.staffId}">
				<li class="fieldcontain">
					<span id="staffId-label" class="property-label"><g:message code="staff.staffId.label" default="Staff Id" /></span>
					
						<span class="property-value" aria-labelledby="staffId-label"><g:fieldValue bean="${staffInstance}" field="staffId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="staff.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${staffInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="staff.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${staffInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.icNumber}">
				<li class="fieldcontain">
					<span id="icNumber-label" class="property-label"><g:message code="staff.icNumber.label" default="Ic Number" /></span>
					
						<span class="property-value" aria-labelledby="icNumber-label"><g:fieldValue bean="${staffInstance}" field="icNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="staff.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${staffInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="staff.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${staffInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.telephoneNumber}">
				<li class="fieldcontain">
					<span id="telephoneNumber-label" class="property-label"><g:message code="staff.telephoneNumber.label" default="Telephone Number" /></span>
					
						<span class="property-value" aria-labelledby="telephoneNumber-label"><g:fieldValue bean="${staffInstance}" field="telephoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.uniqueMessagingId}">
				<li class="fieldcontain">
					<span id="uniqueMessagingId-label" class="property-label"><g:message code="staff.uniqueMessagingId.label" default="Unique Messaging Id" /></span>
					
						<span class="property-value" aria-labelledby="uniqueMessagingId-label"><g:fieldValue bean="${staffInstance}" field="uniqueMessagingId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${staffInstance?.lessons}">
				<li class="fieldcontain">
					<span id="lessons-label" class="property-label"><g:message code="staff.lessons.label" default="Lessons" /></span>
					
						<g:each in="${staffInstance.lessons}" var="l">
						<span class="property-value" aria-labelledby="lessons-label"><g:link controller="lesson" action="show" id="${l.id}">${l?.subject?.subjectName} - ${l?.dateTime}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:staffInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${staffInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
