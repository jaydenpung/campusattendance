<%@ page import="campusattendance.Lesson" %>



<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="lesson.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="minute"  value="${lessonInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'staff', 'error')} required">
	<label for="staff">
		<g:message code="lesson.staff.label" default="Staff" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="staff" name="staff.id" from="${campusattendance.Staff.list()}" optionKey="id" optionValue="name" required="" value="${lessonInstance?.staff?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="lesson.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subject" name="subject.id" from="${campusattendance.Subject.list()}" optionKey="id" optionValue="subjectName" required="" value="${lessonInstance?.subject?.id}" class="many-to-one"/>

</div>

