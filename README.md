# Firebase Cocoa Touch Framework

This Cocoa Touch Framework is an easy way to add a Firebase SDK to your project, if for some reason you can't use CocoaPods, or a manual installation.

## Getting Started

![](FIRGuide.gif)

1. Open the folder with the framework project, copy from DEBUG or APPSTORE folder, and add it to your project in Xcode.

2. Having that done, select your parent project and link these binaries to it: 
    add FirebaseCocoaTouchFramework.framework from Products folder to embedded binaries.
    
3. Download GoogleService-Info.plist from the Firebase console and add it to the project root.

4. Add custom URL schemes to your Xcode project:
    Open your project configuration: double-click the project name in the left tree view. Select your app from the TARGETS section, then select the Info tab, and expand the URL Types section.
    Click the + button, and add a URL for your reversed client ID. To find this value, open the GoogleService-Info.plist configuration file, and look for the REVERSED_CLIENT_ID key. Copy the value of the key, and paste it into the URL. Schemes box on the configuration page. Leave the other fields blank.

5. Add the necessary methods from Firebase SDK to the FirebaseService class

## Update Framework
1. Open FirebaseCocoaTouchFramework.xcworkspace
2. Build Cmd+B with target FirebaseCocoaTouchFramework-Universal and FIR-AppStore, to update framework in DEBUG and APPSTORE folder.


## If you have problems building the project:
- Disable bitcode in project settings
- Try to run on a real device
