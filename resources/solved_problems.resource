*** Settings ***
Library    ../KattisToGithub/src/solved_problem.py
Library    ../test_utils.py


*** Variables ***
&{dict} =    test.py=print('test')
@{vals} =    problem_link.com    submission_link.com    RoboTest    Medium    1    &{dict}


*** Keywords ***
Get Solved Problem Object
    ${sp} =    Get Solved Problem
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
    ${status} =    Get Problem Status    ${int_val}
    RETURN    ${status}

Set Status
    [Arguments]    ${sp}    ${int_val}
    ${status} =    Get Status    ${int_val}
    ${sp.status}    Set Variable    ${status}

Set Filename Code Dict
    [Arguments]    ${sp}    ${dict}
    ${sp.filename_code_dict}    Set Variable    ${dict}

Set Attributes
    [Arguments]    ${sp}    @{vals}
    Set Problem Link    ${sp}    ${vals}[0]
    Set Submissions Link    ${sp}    ${vals}[1]
    Set Name    ${sp}    ${vals}[2]
    Set Difficulty    ${sp}    ${vals}[3]
    Set Status    ${sp}    ${vals}[4]
    Set Filename Code Dict    ${sp}    ${vals}[5]

