package campusattendance

class Staff {

	String staffId
	String staffPosition
	String name
	int age
	String email
	String address
	String telephoneNumber
	String icNumber
	String password
	String uniqueMessagingId

	static hasMany = [lessons:Lesson]

    static constraints = {
    	staffPosition inList: ["Ordinary", "HOD", "Dean"]
    	staffId unique: true
    	uniqueMessagingId unique: true, nullable: true
    }
}
