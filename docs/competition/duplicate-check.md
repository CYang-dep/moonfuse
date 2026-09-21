# MoonFuse 竞争重复检查

- 检查日期：2026-09-21
- 项目：MoonFuse
- 核心：Linux FUSE 用户态文件系统协议、请求分派、响应编码和会话管理。
- 决策：用户已确认，进入实现。

## 检索范围

已检索 MoonCakes 关键词：`fuse`、`libfuse`、`FUSE filesystem`、`mount filesystem`、`inode request`、`fuse kernel`、`fuse session`；并检查相关 MoonBit 包说明和本地项目注册表。

## 相关但不重合

- `tuya-me/fuse`：熔断器，名称相同但不是文件系统。
- `mizchi/fswatch`、`i5ting/chokidar`：文件变化监视，不处理 FUSE 内核请求。
- `tonyfettes/gio`：GIO 文件/流/D-Bus 绑定，不提供 FUSE 协议服务端。
- tar/zip 包：归档格式编解码，不提供内核挂载会话和请求回复。

## 差异边界

MoonFuse 的中心数据是 FUSE 内核请求和协议响应，主循环是请求解析、操作分派和 reply 编码。它不以文件监视、归档读写或普通本地文件访问为核心。因此同属文件系统基础设施领域，但核心功能不同。

## 上游与合规

参考 libfuse 3 的公开协议/接口文档，以及 bazil.org/fuse 的公开协议设计；实现使用 MoonBit 重写，不复制上游源代码。上游许可证、版权与参考范围在 `NOTICE` 中记录。

## 限制

结论针对 2026-09-21 可检索的公开索引和本地记录；不能证明私有或未索引项目绝对不存在。项目为 Linux native 基础设施，非 Linux 目标明确不支持。
