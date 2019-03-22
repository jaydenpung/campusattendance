<%@ page import="campusattendance.Subject" %>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'subjectName', 'error')} required">
	<label for="subjectName">
		<g:message code="subject.subjectName.label" default="Subject Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subjectName" required="" value="${subjectInstance?.subjectName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subjectInstance, field: 'lessons', 'error')} ">
	<label for="lessons">
		<g:message code="subject.lessons.label" default="Lessons" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lessons?}" var="l">
    <li><g:link controller="lesson" action="show" id="${l.id}">${l?.dateTime} - By ${l?.staff.name}</g:link></li>
</g:each>
<li class="add">
<g:link controller="lesson" action="create" params="['subject.id': subjectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'lesson.label', default: 'Lesson')])}</g:link>
</li>
</ul>


</div>



