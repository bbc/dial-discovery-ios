#
# Be sure to run `pod lib lint dial-discovery-ios.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'dial-discovery-ios'
  s.version          = '0.1.0'
  s.summary          = 'Service discovery via SSDP and HbbTV device discovery via DIAL'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This framework provides APIs for the discovery of services via SSDP and the discovery of devices via DIAL, as used in [HbbTV 2](http://hbbtv.org/resource-library/#specifications) compliant TVs It allows HbbTV terminals existing on the same network to be discovered by the Companion Screen Application.
Using the DIAL protocol, the Companion Screen Application can launch an HbbTV application on the television.
                       DESC

  s.homepage         = 'https://github.com/bbc/dial-discovery-ios'

  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author           = { 'Rajiv Ramdhany' => 'rajiv.ramdhany@bbc.co.uk' }
  s.source           = { :git => 'https://github.com/bbc/dial-discovery-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'dial-discovery-ios/Classes/**/*'
  
  s.resource_bundles = {
    'dial-discovery-ios' => ['dial-discovery-ios/Assets/**/*']
  }

 
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'CocoaAsyncSocket', '~> 7.5.1'
  s.dependency 'simple-logger-ios', '~> 0.1'
  s.dependency 'JSONModel', '~> 1.0'

end
