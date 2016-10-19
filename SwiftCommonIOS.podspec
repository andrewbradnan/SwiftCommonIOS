Pod::Spec.new do |s|

  s.name         = "SwiftCommonIOS"
  s.version      = "1.0.5"
  s.summary      = "Common Swift IOS extensions and helpers."
  s.description  = <<-DESC
    Swift extensions and helpers for OS.  UIApplication, UIView etc.
  DESC

  s.homepage     = "https://bitbucket.org/NullPlague/swiftcommonios"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "Andrew Bradnan"
  
  # only because we are using frameworks
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/andrewbradnan/swiftcommonios.git", :tag => s.version }
  s.source_files  = "Classes", "SwiftCommonIOS/**/*.{swift}"

  s.dependency 'SwiftCommon', '~> 1.0.0'
end

