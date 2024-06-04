*** Settings ***
Documentation    Tests for the parse_arguments function
Library          ../KattisToGithub/src/argument_parser.py
Library          Collections
Resource         ../resources/argument_parser.resource


*** Test Cases ***
Test Required Arguments Short
    ${result} =                   argument_parser.Parse Arguments    ${required_args_short}
    Should Be Equal As Strings    ${result.user}     my_username
    Should Be Equal As Strings    ${result.password}    my_password
    Should Be Equal As Strings    ${result.directory}    ../solutions


Test Required Arguments Long
    ${result} =                   argument_parser.Parse Arguments    ${required_args_long}
    Should Be Equal As Strings    ${result.user}     my_username
    Should Be Equal As Strings    ${result.password}    my_password
    Should Be Equal As Strings    ${result.directory}    ../solutions

Test Optional Arguments False
    ${result} =        argument_parser.Parse Arguments    ${required_args_short}
    Should Be Equal    ${result.no_git}    ${False}
    Should Be Equal    ${result.no_readme}    ${False}
    Should Be Equal    ${result.py_main_only}    ${False}

Test Optional Arguments True
    ${args} =         Combine Lists    ${required_args_short}    ${optional_args}
    ${result} =       argument_parser.Parse Arguments    ${args}
    Should Be True    ${result.no_git}
    Should Be True    ${result.no_readme}
    Should Be True    ${result.py_main_only}
