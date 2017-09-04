Return-Path: <romain.perier@collabora.com>
From: Romain Perier <romain.perier@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: philipp.tomsich@theobroma-systems.com,
	klaus.goger@theobroma-systems.com,
	devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Romain Perier <romain.perier@collabora.com>
Subject: [PATCH v2 0/4] rockchip: Add efuse support for RK3368 SoCs
Date: Mon,  4 Sep 2017 10:51:15 +0200
Message-Id: <20170904085119.25981-1-romain.perier@collabora.com>
List-ID: <linux-clk.vger.kernel.org>

This set of patches exports the right clocks, add required functions
and data, and definition for enabling and supporting eFuse on RK3368
SoCs.

Note: On my geekbox rk3368, I was unable to flash a working upstream ATF
or upstream uboot (missing support for LPDDR3 init and timping). I cannot
test the driver without the secure mode for this efuse on my hardware.So
I am asking for testing. I think that it should work like on rk3288

Changes in v2:
- Removed ARM SMC calls for efuse, we need to do as upstream ATF and
  uboot mainline do, so no secure-regs for efuse

Romain Perier (4):
  clk: rockchip: add clock id for PCLK_EFUSE256 of RK3368 SoCs
  clk: rockchip: export clock pclk_efuse_256 for RK3368 SoCs
  nvmem: rockchip: add support for RK3368
  arm64: dts: rockchip: add efuse for RK3368 SoCs

 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt |  1 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi                   | 14 ++++++++++++++
 drivers/clk/rockchip/clk-rk3368.c                          |  2 +-
 drivers/nvmem/rockchip-efuse.c                             |  4 ++++
 include/dt-bindings/clock/rk3368-cru.h                     |  1 +
 5 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.11.0
