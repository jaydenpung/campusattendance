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

	static hasMany = [lessons:Lesson]

    static constraints = {
    	staffPosition inList: ["Ordinary", "HOD", "Dean"]
    	staffId unique: true
    }
}
