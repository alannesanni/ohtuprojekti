*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser
#Test Setup  Open And Configure Browser

*** Test Cases ***
Create Account Page Can Be Opened
    Go To Home Page
    Click Create Account Button
    Page Should Contain  Create a new user account

New Account Can Be Created
    Go To Home Page
    Click Create Account Button
    Set Username  antti56
    Set Password  antti123
    Submit Credentials
    Create Account Should Succeed

Create New Account Fails With One Letter Username
    Go To Home Page
    Click Create Account Button
    Set Username  a
    Set Password  pass123
    Submit Credentials
    Create Account Should Fail With Short Username And Password

Create New Account Fails With One Letter Password
    Go To Home Page
    Click Create Account Button
    Set Username  bertta
    Set Password  p
    Submit Credentials
    Create Account Should Fail With Short Username And Password

Create New Account Fails With One Letter Username And Password
    Go To Home Page
    Click Create Account Button
    Set Username  x
    Set Password  y
    Submit Credentials
    Create Account Should Fail With Short Username And Password

Create New Account Fails With Username Too Long
    Go To Home Page
    Click Create Account Button
    Set Username  thisusernameisverylong
    Set Password  pass123
    Submit Credentials
    Create Account Should Fail With Long Username And Password

Create New Account Fails With Password Too Long
    Go To Home Page
    Click Create Account Button
    Set Username  cecilia
    Set Password  thispasswordisverylong123
    Submit Credentials
    Create Account Should Fail With Long Username And Password


*** Keywords ***
Create Account Should Succeed
    Page Should Contain  User created successfully

Create Account Should Fail With Short Username And Password
    Page Should Contain  Username and password must be at least 3 characters long

Create Account Should Fail With Long Username And Password
    Page Should Contain  Username and password can not be over 15 characters long

Click Create Account Button
    Click Button  Create account

Set Username
    [Arguments]  ${username}
    Input Text  NewUsername  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  NewPassword  ${password}

Submit Credentials
    Click Button  create