Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35626 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751529AbdLWViv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Dec 2017 16:38:51 -0500
Received: by mail-wr0-f194.google.com with SMTP id l19so18248631wrc.2
        for <linux-clk@vger.kernel.org>; Sat, 23 Dec 2017 13:38:50 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: khilman@baylibre.com, carlo@caione.org, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] clk: meson: mpll: use 64-bit maths in params_from_rate
Date: Sat, 23 Dec 2017 22:38:32 +0100
Message-Id: <20171223213832.16552-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

"rem * SDM_DEN" can easily overflow on the 32-bit Meson8 and Meson8b
SoCs if the "remainder" (after the division operation) is greater than
262143Hz. This is likely to happen since the input clock for the MPLLs
on Meson8 and Meson8b is "fixed_pll", which is running at a rate of
2550MHz.

One example where this was observed to be problematic was the Ethernet
clock calculation (which takes MPLL2 as input). When requesting a rate
of 125MHz there is a remainder of 2500000Hz.
The resulting MPLL2 rate before this patch was 127488329Hz.
The resulting MPLL2 rate after this patch is 124999103Hz.

Commit b609338b26f5 ("clk: meson: mpll: use 64bit math in
rate_from_params") already fixed a similar issue in rate_from_params.

Fixes: 007e6e5c5f01d3 ("clk: meson: mpll: add rw operation")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 44a5a535ca63..5144360e2c80 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -98,7 +98,7 @@ static void params_from_rate(unsigned long requested_rate,
 		*sdm = SDM_DEN - 1;
 	} else {
 		*n2 = div;
-		*sdm = DIV_ROUND_UP(rem * SDM_DEN, requested_rate);
+		*sdm = DIV_ROUND_UP_ULL((u64)rem * SDM_DEN, requested_rate);
 	}
 }
 
-- 
2.15.1

