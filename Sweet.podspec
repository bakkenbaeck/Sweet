Pod::Spec.new do |s|

  s.name         = "Sweet"
  s.version      = "0.1.0"
  s.summary      = "Sweet Very simple Boilerplate"
  s.description  = <<-DESC
                   Sweet contains Boilerplate code you will use in every app
                   DESC

  s.homepage     = "https://github.com/kostiakoval/Sweet"
  s.license      = 'MIT'
  s.author       = { "Kostiantyn Koval" => "konstantin.koval1@gmail.com" }
  s.source       = { :git => "https://github.com/kostiakoval/Sweet.git", :tag => s.version }

  s.social_media_url   = "http://twitter.com/kostiakoval"

  s.platform     = :ios, "8.0"
  s.requires_arc = true

  s.source_files  = "Pod/Classes/**/*.{swift}"
end
