Return-Path: <ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160628180438.GD1521@codeaurora.org>
References: <1466499688-28625-1-git-send-email-ricardo.ribalda@gmail.com> <20160628180438.GD1521@codeaurora.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 29 Jun 2016 10:07:23 +0200
Message-ID: <CAPybu_19ZUtRWrZos8rVavxpUUdw4ichE0Azv8nZmCyzdcqXAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: fixed-factor: Convert into a module platform driver
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-clk@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen

On Tue, Jun 28, 2016 at 8:04 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> Almost, except that this flag should be set in the common clk
> framework and not in each driver. The large majority of cases
> will want that. Only a few will want to clear it, and then we can
> hide that fact by having a different CLK_OF_DECLARE macro for
> them that indicates this. I see these potential users right now,
> please double check.
>
> drivers/clk/axis/clk-artpec6.c
> drivers/clk/nxp/clk-lpc18xx-creg.c
> drivers/clk/samsung/clk-exynos3250.c
> drivers/clk/sunxi/clk-mod0.c
> drivers/clk/sunxi/clk-sun8i-apb0.c
> drivers/clk/ti/clk-dra7-atl.c
>
> This is what I'm talking about. I wonder if there's a better way
> to avoid making a closure with macros to set the populated bit.
> It would be nice if we had a return value from the init callback,
> but we don't.

Still there is going to be a lot of code duplication for the
MODULE_DEVICE_TABLE, *_platform_driver, .....

Take a look to this proposal and see what do you think.
It is a new macro that takes care of all the details for the user.
Perhaps we can meet at an irc channel to discuss it.
As I see it

*Pros:
-Very simple api for the drivers
-No code duplication
-Error checking for free

*Cons:
- Huge macro :S
- We still need a return code for probe



- I can send it as a proper patch if you prefer tat.
- (I am already regretting but...) I could help porting the drivers to
this new API.
- As I said, if you want we can meet at irc to discuss this with a
lower latency :)

Thanks!



diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 75cd6c792cb8..4217ed0d835f 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>

 /*
  * DOC: basic fixed multiplier and divider clock that cannot gate
@@ -142,26 +143,35 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);

 #ifdef CONFIG_OF
+
+int of_fixed_factor_clk_remove(struct clk *clk)
+{
+ clk_unregister_fixed_factor(clk);
+
+ return 0;
+}
+
 /**
  * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
  */
-void __init of_fixed_factor_clk_setup(struct device_node *node)
+struct clk *_of_fixed_factor_clk_setup(struct device_node *node)
 {
  struct clk *clk;
  const char *clk_name = node->name;
  const char *parent_name;
  u32 div, mult;
+ int ret;

  if (of_property_read_u32(node, "clock-div", &div)) {
  pr_err("%s Fixed factor clock <%s> must have a clock-div property\n",
  __func__, node->name);
- return;
+ return ERR_PTR(-EIO);
  }

  if (of_property_read_u32(node, "clock-mult", &mult)) {
  pr_err("%s Fixed factor clock <%s> must have a clock-mult property\n",
  __func__, node->name);
- return;
+ return ERR_PTR(-EIO);
  }

  of_property_read_string(node, "clock-output-names", &clk_name);
@@ -169,10 +179,24 @@ void __init of_fixed_factor_clk_setup(struct
device_node *node)

  clk = clk_register_fixed_factor(NULL, clk_name, parent_name, 0,
  mult, div);
- if (!IS_ERR(clk))
- of_clk_add_provider(node, of_clk_src_simple_get, clk);
+ if (IS_ERR(clk))
+ return clk;
+
+ ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+ if (ret) {
+ clk_unregister(clk);
+ return ERR_PTR(ret);
+ }
+
+ return clk;
+}
+
+void of_fixed_factor_clk_setup(struct device_node *node)
+{
+ _of_fixed_factor_clk_setup(node);
 }
 EXPORT_SYMBOL_GPL(of_fixed_factor_clk_setup);
-CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
- of_fixed_factor_clk_setup);
+
+CLK_OF_DECLARE_DRIVER(fixed_factor_clk, "fixed-factor-clock",
+      _of_fixed_factor_clk_setup, of_fixed_factor_clk_remove);
 #endif
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 8e4453eb54e8..519970c1ab9a 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>

 /*
  * DOC: basic fixed-rate clock that cannot gate
@@ -146,18 +147,26 @@ void clk_unregister_fixed_rate(struct clk *clk)
 EXPORT_SYMBOL_GPL(clk_unregister_fixed_rate);

 #ifdef CONFIG_OF
+
+int of_fixed_clk_remove(struct clk *clk)
+{
+ clk_unregister_fixed_rate(clk);
+ return 0;
+}
+
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
  */
-void of_fixed_clk_setup(struct device_node *node)
+struct clk *_of_fixed_clk_setup(struct device_node *node)
 {
  struct clk *clk;
  const char *clk_name = node->name;
  u32 rate;
  u32 accuracy = 0;
+ int ret;

  if (of_property_read_u32(node, "clock-frequency", &rate))
- return;
+ return ERR_PTR(-EIO);

  of_property_read_u32(node, "clock-accuracy", &accuracy);

@@ -165,9 +174,24 @@ void of_fixed_clk_setup(struct device_node *node)

  clk = clk_register_fixed_rate_with_accuracy(NULL, clk_name, NULL,
     0, rate, accuracy);
- if (!IS_ERR(clk))
- of_clk_add_provider(node, of_clk_src_simple_get, clk);
+ if (IS_ERR(clk))
+ return clk;
+
+ ret = of_clk_add_provider(node, of_clk_src_simple_get, clk);
+ if (ret) {
+ clk_unregister(clk);
+ return ERR_PTR(ret);
+ }
+
+ return clk;
+}
+
+void of_fixed_clk_setup(struct device_node *node)
+{
+ _of_fixed_clk_setup(node);
 }
 EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
-CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
+
+CLK_OF_DECLARE_DRIVER(fixed_clk, "fixed-clock", _of_fixed_clk_setup,
+      of_fixed_clk_remove);
 #endif
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fb39d5add173..73a67515c1cc 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -13,6 +13,7 @@

 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/stringify.h>

 #ifdef CONFIG_COMMON_CLK

@@ -777,6 +778,55 @@ extern struct of_device_id __clk_of_table;

 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)

+#define CLK_OF_DECLARE_DRIVER(cname, compat, f_setup, f_remove) \
+ void cname##_init_clk_setup(struct device_node *node) \
+ { \
+ if (!f_setup(node)) \
+ of_node_set_flag(node, OF_POPULATED); \
+ } \
+ EXPORT_SYMBOL_GPL(cname##_init_clk_setup); \
+ CLK_OF_DECLARE(cname, compat, cname##_init_clk_setup); \
+ \
+ static int cname##_of_clk_remove(struct platform_device *pdev) \
+ { \
+ struct clk *clk = platform_get_drvdata(pdev); \
+ \
+ if (clk) \
+ return f_remove(clk); \
+ \
+ return 0; \
+ } \
+ \
+ static int cname##_of_clk_probe(struct platform_device *pdev) \
+ { \
+ struct clk *clk; \
+ \
+ clk = f_setup(pdev->dev.of_node); \
+ \
+ if (IS_ERR(clk)) \
+ return PTR_ERR(clk); \
+ \
+ platform_set_drvdata(pdev, clk); \
+ \
+ return 0; \
+ } \
+ \
+ static const struct of_device_id cname##_ids[] = { \
+ { .compatible = compat }, \
+ { }, \
+ }; \
+ MODULE_DEVICE_TABLE(of, cname##_ids); \
+ \
+ static struct platform_driver cname##_driver = { \
+ .driver = { \
+ .name = __stringify(cname), \
+ .of_match_table = cname##_ids, \
+ }, \
+ .probe = cname##_of_clk_probe, \
+ .remove = cname##_of_clk_remove, \
+ }; \
+ module_platform_driver(cname##_driver);
+
 #ifdef CONFIG_OF
 int of_clk_add_provider(struct device_node *np,
  struct clk *(*clk_src_get)(struct of_phandle_args *args,




-- 
Ricardo Ribalda
