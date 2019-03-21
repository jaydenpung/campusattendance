<%@ page import="campusattendance.Staff" %>



<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'staffPosition', 'error')} required">
	<label for="staffPosition">
		<g:message code="staff.staffPosition.label" default="Staff Position" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="staffPosition" from="${staffInstance.constraints.staffPosition.inList}" required="" value="${staffInstance?.staffPosition}" valueMessagePrefix="staff.staffPosition"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'staffId', 'error')} required">
	<label for="staffId">
		<g:message code="staff.staffId.label" default="Staff Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="staffId" required="" value="${staffInstance?.staffId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="staff.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="staff.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${staffInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="staff.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${staffInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'icNumber', 'error')} required">
	<label for="icNumber">
		<g:message code="staff.icNumber.label" default="Ic Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="icNumber" required="" value="${staffInstance?.icNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="staff.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${staffInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="staff.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${staffInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'telephoneNumber', 'error')} required">
	<label for="telephoneNumber">
		<g:message code="staff.telephoneNumber.label" default="Telephone Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telephoneNumber" required="" value="${staffInstance?.telephoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'uniqueMessagingId', 'error')} ">
	<label for="uniqueMessagingId">
		<g:message code="staff.uniqueMessagingId.label" default="Unique Messaging Id" />
		
	</label>
	<g:textField name="uniqueMessagingId" value="${staffInstance?.uniqueMessagingId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: staffInstance, field: 'lessons', 'error')} ">
	<label for="lessons">
		<g:message code="staff.lessons.label" default="Lessons" />
		
	</label>
	
	<ul class="one-to-many">
		<g:each in="${staffInstance?.lessons?}" var="l">
		    <li><g:link controller="lesson" action="show" id="${l.id}">${l?.subject?.subjectName} - ${l?.dateTime}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="lesson" action="create" params="['staff.id': staffInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lesson.label', default: 'Lesson')])}</g:link>
		</li>
	</ul>

</div>