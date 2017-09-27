Return-Path: <elfring@users.sourceforge.net>
To: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] clk: rockchip: Delete an error message for a failed memory
 allocation in rockchip_clk_register_cpuclk()
Message-ID: <dfcd3f8a-f858-ab71-b08c-e5b2e3005d7c@users.sourceforge.net>
Date: Wed, 27 Sep 2017 11:44:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 11:38:17 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/rockchip/clk-cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 0e09684d43a5..32c19c0f1e14 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -322,8 +322,6 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 					     sizeof(*rates) * nrates,
 					     GFP_KERNEL);
 		if (!cpuclk->rate_table) {
-			pr_err("%s: could not allocate memory for cpuclk rates\n",
-			       __func__);
 			ret = -ENOMEM;
 			goto unregister_notifier;
 		}
-- 
2.14.1
