# Luna SDK iOS
![splash-icon](https://user-images.githubusercontent.com/110383501/194293107-ecc432e4-8157-4769-a4bd-53eab51a52aa.png)

Luna SDK is an iOS framework for working with Luna Trackers. For more information check [Luna XIO](https://lunaxio.com) webpage.
​
## Installation

To integrate Luna SDK use [CocoaPods](https://cocoapods.org/) (version 1.11.3 is recommended).

In your **Podfile** you need to make **3 changes**:

```ruby
# 1. Add sources pointing to this repo and the CocoaPods repo
source 'https://github.com/indigo-d/luna_ios_sdk'
source 'https://cdn.cocoapods.org/'

use_frameworks!
target 'YOUR_TARGET_NAME' do
    # [YOUR PODS]

    # 2. Add LunaSDK pod
    pod 'LunaSDK'
end

# 3. Add post install script
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```

Run ```pod install``` so that CocoaPods fetches and links Luna SDK with your project.

## Prerequisites

#### Project settings

Luna SDK requires the **Location updates** [Background Mode](https://developer.apple.com/documentation/xcode/configuring-background-execution-modes) to work properly. It can be configured in the Xcode project (Signing & Capabilities -> + Capability), or added manually to the project .plist file:
```
<key>UIBackgroundModes</key>
<array>
    <string>location</string>
</array>
```
#### Runtime

Luna SDK requires **Always** [Location Authorization](https://developer.apple.com/documentation/corelocation/requesting_authorization_to_use_location_services):
```swift
import CoreLocation

let locationManager = CLLocationManager()
locationManager.requestAlwaysAuthorization()
```

Remember to add:
- `NSLocationAlwaysAndWhenInUseUsageDescription` 
- `NSLocationWhenInUseUsageDescription`

property list keys to the Xcode project (Info -> Custom iOS Target Properties), with an explanation of why the app is accessing the location, e.g. "The app is using Always location for iBeacon scanning". See [Apple docs](https://developer.apple.com/documentation/bundleresources/information_property_list/protected_resources) for more details about accessing the protected sources.

## Usage

You just need to `start` the Luna Gateway, that's it!

```swift
import LunaSDK

let lunaGateway = Luna.gateway()

func startLunaGateway() {
  lunaGateway.start()
}

func stopLunaGateway() {
  lunaGateway.stop()
}

```

### Support

If you need any assistance with the Luna SDK iOS setup, feel free to [contact the developers directly](mailto:mateusz@lunaxio.com). Feedback appriciated!
