*** Variables ***
#${url}=    http://localhost:9000
${url}=    http://192.168.109.95:8085

#TC0101 Get exam by ID successful
@{exam_by_id_resp}    exam_id    exam_name    questions
@{exam_by_id_question_resp}    choices    question
#TC0201 Get the entire user's history successful
@{exam_content_resp}    exam_id    exam_name    exam_total_score    point_exam       timestamp
#TC0301 Get all list of exams successful
@{exam_list_resp}    count_question    exam_id    exam_name    exam_total_score
#TC0401 Get most do exam history successful
@{exam_history_most_resp}    history_most_do
@{exam_history_most_count_resp}    count_all_do     exam_id    exam_name
#TC0501 Get the latest completed exam successful
@{exam_latest_resp}    exam_id    exam_name    timestamp
@{exam_latest_count_resp}    count_do_exam    count_exam    last_do

@{question_content_resp}    question    question_text    question_pic    question_type
@{choice_content_resp}    choice_text    choice_pic    score



${exam_history_uri}=    /api/exam/history
${list_exam_uri}=    /api/exam/list_exam
${last_exam_uri}=    /api/exam/last_exam
${get_exam_by_ID_uri}=    /api/exam
${get_most_do_exam_history_uri}=    /api/exam/exam_most
${get_id_from_token}=    /api/auth/verify
