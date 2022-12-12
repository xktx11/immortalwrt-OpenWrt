#!/bin/bash
#=================================================
# DIY script
# jsjson@163.com 
#=================================================             

#设置默认时区
#uci set system.@system[0].timezone=CST-8
#uci set system.@system[0].zonename=Asia/Shanghai

##配置IP
#sed -i 's/192.168.1.1/192.168.100.101/g' package/base-files/files/bin/config_generate

##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
#sed -i "s/hostname='.*'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
#sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION='$(date +%Y%m%d) by HiJwm'/g" package/base-files/files/etc/openwrt_release #默认为openwrt版本号，无个人信息
#sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWrt-$(date +%Y%m%d) by HiJwm'/g"  package/base-files/files/etc/openwrt_release #编译文件中添加，这个就无效了

##把nas-packages-luci的zh-cn替换成zh_Hans
sed -i 's/("QuickStart")/("首页")/g' feeds/nas_luci/luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("NetworkGuide")/("网络向导")/g' feeds/nas-luci/luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("RAID")/("磁盘阵列")/g' feeds/nas-luci/luci/luci-app-quickstart/luasrc/controller/quickstart.lua
sed -i 's/("NetworkPort")/("网口配置")/g' feeds/nas-luci/luci/luci-app-quickstart/luasrc/controller/quickstart.lua
#cp -af feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/po/zh-cn feeds/xiangfeidexiaohuo/linkease/nas-packages-luci/luci-app-quickstart/po/zh_Hans 
