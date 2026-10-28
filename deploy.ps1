# Android Skills 技能包安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://developer.android.com/tools/agents/android-skills
# 更新日期：2026-10-27
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

git clone --depth=1 https://github.com/android/skills.git
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills" | Out-Null
foreach ($d in @('camera','performance','navigation','testing','play')) { if (Test-Path "skills\$d") { Copy-Item -Recurse -Force "skills\$d" "$env:USERPROFILE\.claude\skills\" } }
Get-ChildItem "$env:USERPROFILE\.claude\skills" -Name | Select-Object -First 20
Write-Host '安装完成：在对话里直接提需求，Agent 会自动匹配技能'

Write-Host ''

Write-Host '安装完成：在对话里直接提需求，比如「把我的应用改成 edge-to-edge」，Agent 会自己匹配到对应技能'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://developer.android.com/tools/agents/android-skills'
