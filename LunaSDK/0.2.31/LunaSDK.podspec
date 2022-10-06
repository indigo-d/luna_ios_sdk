
Pod::Spec.new do |s|
  s.name             = 'LunaSDK'
  s.version          = '0.2.31'
  s.summary          = 'Luna Gateway SDK allows for communication with Luna-enabled Trackers.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Luna Gateway SDK allows to locate, blink, and otherwise interact with Luna-enabled trackers.
                       DESC
  s.homepage         = 'https://lunaxio.com/'
  s.license          = { :type => 'Copyright', :text => 'Copyright 2022 LunaNets' }

  s.author           = { 'Luna XIO' => 'info@lunanets.com' }

  s.ios.deployment_target = '13.0'

# enable when building as framework
 s.source           = { :http => 'https://github.com/indigo-d/luna_ios_published_sdk/releases/download/v0.1.78/LunaSDK-0.1.78.zip' }
 s.vendored_frameworks = ['Frameworks/LunaSDK.xcframework']

# disable when building as framework
  # s.source_files = ['LunaSDK/Classes/**/*','LunaSDK/ExternalLibraries/**/*']
  # s.source           = { :git => 'https://github.com/indigod/luna-sdk-ios.git', :tag => s.version.to_s }

  s.dependency 'Sodium'
  s.dependency 'iOSDFULibrary'
  s.dependency 'MQTTClient'

  s.swift_version =  "5.0"

# next 2 lines are disabled while trying to make it compile on m1
# s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386', 'EXCLUDED_ARCHS[sdk=iphoneos*]' => 'i386'  }
#   s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 i386', 'EXCLUDED_ARCHS[sdk=iphoneos*]' => 'i386'  }

end
