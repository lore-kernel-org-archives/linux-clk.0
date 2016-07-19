Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: prevent __of_clk_get_hw_from_provider() from returning NULL
Date: Tue, 19 Jul 2016 18:03:58 +0900
Message-Id: <1468919039-23004-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

The .get(_hw) callback of an OF clock provider can return a NULL
pointer in some cases.

For example, of_clk_src_onecell_get() returns NULL for index 1 of a
sparse array of clocks like follows:

  clk_num == 3
  idx 0: UART clk
  idx 1: NULL (no clk is allocated)
  idx 2: I2C clk

In such cases, clk_get() successfully returns NULL.

A problem is that most drivers only check IS_ERR(), like follows:

  clk = devm_clk_get(dev, NULL);
  if (IS_ERR(clk))
          return PTR_ERR(clk);

It carries on moving forward and will probably be hit by a different
error check with a different error message.

Let's make __of_clk_get_hw_from_provider() return ERR_PTR(-ENOENT)
if the .get(_hw) returns NULL.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 953643f..484acc2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3117,7 +3117,7 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 			hw = ERR_CAST(clk);
 	}
 
-	return hw;
+	return hw ?: ERR_PTR(-ENOENT);
 }
 
 struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
-- 
1.9.1
