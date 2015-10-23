Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-by2on0119.outbound.protection.outlook.com ([207.46.100.119]:6912
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751096AbbJWTxj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 23 Oct 2015 15:53:39 -0400
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
	<linux-clk@vger.kernel.org>, <olof@lixom.net>
CC: <bhupesh.linux@gmail.com>, <will.deacon@arm.com>,
	<Catalin.Marinas@arm.com>, <bhupesh.sharma@freescale.com>,
	<LeoLi@freescale.com>, <scottwood@freescale.com>,
	<stuart.yoder@freescale.com>
Subject: [PATCH v4 07/12] doc: DTS: Update DWC3 binding to provide reference to generic bindings
Date: Sat, 24 Oct 2015 01:01:56 +0530
Message-ID: <1445628721-10483-8-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1445628721-10483-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Since the Synopsys DWC3 controller driver inherits the generic bindings
defined in 'usb/generic.txt', this patch tries to capture the same in
the DWC3 binging documentation to avoid any confusion in usage of properties
like 'dr_mode' for certain SoCs like FSL LS2080A.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 9ff48e0..fb2ad0a 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -1,6 +1,7 @@
 synopsys DWC3 CORE
 
-DWC3- USB3 CONTROLLER
+DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
+      as described in 'usb/generic.txt'
 
 Required properties:
  - compatible: must be "snps,dwc3"
-- 
1.7.9.5


