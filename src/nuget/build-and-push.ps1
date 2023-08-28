# 定义参数
Param(
    # Nuget APIKey
    [string] $apikey
)

if ($apikey -eq $null -or $apikey -eq "")
{
    Write-Error "必须指定apiKey";
    return;
}

$files = Get-ChildItem -Path ../Mapster/bin/Release -Filter *.nupkg
foreach($file in $files)
{
    dotnet nuget push $file.fullName --skip-duplicate --api-key $apikey --source https://api.nuget.org/v3/index.json
}
$files = Get-ChildItem -Path ../Mapster.DependencyInjection/bin/Release -Filter *.nupkg
foreach($file in $files)
{
    dotnet nuget push $file.fullName --skip-duplicate --api-key $apikey --source https://api.nuget.org/v3/index.json
}
$files = Get-ChildItem -Path ../Mapster.Core/bin/Release -Filter *.nupkg
foreach($file in $files)
{
    dotnet nuget push $file.fullName --skip-duplicate --api-key $apikey --source https://api.nuget.org/v3/index.json
}