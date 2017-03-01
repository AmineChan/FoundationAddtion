Pod::Spec.new do |s|
  s.name         = "FoundationAddtion"
  s.version      = "0.0.2"
  s.summary      = "FoundationAddtion."
  s.homepage     = "https://github.com"
  s.license      = "MIT"
  s.author       = {"czm" => "328525910@qq.com",}
  s.platform      = :ios, '7.0'

  s.source       = { :git  => "https://github.com/AmineChan/FoundationAddtion.git", :tag => s.version }

  s.requires_arc  = true
  s.source_files  = "FoundationAddtion/*.{h,m}"

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.libraries = 'z'

end
