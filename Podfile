platform :ios, '10.0'
inhibit_all_warnings!

def shared_pods
  pod 'SwiftLint'
  pod 'Moya', '~> 14.0'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'Swinject', '~> 2.7.1'
  pod 'SwinjectStoryboard', :git => 'https://github.com/anuragajwani/SwinjectStoryboard'
end

target 'WeatherApp' do
  use_frameworks!
  shared_pods
end
