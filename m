Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1on0053.outbound.protection.outlook.com ([157.56.110.53]:57504
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756117AbcEEDXF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 4 May 2016 23:23:05 -0400
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
	<netdev@vger.kernel.org>
CC: <ulf.hansson@linaro.org>, Scott Wood <oss@buserror.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Jochen Friedrich <jochen@scram.de>,
	Joerg Roedel <joro@8bytes.org>,
	Claudiu Manoil <claudiu.manoil@freescale.com>,
	"Bhupesh Sharma" <bhupesh.sharma@freescale.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	"Kumar Gala" <galak@codeaurora.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, <leoyang.li@nxp.com>,
	<xiaobo.xie@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v10, 6/7] MAINTAINERS: add entry for Freescale SoC drivers
Date: Thu, 5 May 2016 11:12:29 +0800
Message-ID: <1462417950-46796-7-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1462417950-46796-1-git-send-email-yangbo.lu@nxp.com>
References: <1462417950-46796-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
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
---
 MAINTAINERS | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42e65d1..85c4b8b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4622,9 +4622,18 @@ F:	drivers/net/ethernet/freescale/fec_ptp.c
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

