#
# Be sure to run `pod lib lint CYExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CYExtension'
  s.version          = '1.1.1'
  s.summary          = 'A Extension of CY'

  s.description      = '<<-DESCTODO: Add long description of the pod here.DESC'
  s.swift_version = '4.0'
  s.homepage         = 'https://github.com/liutiesong/CYExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liutiesong@vip.sina.com' => 'cy@liutiesong.com' }
  s.source           = { :git => 'https://github.com/liutiesong/CYExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CYExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CYExtension' => ['CYExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
