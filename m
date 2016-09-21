Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-co1nam03on0056.outbound.protection.outlook.com ([104.47.40.56]:17521
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754683AbcIUHJj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Sep 2016 03:09:39 -0400
From: Yangbo Lu <yangbo.lu@nxp.com>
To: <linux-mmc@vger.kernel.org>, <ulf.hansson@linaro.org>,
        Scott Wood <oss@buserror.net>, Arnd Bergmann <arnd@arndb.de>
CC: <linuxppc-dev@lists.ozlabs.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <iommu@lists.linux-foundation.org>,
        <netdev@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@arm.linux.org.uk>,
        Jochen Friedrich <jochen@scram.de>,
        Joerg Roedel <joro@8bytes.org>,
        Claudiu Manoil <claudiu.manoil@freescale.com>,
        "Bhupesh Sharma" <bhupesh.sharma@freescale.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        "Kumar Gala" <galak@codeaurora.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Leo Li <leoyang.li@nxp.com>, Xiaobo Xie <xiaobo.xie@nxp.com>,
        Minghuan Lian <minghuan.lian@nxp.com>,
        Yangbo Lu <yangbo.lu@nxp.com>
Subject: [v12, 1/8] dt: bindings: update Freescale DCFG compatible
Date: Wed, 21 Sep 2016 14:57:13 +0800
Message-ID: <1474441040-11946-2-git-send-email-yangbo.lu@nxp.com>
In-Reply-To: <1474441040-11946-1-git-send-email-yangbo.lu@nxp.com>
References: <1474441040-11946-1-git-send-email-yangbo.lu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Update Freescale DCFG compatible with 'fsl,<chip>-dcfg' instead
of 'fsl,ls1021a-dcfg' to include more chips such as ls1021a,
ls1043a, and ls2080a.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Scott Wood <oss@buserror.net>
---
Changes for v8:
	- Added this patch
Changes for v9:
	- Added a list for the possible compatibles
Changes for v10:
	- None
Changes for v11:
	- Added 'Acked-by: Rob Herring'
	- Updated commit message by Scott
Changes for v12:
	- None
---
 Documentation/devicetree/bindings/arm/fsl.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index dbbc095..713c1ae 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -119,7 +119,11 @@ Freescale DCFG
 configuration and status for the device. Such as setting the secondary
 core start address and release the secondary core from holdoff and startup.
   Required properties:
-  - compatible: should be "fsl,ls1021a-dcfg"
+  - compatible: should be "fsl,<chip>-dcfg"
+    Possible compatibles:
+	"fsl,ls1021a-dcfg"
+	"fsl,ls1043a-dcfg"
+	"fsl,ls2080a-dcfg"
   - reg : should contain base address and length of DCFG memory-mapped registers
 
 Example:
-- 
2.1.0.27.g96db324

