#!/bin/bash

#修改密码
sed -i 's/root::0:0:99999:7:::/root:$1$xUooaZpA$6zs50xt4ac9sJXiYpycT3\/:19338:0:99999:7:::/g' package/base-files/files/etc/shadow

## 酷友社开发的Openwrt插件：DDNSTO远程穿透、易有云存储端、iStore、QuickStart便捷首页
svn co https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/linkease package/linkease

## luci-app-openclash
#svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#rm -rf package/luci-app-openclash/.svn

## 修改include/target.mk
sed -i 's/kmod-nf-nathelper/kmod-nf-nathelper kmod-bnx2 kmod-forcedeth/g' include/target.mk
sed -i 's/luci-app-filetransfer/luci-app-openclash luci-app-store/g' include/target.mk
sed -i 's/luci-app-turboacc/luci-app-udpxy luci-app-upnp/g' include/target.mk

## 修改openwrt/target/linux/x86的Makefile文件
sed -i 's/automount/iptables ip6tables dnsmasq-full firewall htop ppp ppp-mod-pppoe/g' target/linux/x86/Makefile
