# Android Skills 技能包安装指南

> 第三方部署指南 · 非 Android Skills 官方仓库。官方项目：[android/skills](https://github.com/android/skills)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://developer.android.com/tools/agents/android-skills)为准。

[![⚡ 技能包安装](https://img.shields.io/badge/%E2%9A%A1_%E6%8A%80%E8%83%BD%E5%8C%85%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#技能包安装推荐用百度搭子)

## 技能包安装（推荐：用百度搭子）

> [!TIP]
> 让 AI 写安卓代码总是踩坑？让百度搭子把谷歌官方的 Android 技能库装上。

⚠️ 这是给 AI 编程助手用的技能库，不是安卓 SDK。官方推荐用 Android CLI 安装；本教程用 git clone 加复制的方式，适合没有装 Android CLI 的环境。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/android-skills-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子克隆仓库，把技能目录复制到客户端读取的技能文件夹，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Android Skills 是什么？

Android Skills 是开源的10.0k stars，Apache-2.0，谷歌官方维护的 Android Agent 技能库，覆盖 Compose、相机、性能与上架（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/android/skills?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

一套按主题拆分的 Android 开发技能：每个目录是一个 SKILL.md，把 Android 官方文档里的最佳实践写成 Agent 能直接执行的技术规范，重点覆盖模型容易出错的场景。

- 10.0k stars：谷歌官方仓库，2026-03 建仓
- 17 个主题：Compose、相机、媒体、导航、性能、Play、安全、测试、Wear、TV、XR 等
- 只做难的部分：官方明确不覆盖模型已经很擅长的领域
- 开放标准：遵循 agentskills.io 的 SKILL.md 规范
- 可用于 Claude Code / Codex / Gemini / Antigravity
- Apache-2.0：可内部使用

（来源：[官方仓库](https://github.com/android/skills)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 10.0k stars | 谷歌官方维护 |
| 17 个主题 | 从 Compose 到 Play 上架全覆盖 |
| 官方文档口径 | 内容来自 developer.android.com |
| 标准格式 | 遵循 agentskills.io 规范 |
| 多客户端 | Claude Code / Codex / Gemini 都能用 |
| Apache-2.0 | 可内部使用 |

| 需要注意 | 说明 |
|---|---|
| 不覆盖基础 | Compose 入门这类事它不管 |
| 需要客户端支持技能 | 不支持的客户端用不了 |
| 官方路径要 Android CLI | 没装就得手动复制 |
| 不接收外部贡献 | 定制只能自己 fork |
| 偏实践规范 | 不替代官方文档 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 快速部署（官方方式）

```bash
git clone --depth=1 https://github.com/android/skills.git
mkdir -p ~/.claude/skills
for d in skills/camera skills/performance skills/navigation skills/testing skills/play; do cp -R "$d" ~/.claude/skills/ 2>/dev/null; done
ls ~/.claude/skills | head -n 20
echo "安装完成：在对话里直接提需求，Agent 会自动匹配技能"
```

部署步骤来源：[https://github.com/android/skills#install-android-skills](https://github.com/android/skills#install-android-skills)

## 验证状态

| 场景 | 状态 |
|---|---|
| 仓库元数据核对：9,955 stars、641 forks、Apache-2.0、2026-03-16 建仓 | 已核对 2026-10-28 |
| GitHub Trending 周榜 +873 | 已核对 2026-10-27 |
| 仓库根目录确认 17 个技能目录（camera / performance / navigation / testing / play 等） | 已核对 2026-10-27 |
| README 确认官方安装方式为 `android skills add --all`，也支持 Claude Code / Codex 插件市场 | 已核对 2026-10-27 |
| 最新 release v1.0.18（2026-10-26），附带 android-skills.zip 1.3 MB | 已核对 2026-10-27 |
| 未实测技能在客户端内的触发效果 | 说明 2026-10-27 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Android Skills 不是 MCP server，是 Agent 技能集合；本仓库只负责安装，不注册 MCP。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\android-skills-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 装了哪些技能

仓库根目录下每个文件夹是一个技能：

| 目录 | 覆盖内容 |
|---|---|
| `jetpack-compose` | Compose 相关实践 |
| `camera` | CameraX 与相机流程 |
| `media` | 音视频与媒体会话 |
| `navigation` | 导航与深链 |
| `performance` | 启动、卡顿、内存 |
| `play` | 上架与 Play 政策 |
| `security` | 权限、加密、数据安全 |
| `testing` | 测试策略与工具 |
| `wear` / `tv` / `cars` / `xr` | 各形态设备 |
| `profilers` / `devtools` | 性能分析工具 |
| `build-system` / `system` / `identity` | 构建、系统能力、身份 |

### 官方安装方式（有 Android CLI 时）

```bash
android skills add --all
android skills add r8-analyzer --project=.
android skills update --all
```

### Claude Code 插件方式

```text
/plugin marketplace add android/skills
/plugin install android-skills@android-skills
```

### 怎么触发

不需要点名。说完需求 Agent 会自动挑技能，比如：

```text
把我的应用 UI 改成 edge-to-edge
帮我看看启动为什么慢
把相机预览换成 CameraX
```

> ⚠️ 官方说明：公开贡献暂不接受，发现问题走 GitHub issue。

## 常见坑

- 技能不生效：确认复制到了客户端读取的目录，而不是仓库目录
- 只装了一个：`android skills add` 默认只装 android-cli，要加 `--all`
- 复制后目录层级多一层：确保是 `skills/camera` 变成 `~/.claude/skills/camera`
- 客户端不识别：确认版本支持 SKILL.md 规范
- 内容过期：用 `android skills update --all` 或重新 clone
- 想改技能：Apache-2.0 允许，但公开贡献暂不接受

## 免责声明

本仓库为第三方指南，与 Android Skills 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://developer.android.com/tools/agents/android-skills)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
