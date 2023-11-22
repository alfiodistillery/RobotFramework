*** Settings ***
Library    Selenium2Library

*** Variables ***
${computerName}         //*[@id="name"]
${introduced}           //*[@id="introduced"]
${discontinued}         //*[@id="discontinued"]
${company}              //*[@id="company"]
${CreateComputerBtn}    //*[@class="btn primary"]
${titlePage}            //*[@id="main"]/h1

*** Keywords ***
Fill out the fields
    Wait Until Element Contains    ${titlePage}     Add a computer
    Input Text    ${computerName}   New Computer
    Input Text    ${introduced}     2023-01-01


Select from the dropdown and create the computer
    [Arguments]    ${Option}
    Select From List By Value    ${company}     ${Option}
    Click Button    ${CreateComputerBtn}