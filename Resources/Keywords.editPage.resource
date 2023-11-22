*** Settings ***
Library    Selenium2Library


*** Variables ***
${computername}     //*[@id="name"]
${saveChangeBtn}    //input[@value="Save this computer"]
${WarningmessageLine}      //*[@id="main"]/form[1]/fieldset/div[1]/div/span
${cancelBtn}        //*[@class="btn"]
${company}          //*[@id="company"]


*** Keywords ***
Verify computer name is required
    Clear Element Text  ${computername}
    Click Button    ${saveChangeBtn}
    Element Should Contain    ${WarningmessageLine}    Failed to refine type : Predicate isEmpty() did not fail.
    Sleep    1
    Click Element    ${cancelBtn}


Edit the computer company succesfully
    Select From List By Value    ${company}    13
    Click Button    ${saveChangeBtn}