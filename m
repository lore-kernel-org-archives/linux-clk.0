Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1bon0115.outbound.protection.outlook.com ([157.56.111.115]:37568
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751010AbbJWTxO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 23 Oct 2015 15:53:14 -0400
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
	<linux-clk@vger.kernel.org>, <olof@lixom.net>
CC: <bhupesh.linux@gmail.com>, <will.deacon@arm.com>,
	<Catalin.Marinas@arm.com>, <bhupesh.sharma@freescale.com>,
	<LeoLi@freescale.com>, <scottwood@freescale.com>,
	<stuart.yoder@freescale.com>
Subject: [PATCH v4 03/12] Documentation: DT: Add entry for FSL LS2080A QDS and RDB boards
Date: Sat, 24 Oct 2015 01:01:52 +0530
Message-ID: <1445628721-10483-4-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patch adds a devicetree binding documentation for Freescale's
LS2080A QDS and RDB boards.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 Documentation/devicetree/bindings/arm/fsl.txt |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 53f229a..34c88b0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -135,3 +135,11 @@ LS2080A ARMv8 based Simulator model
 Required root node properties:
     - compatible = "fsl,ls2080a-simu", "fsl,ls2080a";
 
+LS2080A ARMv8 based QDS Board
+Required root node properties:
+    - compatible = "fsl,ls2080a-qds", "fsl,ls2080a";
+
+LS2080A ARMv8 based RDB Board
+Required root node properties:
+    - compatible = "fsl,ls2080a-rdb", "fsl,ls2080a";
+
-- 
1.7.9.5


