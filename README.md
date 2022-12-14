# reacttask
This flutter project is derived from an interview question that was targeted at React and Typescript, neither of which I know. So rather than just ignore the task I decided to create the project using Flutter. This can be run on:

- iOS (tested)
- Android (tested)
- Windows (don't have a Windows box)
- MacOS (tested)
- Web (tested with local data as API not CORS compliant)


## Test Web release
A test version of the Flutter App can be found here https://magnatronus.github.io/react-web/#/

This version uses a hard coded version of the API as the App had CORS issues accessing the API.

## Architecture

### API
The API was split into a seperate package, this allows the API to be used elsewhere if required and makes the project cleaner as all the importing, conversion and object class definitions are wrapped into the single package.

### App
The app uses a domain architecture that splits the functionality into the task main areas, in this case

- The App 
- A Question
- A Round

This is analogous to how the data in the API is organised. Each domain has it own model that controls and tracks the data and state of that domain and each has it's own 'barrel' file to ease using the domain functionality elewhere.

Each domain consist of one or more of the following:

- *models dir* - this is where the models for the domain are defined
- *ui dir* - the main UI for the domain page is kept here
- *widget dir* - if any widgets/components are required for domain use only they are put here

This structure makes the domains portable across projects without too much need for re-writing.

