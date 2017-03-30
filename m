Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-mmc@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ziji Hu <huziji@marvell.com>,
	Jimmy Xu <zmxu@marvell.com>,
	Jisheng Zhang <jszhang@marvell.com>,
	Nadav Haklai <nadavh@marvell.com>,
	Ryan Gao <ygao@marvell.com>,
	Doug Jones <dougj@marvell.com>,
	Victor Gu <xigu@marvell.com>,
	"Wei(SOCP) Liu" <liuw@marvell.com>,
	Wilson Ding <dingwei@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Hanna Hawa <hannah@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>
Subject: [PATCH v7 13/13] arm64: configs: enable SDHCI driver for Xenon
Date: Thu, 30 Mar 2017 17:23:05 +0200
Message-Id: <13642de40b722ced00446e5b1e7aa95e6abb43f1.1490886907.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
References: <cover.51071caa64e5df81264a91b9a81ed1e94f47d2c4.1490886907.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

This patch enables the driver for the SDHCI controller found on the
Marvell Armada 3700 and 7K/8K ARM64 SoCs.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7c48028ec64a..95954a4ecba2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -398,6 +398,7 @@ CONFIG_MMC_DW_EXYNOS=y
 CONFIG_MMC_DW_K3=y
 CONFIG_MMC_DW_ROCKCHIP=y
 CONFIG_MMC_SUNXI=y
+CONFIG_MMC_SDHCI_XENON=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
git-series 0.9.1
