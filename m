Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0133.outbound.protection.outlook.com ([65.55.169.133]:1680
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754518AbbJOHEQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 15 Oct 2015 03:04:16 -0400
From: Bhupesh Sharma <bhupesh.sharma@freescale.com>
To: <arnd@arndb.de>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <marc.zyngier@arm.com>,
	<linux-clk@vger.kernel.org>, <olof@lixom.net>
CC: <bhupesh.linux@gmail.com>, <will.deacon@arm.com>,
	<Catalin.Marinas@arm.com>, <bhupesh.sharma@freescale.com>,
	<LeoLi@freescale.com>, <scottwood@freescale.com>,
	<stuart.yoder@freescale.com>, Liu Gang <Gang.Liu@freescale.com>
Subject: [PATCH v3 06/12] doc/bindings: Update GPIO devicetree binding documentation for LS2080A
Date: Thu, 15 Oct 2015 12:17:46 +0530
Message-ID: <1444891672-32117-7-git-send-email-bhupesh.sharma@freescale.com>
In-Reply-To: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
References: <1444891672-32117-1-git-send-email-bhupesh.sharma@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Update the FSL, GPIO binding documentation to add support
for GPIO controller found on Freescale's LS2080A platform.

Signed-off-by: Liu Gang <Gang.Liu@freescale.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@freescale.com>
---
 .../devicetree/bindings/gpio/gpio-mpc8xxx.txt      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
index 805ddcd..f2455c5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-mpc8xxx.txt
@@ -1,9 +1,9 @@
-* Freescale MPC512x/MPC8xxx GPIO controller
+* Freescale MPC512x/MPC8xxx/Layerscape GPIO controller
 
 Required properties:
 - compatible : Should be "fsl,<soc>-gpio"
   The following <soc>s are known to be supported:
-    mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq
+    mpc5121, mpc5125, mpc8349, mpc8572, mpc8610, pq3, qoriq.
 - reg : Address and length of the register set for the device
 - interrupts : Should be the port interrupt shared by all 32 pins.
 - #gpio-cells : Should be two.  The first cell is the pin number and
-- 
1.7.9.5


