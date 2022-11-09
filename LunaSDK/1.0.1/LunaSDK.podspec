Pod::Spec.new do |s|
   s.name             = 'LunaSDK'
   s.version          = '1.0.1'
   s.summary          = 'Luna Gateway SDK allows for communication with Luna-enabled Trackers.'
   s.description      = <<-DESC
   Luna Gateway SDK allows to locate, blink, and otherwise interact with Luna-enabled trackers.
                        DESC
   s.homepage         = 'https://lunaxio.com/'
   s.license          = { :type => 'Copyright', :text => 'Copyright 2022 Luna XIO' }
   s.author           = { 'Luna XIO' => 'info@lunanets.com' }

   s.ios.deployment_target = '13.0'
   s.swift_version =  "5.0"

   s.source = { :http => 'https://github.com/indigo-d/luna_ios_sdk/releases/download/v.1.0.1/LunaSDK-1.0.1.zip' }
   s.vendored_frameworks = ['Frameworks/LunaSDK.xcframework']

   s.dependency 'Sodium'
   s.dependency 'iOSDFULibrary'
   s.dependency 'CocoaMQTT'
   s.dependency 'ReachabilitySwift'

 end
