#  LPMessagingSDK SwiftUI Container Sample

This project is created to demonstrate using SDK provided Transcript view inside a SwiftUI Container.

Brief Explanation of Related Classes

### AppEntryView.swift

Entry point for the main application, can be used to set brandId and jwt. brand Id and jwt values can be either hardcoded or can be entered via Textfields present on the screen. "Initialize the SDK" button handles the initialization if it is not tapped APIs will throw related errors. To use implicit authentication please provide a JWT either adjusting the values or inserting it to JWT code field, if JWT is empty unauthenticated flow will be used.

### ContentView.swift 

Container of the Transcript view, top bar and custom input area.


### Utils.swift

Helper functions to initialize and configure the SDK

### FileSharingMenu.swift

Entry point for triggering file sharing APIs, if the validation switch is turned off, the SDK will try to get permissions automatically. If it is turned on, the SDK will throw errors if necessary photo/camera permissions are not granted. Camera functionality does not work on simulator and should be tested on real device.

### MessagingViewController.swift

The container for the transcript view, its purpose is to use UIKit view controller in SwiftUI context.
