package campusattendance

import org.hibernate.Criteria

class DashboardController {

	def sessionFactory

    def index() { }



    def barredList() {
        try {
        	def currentSession = sessionFactory.currentSession
	        def q = "select std.id as student_index_id, std.student_id, std.name as student_name, sbj.subject_name, SUM(att.attended)/COUNT(att.attended)*100 as attendance_percentage, SUM(att.attended) as attended_lesson, COUNT(att.attended) as total_lesson from subject sbj left join lesson l on sbj.id=l.subject_id left join lesson_attendance att on l.id=att.lesson_id left join student std on att.student_id=std.id WHERE std.id is not null and l.date_time <= now() GROUP BY std.student_id, sbj.subject_name having SUM(att.attended)/COUNT(att.attended) < 0.8"

	        def data = currentSession.createSQLQuery(q)
	        data.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);//if you are using alias for query e.g bank.credit_amount as creditAmount
	        final result = data.list()

            [ result: result ]
        }
        catch (Exception ex) {
            log.error("barredList() failed: ${ex.message}", ex)
        }
    }
}
