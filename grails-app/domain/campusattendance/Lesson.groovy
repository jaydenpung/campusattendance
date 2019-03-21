package campusattendance

class Lesson {

	Date dateTime
	Staff staff
	Subject subject

	static hasMany = [lessonAttendances:LessonAttendance]

    static constraints = {
    }
}
