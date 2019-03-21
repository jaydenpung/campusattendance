package campusattendance



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LessonAttendanceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LessonAttendance.list(params), model:[lessonAttendanceInstanceCount: LessonAttendance.count()]
    }

    def show(LessonAttendance lessonAttendanceInstance) {
        respond lessonAttendanceInstance
    }

    def create() {
        respond new LessonAttendance(params)
    }

    @Transactional
    def save(LessonAttendance lessonAttendanceInstance) {
        if (lessonAttendanceInstance == null) {
            notFound()
            return
        }

        if (lessonAttendanceInstance.hasErrors()) {
            respond lessonAttendanceInstance.errors, view:'create'
            return
        }

        lessonAttendanceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lessonAttendance.label', default: 'LessonAttendance'), lessonAttendanceInstance.id])
                redirect lessonAttendanceInstance
            }
            '*' { respond lessonAttendanceInstance, [status: CREATED] }
        }
    }

    def edit(LessonAttendance lessonAttendanceInstance) {
        respond lessonAttendanceInstance
    }

    @Transactional
    def update(LessonAttendance lessonAttendanceInstance) {
        if (lessonAttendanceInstance == null) {
            notFound()
            return
        }

        if (lessonAttendanceInstance.hasErrors()) {
            respond lessonAttendanceInstance.errors, view:'edit'
            return
        }

        lessonAttendanceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LessonAttendance.label', default: 'LessonAttendance'), lessonAttendanceInstance.id])
                redirect lessonAttendanceInstance
            }
            '*'{ respond lessonAttendanceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LessonAttendance lessonAttendanceInstance) {

        if (lessonAttendanceInstance == null) {
            notFound()
            return
        }

        lessonAttendanceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LessonAttendance.label', default: 'LessonAttendance'), lessonAttendanceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lessonAttendance.label', default: 'LessonAttendance'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
