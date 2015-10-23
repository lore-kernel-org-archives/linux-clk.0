Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn1bn0107.outbound.protection.outlook.com ([157.56.110.107]:23884
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750953AbbJWEus (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 23 Oct 2015 00:50:48 -0400
From: Scott Wood <scottwood@freescale.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	Scott Wood <scottwood@freescale.com>
Subject: [PATCH] clk: qoriq: Fix wrong data in p2041_cmux_grp2
Date: Thu, 22 Oct 2015 23:50:34 -0500
Message-ID: <1445575834-30146-1-git-send-email-scottwood@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
This is on top of http://patchwork.ozlabs.org/patch/519801/
and I'll apply them together.

 drivers/clk/clk-qoriq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 8f9c93b..07985a5 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -128,8 +128,8 @@ static const struct clockgen_muxinfo p2041_cmux_grp1 = {
 static const struct clockgen_muxinfo p2041_cmux_grp2 = {
 	{
 		[0] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
-		[4] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
-		[5] = { CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
+		[4] = { CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
+		[5] = { CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
 	}
 };
 
-- 
2.1.4

