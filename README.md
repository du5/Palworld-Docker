# Palworld-Docker

## 项目简介

通过 Docker Compose 你可以在你的机器上快速地运行和开发 Palworld。

## 安装步骤

1. 确保你的机器上已经安装了 Docker 和 Docker Compose。如果还没有安装，你可以参考这些链接进行安装：[Docker](https://docs.docker.com/get-docker/) 和 [Docker Compose](https://docs.docker.com/compose/install/)。
2. 克隆这个仓库到你的本地机器。
3. 在项目的根目录下运行 `docker-compose up`。

## 如何使用

在安装完成后，你可以通过服务器的 udp 端口 `8211` 来加入到这个 Palworld 社区服务器。

默认情况下你的存档文件应该保存在目录 `/opt/palworld` 下。如果你想要修改存档文件的位置，你可以在 `docker-compose.yml` 文件中修改 `volumes` 部分。

如果你需要自定义服务器的配置，你可以在 `/opt/palworld/Config/LinuxServer/PalWorldSettings.ini` 文件中修改。(在修改前, 你需要先停止服务器。)

## 贡献

如果你有任何想法或者建议，欢迎提交 issue 或者 pull request。

## 许可证

此项目遵循 MIT 许可证。

## 联系方式

如果你有任何问题，可以通过 email@example.com 联系我。