Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
 <netdev@vger.kernel.org>
Subject: [v9, 2/7] ARM64: dts: ls2080a: add device configuration node
Date: Wed, 4 May 2016 11:24:29 +0800
Message-ID: <1462332274-13744-3-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1462332274-13744-1-git-send-email-yangbo.lu@nxp.com>
References: <1462332274-13744-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, ulf.hansson@linaro.org,
 Russell King <linux@arm.linux.org.uk>, Yangbo Lu <yangbo.lu@nxp.com>, Bhupesh
 Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Jochen Friedrich <jochen@scram.de>,
 leoyang.li@nxp.com, Scott Wood <oss@buserror.net>,
 Rob Herring <robh+dt@kernel.org>,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 Kumar Gala <galak@codeaurora.org>, xiaobo.xie@nxp.com,
 Qiang Zhao <qiang.zhao@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
