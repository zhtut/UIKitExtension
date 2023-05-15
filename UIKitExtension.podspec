
Pod::Spec.new do |s| 

  s.name         = "UIKitExtension"
  s.version      = "1.0.0"
  s.summary      = " UIKit的一些扩展工具 "

  s.description  = <<-DESC
   UIKit的一些扩展工具
                   DESC

  s.homepage     = "https://github.com/zhtut/UIKit的一些扩展工具.git"

  s.license        = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "zhtg" => "zhtg@icloud.com" }

  s.source       = { :git => "https://github.com/zhtut/UIKit的一些扩展工具.git", :tag => "#{s.version}" }

  s.source_files  = "Sources/**/*.swift"

  s.ios.deployment_target = "11.0"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'ENABLE_MODULE_VERIFIER' => 'YES' }

end
