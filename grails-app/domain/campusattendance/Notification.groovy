package campusattendance

class Notification {

	String message
	Student student
	Staff sender
	Date dateTime = new Date()

    static constraints = {
    	sender nullable: true
    }
}
