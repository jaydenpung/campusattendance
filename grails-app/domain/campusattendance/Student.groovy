package campusattendance

class Student {

	String studentId
	String name
	int age
	String email
	String address
	String telephoneNumber
	String icNumber
	String password
	String uniqueMessagingId

	static hasMany = [lessonAttendances: LessonAttendance, notifications: Notification]

    static constraints = {
    	studentId unique: true
    	uniqueMessagingId unique: true, nullable: true
    }
}
