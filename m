Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:52310 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753011AbeASCJc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jan 2018 21:09:32 -0500
From: Yixun Lan <yixun.lan@amlogic.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yixun Lan <yixun.lan@amlogic.com>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: meson: axg: fix the od shift of the sys_pll
Date: Fri, 19 Jan 2018 10:09:26 +0800
Message-ID: <20180119020926.246887-1-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

According to datasheet, the od shift of sys_pll is 16,
fix the typo which introduced at previous commit.

Fixes: 78b4af312f91 ('clk: meson-axg: add clock controller drivers')
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/clk/meson/axg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7988dc8506b0..04a231eaf648 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -64,7 +64,7 @@ static struct meson_clk_pll axg_sys_pll = {
 	},
 	.od = {
 		.reg_off = HHI_SYS_PLL_CNTL,
-		.shift   = 10,
+		.shift   = 16,
 		.width   = 2,
 	},
 	.lock = &meson_clk_lock,
-- 
2.15.1

