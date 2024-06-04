*** Settings ***
Resource    ../resources/solved_problems.resource

Library    ../.venv/lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../.venv/lib/site-packages/robot/libraries/Collections.py

*** Test Cases ***
Test Create
    [Documentation]    Ensure that a SolvedProblem object is created successfully
    ${sp} =    Get Solved Problem
    Should Not Be Equal    ${sp}    ${None}

Test Updated Attribute Values
    [Documentation]    Ensure that setting attribute values works correctly
    ${sp} =    Get Solved Problem
    Set Attributes    ${sp}    @{vals}
    Should Be Equal As Strings    ${sp.problem_link}    ${vals}[0]
    Should Be Equal As Strings    ${sp.submissions_link}    ${vals}[1]
    Should Be Equal As Strings    ${sp.name}    ${vals}[2]
    Should Be Equal As Strings    ${sp.difficulty}    ${vals}[3]
    Should Be Equal As Integers   ${sp.status}    ${vals}[4]
    Should Be Equal               ${sp.filename_code_dict}    ${vals}[5]

Test Writing To File
    [Documentation]    Ensure that SolvedProblem is written correctly into a file
    ${sp} =    Get Solved Problem
    Set Attributes    ${sp}    @{vals}
    Create Directory    tests/Solutions/
    Call Write To File    ${sp}    tests/
    @{keys} =    Get Dictionary Keys    ${filename_code_dict}
    ${filepath} =    Set Variable    tests/Solutions/${keys}[0]
    File Should Exist    ${filepath}
    File Should Not Be Empty    ${filepath}
    ${file_contents} =    Get File    ${filepath}
    Should Be Equal As Strings    ${file_contents}    ${filename_code_dict}[${keys}[0]]
    Remove File    ${filepath}
    Remove Directory    tests/Solutions/

Test To Dict
    [Documentation]    Ensure that SolvedProblem.to_dict produces an expected result
    ${sp} =    Get Solved Problem
    Set Attributes    ${sp}    @{vals}
    ${result} =    Call To Dict    ${sp}
    Dictionary Should Contain Item    ${result}    Name    ${vals}[2]
    Dictionary Should Contain Item    ${result}    Difficulty    ${vals}[3]
    ${status} =    Convert To Integer    ${vals}[4]
    Dictionary Should Contain Item    ${result}    Status    ${status}
    Dictionary Should Contain Item    ${result}    ProblemLink    ${vals}[0]
    Dictionary Should Contain Item    ${result}    SubmissionsLink    ${vals}[1]
    @{keys} =    Get Dictionary Keys    ${filename_language_dict}
    ${solutions} =    Catenate    SEPARATOR=|    ${filename_language_dict}[${keys}[0]]    ${keys}[0]
    Dictionary Should Contain Item    ${result}    Solutions    ${solutions}
