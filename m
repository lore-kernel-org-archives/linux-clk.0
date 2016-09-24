Return-Path: <christophe.jaillet@wanadoo.fr>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: boris.brezillon@free-electrons.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: at91: Fix a return value in case of error
Date: Sat, 24 Sep 2016 23:57:26 +0200
Message-Id: <1474754246-27226-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-ID: <linux-clk.vger.kernel.org>

If 'clk_hw_register()' fails, it is likely that we expect to return an
error instead of a valid pointer (which would mean success).
'clk_hw_register()' returns a bool, so we don't have the detail of the
error. Return -ENOMEM instead, as it seems to be the most common error
returned by clk_register().

Fix commit f5644f10dcfb ("clk: at91: Migrate to clk_hw based registration
and OF APIs")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It is likely that a bigger change is needed. For example using clk_register
instead of clk_hw_register would return the error instead of a bool.
We could then propagate this error to the caller without the need to choose
an arbitrary error value.

This proposal is un-compiled and un-tested.
I get an error when I run 'make drivers/clk/at91/' which is likely due to
my building environment. 
---
 drivers/clk/at91/clk-programmable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
index 190122e64a3a..2cf200e22d48 100644
--- a/drivers/clk/at91/clk-programmable.c
+++ b/drivers/clk/at91/clk-programmable.c
@@ -203,7 +203,7 @@ at91_clk_register_programmable(struct regmap *regmap,
 	ret = clk_hw_register(NULL, &prog->hw);
 	if (ret) {
 		kfree(prog);
-		hw = &prog->hw;
+		hw = ERR_PTR(-ENOMEM);
 	}
 
 	return hw;
-- 
2.7.4
