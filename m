Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] clk: return -EINVAL if clock provider has no .get callback
Date: Tue, 19 Jul 2016 18:21:38 +0900
Message-Id: <1468920098-8553-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
References: <1468920098-8553-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, __of_clk_get_hw_from_provider() returns -EPROBE_DEFER
if neither .get_hw nor .get is registered for the given provider.
This means of_clk_add(_hw)_provider() has been already called for
the node in a wrong way; it is not deferred probing at all.  EINVAL
is a better fit for the case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2207098..3004388 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3136,7 +3136,7 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 			      struct of_phandle_args *clkspec)
 {
 	struct clk *clk;
-	struct clk_hw *hw = ERR_PTR(-EPROBE_DEFER);
+	struct clk_hw *hw = ERR_PTR(-EINVAL);
 
 	if (provider->get_hw) {
 		hw = provider->get_hw(clkspec, provider->data);
-- 
1.9.1
