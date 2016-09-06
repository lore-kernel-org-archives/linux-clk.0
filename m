Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>, Scott Wood
 <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
Subject: [v11, 6/8] MAINTAINERS: add entry for Freescale SoC drivers
Date: Tue, 6 Sep 2016 16:28:21 +0800
Message-ID: <1473150503-9550-7-git-send-email-yangbo.lu@nxp.com>
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

Add maintainer entry for Freescale SoC drivers including
the QE library and the GUTS driver now. Also add maintainer
for QE library.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Scott Wood <oss@buserror.net>
Acked-by: Qiang Zhao <qiang.zhao@nxp.com>
---
Changes for v8:
	- Added this patch
Changes for v9:
	- Added linux-arm mail list
	- Removed GUTS driver entry
Changes for v10:
	- Changed 'DRIVER' to 'DRIVERS'
	- Added 'Acked-by' of Scott and Qiang
Changes for v11:
	- None
---
 MAINTAINERS | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71aa5da..3954c0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4969,9 +4969,18 @@ F:	drivers/net/ethernet/freescale/fec_ptp.c
 F:	drivers/net/ethernet/freescale/fec.h
 F:	Documentation/devicetree/bindings/net/fsl-fec.txt
 
+FREESCALE SOC DRIVERS
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
