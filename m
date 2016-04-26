Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ob0-f195.google.com ([209.85.214.195]:35848 "EHLO
	mail-ob0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753257AbcDZWhI (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 26 Apr 2016 18:37:08 -0400
From: Franklin S Cooper Jr <fcooper@ti.com>
To: thierry.reding@gmail.com, robh+dt@kernel.org, tony@atomide.com,
	paul@pwsan.com, t-kristo@ti.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, vigneshr@ti.com, nsekhar@ti.com
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v7 4/9] pwm: pwm-tiecap: Update dt binding document to use proper unit address
Date: Tue, 26 Apr 2016 17:36:44 -0500
Message-Id: <1461710209-6563-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1461710209-6563-1-git-send-email-fcooper@ti.com>
References: <1461710209-6563-1-git-send-email-fcooper@ti.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace unit address from 0 to the proper physical address.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 Documentation/devicetree/bindings/pwm/pwm-tiecap.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
index 788da6c..1b7eec5 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
@@ -16,21 +16,21 @@ Optional properties:
 
 Example:
 
-ecap0: ecap@0 { /* ECAP on am33xx */
+ecap0: ecap@48300100 { /* ECAP on am33xx */
 	compatible = "ti,am33xx-ecap";
 	#pwm-cells = <3>;
 	reg = <0x48300100 0x80>;
 	ti,hwmods = "ecap0";
 };
 
-ecap0: ecap@0 { /* ECAP on am4372 */
+ecap0: ecap@48300100 { /* ECAP on am4372 */
 	compatible = "ti,am4372-ecap", "ti,am33xx-ecap";
 	#pwm-cells = <3>;
 	reg = <0x48300100 0x80>;
 	ti,hwmods = "ecap0";
 };
 
-ecap0: ecap@0 { /* ECAP on da850 */
+ecap0: ecap@1f06000 { /* ECAP on da850 */
 	compatible = "ti,da850-ecap", "ti,am33xx-ecap";
 	#pwm-cells = <3>;
 	reg = <0x306000 0x80>;
-- 
2.7.0

