Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>
Subject: [PATCH] clk: qcom: msm8960: Fix dsi1/2 halt bits
Date: Mon, 26 Oct 2015 18:23:22 -0700
Message-Id: <1445909002-31576-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The halt bits for these clocks seem wrong. I get the following
warning while booting on an msm8960-cdp:

WARNING: CPU: 0 PID: 1 at drivers/clk/qcom/clk-branch.c:97 clk_branch_toggle+0xd0/0x138()
dsi1_clk status stuck at 'on'
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.3.0-rc3-00113-g5532cfb567fe #110
Hardware name: Qualcomm (Flattened Device Tree)
[<c0216984>] (unwind_backtrace) from [<c02138f8>] (show_stack+0x10/0x14)
[<c02138f8>] (show_stack) from [<c04a525c>] (dump_stack+0x70/0xbc)
[<c04a525c>] (dump_stack) from [<c0223c70>] (warn_slowpath_common+0x78/0xb4)
[<c0223c70>] (warn_slowpath_common) from [<c0223d40>] (warn_slowpath_fmt+0x30/0x40)
[<c0223d40>] (warn_slowpath_fmt) from [<c05fc2dc>] (clk_branch_toggle+0xd0/0x138)
[<c05fc2dc>] (clk_branch_toggle) from [<c05f3f3c>] (clk_disable_unused_subtree+0x98/0x1b0)
[<c05f3f3c>] (clk_disable_unused_subtree) from [<c05f3ec4>] (clk_disable_unused_subtree+0x20/0x1b0)
[<c05f3ec4>] (clk_disable_unused_subtree) from [<c05f5474>] (clk_disable_unused+0x58/0xd8)
[<c05f5474>] (clk_disable_unused) from [<c0209710>] (do_one_initcall+0xac/0x1ec)
[<c0209710>] (do_one_initcall) from [<c0991db4>] (kernel_init_freeable+0x11c/0x1e8)
[<c0991db4>] (kernel_init_freeable) from [<c0727ae0>] (kernel_init+0x8/0xec)
[<c0727ae0>] (kernel_init) from [<c0210238>] (ret_from_fork+0x14/0x3c)

Fix the status bits and the errors go away.

Fixes: 5532cfb567fe ("clk: qcom: mmcc-8960: Add DSI related clocks")
Cc: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8960.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index 397f5df6422a..00e36192a1de 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -2104,7 +2104,7 @@ static struct clk_rcg dsi1_src = {
 
 static struct clk_branch dsi1_clk = {
 	.halt_reg = 0x01d0,
-	.halt_bit = 1,
+	.halt_bit = 2,
 	.clkr = {
 		.enable_reg = 0x004c,
 		.enable_mask = BIT(0),
@@ -2152,7 +2152,7 @@ static struct clk_rcg dsi2_src = {
 
 static struct clk_branch dsi2_clk = {
 	.halt_reg = 0x01d0,
-	.halt_bit = 2,
+	.halt_bit = 20,
 	.clkr = {
 		.enable_reg = 0x003c,
 		.enable_mask = BIT(0),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
