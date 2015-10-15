Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1bon0116.outbound.protection.outlook.com ([157.56.111.116]:60386
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753829AbbJOHEy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 15 Oct 2015 03:04:54 -0400
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
	<linux-clk@vger.kernel.org>, <olof@lixom.net>
CC: <bhupesh.linux@gmail.com>, <will.deacon@arm.com>,
	<Catalin.Marinas@arm.com>, <bhupesh.sharma@freescale.com>,
	<LeoLi@freescale.com>, <scottwood@freescale.com>,
	<stuart.yoder@freescale.com>
Subject: [PATCH v3 12/12] dts/Makefile: Add build support for LS2080a QDS & RDB board DTS
Date: Thu, 15 Oct 2015 12:17:52 +0530
Message-ID: <1444891672-32117-13-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch adds build support for LS2080a QDS & RDB board DTS files
in the arm64 DTS Makefile.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 arch/arm64/boot/dts/freescale/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 932001a..57b41c7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -1,4 +1,4 @@
-dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-simu.dtb
+dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls2080a-qds.dtb fsl-ls2080a-rdb.dtb fsl-ls2080a-simu.dtb
  
 always		:= $(dtb-y)
 subdir-y	:= $(dts-dirs)
-- 
1.7.9.5


