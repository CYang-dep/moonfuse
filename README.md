# MoonFuse

Linux FUSE 用户态文件系统协议库的 MoonBit 移植。

> 当前阶段：协议核心开发中。项目面向 MoonBit native/Linux；非 Linux 目标会明确返回不支持。

## 目标

MoonFuse 负责连接 Linux FUSE 内核设备与用户态文件系统实现：解析内核请求、分派操作、编码响应，并管理 inode、文件句柄、错误码和会话生命周期。

它不负责实现某一种具体文件系统，也不等同于文件监视器、tar/zip 解析器或普通文件 API。

## 计划范围

- FUSE 协议头、操作码、属性和目录项编解码
- lookup/getattr/setattr/open/read/write/readdir/create/mkdir/unlink/rmdir/rename/statfs
- inode 与 file handle 生命周期
- 请求分派、错误映射、取消与会话关闭
- mock 设备和 Linux native 后端
- 内存文件系统、只读归档视图、动态文件系统示例

## 开源来源

本项目参考 libfuse 3 的公开协议与接口设计，并参考 bazil.org/fuse 的 Go 协议实现思路；不复制其实现代码。具体许可证和参考范围见 `NOTICE` 与 `docs/competition/duplicate-check.md`。

## 状态

这是经确认后开始的开发项目，API 可能在 0.x 阶段调整。
