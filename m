Return-Path: <jszhang@marvell.com>
From: Jisheng Zhang <jszhang@marvell.com>
To: <ulf.hansson@linaro.org>, <sebastian.hesselbarth@gmail.com>,
        <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
        <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>,
        <mturquette@baylibre.com>, <sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 2/5] ARM: dts: berlin: correct BG2Q's sdhci2 axi clock
Date: Mon, 12 Oct 2015 13:46:33 +0800
Message-ID: <1444628796-5484-3-git-send-email-jszhang@marvell.com>
In-Reply-To: <1444628796-5484-1-git-send-email-jszhang@marvell.com>
References: <1444628796-5484-1-git-send-email-jszhang@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The optional axi clock is CLKID_SDIO.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 4ad585c..2f12048 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -119,7 +119,7 @@
 			compatible = "mrvl,pxav3-mmc";
 			reg = <0xab1000 0x200>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&chip_clk CLKID_NFC_ECC>, <&chip_clk CLKID_NFC>;
+			clocks = <&chip_clk CLKID_NFC_ECC>, <&chip_clk CLKID_SDIO>;
 			clock-names = "core", "axi";
 			status = "disabled";
 		};
-- 
2.6.1
