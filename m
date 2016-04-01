Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1bon0079.outbound.protection.outlook.com ([157.56.111.79]:2753
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932304AbcDADQ7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 31 Mar 2016 23:16:59 -0400
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-clk@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<iommu@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, <scott.wood@nxp.com>,
	Russell King <linux@arm.linux.org.uk>,
	Jochen Friedrich <jochen@scram.de>,
	Joerg Roedel <joro@8bytes.org>,
	Claudiu Manoil <claudiu.manoil@freescale.com>,
	<ulf.hansson@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@freescale.com>,
	"Zhao Qiang" <qiang.zhao@freescale.com>,
	Kumar Gala <galak@codeaurora.org>,
	"Santosh Shilimkar" <ssantosh@kernel.org>, <leoyang.li@nxp.com>,
	<xiaobo.xie@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v7, 1/5] ARM64: dts: ls2080a: add device configuration node
Date: Fri, 1 Apr 2016 11:07:27 +0800
Message-ID: <1459480051-3701-2-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
References: <1459480051-3701-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the dts node for device configuration unit that provides
general purpose configuration and status for the device.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v2:
	- None
Changes for v3:
	- None
Changes for v4:
	- None
Changes for v5:
	- Added this patch
Changes for v6:
	- None
Changes for v7:
	- None
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 9d746c6..8724cf1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -191,6 +191,12 @@
 			clocks = <&sysclk>;
 		};
 
+		dcfg: dcfg@1e00000 {
+			compatible = "fsl,ls2080a-dcfg", "syscon";
+			reg = <0x0 0x1e00000 0x0 0x10000>;
+			little-endian;
+		};
+
 		serial0: serial@21c0500 {
 			compatible = "fsl,ns16550", "ns16550a";
 			reg = <0x0 0x21c0500 0x0 0x100>;
-- 
2.1.0.27.g96db324

