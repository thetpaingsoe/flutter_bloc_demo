# Flutter-Bloc Demo

## Requirement
Flutter SDK 3.29.2

## Installation
- Clone the project
- Download packages using ( flutter pub get ) 
- And Run the project

## Action Items
- [x] Basic Counter with Bloc
- [x] Basic Counter with Cubit
- [ ] Bloc Widgets
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
- [ ] Modeling States
    - [ ] Enum States
    - [ ] Sealed Class States
    - [ ] Hybird States
- [ ] Bloc Testing
