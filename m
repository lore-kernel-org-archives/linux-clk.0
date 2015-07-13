Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	James Liao <jamesjj.liao@mediatek.com>
CC: Russell King <linux@arm.linux.org.uk>,
	<devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	<linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	<linux-mediatek@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	<srv_heupstream@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>,
	Daniel Kurtz <djkurtz@chromium.org>,
	<linux-clk@vger.kernel.org>, Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 5/5] arm64: dts: mt8173: add timer node
Date: Mon, 13 Jul 2015 17:32:49 +0800
Message-ID: <1436779969-18610-6-git-send-email-yingjoe.chen@mediatek.com>
In-Reply-To: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Daniel Kurtz <djkurtz@chromium.org>

Add device node to enable GPT timer. This timer will be
used as sched clock source.

Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 0696f8f..04bdd8f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -219,6 +219,15 @@
 			reg = <0 0x10007000 0 0x100>;
 		};
 
+		timer: timer@10008000 {
+			compatible = "mediatek,mt8173-timer",
+				     "mediatek,mt6577-timer";
+			reg = <0 0x10008000 0 0x1000>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_CLK_13M>,
+				 <&topckgen CLK_TOP_RTC_SEL>;
+		};
+
 		pwrap: pwrap@1000d000 {
 			compatible = "mediatek,mt8173-pwrap";
 			reg = <0 0x1000d000 0 0x1000>;
-- 
1.8.1.1.dirty

