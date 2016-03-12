Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Xing Zheng <zhengxing@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 2/7] clk: rockchip: fix warning reported by kernel-doc
Date: Sun, 13 Mar 2016 00:25:14 +0800
Message-Id: <1457799914-3101-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

./scripts/kernel-doc -man -v drivers/clk/rockchip/clk.h > /dev/null

drivers/clk/rockchip/clk.h:133: warning: missing initial short
description on line:
 * struct rockchip_clk_provider: information about clock provider
drivers/clk/rockchip/clk.h:133: info: Scanning doc for struct
drivers/clk/rockchip/clk.h:164: warning: missing initial short
description on line:
 * struct rockchip_pll_clock: information about pll clock
drivers/clk/rockchip/clk.h:164: info: Scanning doc for struct
drivers/clk/rockchip/clk.h:194: warning: No description found for
parameter 'parent_names'
drivers/clk/rockchip/clk.h:194: warning: No description found for
parameter 'num_parents'
drivers/clk/rockchip/clk.h:194: warning: Excess struct/union/enum/typedef
member 'parent_name' description in 'rockchip_pll_clock'
drivers/clk/rockchip/clk.h:235: warning: missing initial short
description on line:
 * struct rockchip_cpuclk_reg_data: describes register offsets and
masks of the cpuclock

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/clk/rockchip/clk.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index b298f99..e0f103b 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -130,7 +130,7 @@ enum rockchip_pll_type {
 }
 
 /**
- * struct rockchip_clk_provider: information about clock provider
+ * struct rockchip_clk_provider - information about clock provider
  * @reg_base: virtual address for the register base.
  * @clk_data: holds clock related data like clk* and number of clocks.
  * @cru_node: device-node of the clock-provider
@@ -161,10 +161,11 @@ struct rockchip_pll_rate_table {
 };
 
 /**
- * struct rockchip_pll_clock: information about pll clock
+ * struct rockchip_pll_clock - information about pll clock
  * @id: platform specific id of the clock.
  * @name: name of this pll clock.
- * @parent_name: name of the parent clock.
+ * @parent_names: name of the parent clock.
+ * @num_parents: number of parents
  * @flags: optional flags for basic clock.
  * @con_offset: offset of the register for configuring the PLL.
  * @mode_offset: offset of the register for configuring the PLL-mode.
@@ -232,7 +233,7 @@ struct rockchip_cpuclk_rate_table {
 };
 
 /**
- * struct rockchip_cpuclk_reg_data: describes register offsets and masks of the cpuclock
+ * struct rockchip_cpuclk_reg_data - describes register offsets and masks of the cpuclock
  * @core_reg:		register offset of the core settings register
  * @div_core_shift:	core divider offset used to divide the pll value
  * @div_core_mask:	core divider mask
-- 
2.3.7
