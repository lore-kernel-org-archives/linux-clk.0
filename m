Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:57968 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753561AbcDLBhW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Mon, 11 Apr 2016 21:37:22 -0400
From: Shawn Guo <shawnguo@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] clk: imx: vf610: fix whitespace in vf610-clock.h
Date: Tue, 12 Apr 2016 09:35:59 +0800
Message-Id: <1460424959-14207-1-git-send-email-shawnguo@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

There is whitespace in VF610_CLK_OCOTP line.  Fix it.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 include/dt-bindings/clock/vf610-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index dc5e1790d8cb..45997750c8a0 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -194,7 +194,7 @@
 #define VF610_PLL7_BYPASS		181
 #define VF610_CLK_SNVS			182
 #define VF610_CLK_DAP			183
-#define VF610_CLK_OCOTP         184
+#define VF610_CLK_OCOTP			184
 #define VF610_CLK_DDRMC			185
 #define VF610_CLK_WKPU			186
 #define VF610_CLK_TCON0			187
-- 
1.9.1

