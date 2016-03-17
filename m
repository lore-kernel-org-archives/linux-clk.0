Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ob0-f193.google.com ([209.85.214.193]:36489 "EHLO
	mail-ob0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932621AbcCQWHt (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2016 18:07:49 -0400
From: Franklin S Cooper Jr <fcooper@ti.com>
To: thierry.reding@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, bcousson@baylibre.com, tony@atomide.com,
	linux@arm.linux.org.uk, t-kristo@ti.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v2 3/3] pwm: pwm-tiehrpwm: Update dt binding document to use generic node name
Date: Thu, 17 Mar 2016 17:07:43 -0500
Message-Id: <1458252463-8821-4-git-send-email-fcooper@ti.com>
In-Reply-To: <1458252463-8821-1-git-send-email-fcooper@ti.com>
References: <1458252463-8821-1-git-send-email-fcooper@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Now that the node name has been changed from ehrpwm to pwm the document
should show this proper usage. Also change the unit address in the example
from 0 to the proper physical address value that should be used.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Changed the unit address for da850 to match the value in the reg property.

 Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
index 9c100b2..0f9ba50 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
@@ -15,14 +15,14 @@ Optional properties:
 
 Example:
 
-ehrpwm0: ehrpwm@0 { /* EHRPWM on am33xx */
+ehrpwm0: pwm@48300200 { /* EHRPWM on am33xx */
 	compatible = "ti,am33xx-ehrpwm";
 	#pwm-cells = <3>;
 	reg = <0x48300200 0x100>;
 	ti,hwmods = "ehrpwm0";
 };
 
-ehrpwm0: ehrpwm@0 { /* EHRPWM on da850 */
+ehrpwm0: pwm@300000 { /* EHRPWM on da850 */
 	compatible = "ti,da850-ehrpwm", "ti,am33xx-ehrpwm";
 	#pwm-cells = <3>;
 	reg = <0x300000 0x2000>;
-- 
2.7.0

