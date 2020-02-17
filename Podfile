# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def testing_libs
  pod 'Nimble', '8.0.4'
  pod 'Quick', '2.2.0'
  pod 'Nimble-Snapshots', '8.0.0'
end

target 'TopSwiftRepositories' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SDWebImage'
  pod 'PromiseKit'

  target 'TopSwiftRepositoriesTests' do
    inherit! :search_paths
    testing_libs
  end

end
