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
Subject: [PATCH v5 09/12] MAINTAINERS: add entry for Marvell Xenon MMC Host Controller drivers
Date: Wed, 11 Jan 2017 18:19:12 +0100
Message-Id: <9f1e0138c7bc660667f4045f7d48434eb5fdc9a0.1484154449.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
References: <cover.8527229dae6c124f24c5e637430c2cdc86f80392.1484154449.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

From: Hu Ziji <huziji@marvell.com>

Add maintainer entry for Marvell Xenon eMMC/SD/SDIO
Host Controller drivers.

Signed-off-by: Hu Ziji <huziji@marvell.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfff2c9e3d94..f4fea77165d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7757,6 +7757,13 @@ M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Odd Fixes
 F:	drivers/mmc/host/mvsdio.*
 
+MARVELL XENON MMC/SD/SDIO HOST CONTROLLER DRIVER
+M:	Ziji Hu <huziji@marvell.com>
+L:	linux-mmc@vger.kernel.org
+S:	Supported
+F:	drivers/mmc/host/sdhci-xenon*
+F:	Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.txt
+
 MATROX FRAMEBUFFER DRIVER
 L:	linux-fbdev@vger.kernel.org
 S:	Orphan
-- 
git-series 0.9.1
