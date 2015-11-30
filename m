Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] clk: replace pr_warn() with pr_err() for fatal cases
Date: Mon, 30 Nov 2015 16:34:46 +0900
Message-Id: <1448868893-4575-10-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

These three cases let clk_register() fail.  They should be considered
as error messages.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 43fb329..cd96442 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2302,22 +2302,22 @@ static int __clk_core_init(struct clk_core *core)
 	if (core->ops->set_rate &&
 	    !((core->ops->round_rate || core->ops->determine_rate) &&
 	      core->ops->recalc_rate)) {
-		pr_warning("%s: %s must implement .round_rate or .determine_rate in addition to .recalc_rate\n",
-				__func__, core->name);
+		pr_err("%s: %s must implement .round_rate or .determine_rate in addition to .recalc_rate\n",
+		       __func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (core->ops->set_parent && !core->ops->get_parent) {
-		pr_warning("%s: %s must implement .get_parent & .set_parent\n",
-				__func__, core->name);
+		pr_err("%s: %s must implement .get_parent & .set_parent\n",
+		       __func__, core->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (core->ops->set_rate_and_parent &&
 			!(core->ops->set_parent && core->ops->set_rate)) {
-		pr_warn("%s: %s must implement .set_parent & .set_rate\n",
+		pr_err("%s: %s must implement .set_parent & .set_rate\n",
 				__func__, core->name);
 		ret = -EINVAL;
 		goto out;
-- 
1.9.1
