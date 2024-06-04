*** Settings ***
Resource    ../resources/solved_problems.resource

Library    ../.venv/lib/site-packages/robot/libraries/OperatingSystem.py
Library    ../.venv/lib/site-packages/robot/libraries/Collections.py

*** Test Cases ***
Test Create
    [Documentation]    Ensure that a SolvedProblem object is created successfully
    ${sp} =    Get Solved Problem Object
    Should Not Be Equal    ${sp}    ${None}

Test Updated Attribute Values
    ${sp} =    Get Solved Problem Object
    Set Attributes    ${sp}    @{vals}
    Should Be Equal As Strings    ${sp.problem_link}    ${vals}[0]
    Should Be Equal As Strings    ${sp.submissions_link}    ${vals}[1]
    Should Be Equal As Strings    ${sp.name}    ${vals}[2]
    Should Be Equal As Strings    ${sp.difficulty}    ${vals}[3]
    Should Be Equal As Integers   ${sp.status}    ${vals}[4]
    Should Be Equal               ${sp.filename_code_dict}    ${vals}[5]

Test Writing To File
    ${sp} =    Get Solved Problem Object
    Set Attributes    ${sp}    @{vals}
    Create Directory    tests/Solutions/
    Call Write To File    ${sp}    tests/
    @{keys} =    Get Dictionary Keys    ${dict}
    ${filepath} =    Set Variable    tests/Solutions/${keys}[0]
    File Should Exist    ${filepath}
    File Should Not Be Empty    ${filepath}
    ${file_contents} =    Get File    ${filepath}
    Should Be Equal As Strings    ${file_contents}    ${dict}[${keys}[0]]
    Remove File    ${filepath}
    Remove Directory    tests/Solutions/
