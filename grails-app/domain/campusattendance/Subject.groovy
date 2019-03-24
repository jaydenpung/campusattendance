package campusattendance

class Subject {

	String subjectName

	static hasMany = [lessons: Lesson]

    static constraints = {
    	subjectName unique: true
    }
}
