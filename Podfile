source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '14.0'

use_frameworks!

def shared_pods

  pod 'ExpoFpFplan', '3.0.8'
  pod 'ExpoFpCrowdConnected', '3.0.8'
  pod 'ExpoFpIndoorAtlas', '3.0.8'
  pod 'ExpoFpGpsProvider', '3.0.8'

end

target 'Fplan' do
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      #config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      #config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end