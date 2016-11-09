Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v16,
 2/7] dt: bindings: move guts devicetree doc out of powerpc directory
Date: Wed, 9 Nov 2016 11:14:07 +0800
Message-ID: <1478661252-42439-3-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
References: <1478661252-42439-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiaobo Xie <xiaobo.xie@nxp.com>, Minghuan Lian <minghuan.lian@nxp.com>,
 linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
 Qiang Zhao <qiang.zhao@nxp.com>, Russell King <linux@arm.linux.org.uk>,
 Bhupesh Sharma <bhupesh.sharma@freescale.com>, Joerg Roedel <joro@8bytes.org>,
 Jochen Friedrich <jochen@scram.de>,
 Claudiu Manoil <claudiu.manoil@freescale.com>, devicetree@vger.kernel.org,
 Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, Yangbo Lu <yangbo.lu@nxp.com>,
 linuxppc-dev@lists.ozlabs.org
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
Acked-by: Arnd Bergmann <arnd@arndb.de>
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
