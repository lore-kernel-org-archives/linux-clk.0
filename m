Return-Path: <linux-kernel-owner@vger.kernel.org>
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
        Kumar Gala <galak@codeaurora.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Xiaobo Xie <xiaobo.xie@nxp.com>,
        Minghuan Lian <minghuan.lian@nxp.com>,
        Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v14, 2/8] ARM64: dts: ls2080a: add device configuration node
Date: Fri, 28 Oct 2016 13:45:15 +0800
Message-ID: <1477633521-7391-3-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1477633521-7391-1-git-send-email-yangbo.lu@nxp.com>
References: <1477633521-7391-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the dts node for device configuration unit that provides
general purpose configuration and status for the device.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Scott Wood <oss@buserror.net>
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
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 337da90..c03b099 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -215,6 +215,12 @@
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
