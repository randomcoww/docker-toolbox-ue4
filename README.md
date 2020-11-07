### Environment for UE4 editor in fedora toolbox

Upstream https://github.com/containers/toolbox

Add packages to stock toolbox needed to launch the Unreal Engine 4 editor.

Start toolbox using image
```
toolbox create -c ue4 -i docker.io/randomcoww/fedora-toolbox-ue4:latest
```

#### Build and launch editor

*Build steps based on https://github.com/adamrehn/ue4-docker*

Get Github invite to EpicGames private repos

https://docs.unrealengine.com/en-US/Platforms/Linux/BeginnerLinuxDeveloper/SettingUpAnUnrealWorkflow/index.html

Generate a Github personal token with `repo` access

Check out project somewhere in home directory
```
GITHUB_TOKEN=<token>
git clone --depth=1 -b release \
    https://${GITHUB_TOKEN}:x-oauth-basic@github.com/EpicGames/UnrealEngine.git 
```

Build
```
cd UnrealEngine \
  && ./Setup.sh \
  && ./Engine/Build/BatchFiles/Linux/Build.sh UE4Editor Linux Development -WaitMutex \
  && ./Engine/Build/BatchFiles/Linux/Build.sh ShaderCompileWorker Linux Development -WaitMutex \
  && ./Engine/Build/BatchFiles/Linux/Build.sh UnrealPak Linux Development -WaitMutex
```

Launch editor
```
./Engine/Binaries/Linux/UE4Editor
```