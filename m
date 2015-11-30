Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] clk: move checking .git_parent to __clk_core_init()
Date: Mon, 30 Nov 2015 16:34:47 +0900
Message-Id: <1448868893-4575-11-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The .git_parent is mandatory for multi-parent clocks.  Move the check
to __clk_core_init(), like other callback checkings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cd96442..486f6d4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1677,13 +1677,6 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 		goto out;
 	}
 
-	if (!core->ops->get_parent) {
-		WARN(!core->ops->get_parent,
-			"%s: multi-parent clocks must implement .get_parent\n",
-			__func__);
-		goto out;
-	}
-
 	/*
 	 * Do our best to cache parent clocks in core->parents.  This prevents
 	 * unnecessary and expensive lookups.  We don't set core->parent here;
@@ -2315,6 +2308,11 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->num_parents > 1 && !core->ops->get_parent) {
+		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
+		       __func__, core->name);
+	}
+
 	if (core->ops->set_rate_and_parent &&
 			!(core->ops->set_parent && core->ops->set_rate)) {
 		pr_err("%s: %s must implement .set_parent & .set_rate\n",
-- 
1.9.1
