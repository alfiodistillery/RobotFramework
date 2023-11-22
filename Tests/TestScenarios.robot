*** Settings ***
Library         Selenium2Library
Resource        ../Resources/Keywords.searchPage.resource
Resource        ../Resources/Keywords.editPage.resource
Resource        ../Resources/Keywords.addPage.resource


*** Variables ***
${url}                  https://computer-database.gatling.io/computers
${DoneMessage}          //*[@class="alert-message warning"]
${computer}             Commodore 64


*** Test Cases ***
Locate the following computer in the table: Commodore 64
    Open Browser    ${url}
    Search the computer     Commodore 64
    The computer should appear on the table     Commodore 64


Click to edit Commodore 64
    Select the computer


Create a negative test case to ensure a failure validation displays.
    Verify computer name is required


Create a positive test case to ensure that valid data is updated successfully
    Search The Computer     Commodore 64
    The computer should appear on the table     Commodore 64
    Click Element   ${searchResult}
    Element Should Be Visible    ${PageTitle}     Edit computer
    Edit the computer company succesfully
    Element Should Contain    ${DoneMessage}    Done !


Filter computer list by “HP” and create a map of the returned data.
    Search The Computer     HP
    Print the MAP


Filter computer list by “IBM” and return a list of computer names on the LAST page of the results.
    Search The Computer    IBM
    Go to the last page
    Print the computers name


Click the ‘Add a new computer’ button, enter some data into the various text fields
    Click on Add a new computer
    Fill out the fields


select ‘Evans & Sutherland’ from the company dropdown and complete the creation.
    Select from the dropdown and create the computer    31


Verify that the computer was created successfully.
    Element Should Contain    ${DoneMessage}    Done !


Close the browser
    Close Browser



