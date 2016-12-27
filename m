Return-Path: <ping.bai@nxp.com>
From: Bai Ping <ping.bai@nxp.com>
To: <shawnguo@kernel.org>, <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>, <mark.rutland@arm.com>, <linus.walleij@linaro.org>
CC: <kernel@pengutronix.de>, <fabio.estevam@nxp.com>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>, <p.zabel@pengutronix.de>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<jacky.baip@gmail.com>
Subject: [PATCH v2 12/12] ARM: configs: enable imx6sll support in defconfig
Date: Tue, 27 Dec 2016 17:47:50 +0800
Message-ID: <1482832070-22668-13-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: ping.bai@nxp.com
List-ID: <linux-clk.vger.kernel.org>

Enable i.MX6SLL in imx_v6_v7_defconfig.

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index cbe7faf..ab8afb3 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -38,6 +38,7 @@ CONFIG_SOC_IMX51=y
 CONFIG_SOC_IMX53=y
 CONFIG_SOC_IMX6Q=y
 CONFIG_SOC_IMX6SL=y
+CONFIG_SOC_IMX6SLL=y
 CONFIG_SOC_IMX6SX=y
 CONFIG_SOC_IMX6UL=y
 CONFIG_SOC_IMX7D=y
-- 
1.9.1
