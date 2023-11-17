# SimbuCore

Cross project code to support flutter application development

## Features

* "ft" **F**eature **T**est tools to run and report on feature tests.
* Log writer - Log debug, info, warning and error messages.
* Device and Platform information providers.

## Additional information

Pull requests welcome.

## "ft" Tools

Run and report on flutter_gherkin feature tests

### Version 1.0.0

* Refresh features
* Run feature tests
* Create cumcumber html report from feature test json results
* Log writer - Log debug, info, warning and error messages.

### origin https://gitlab.com/simbu-mobile/simbucore

### Launch.json examples

```dart

{
    "name": "Refresh Features",
    "command": "dart run tools/dt/bin/dt.dart -r /Users/simbu/Src/flutter/myProjectName", 
    "request": "launch",
    "type": "f5anything"
},
{
    "name": "iPhone Feature Tests",
    "command": "dart run tools/dt/bin/dt.dart -f /Users/simbu/Src/flutter/myProjectName 0A2BDB91-D9C7-4897-94EA-C48A499CCE19", 
    "request": "launch",
    "type": "f5anything"
},
{
    "name": "iPhone Cucumber Report",
    "command": "dart run tools/dt/bin/dt.dart -c /Users/simbu/Src/flutter/myProjectName B7A5F50E-DA94-49D0-913F-698AF846365D", 
    "request": "launch",
    "type": "f5anything"
},
{
    "name": "Android Feature Tests",
    "command": "dart run tools/dt/bin/dt.dart -f /Users/simbu/Src/flutter/myProjectName pixel5", 
    "request": "launch",
    "type": "f5anything"
},
{
    "name": "Android Cucumber Report",
    "command": "dart run tools/dt/bin/dt.dart -c /Users/simbu/Src/flutter/myProjectName pixel5", 
    "request": "launch",
    "type": "f5anything"
},

```
