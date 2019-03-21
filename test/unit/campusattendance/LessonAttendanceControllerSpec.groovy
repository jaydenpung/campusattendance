package campusattendance



import grails.test.mixin.*
import spock.lang.*

@TestFor(LessonAttendanceController)
@Mock(LessonAttendance)
class LessonAttendanceControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.lessonAttendanceInstanceList
            model.lessonAttendanceInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.lessonAttendanceInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def lessonAttendance = new LessonAttendance()
            lessonAttendance.validate()
            controller.save(lessonAttendance)

        then:"The create view is rendered again with the correct model"
            model.lessonAttendanceInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            lessonAttendance = new LessonAttendance(params)

            controller.save(lessonAttendance)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/lessonAttendance/show/1'
            controller.flash.message != null
            LessonAttendance.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def lessonAttendance = new LessonAttendance(params)
            controller.show(lessonAttendance)

        then:"A model is populated containing the domain instance"
            model.lessonAttendanceInstance == lessonAttendance
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def lessonAttendance = new LessonAttendance(params)
            controller.edit(lessonAttendance)

        then:"A model is populated containing the domain instance"
            model.lessonAttendanceInstance == lessonAttendance
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/lessonAttendance/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def lessonAttendance = new LessonAttendance()
            lessonAttendance.validate()
            controller.update(lessonAttendance)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.lessonAttendanceInstance == lessonAttendance

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            lessonAttendance = new LessonAttendance(params).save(flush: true)
            controller.update(lessonAttendance)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/lessonAttendance/show/$lessonAttendance.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/lessonAttendance/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def lessonAttendance = new LessonAttendance(params).save(flush: true)

        then:"It exists"
            LessonAttendance.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(lessonAttendance)

        then:"The instance is deleted"
            LessonAttendance.count() == 0
            response.redirectedUrl == '/lessonAttendance/index'
            flash.message != null
    }
}
