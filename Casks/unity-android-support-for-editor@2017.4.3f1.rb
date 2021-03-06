cask 'unity-android-support-for-editor@2017.4.3f1' do
  version '2017.4.3f1,21ae32b5a9cb'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/21ae32b5a9cb/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-2017.4.3f1.pkg"
  name 'Android Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-Android-Support-for-Editor-2017.4.3f1.pkg'

  depends_on cask: 'unity@2017.4.3f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.4.3f1"
      FileUtils.move "/Applications/Unity-2017.4.3f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.4.3f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.4.3f1/PlaybackEngines/AndroidPlayer'
end
