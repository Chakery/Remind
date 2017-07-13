source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target 'Remind' do 
  pod 'FSCalendar', '~> 2.7'
  pod 'AlamofireObjectMapper', '~> 4.0'
  pod 'Kingfisher', '~> 3.0'
  pod 'RxSwift',    '~> 3.0'
  pod 'RxCocoa',    '~> 3.0'
  pod 'SnapKit', '~> 3.2.0'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
