<%@ page import="campusattendance.LessonAttendance" %>


<div class="fieldcontain ${hasErrors(bean: lessonAttendanceInstance, field: 'attended', 'error')} ">
	<label for="attended">
		<g:message code="lessonAttendance.attended.label" default="Attended" />
		
	</label>
	<g:checkBox name="attended" value="${lessonAttendanceInstance?.attended}" />

</div>

<div class="fieldcontain ${hasErrors(bean: lessonAttendanceInstance, field: 'lesson', 'error')} required">
	<label for="lesson">
		<g:message code="lessonAttendance.lesson.label" default="Lesson" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lesson" name="lesson.id" from="${campusattendance.Lesson.list()}" optionKey="id" optionValue="${{it.subject.subjectName +' - '+it.dateTime + ' - By ' + it.staff.name}}" required="" value="${lessonAttendanceInstance?.lesson?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lessonAttendanceInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="lessonAttendance.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${campusattendance.Student.list()}" optionKey="id" optionValue="name" required="" value="${lessonAttendanceInstance?.student?.id}" class="many-to-one"/>

</div>

