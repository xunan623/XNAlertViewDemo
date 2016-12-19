Pod::Spec.new do |s|
  s.name         = "XNAlertView"
  s.version      = "0.0.3"
  s.ios.deployment_target = '8.0'
  s.summary      = "a alerview like android system style"
  s.homepage     = "https://github.com/xunan623/XNAlertViewDemo"
  s.license      = "MIT"
  s.author             = { "xunan623" => "xunan623@outlook.com" }
  s.social_media_url   = "http://weibo.com/exceptions"
  s.source       = { :git => "https://github.com/xunan623/XNAlertViewDemo.git", :tag => s.version }
  s.source_files  = "XNAlertViewDemo/**/*.{h,m}"

  s.requires_arc = true
end
