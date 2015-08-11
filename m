Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Shunqian Zheng <zhengsq@rock-chips.com>
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org,
	maxime.ripard@free-electrons.com, heiko@sntech.de,
	caesar.wang@rock-chips.com
Cc: mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, dianders@chromium.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	xjq@rock-chips.com, ZhengShunQian <zhengsq@rock-chips.com>
Subject: [PATCH v2 5/5] ARM: dts: rockchip: add eFuse config of rk3288 SoC
Date: Tue, 11 Aug 2015 18:13:44 +0800
Message-Id: <1439288024-13359-6-git-send-email-zhengsq@rock-chips.com>
In-Reply-To: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
References: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: ZhengShunQian <zhengsq@rock-chips.com>

This patch add the eFuse dt config of rk3288 SoC.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: ZhengShunQian <zhengsq@rock-chips.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 2db91c9..4632e0d 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -749,6 +749,19 @@
 		interrupts = <GIC_PPI 9 0xf04>;
 	};
 
+	efuse: efuse@ffb40000 {
+		compatible = "rockchip,rockchip-efuse";
+		reg = <0xffb40000 0x20>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		clocks = <&cru PCLK_EFUSE256>;
+		clock-names = "pclk_efuse";
+
+		cpu_leakage: cpu_leakage {
+			reg = <0x17 0x1>;
+		};
+	};
+
 	usbphy: phy {
 		compatible = "rockchip,rk3288-usb-phy";
 		rockchip,grf = <&grf>;
-- 
1.9.1

