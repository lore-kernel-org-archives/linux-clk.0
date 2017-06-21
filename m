Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from szxga02-in.huawei.com ([45.249.212.188]:8370 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752227AbdFUJXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Jun 2017 05:23:18 -0400
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <sboyd@codeaurora.org>, <robh+dt@kernel.org>, <kishon@ti.com>,
        <xuwei5@hisilicon.com>, <catalin.marinas@arm.com>,
        <balbi@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <project-aspen-dev@linaro.org>, <yanhaifeng@hisilicon.com>,
        Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH 2/5] dt-bindings: phy-hisi-inno-usb2: add support for hisi-inno-usb2 phy
Date: Wed, 21 Jun 2017 17:00:42 +0800
Message-ID: <1498035645-22804-3-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1498035645-22804-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1498035645-22804-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add support for hisi-inno-usb2 phy.

Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
---
 .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
new file mode 100644
index 0000000..21f8208
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
@@ -0,0 +1,36 @@
+HiSilicon INNO USB2 PHY
+-----------------------
+Required properties:
+- compatible: Should be one of the following strings:
+		"hisilicon,inno-usb2-phy",
+		"hisilicon,hi3798cv200-usb2-phy",
+- #phy-cells: Must be 0
+- hisilicon,peripheral-syscon: Phandle of syscon used to control phy.
+- clocks: Phandle and clock specifier pair for reference clock utmi_refclk.
+- resets: List of phandle and reset specifier pairs for each reset signal in
+reset-names.
+- reset-names: Should be "por_rst" and "test_rst". The test_rst only
+exists in some of SOCs, so it is optional.
+
+Phy node can include up to four subnodes. Each subnode represents one port.
+The required properties of port node are as follows:
+- clocks: Phandle and clock specifier pair for utmi_clock.
+- resets: List of phandle and reset specifier pairs for port reset and utmi reset.
+- reset-names: List of reset signal names. Should be "port_rst" and "utmi_rst"
+
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+usb_phy: phy {
+		 compatible = "hisilicon,inno_usb2_phy";
+		 #phy-cells = <0>;
+		 hisilicon,peripheral-syscon = <&peri_ctrl>;
+		 clocks = <&crg USB2_REF_CLK>;
+		 resets = <&crg 0xb4 2>;
+		 reset-names = "por_rst";
+		 port0 {
+			 clocks = <&crg USB2_UTMI0_CLK>;
+			 resets = <&crg 0xb4 5>, <&crg 0xb4 1>;
+			 reset-names = "port_rst", "utmi_rst";
+		 };
+	 };
-- 
1.9.1

