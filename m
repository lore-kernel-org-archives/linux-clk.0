Return-Path: <shengjiu.wang@freescale.com>
From: Shengjiu Wang <shengjiu.wang@freescale.com>
To: <shawnguo@kernel.org>, <mturquette@baylibre.com>, <kernel@pengutronix.de>,
	<sboyd@codeaurora.org>, <robh+dt@kernel.org>, <pawel.moll@arm.com>,
	<mark.rutland@arm.com>, <ijc+devicetree@hellion.org.uk>,
	<galak@codeaurora.org>, <linux@arm.linux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 0/2]  fix clock issue for fsl,spdi
Date: Tue, 15 Sep 2015 18:01:00 +0800
Message-ID: <cover.1442310569.git.shengjiu.wang@freescale.com>
Return-Path: shengjiu.wang@freescale.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

fix clock issue for fsl,spdi in imx6.

Changes in v2:
move the dts change to another patch

Shengjiu Wang (2):
  clk: imx6: Add SPDIF_GCLK clock in clock tree
  ARM: dts: imx6: change the core clock of spdif

 arch/arm/boot/dts/imx6qdl.dtsi            |  2 +-
 arch/arm/boot/dts/imx6sl.dtsi             | 16 ++++++++++++++++
 arch/arm/boot/dts/imx6sx.dtsi             |  2 +-
 drivers/clk/imx/clk-imx6q.c               |  4 +++-
 drivers/clk/imx/clk-imx6sl.c              |  4 +++-
 drivers/clk/imx/clk-imx6sx.c              |  1 +
 include/dt-bindings/clock/imx6qdl-clock.h |  3 ++-
 include/dt-bindings/clock/imx6sl-clock.h  |  3 ++-
 include/dt-bindings/clock/imx6sx-clock.h  |  3 ++-
 9 files changed, 31 insertions(+), 7 deletions(-)

-- 
1.9.1
