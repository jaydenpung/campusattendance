<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div style="margin:10px">
			<h2>Barred List based on today's date:</h2>
			<table>
				<tr>
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Subject</th>
					<th>Attendance</th>
					<th>Attendance (%)</th>
				</tr>
				<g:each var="row" in="${result}">
				<tr>
					<input style="display:none" class="barredList" data-studentIndexId="${row.student_index_id}" data-subject="${row.subject_name}"></input>
					<td>${row.student_id}</td>
					<td>${row.student_name}</td>
					<td>${row.subject_name}</td>
					<td>${row.attended_lesson} / ${row.total_lesson}</td>
					<td>${row.attendance_percentage}</td>
				</tr>
	         	</g:each>
	         </table>
	         <div style="text-align:center">
	         	<button onclick="sendBarredListNotification()">Send Barred List</button>
	         </div>
		</div>

		<script>

			var groupBy = function(xs, key) {
			  return xs.reduce(function(rv, x) {
			    (rv[x[key]] = rv[x[key]] || []).push(x);
			    return rv;
			  }, {});
			}; 

			function sendBarredListNotification() {
				var messagePacketList = [];
				$.each($('.barredList'), function( index, value ) {
					var studentId = $(this).attr("data-studentindexid");
					var subjectName = $(this).attr("data-subject");

					var messagePacket = {};
					messagePacket.subjectName = subjectName;
					messagePacket.message = 'You have been barred in the subject: ' + subjectName+ '.';
					messagePacket.studentId = studentId;
					messagePacketList.push(messagePacket);
				});

				var dataPacket = groupBy(messagePacketList, 'subjectName');

				$.each(dataPacket, function( index, data ) {
					var studentIdList = [];
					var message = data[0].message;
					$.each(data, function( index, messagePacket ) {
						studentIdList.push(parseInt(messagePacket.studentId));

					});

					var packet = {
						authenticationObject : {
							userId: "BACKOFFICE",
							userType: "BACKOFFICE",
							token: "backofficesecretkey"
						},
						message: message,
						student_id_list: studentIdList
					};

					$.ajax({
					  url: "http://localhost:5000/api/v1/mobileapi/createNotification",
					  type: "PUT",

					  contentType: "application/json",
					  dataType: "json",
					  crossDomain: true,
					  data: JSON.stringify(packet),
					  success: function (results) {
						alert("Notifications have been sent to barred students in subject: " + index);
					  },
					  error: function (err) {
					  }
					});
				});
			}
		</script>
	</body>
</html>
