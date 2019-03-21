import grails.util.Holders
import grails.util.Environment
import org.springframework.web.multipart.commons.CommonsMultipartFile

import campusattendance.*

class BootStrap {

    def init = { servletContext ->
    	switch (Environment.current) {
            case Environment.PRODUCTION:
                break
            case Environment.DEVELOPMENT:
                if (Staff.count() == 0) {
                    createDefaultStaffs()
                }
                if (Student.count() == 0) {
                    createDefaultStudents()
                }
                if (Subject.count() == 0 && Lesson.count() == 0) {
                    createDefaultSubjectAndLessons()
                }
                if (LessonAttendance.count() == 0) {
                    createDefaultLessonAttendances()
                }
                break
        }
    }
    def destroy = {
    	def servletContext = Holders.getServletContext()
        servletContext.getAttribute("executor")?.shutdown()
    }

    def createDefaultStaffs() {
        try {
	            [
	                [
	                    staffId: "A001",
	                    staffPosition: "Ordinary",
	                    name: "Marc Jacobs",
	                    age: 34,
	                    email: "marc_jacobs@edu.my",
	                    address: "Lorong 14, Taman Mutiara",
	                    telephoneNumber: "016-4340932",
	                    icNumber: "850225-11-3121"
	                ],
	                [
	                    staffId: "A002",
	                    staffPosition: "Ordinary",
	                    name: "Anne Nielson",
	                    age: 37,
	                    email: "anne_nielson@edu.my",
	                    address: "Lorong 16, Taman Naga",
	                    telephoneNumber: "018-2140982",
	                    icNumber: "820821-13-6128"
	                ],
	                [
	                    staffId: "A003",
	                    staffPosition: "HOD",
	                    name: "Castiel Houston",
	                    age: 50,
	                    email: "castiel_houston@edu.my",
	                    address: "Lorong 9, Taman Mango",
	                    telephoneNumber: "012-9320911",
	                    icNumber: "690225-07-3569"
	                ],
	                [
	                    staffId: "A004",
	                    staffPosition: "Dean",
	                    name: "Zachariah Bing",
	                    age: 60,
	                    email: "zachariah_bing@edu.my",
	                    address: "Lorong 4, Taman Singa",
	                    telephoneNumber: "010-1115672",
	                    icNumber: "590225-07-3569"
	                ]
	            ].each { data ->

	                def staff = new Staff(
	                    staffId: data.staffId,
	                    staffPosition: data.staffPosition,
	                    name: data.name,
	                    age: data.age,
	                    email: data.email,
	                    address: data.address,
	                    telephoneNumber: data.telephoneNumber,
	                    icNumber: data.icNumber
	                )

	                staff.save(flush:true, failOnError: true)
	                log.info("Saved staff: ${staff.name}")
	            }
        }
        catch (Exception ex) {
            log.error("createDefaultStaffs() failed: ${ex.message}", ex)
        }
    }

    def createDefaultStudents() {
        try {
	            [
	                [
	                    studentId: "B001",
	                    name: "Lim Ping Pong",
	                    age: 19,
	                    email: "limpingpong@edu.my",
	                    address: "Jalan 14, Taman Mutiara",
	                    telephoneNumber: "012-2222222",
	                    icNumber: "000225-11-7876"
	                ],
	                [
	                    studentId: "B002",
	                    name: "Kong Teck Chong",
	                    age: 21,
	                    email: "kongteckchong@edu.my",
	                    address: "Jalan 16, Taman Naga",
	                    telephoneNumber: "013-3333333",
	                    icNumber: "980821-13-4533"
	                ],
	                [
	                    studentId: "B003",
	                    name: "Tan Sin Ho",
	                    age: 23,
	                    email: "tansinho@edu.my",
	                    address: "Jalan 9, Taman Mango",
	                    telephoneNumber: "014-4444444",
	                    icNumber: "960225-07-6565"
	                ],
	                [
	                    studentId: "B004",
	                    name: "Lee Chiu Kai",
	                    age: 22,
	                    email: "leechiukai@edu.my",
	                    address: "Jalan 4, Taman Singa",
	                    telephoneNumber: "015-1555555",
	                    icNumber: "970225-07-3234"
	                ]
	            ].each { data ->

	                def student = new Student(
	                    studentId: data.studentId,
	                    name: data.name,
	                    age: data.age,
	                    email: data.email,
	                    address: data.address,
	                    telephoneNumber: data.telephoneNumber,
	                    icNumber: data.icNumber
	                )

	                student.save(flush:true, failOnError: true)
	                log.info("Saved Student: ${student.name}")
	            }
        }
        catch (Exception ex) {
            log.error("createDefaultStudents() failed: ${ex.message}", ex)
        }
    }

    def createDefaultSubjectAndLessons() {
    }

    def createDefaultLessonAttendances() {

    }
}
