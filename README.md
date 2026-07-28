# hassio-addons

自维护的 Home Assistant 加载项仓库，使用官方二进制，GitHub Actions 自动跟进版本。

## 加载项列表

### DDNS-GO

自动获取公网 IPv4/IPv6 地址，并更新到 Cloudflare、DNSPod 等 DNS 服务商。

- **官方仓库**: https://github.com/jeessy2/ddns-go
- **当前版本**: 6.17.2
- **构建方式**: 使用 HAOS 基础镜像 + 官方二进制（非第三方镜像）
- **自动更新**: GitHub Actions 每天检查官方 release，有新版自动修改版本号并提交

## 安装方法

1. Home Assistant → 设置 → 加载项 → 加载项商店
2. 右上角菜单 → 仓库 → 添加仓库地址：
   ```
   https://github.com/<你的GitHub用户名>/hassio-addons
   ```
3. 刷新页面，在加载项列表中找到 **DDNS-GO**
4. 点击安装 → 启动
5. 点击「打开 Web UI」按钮，或访问 `http://HAOS_IP:9876`

## 配置说明

安装后打开 Web UI，在界面中配置：

1. **DNS 服务商**: 分别添加 Cloudflare 和腾讯云 DNSPod
2. **IPv4**: 取消勾选（仅同步 IPv6）
3. **IPv6**: 勾选启用，获取方式选「通过网卡获取」

配置文件保存在 HAOS 的 `/config/ddns-go/` 目录，系统重装不丢失。

## 版本更新

- GitHub Actions 每天北京时间 14:00 自动检查官方 release
- 检测到新版本后自动修改 `config.yaml` 和 `Dockerfile` 中的版本号并提交
- HAOS 加载项商店会显示「可更新」提示，点击更新即可重新构建
- 也可在仓库的 Actions 页面手动触发更新检查
