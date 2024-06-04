*** Settings ***
Library    ../KattisToGithub/src/solved_problem.py
Library    ../test_utils.py


*** Keywords ***
Get Solved Problem Object
    ${sp} =    test_utils.Get Solved Problem
    RETURN    ${sp}

Set Problem Link
    [Arguments]    ${sp}    ${link}
    ${sp.problem_link}    Set Variable    ${link}

Set Submissions Link
    [Arguments]    ${sp}    ${link}
    ${sp.submissions_link}    Set Variable    ${link}

Set Name
    [Arguments]    ${sp}    ${name}
    ${sp.name}    Set Variable    ${name}

Set Difficulty
    [Arguments]    ${sp}    ${difficulty}
    ${sp.difficulty}    Set Variable    ${difficulty}

Get Status
    [Arguments]    ${int_val}
    ${int_val} =    Convert To Integer    ${int_val}
    ${status} =    test_utils.Get Problem Status    ${int_val}
    RETURN    ${status}

Set Status
    [Arguments]    ${sp}    ${int_val}
    ${status} =    Get Status    ${int_val}
    ${sp.status}    Set Variable    ${status}

Set Filename Code Dict
    [Arguments]    ${sp}    ${dict}
    ${sp.filename_code_dict}    Set Variable    ${dict}


*** Test Cases ***
Test 1
    ${sp} =    Get Solved Problem Object
    Set Problem Link    ${sp}    https://test.com/problem
    Set Submissions Link    ${sp}    https://test.com/submissions
    Set Name    ${sp}    RoboTest
    Set Difficulty    ${sp}    Medium
    Set Status    ${sp}    1
    ${dict} =    Create Dictionary    test.py=print('hello')
    Set Filename Code Dict    ${sp}    ${dict}
    Log To Console    ${sp}
