Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: asm9260: Fix of_io_request_and_map error check
Date: Sat,  2 May 2015 17:03:21 +0200
Message-Id: <1430579006-32702-2-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

of_io_request_and map returns an error pointer, but the current code assumes
that on error the returned pointer will be NULL.

Obviously, that makes the check completely useless. Change the test to actually
check for the proper error code.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/clk-asm9260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-asm9260.c b/drivers/clk/clk-asm9260.c
index 88f4ff6916fe..90897af8d9f7 100644
--- a/drivers/clk/clk-asm9260.c
+++ b/drivers/clk/clk-asm9260.c
@@ -274,7 +274,7 @@ static void __init asm9260_acc_init(struct device_node *np)
 	u32 accuracy = 0;
 
 	base = of_io_request_and_map(np, 0, np->name);
-	if (!base)
+	if (IS_ERR(base))
 		panic("%s: unable to map resource", np->name);
 
 	/* register pll */
-- 
2.3.6
