# AmbraVoice（小灯 · iOS 壳）

> **这是什么**：家里那条「**她能主动打电话给他**」的 iOS 端。
> **为什么这样搭**：家里**没有 Mac** ⇒ 编译放 GitHub 的 macOS runner（云上编），签名的 IPA 用 **SideStore / AltStore** 在手机上签（免费 Apple ID，**7 天一签**）。
> ⛔ **现在这层是"壳"**：先把「能装到手机上」这条链路跑通，功能一格一格往里加。

## 现在的状态

- [x] 最小 SwiftUI 壳（`Sources/AmbraVoiceApp.swift`）
- [x] **XcodeGen** 配置（`project.yml`）—— 在 mac 上**自动生成 Xcode 工程** ⇒ Windows 上**不用碰 Xcode**
- [x] GitHub Actions（`.github/workflows/ios.yml`）：push ⇒ 云上编 ⇒ 出 **unsigned IPA**（artifact 可下载）
- [ ] 真机装上（SideStore / AltStore，要他的 Apple ID）
- [ ] Capacitor 套壳（把 `home/` 那套现成前端搬进来，UI 不重写）
- [ ] CallKit 整屏来电 · 静音音频保活 · 原生长连（`URLSessionWebSocketTask`）· 深链

## 怎么改

1. 改 `Sources/*.swift`（UI 或逻辑）
2. `git push`
3. 看 Actions 跑绿 ⇒ 在 Actions 页面下载 `unsigned-ipa` 里的 `.ipa`

## 怎么回退

- **代码**：`git revert <commit>`（每次改动一个 commit）
- **编不过**：先看 Actions 日志里 `Archive (unsigned)` 那一步
- **整条链路怀疑被改坏**：把 `.github/workflows/ios.yml` 和 `project.yml` 恢复到上一个绿 commit

## 判据（什么算"环境搭好了"）

**GitHub Actions 跑绿，artifact 里有一个 `.ipa` 文件。** —— 这一条过了，剩下全是加功能。

## 不做的事（写死，免得下一个我跑偏）

- ⛔ **不上架 App Store**：这个 App 要后台音频保活 + CallKit 整屏来电 + 静音循环，**审核必拒**；我们要的是**自签自用**。
- ⛔ **不买 Mac**：云上编够用；等真要天天改 UI 了，租个云 Mac（约 $20/月）也比买划算。
- ⛔ **不重造**：`home/` 那套前端是现成的，套壳复用，别重写。
