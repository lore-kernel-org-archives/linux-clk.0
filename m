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
Subject: [PATCH v2 4/5] Documentation: rockchip-efuse: describe the usage of eFuse
Date: Tue, 11 Aug 2015 18:13:43 +0800
Message-Id: <1439288024-13359-5-git-send-email-zhengsq@rock-chips.com>
In-Reply-To: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
References: <1439288024-13359-1-git-send-email-zhengsq@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

From: ZhengShunQian <zhengsq@rock-chips.com>

This patch add the bindings document of rockchip eFuse driver.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: ZhengShunQian <zhengsq@rock-chips.com>
---
 .../devicetree/bindings/nvmem/rockchip-efuse.txt   | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt

diff --git a/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
new file mode 100644
index 0000000..8f86ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/rockchip-efuse.txt
@@ -0,0 +1,38 @@
+= Rockchip eFuse device tree bindings =
+
+Required properties:
+- compatible: Should be "rockchip,rockchip-efuse"
+- reg: Should contain the registers location and exact eFuse size
+- clocks: Should be the clock id of eFuse
+- clock-names: Should be "pclk_efuse"
+
+= Data cells =
+Are child nodes of eFuse, bindings of which as described in
+bindings/nvmem/nvmem.txt
+
+Example:
+
+	efuse: efuse@ffb40000 {
+		compatible = "rockchip,rockchip-efuse";
+		reg = <0xffb40000 0x20>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		clocks = <&cru PCLK_EFUSE256>;
+		clock-names = "pclk_efuse";
+
+		/* Data cells */
+		cpu_leakage: cpu_leakage {
+			reg = <0x17 0x1>;
+		};
+	};
+
+= Data consumers =
+Are device nodes which consume nvmem data cells.
+
+Example:
+
+	cpu_leakage {
+		...
+		nvmem-cells = <&cpu_leakage>;
+		nvmem-cell-names = "cpu_leakage";
+	};
-- 
1.9.1
