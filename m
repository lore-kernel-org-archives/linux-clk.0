Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-dm3nam03on0069.outbound.protection.outlook.com ([104.47.41.69]:52640
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752559AbcKID11 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 8 Nov 2016 22:27:27 -0500
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>,
        Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
CC: <linuxppc-dev@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
        <netdev@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@arm.linux.org.uk>,
        Jochen Friedrich <jochen@scram.de>,
        Joerg Roedel <joro@8bytes.org>,
        Claudiu Manoil <claudiu.manoil@freescale.com>,
        Bhupesh Sharma <bhupesh.sharma@freescale.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Kumar Gala <galak@codeaurora.org>, Leo Li <leoyang.li@nxp.com>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Minghuan Lian <minghuan.lian@nxp.com>,
        Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v16, 1/7] ARM64: dts: ls2080a: add device configuration node
Date: Wed, 9 Nov 2016 11:14:06 +0800
Message-ID: <1478661252-42439-2-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
References: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the dts node for device configuration unit that provides
general purpose configuration and status for the device.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Scott Wood <oss@buserror.net>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
Changes for v5:
	- Added this patch
Changes for v6:
	- None
Changes for v7:
	- None
Changes for v8:
	- Added 'Acked-by: Scott Wood'
Changes for v9:
	- None
Changes for v10:
	- None
Changes for v11:
	- None
Changes for v12:
	- None
Changes for v13:
	- None
Changes for v14:
	- None
Changes for v15:
	- None
Changes for v16:
	- Added 'Acked-by: Arnd'
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 7f0dc13..d058e56 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -216,6 +216,12 @@
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

