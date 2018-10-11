cask 'unity-ios-support-for-editor@2018.1.2f1' do
  version '2018.1.2f1,a46d718d282d'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/a46d718d282d/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2018.1.2f1.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2018.1.2f1.pkg'

  depends_on cask: 'unity@2018.1.2f1'

  preflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end
  end

  postflight do
    if File.exist? "/Applications/Unity"
        FileUtils.move "/Applications/Unity", "/Applications/Unity-2018.1.2f1"
    end

    if File.exist? "/Applications/Unity.temp"
        FileUtils.move "/Applications/Unity.temp", "/Applications/Unity"
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2018.1.2f1'
end
