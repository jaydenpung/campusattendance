<%@ page import="campusattendance.Notification" %>



<div class="fieldcontain ${hasErrors(bean: notificationInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="notification.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="minute"  value="${notificationInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: notificationInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="notification.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" required="" value="${notificationInstance?.message}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: notificationInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="notification.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${campusattendance.Student.list()}" optionKey="id" optionValue="name" required="" value="${notificationInstance?.student?.id}" class="many-to-one"/>

</div>

