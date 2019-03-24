package campusattendance

class Lesson {

	Date dateTime
	Staff staff
	Subject subject
	String qrKeyString

	static hasMany = [lessonAttendances:LessonAttendance]

    static constraints = {
    	qrKeyString nullable: true
    }
}
