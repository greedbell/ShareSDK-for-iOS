Pod::Spec.new do |s|
  s.name             = 'mob_sharesdk_bell'
  s.version          = "4.3.7.1"
  s.summary          = 'ShareSDK is the most comprehensive Social SDK in the world,which share easily with 40+ platforms.'
  s.license          = 'MIT'
  s.author           = { "mob" => "mobproducts@163.com" }

  s.homepage         = 'http://www.mob.com'

  s.source           = { :git => 'https://github.com/greedbell/ShareSDK-for-iOS.git', :tag => 'ding-talk-' + s.version.to_s }

  s.platform         = :ios
  s.ios.deployment_target = "8.0"
  s.frameworks       = 'JavaScriptCore'
  s.libraries        = 'sqlite3'
  s.default_subspecs = 'ShareSDKPlatforms'
  s.dependency 'MOBFoundation','>= 3.2.9'
  
    # 各个平台：每个平台都必须要有ShareSDK.bundle和对应的Connector
    s.subspec 'ShareSDKPlatforms' do |sp|
        # DingTalk
        sp.subspec 'DingTalk' do |ssp|
            ssp.vendored_frameworks = 'DTShareKit.framework','DingTalkConnector.framework'
            ssp.dependency 'mob_sharesdk/ShareSDK'
            ssp.resource_bundles = {
                'ShareSDK_JS_DingTalk' => ['DingTalk.js']
            }
        end
    end
end
