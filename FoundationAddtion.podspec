Pod::Spec.new do |s|
  s.name         = "FuncdationAddtion"
  s.version      = "0.0.1"
  s.summary      = "FuncdationAddtion."
  s.homepage     = "https://www.gaodesoft.com"
  s.license      = "MIT"
  s.author       = {"czm" => "chenzm@gaodesoft.com",}
  s.platform      = :ios, '7.0'

  s.source       = { :git  => "https://chenziming@192.168.1.103/svn/ecoalstore/trunk/ios/FuncdationAddtion", :tag => s.version }

  s.requires_arc  = true
  s.source_files  = "FuncdationAddtion/*.{h,m}"

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  s.libraries = 'z'

end
