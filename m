Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Xing Zheng <xing.zheng@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Ziyuan Xu <xzy.xu@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 1/2] clk: divider: Add CLK_DIVIDER_EVEN flag support
Date: Thu,  5 Apr 2018 13:38:18 +0800
Message-Id: <1522906699-127765-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

CLK_DIVIDER_EVEN is used for clock divders that should only
use even number in the div field.

Two clock divder should consider to use this flag
(1) The divder is physically only support even div number to
generate 50% duty cycle clock rate.
(2) The divder's clock consumer request it to use even div number
to generate the most closest requested rate for whatever reason.

In some platforms, for instance Rockchip, the eMMC/SDIO/SDMMC should
request divder to use even number when working at a high throughput
speed mode reliably. However, that wasn't guaranteed by clock framework.
So the previous tricky is to carefully assign magic clock rate to their
parents as well as consumer's clock rate when requesting. That works
bad in practice if folks change the parents clock rate or the clock
hierarchy randomly. That also work bad if the consumer's clock rate
came from the DT, which is changed so fraquent for different boards.

To make it's less prone to make mistake and to make it really respect
the fact that the divder should use even number to the div field, we
need the clock framework's help. Now we have CLK_DIVIDER_POWER_OF_TWO,
which could guarantee the div field is even number, however, obviously
it skips the even numbers which is the power of 2, but maybe which is
the best div to generate closest clock rate for consumer.

Look at the examples here when doing some random test on Rockchip's
platforms, by changing the requested clock rate from DT, namely
assigning different max-frquency for MMC node,

when the mmc host driver requests 80MHz with CLK_DIVIDER_POWER_OF_TWO
flag for the clock divder, it shows the final clock rate is 61.44Mhz

pll_vpll0		1		1 983039999     0   0
   vpll0		4		4 983039999     0   0
     clk_emmc_div       1		1 122880000     0   0
	clk_emmc	1		1 122880000     0   0
	  emmc_sample	0		0  61440000	0 155
	  emmc_drv	0		0  61440000	0 180

With this patch and add CLK_DIVIDER_EVEN flag for clk_emmc_div, we get
the final clock rate, 67.7376MHz.

pll_vpll1               1		1 812851199	0   0
   vpll1                2		2 812851199     0   0
     clk_emmc_div       1		1 135475200     0   0
	clk_emmc	1		1 135475200     0   0
	  emmc_sample   0		0  67737600     0 113
	  emmc_drv	0		0  67737600	0 180

Apprently 67737600 is better than 61440000 when requesting 80MHz.
Of course, we could have more case that worsen the gap between
the desired rate and the actual rate if using CLK_DIVIDER_POWER_OF_TWO.

So this introduces CLK_DIVIDER_EVEN flag for clock framework to make
the best in this process.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/clk-divider.c    | 9 +++++++++
 include/linux/clk-provider.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index b6234a5..97f7b94 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -161,6 +161,8 @@ static bool _is_valid_div(const struct clk_div_table *table, unsigned int div,
 {
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return is_power_of_2(div);
+	if (flags & CLK_DIVIDER_EVEN)
+		return !(div % 2);
 	if (table)
 		return _is_valid_table_div(table, div);
 	return true;
@@ -210,6 +212,8 @@ static int _div_round_up(const struct clk_div_table *table,
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		div = __roundup_pow_of_two(div);
+	if (flags & CLK_DIVIDER_EVEN)
+		div = !(div % 2) ? div : (div + 1);
 	if (table)
 		div = _round_up_table(table, div);
 
@@ -229,6 +233,9 @@ static int _div_round_closest(const struct clk_div_table *table,
 	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
 		up = __roundup_pow_of_two(up);
 		down = __rounddown_pow_of_two(down);
+	} else if (flags & CLK_DIVIDER_EVEN) {
+		up = !(up % 2) ? up : (up + 1);
+		down = !(down % 2) ? down : (down - 1);
 	} else if (table) {
 		up = _round_up_table(table, up);
 		down = _round_down_table(table, down);
@@ -266,6 +273,8 @@ static int _next_div(const struct clk_div_table *table, int div,
 
 	if (flags & CLK_DIVIDER_POWER_OF_TWO)
 		return __roundup_pow_of_two(div);
+	if (flags & CLK_DIVIDER_EVEN)
+		return !(div % 2) ? div : (div + 1);
 	if (table)
 		return _round_up_table(table, div);
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 210a890..7c59611 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -388,6 +388,8 @@ struct clk_div_table {
  * CLK_DIVIDER_MAX_AT_ZERO - For dividers which are like CLK_DIVIDER_ONE_BASED
  *	except when the value read from the register is zero, the divisor is
  *	2^width of the field.
+ * CLK_DIVIDER_EVEN - For the dividers which could only use even number in the
+ *	div field.
  */
 struct clk_divider {
 	struct clk_hw	hw;
@@ -409,6 +411,7 @@ struct clk_divider {
 #define CLK_DIVIDER_ROUND_CLOSEST	BIT(4)
 #define CLK_DIVIDER_READ_ONLY		BIT(5)
 #define CLK_DIVIDER_MAX_AT_ZERO		BIT(6)
+#define CLK_DIVIDER_EVEN		BIT(7)
 
 extern const struct clk_ops clk_divider_ops;
 extern const struct clk_ops clk_divider_ro_ops;
-- 
1.9.1
