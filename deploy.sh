#!/usr/bin/env bash
set -euo pipefail
# Android Skills 技能包安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://developer.android.com/tools/agents/android-skills
# 更新日期：2026-10-28
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }

mkdir -p .download
cd .download

git clone --depth=1 https://github.com/android/skills.git
mkdir -p ~/.claude/skills
for d in skills/camera skills/performance skills/navigation skills/testing skills/play; do cp -R "$d" ~/.claude/skills/ 2>/dev/null; done
ls ~/.claude/skills | head -n 20
echo "安装完成：在对话里直接提需求，Agent 会自动匹配技能"

echo ""

echo "安装完成：在对话里直接提需求，比如「把我的应用改成 edge-to-edge」，Agent 会自己匹配到对应技能"
echo "若结果异常或需要改配置，请参考官方文档：https://developer.android.com/tools/agents/android-skills"
