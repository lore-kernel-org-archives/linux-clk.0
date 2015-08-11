Return-Path: <shunqian.zheng@gmail.com>
Return-Path: <shunqian.zheng@gmail.com>
From: Shunqian Zheng <zhengsq@rock-chips.com>
To: gregkh@linuxfoundation.org,
	srinivas.kandagatla@linaro.org,
	maxime.ripard@free-electrons.com,
	heiko@sntech.de,
	caesar.wang@rock-chips.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	dianders@chromium.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xjq@rock-chips.com,
	ZhengShunQian <zhengsq@rock-chips.com>
Subject: [PATCH v2 0/5] Add eFuse driver of Rockchip SoC
Date: Tue, 11 Aug 2015 18:13:39 +0800
Message-Id: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

From: ZhengShunQian <zhengsq@rock-chips.com>

Base on nvmem framework, this series patches
implement the eFuse driver of Rockchip SoC.
The data from eFuse contains CPU leakage, chip code and version etc.

The flow of reading data from eFuse is quite simple,
configure the CTRL register, write data address to CTRL
register, then data is available in DOUT register.


ZhengShunQian (5):
  clk: rockchip: rk3288: Add the clock id of eFuse
  nvmem: fix the out-of-range leak in read/write()
  nvmem: rockchip-efuse: implement efuse driver
  Documentation: rockchip-efuse: describe the usage of eFuse
  ARM: dts: rockchip: add eFuse config of rk3288 SoC

 .../devicetree/bindings/nvmem/rockchip-efuse.txt   |  38 +++++
 arch/arm/boot/dts/rk3288.dtsi                      |  13 ++
 drivers/clk/rockchip/clk-rk3288.c                  |   2 +-
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/core.c                               |   4 +-
 drivers/nvmem/rockchip-efuse.c                     | 186 +++++++++++++++++++++
 include/dt-bindings/clock/rk3288-cru.h             |   1 +
 8 files changed, 253 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
 create mode 100644 drivers/nvmem/rockchip-efuse.c

-- 
1.9.1
