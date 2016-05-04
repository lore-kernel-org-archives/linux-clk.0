Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
 <netdev@vger.kernel.org>
Subject: [v9, 6/7] MAINTAINERS: add entry for Freescale SoC driver
Date: Wed, 4 May 2016 11:24:33 +0800
Message-ID: <1462332274-13744-7-git-send-email-yangbo.lu@nxp.com>
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

Add maintainer entry for Freescale SoC driver including
the QE library and the GUTS driver now. Also add maintainer
for QE library.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
Changes for v8:
	- Added this patch
Changes for v9:
	- Added linux-arm mail list
	- Removed GUTS driver entry
---
 MAINTAINERS | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42e65d1..ce91db7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4622,9 +4622,18 @@ F:	drivers/net/ethernet/freescale/fec_ptp.c
 F:	drivers/net/ethernet/freescale/fec.h
 F:	Documentation/devicetree/bindings/net/fsl-fec.txt
 
+FREESCALE SOC DRIVER
+M:	Scott Wood <oss@buserror.net>
+L:	linuxppc-dev@lists.ozlabs.org
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	drivers/soc/fsl/
+F:	include/linux/fsl/
+
 FREESCALE QUICC ENGINE LIBRARY
+M:	Qiang Zhao <qiang.zhao@nxp.com>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Orphan
+S:	Maintained
 F:	drivers/soc/fsl/qe/
 F:	include/soc/fsl/*qe*.h
 F:	include/soc/fsl/*ucc*.h
-- 
2.1.0.27.g96db324


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
