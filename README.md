# Flutter-Bloc Demo

## Requirement
Flutter SDK 3.29.2

## Installation
- Clone the project
- Download packages using ( flutter pub get ) 
- And Run the project

## Unit Test
For the testing we used test, bloc_test, and mockito
- In-order to run the test you can run using `flutter test` to run all the test cases.
- If you want to run individual test case, please add the file path behind the command `flutter test {full_path}`
- All our test cases will be under `test/`

## Action Items
- [x] Basic Counter with Bloc
- [x] Basic Counter with Cubit
- [x] Bloc Widgets
    - [x] BlocBuilder : buildWhen  
        **Requirement**
        - It should build the UI only the counter value is even,
        - It should not build the UI when the value is odd.
    - [x] BlocSelector  
        **Requirement**
        - When user input the email, and format is wrong then build the error message 
    - [x] BlocConsumer  
        **Requirement**
        - When user click inform, show the toast
        - When user click +, - update the counter 
    - [x] Simple RepositoryProvider  
        **Requirement**
        - Provide data from Repository to Bloc using RepositoryProvider 
- [x] Modeling States
    - [x] Concrete Class & Enum States
    - [x] Sealed Class States
    - [x] Hybird States
- [x] Bloc Testing
