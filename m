Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752095AbdHMOWn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Aug 2017 10:22:43 -0400
From: Shawn Guo <shawnguo@kernel.org>
To: Felipe Balbi <balbi@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] usb: dwc3: of-simple: remove include of clk-provider.h
Date: Sun, 13 Aug 2017 22:21:11 +0800
Message-Id: <1502634071-2266-1-git-send-email-shawnguo@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Shawn Guo <shawn.guo@linaro.org>

The header clk-provider.h is there for clock drivers (providers) to
include, not client drivers (consumers).  That said,
of_clk_get_parent_count() is a helper function for clock providers, not
a clk API for consumers.

Let's replace of_clk_get_parent_count() with of_count_phandle_with_args()
call, so that we can remove the include of clk-provider.h.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index fe414e7a9c78..4cef7d4f9cd0 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -25,7 +25,6 @@
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/clk.h>
-#include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
@@ -96,7 +95,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
-	ret = dwc3_of_simple_clk_init(simple, of_clk_get_parent_count(np));
+	ret = dwc3_of_simple_clk_init(simple, of_count_phandle_with_args(np,
+						"clocks", "#clock-cells"));
 	if (ret)
 		return ret;
 
-- 
1.9.1

