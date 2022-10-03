# dt tools

'dt' tools:  Run and report on flutter_gherkin feature tests

## Usage

launch.json examples:

```dart

{
    "name": "Refresh Features",
    "command": "dart run tools/dt/bin/dt.dart -r /Users/simbu/Src/flutter/digestableme", 
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
