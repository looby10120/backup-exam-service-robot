*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource    ../keywords/TC keyword.robot
Resource    ../variables/variables.robot

*** Test Cases ***
TC0101 Get exam by ID successful
    #success -> Standard response for successful HTTP requests
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_exam_by_ID_uri}/1
    Request Success    ${resp}

TC0102 Get exam by ID with the resource that does not exist
    #fail -> the requested resource could not be found but may be available in the future.
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_exam_by_ID_uri}/99999999
    Resource Not Available    ${resp}

TC0103 Get exam by ID with incorrect HTTP method
    #fail -> the request method is not supported for the requested resource.
    Create Session    server    ${url}
    ${resp}=    Post Request    server    ${get_exam_by_ID_uri}/1
    Method Not Allow    ${resp}

TC0104 Get exam by ID with incorrect syntax
    #fail -> malformed request syntax by using string instead of integer
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_exam_by_ID_uri}/u
    Bad Request    ${resp}

TC0105 Get exam by ID with the path that contains space
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_exam_by_ID_uri}/${space}
    Bad Request    ${resp}

TC0106 Get exam by ID with a wrong path
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_exam_by_ID_uri}/
    Wrong URL Path    ${resp}

TC0201 Get the entire user's history successful
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${exam_history_uri}/1
    Request Success    ${resp}

TC0202 Get the entire user's history with the resource that does not exist
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${exam_history_uri}/99999999
    Resource Not Available    ${resp}

TC0203 Get the entire user's history with incorrect HTTP method
    Create Session    server    ${url}
    ${resp}=    Post Request    server    ${exam_history_uri}
    Method Not Allow    ${resp}

TC0204 Get the entire user's history with incorrect syntax
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${exam_history_uri}/u
    Bad Request    ${resp}

TC0205 Get the entire user's history with the path that contains space
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${exam_history_uri}/${space}
    Bad Request    ${resp}

TC0301 Get all list of exams successful
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${list_exam_uri}
    Request Success    ${resp}

TC0302 Get all list of exams with incorrect HTTP method
    Create Session    server    ${url}
    ${resp}=    Post Request    server    ${list_exam_uri}
    Method Not Allow    ${resp}

TC0303 Get all list of exams with a wrong path
    #fail -> the URL path does not exist
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${list_exam_uri}/u
    Wrong URL Path    ${resp}

TC0401 Get most do exam history successful
    #success -> response 200
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${get_most_do_exam_history_uri}
    Request Success    ${resp}

TC0402 Get most do exam history with the wrong path
     Create Session    server    ${url}
     ${resp}=    Get Request    server    ${get_most_do_exam_history_uri}/3
     Wrong URL Path    ${resp}

TC0403 Get most do exam history with incorrect HTTP method
     Create Session    server    ${url}
     ${resp}=    Post Request    server    ${get_most_do_exam_history_uri}
     Method Not Allow    ${resp}

TC0501 Get the recent completed exam successful
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${last_exam_uri}/1
    Request Success    ${resp}

TC0502 Get the recent completed exam with the resource that does not exist
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${last_exam_uri}/99999999
    Resource Not Available    ${resp}

TC0503 Get the recent completed exam with incorrect HTTP method
    Create Session    server    ${url}
    ${resp}=    Post Request    server    ${last_exam_uri}/1
    Method Not Allow    ${resp}

TC0504 Get the recent completed exam with incorrect syntax
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${last_exam_uri}/u
    Bad Request    ${resp}

TC0505 Get the recent completed exam with the path that contains space
    Create Session    server    ${url}
    ${resp}=    Get Request    server    ${last_exam_uri}/${space}
    Bad Request    ${resp}
