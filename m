Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: [PATCH 32/41] clk: palmas: Remove CLK_IS_ROOT
Date: Tue,  1 Mar 2016 11:00:17 -0800
Message-Id: <1456858826-28541-33-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

This flag is a no-op now. Remove usage of the flag.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Nishanth Menon <nm@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/clk-palmas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index 9c0b8e6b1ab3..8328863cb0e0 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -132,7 +132,7 @@ static const struct palmas_clks_of_match_data palmas_of_clk32kg = {
 	.init = {
 		.name = "clk32kg",
 		.ops = &palmas_clks_ops,
-		.flags = CLK_IS_ROOT | CLK_IGNORE_UNUSED,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	.desc = {
 		.clk_name = "clk32kg",
@@ -148,7 +148,7 @@ static const struct palmas_clks_of_match_data palmas_of_clk32kgaudio = {
 	.init = {
 		.name = "clk32kgaudio",
 		.ops = &palmas_clks_ops,
-		.flags = CLK_IS_ROOT | CLK_IGNORE_UNUSED,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	.desc = {
 		.clk_name = "clk32kgaudio",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
