*** Settings ***
Library    Selenium2Library


*** Variables ***
${searchbox}            searchbox
${table}                //*[@id="main"]/table
${searchResult}         //a[starts-with(@href, '/computers/51')]
${searchButton}         //*[@id="searchsubmit"]
${AddComputer}          //*[@id="add"]
${computername}         //*[@id="name"]
${saveChangeButton}     //input[@value="Save this computer"]
${messageLine}          //*[@id="main"]/form[1]/fieldset/div[1]/div/span
${PageTitle}            //*[@id="main"]/h1
${Nextbtn}              //*[@class="next"]/a


*** Keywords ***
Search the computer
    [Arguments]    ${computer}
    Wait Until Element Is Visible    ${searchbox}   # wait until the searchbox is visible to avoid generating errors.
    Input Text    ${searchbox}     ${computer}
    Click Button    ${searchButton}


The computer should appear on the table
    [Arguments]    ${computer}
    Wait Until Element Is Visible    ${Table}
    Table Row Should Contain    ${Table}    1   ${computer}


Select the computer
    Click Element   ${searchResult}
    Element Should Be Visible    ${PageTitle}     Edit computer


Print the MAP
     ${Rows}=    Get Element Count  //table[@class="computers zebra-striped"]/tbody/tr
     FOR    ${i}    IN RANGE  1  (${Rows}+1)
        ${cell}=    Get Text    //table[@class="computers zebra-striped"]/tbody/tr[${i}]
        Log To Console   \n${cell}
     END


Go to the last page
    ${condition}=       Run Keyword And Return Status    Click Element    ${Nextbtn}
    WHILE   ${condition}
        Click Element    ${Nextbtn}
        ${condition}=       Run Keyword And Return Status    Click Element    ${Nextbtn}
    END


Print the computers name
     ${Rows}=    Get Element Count  //table[@class="computers zebra-striped"]/tbody/tr
     FOR    ${i}    IN RANGE  1  (${Rows}+1)
        ${cell}=    Get Text    //table[@class="computers zebra-striped"]/tbody/tr[${i}]/td
        Log To Console   \n${cell}
     END


Click on Add a new computer
    Click Element    ${AddComputer}