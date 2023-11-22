
# Robot Framework

The purpose of this project was to develop a QA automation test using Robot Framework.

The file `QA Automation Test.pdf` contains a description of the test cases that need to be automated.



## Getting Started

To get started with the Robot Framework project, follow these steps:

1 - Clone the repository: git clone https://github.com/alfiodistillery/RobotFramework.git

2 - Navigate to the project directory: `cd RobotFramework`

3 - Installing Robot Framework with pip is simple
```
    pip install robotframework
```
4 - To check that the installation was successful, run
```
robot --version 
```
5 - Installing Selenium2Library 
```
pip install --upgrade robotframework-selenium2library
```
6 - Create a virtual environment at a `.venv` directory.

If using pyenv installation
    
        python -m venv .venv
    
If using some other version, make sure you are using python3 by calling it explicitly
    ```
        python3 -m venv .venv
    ```
    
7 - Run the example test suite: 
```
robot Tests/TestScenarios.robot 
```


## Reporting

After test execution, HTML and XML reports can be found. Open the HTML report in a web browser for detailed results.



