Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: kbuild test robot <fengguang.wu@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: Use static inline functions instead of macros for dummies
Date: Thu, 29 Oct 2015 22:12:56 +0100
Message-Id: <1446153176-29865-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

if CONFIG_OF=n:

    drivers/clk/clk-cs2000-cp.c: In function ‘cs2000_remove’:
    drivers/clk/clk-cs2000-cp.c:453:22: warning: unused variable ‘np’ [-Wunused-variable]
      struct device_node *np = dev->of_node;
			  ^

Convert dummies of_clk_del_provider() and of_clk_init() from macros to
static inline functions to kill such compiler warnings.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/clk-provider.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index eb5a23e8bf0219ac..61d30af2a85382a8 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -717,8 +717,7 @@ static inline int of_clk_add_provider(struct device_node *np,
 {
 	return 0;
 }
-#define of_clk_del_provider(np) \
-	{ while (0); }
+static inline void of_clk_del_provider(struct device_node *np) {}
 static inline struct clk *of_clk_src_simple_get(
 	struct of_phandle_args *clkspec, void *data)
 {
@@ -743,8 +742,7 @@ static inline const char *of_clk_get_parent_name(struct device_node *np,
 {
 	return NULL;
 }
-#define of_clk_init(matches) \
-	{ while (0); }
+static inline void of_clk_init(const struct of_device_id *matches) {}
 #endif /* CONFIG_OF */
 
 /*
-- 
1.9.1
