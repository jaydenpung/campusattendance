package campusattendance

class Student {

	String studentId
	String name
	int age
	String email
	String address
	String telephoneNumber
	String icNumber

	static hasMany = [lessonAttendances: LessonAttendance]

    static constraints = {
    	studentId unique: true
    }
}
