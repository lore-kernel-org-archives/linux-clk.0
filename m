Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1on0136.outbound.protection.outlook.com ([157.56.110.136]:17472
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753668AbbJOHEh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 15 Oct 2015 03:04:37 -0400
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
	<linux-clk@vger.kernel.org>, <olof@lixom.net>
CC: <bhupesh.linux@gmail.com>, <will.deacon@arm.com>,
	<Catalin.Marinas@arm.com>, <bhupesh.sharma@freescale.com>,
	<LeoLi@freescale.com>, <scottwood@freescale.com>,
	<stuart.yoder@freescale.com>
Subject: [PATCH v3 09/12] dts/ls2080a: Update Simulator DTS to add support of various peripherals
Date: Thu, 15 Oct 2015 12:17:49 +0530
Message-ID: <1444891672-32117-10-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch updates the LS2080a simulator DTS to add support of various
peripherals which are supported on the simulator platform and explicitly
disables those which are yet not supported on the platform.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts |   54 ++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts b/arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts
index 33d6d0c..70b0fb4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-simu.dts
@@ -57,9 +57,63 @@
 	model = "Freescale Layerscape 2080a software Simulator model";
 	compatible = "fsl,ls2080a-simu", "fsl,ls2080a";
 
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+	};
+
 	ethernet@2210000 {
 		compatible = "smsc,lan91c111";
 		reg = <0x0 0x2210000 0x0 0x100>;
 		interrupts = <0 58 0x1>;
 	};
 };
+
+&esdhc {
+	status = "disabled";
+};
+
+&ifc {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "disabled";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&i2c2 {
+	status = "disabled";
+};
+
+&i2c3 {
+	status = "disabled";
+};
+
+&dspi {
+	status = "disabled";
+};
+
+&qspi {
+	status = "disabled";
+};
+
+&sata0 {
+	status = "disabled";
+};
+
+&sata1 {
+	status = "disabled";
+};
+
+&usb0 {
+	status = "disabled";
+};
+
+&usb1 {
+	status = "disabled";
+};
+
-- 
1.7.9.5


