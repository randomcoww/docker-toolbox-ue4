### Fedora Toolbox UE4

Toolbox dev environment for UE4 https://github.com/containers/toolbox

#### Get Github invite to EpicGames private repos

https://docs.unrealengine.com/en-US/Platforms/Linux/BeginnerLinuxDeveloper/SettingUpAnUnrealWorkflow/index.html

#### Build locally
Generate a Github personal token with `repo` access

```
podman build \
  --security-opt label=disable \
  --build-arg BRANCH=release \
  --build-arg GITHUB_TOKEN=<personal_token> \
   -t f33-ue4:release .
```

#### Create container
```
toolbox create -c f33-ue4 -i f33-ue4:release
toolbox enter f33-ue4
```

#### Launch
```
cd Engine/Binaries/Linux
./UE4Editor
```