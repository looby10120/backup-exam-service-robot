*** Keywords ***
Request Success
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status_code}    200
    Should Be Equal As Strings    ${resp.json()}[status][code]    1000

Bad Request
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status_code}    400
    Should Be Equal As Strings    ${resp.json()}[status][code]    1499

Resource Not Available
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Be Equal As Strings    ${resp.json()}[status][code]    1699

Wrong URL Path
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Be Equal As Strings    ${resp.json()}[status][code]    1999

Method Not Allow
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status_code}    405
    #Should Be Equal As String    ${resp.json()}[status][code]    xxx
    #Because there is no status code yet.

Internal Server Error
    [Arguments]    ${resp}
    Should Be Equal As Integers    ${resp.status.code}    500
    Should Be Equal As Strings    ${resp.json()}[status][code]    1899
