Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Pawel Moll <pawel.moll@arm.com>
Subject: [PATCH] clk: versatile: sp810: support reentrance
Date: Wed, 24 Feb 2016 09:39:11 +0100
Message-Id: <1456303151-29413-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Despite care take to allocate clocks state containers the
SP810 driver actually just supports creating one instance:
all clocks registered for every instance will end up with the
exact same name and __clk_init() will fail.

Rename the timclken<0> .. timclken<n> to sp810_<instance>_<n>
so every clock on every instance gets a unique name.

This is necessary for the RealView PBA8 which has two SP810
blocks: the second block will not register its clocks unless
every clock on every instance is unique and results in boot
logs like this:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at ../drivers/clk/versatile/clk-sp810.c:137
  clk_sp810_of_setup+0x110/0x154()
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.5.0-rc2-00030-g352718fc39f6-dirty #225
Hardware name: ARM RealView Machine (Device Tree Support)
[<c00167f8>] (unwind_backtrace) from [<c0013204>]
             (show_stack+0x10/0x14)
[<c0013204>] (show_stack) from [<c01a049c>]
             (dump_stack+0x84/0x9c)
[<c01a049c>] (dump_stack) from [<c0024990>]
             (warn_slowpath_common+0x74/0xb0)
[<c0024990>] (warn_slowpath_common) from [<c0024a68>]
             (warn_slowpath_null+0x1c/0x24)
[<c0024a68>] (warn_slowpath_null) from [<c051eb44>]
             (clk_sp810_of_setup+0x110/0x154)
[<c051eb44>] (clk_sp810_of_setup) from [<c051e3a4>]
             (of_clk_init+0x12c/0x1c8)
[<c051e3a4>] (of_clk_init) from [<c0504714>]
             (time_init+0x20/0x2c)
[<c0504714>] (time_init) from [<c0501b18>]
             (start_kernel+0x244/0x3c4)
[<c0501b18>] (start_kernel) from [<7000807c>] (0x7000807c)
---[ end trace cb88537fdc8fa200 ]---

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Fixes: 6e973d2c4385 "clk: vexpress: Add separate SP810 driver"
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/versatile/clk-sp810.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
index e78755e0ef78..1fe1e8d970cf 100644
--- a/drivers/clk/versatile/clk-sp810.c
+++ b/drivers/clk/versatile/clk-sp810.c
@@ -92,6 +92,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 	int num = ARRAY_SIZE(parent_names);
 	char name[12];
 	struct clk_init_data init;
+	static int instance;
 	int i;
 	bool deprecated;
 
@@ -117,7 +118,7 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 	deprecated = !of_find_property(node, "assigned-clock-parents", NULL);
 
 	for (i = 0; i < ARRAY_SIZE(sp810->timerclken); i++) {
-		snprintf(name, ARRAY_SIZE(name), "timerclken%d", i);
+		snprintf(name, sizeof(name), "sp810_%d_%d", instance, i);
 
 		sp810->timerclken[i].sp810 = sp810;
 		sp810->timerclken[i].channel = i;
@@ -138,5 +139,6 @@ static void __init clk_sp810_of_setup(struct device_node *node)
 	}
 
 	of_clk_add_provider(node, clk_sp810_timerclken_of_get, sp810);
+	instance++;
 }
 CLK_OF_DECLARE(sp810, "arm,sp810", clk_sp810_of_setup);
-- 
2.4.3
