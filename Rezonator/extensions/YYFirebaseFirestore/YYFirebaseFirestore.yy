{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": -1,
  "extensionVersion": "0.0.1",
  "packageId": "",
  "productId": "",
  "author": "",
  "date": "2021-08-27T19:33:55.4551561-07:00",
  "license": "",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"FirebaseFirestore.ext","origname":"","init":"","final":"","kind":4,"uncompress":false,"functions":[
        {"externalName":"FirebaseFirestore_SDK","kind":4,"help":"FirebaseFirestore_SDK(fluent_json)","hidden":false,"returnType":2,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"FirebaseFirestore_SDK","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":-1,"order":[
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"FirebaseFirestore.js","origname":"","init":"","final":"","kind":5,"uncompress":false,"functions":[
        {"externalName":"FirebaseFirestore_SDK","kind":5,"help":"FirebaseFirestore_SDK(json)","hidden":false,"returnType":1,"argCount":0,"args":[
            1,
          ],"resourceVersion":"1.0","name":"FirebaseFirestore_SDK","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":-1,"order":[
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
        {"name":"FirebaseFirestore_SDK","path":"extensions/YYFirebaseFirestore/YYFirebaseFirestore.yy",},
      ],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "YYFirebaseFirestore",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": "",
  "androidclassname": "YYFirebaseFirestore",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": "",
  "maclinkerflags": "",
  "tvosmaclinkerflags": "",
  "iosplistinject": "",
  "tvosplistinject": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "\r\n        implementation platform('com.google.firebase:firebase-bom:29.0.0')\r\n        implementation 'com.google.firebase:firebase-firestore'\r\n",
  "androidcodeinjection": "\r\n<YYAndroidGradleDependencies>\r\n        implementation platform('com.google.firebase:firebase-bom:29.0.0')\r\n        implementation 'com.google.firebase:firebase-firestore'\r\n</YYAndroidGradleDependencies>\r\n\r\n<YYAndroidTopLevelGradleBuildscriptDependencies>\r\n        classpath 'com.google.gms:google-services:4.3.2'  // Google Services plugin\r\n</YYAndroidTopLevelGradleBuildscriptDependencies>\r\n\r\n<YYAndroidGradleEnd>\r\n       apply plugin: 'com.google.gms.google-services'\r\n</YYAndroidGradleEnd>\r\n\r\n<YYAndroidGradleAndroid>\r\n    compileOptions {\r\n        sourceCompatibility 1.8\r\n        targetCompatibility 1.8}\r\n</YYAndroidGradleAndroid>\r\n",
  "hasConvertedCodeInjection": true,
  "ioscodeinjection": "\r\n<YYIosCocoaPods>\r\npod 'Firebase/Firestore','8.4.0'\r\n</YYIosCocoaPods>\r\n",
  "tvoscodeinjection": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [],
  "androidPermissions": [],
  "copyToTargets": 44,
  "iosCocoaPods": "\r\npod 'Firebase/Firestore','8.4.0'\r\n",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Firebase Firestore/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "YYFirebaseFirestore",
  "tags": [],
  "resourceType": "GMExtension",
}