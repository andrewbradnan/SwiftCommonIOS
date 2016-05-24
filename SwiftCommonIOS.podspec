Pod::Spec.new do |s|

  s.name         = "SwiftCommonIOS"
  s.version      = "0.0.2"
  s.summary      = "Common Swift IOS extensions and helpers."
  s.description  = <<-DESC
    Swift extensions and helpers for OS.  UIApplication, UIView etc.
  DESC

  s.homepage     = "https://bitbucket.org/NullPlague/swiftcommonios"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Andrew Bradnan"
  s.social_media_url   = "http://twitter.com/NullPlague"
  
  # only because we are using frameworks
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://bitbucket.org/NullPlague/swiftcommonios.git", :tag => s.version }
  s.source_files  = "Classes", "SwiftCommonIOS/**/*.{swift}"
  # s.resources = "SwiftCommonIOS/**/*.{png,jpeg,jpg,storyboard,xib}"

  s.dependency 'SwiftCommon'

end
