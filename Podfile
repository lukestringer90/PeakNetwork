platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'git@gitlab.3squared.com:iOSLibraries/CocoaPodSpecs.git'

target 'Network' do
    use_frameworks!
		pod 'THROperations', '~> 0.1.0'
			
		target 'NetworkTests' do
	    inherit! :search_paths
			pod 'OHHTTPStubs', '~> 5.2'
		  pod 'OHHTTPStubs/Swift', '~> 5.2'
		end
end
