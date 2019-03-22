<%@ page import="campusattendance.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentId', 'error')} required">
	<label for="studentId">
		<g:message code="student.studentId.label" default="Student Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="studentId" required="" value="${studentInstance?.studentId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="student.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="student.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${studentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="student.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${studentInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="student.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${studentInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="student.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${studentInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'icNumber', 'error')} required">
	<label for="icNumber">
		<g:message code="student.icNumber.label" default="Ic Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="icNumber" required="" value="${studentInstance?.icNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'telephoneNumber', 'error')} required">
	<label for="telephoneNumber">
		<g:message code="student.telephoneNumber.label" default="Telephone Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telephoneNumber" required="" value="${studentInstance?.telephoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'lessonAttendances', 'error')} ">
	<label for="lessonAttendances">
		<g:message code="student.lessonAttendances.label" default="Lesson Attendances" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lessonAttendances}" var="l">
    <li><g:link controller="lessonAttendance" action="show" id="${l.id}">${l?.lesson?.subject?.subjectName} - ${l?.lesson?.dateTime} - ${l?.attended}</g:link></li>
</g:each>
<li class="add">
<g:link controller="lessonAttendance" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lessonAttendance.label', default: 'LessonAttendance')])}</g:link>
</li>
</ul>


</div>


<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'notifications', 'error')} ">
	<label for="notifications">
		<g:message code="student.notifications.label" default="Notifications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${studentInstance?.notifications?}" var="n">
    <li><g:link controller="notification" action="show" id="${n.id}">${n?.dateTime}  -  ${n?.message}</g:link></li>
</g:each>
<li class="add">
<g:link controller="notification" action="create" params="['student.id': studentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'notification.label', default: 'Notification')])}</g:link>
</li>
</ul>


</div>

