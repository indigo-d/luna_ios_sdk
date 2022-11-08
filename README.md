# Luna SDK iOS
![splash-icon](https://user-images.githubusercontent.com/110383501/194293107-ecc432e4-8157-4769-a4bd-53eab51a52aa.png)

Luna SDK is an iOS framework for working with Luna Trackers. For more information check [Luna](https://lunaxio.com) webpage.
​
## Installation

Luna SDK is entirely standalone and does not depend on any third party libraries. The easiest way to integrate Luna SDK with the host application is via CocoaPods (CocoaPods version 1.11.3 suggested).

Please add ```pod 'LunaSDK', :git => 'git@github.com:indigo-d/luna_ios_sdk.git'``` to your Podfile, example:
    
```bash
  # Podfile
use_frameworks!
target 'YOUR_TARGET_NAME' do
    pod 'LunaSDK', :git => 'git@github.com:indigo-d/luna_ios_sdk.git'
end
```
Execute ```pod install``` so that CocoaPods fetches and links Luna SDK with your project.

## Prerequisites

In order for Luna SDK to function correctly, the developer of the host application needs to ensure that the host app includes required background mode settings and requests user permission to access location, etc.

### Project settings

LunaSDK requires a few configuration steps that need to be taken by the developer of the host application.

1. Location updates in the Background Modes - UIBackgroundModes of type location need to be defined in host app Info.plist file. See example below:

```
<key>UIBackgroundModes</key>
<array>
    <string>location</string>
</array>
```
2. Request Always Authorization for the location updates - in order for registering for iBeacon events when the application is not actively running the host app needs to be authorized by the user to fetch user location always. Developer of the host application should request user permission before initiating LunaSDK.
## Basic usage

Insert gif or link to demo
```swift
import UIKit

// 1
import LunaSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // 2
    let mqttHost = "your mqqt host"

    // 3 
    let configuration = LunaConfiguration(mqttHost: mqttHost)

    // 4
    let luna = Luna.finder(configuration)
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 5
        luna.delegate = self
        
        // 6
        luna.start()
        
        return true
    }
}

// 7
extension AppDelegate: LunaDelegate {

    func lunaFinder(didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    // optional
    func lunaFinder(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(region)
    }
    
    // optional
    func lunaFinder(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print(region)
    }
    
    // optional
    func lunaFinder(didFindHeid heid: String) {
        print(heid)
    }
}

```

1) Import Luna SDK.
2) Set your MQTT host path.
3) Set your basic configuration with MQTT host path
4) Initialize LunaFinder object with basic configuration
5) Delegate for the Luna is set. Conformance to the LunaDelegate protocol is set in the extension of the AppDelegate.
6) Start function is called. After that we can receive informations about trackers in range.
7) In the AppDelegate extension, conformance to the LunaDelgate protocol is set.
