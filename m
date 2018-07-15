Return-Path: <hofrat@osadl.org>
From: Nicholas Mc Guire <hofrat@osadl.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Kees Cook <keescook@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 1/2] drivers: clk: st: warn on iomap failure
Date: Sun, 15 Jul 2018 12:18:23 +0200
Message-Id: <1531649904-6072-1-git-send-email-hofrat@osadl.org>
List-ID: <linux-clk.vger.kernel.org>

 While the return value of clkgen_get_register_base() is being checked
at the call site, there is no indication of failure cause thus making
diagnosis of the issues hard. The WARN_ON() allows to determine the
cause of failure.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Problem found by an experimental coccinelle script

Patch was compile tested with: multi_v7_defconfig (implies
CONFIG_ARCH_STI=y)

Patch is against 4.18-rc4 (localversion-next is next-20180713)

 drivers/clk/st/clkgen-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index cbb5184..aeb30ab 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -647,6 +647,7 @@ static void __iomem * __init clkgen_get_register_base(
 		return NULL;
 
 	reg = of_iomap(pnode, 0);
+	WARN_ON(!reg);
 
 	of_node_put(pnode);
 	return reg;
-- 
2.1.4
