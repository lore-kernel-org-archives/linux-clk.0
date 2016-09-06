Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v11,
 3/8] dt: bindings: move guts devicetree doc out of powerpc directory
Date: Tue, 6 Sep 2016 16:28:18 +0800
Message-ID: <1473150503-9550-4-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1473150503-9550-1-git-send-email-yangbo.lu@nxp.com>
References: <1473150503-9550-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Russell King <linux@arm.linux.org.uk>, Yangbo Lu <yangbo.lu@nxp.com>, Bhupesh
 Sharma <bhupesh.sharma@freescale.com>, netdev@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-kernel@vger.kernel.org, Jochen Friedrich <jochen@scram.de>,
 xiaobo.xie@nxp.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Claudiu Manoil <claudiu.manoil@freescale.com>,
 Kumar Gala <galak@codeaurora.org>, leoyang.li@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Move guts devicetree doc to Documentation/devicetree/bindings/soc/fsl/
since it's used by not only PowerPC but also ARM. And add a specification
for 'little-endian' property.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Scott Wood <oss@buserror.net>
---
Changes for v4:
	- Added this patch
Changes for v5:
	- Modified the description for little-endian property
Changes for v6:
	- None
Changes for v7:
	- None
Changes for v8:
	- Added 'Acked-by: Scott Wood'
	- Added 'Acked-by: Rob Herring'
Changes for v9:
	- None
Changes for v10:
	- None
Changes for v11:
	- None
---
 Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt | 3 +++
 1 file changed, 3 insertions(+)
 rename Documentation/devicetree/bindings/{powerpc => soc}/fsl/guts.txt (91%)

diff --git a/Documentation/devicetree/bindings/powerpc/fsl/guts.txt b/Documentation/devicetree/bindings/soc/fsl/guts.txt
similarity index 91%
rename from Documentation/devicetree/bindings/powerpc/fsl/guts.txt
rename to Documentation/devicetree/bindings/soc/fsl/guts.txt
index b71b203..07adca9 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/guts.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/guts.txt
@@ -25,6 +25,9 @@ Recommended properties:
  - fsl,liodn-bits : Indicates the number of defined bits in the LIODN
    registers, for those SOCs that have a PAMU device.
 
+ - little-endian : Indicates that the global utilities block is little
+   endian. The default is big endian.
+
 Examples:
 	global-utilities@e0000 {	/* global utilities block */
 		compatible = "fsl,mpc8548-guts";
-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
