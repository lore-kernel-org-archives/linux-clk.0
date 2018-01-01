Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:42074 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750923AbeAAVBz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Jan 2018 16:01:55 -0500
Received: by mail-wm0-f68.google.com with SMTP id b141so11872893wme.1
        for <linux-clk@vger.kernel.org>; Mon, 01 Jan 2018 13:01:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org
Cc: carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/1] clk: meson: meson8b: add support for the NAND clocks
Date: Mon,  1 Jan 2018 22:01:39 +0100
Message-Id: <20180101210139.29808-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
References: <20180101210139.29808-1-martin.blumenstingl@googlemail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds the NAND clocks (from the HHI_NAND_CLK_CNTL register) to the
Meson8b clock driver. There are three NAND clocks: a gate which enables
or disables the NAND clock, a mux and a divider (which divides the mux
output).
Unfortunately the public S805 datasheet does not document the mux
parents. However, the vendor kernel has a few hints for us which allows
us to make an educated guess about the clock parents. To do this we need
to have a look at set_nand_core_clk() from the vendor's NAND driver (see
[0]):
- XTAL = (4<<9) | (1<<8) | 0
- 160MHz = (0<<9) | (1<<8) | 3)
- 182MHz = (3<<9) | (1<<8) | 1)
- 212MHz = (1<<9) | (1<<8) | 3)
- 255MHz = (2<<9) | (1<<8) | 1)

While there is a comment for the XTAL parent (which indicates that it
should only be used for debugging) we have to do a bit of math for the
other parents: target_freq * divider = rate of parent clock
Bit 8 above is the enable bit, so we can ignore it here. Bits 11:9 are
the mux index and bits 6:0 are the 0-based divider (so we need to add
1). This gives us:
- mux 0 (160MHz * 4) = fclk_div4 (actual rate = 637.5MHz, off by 2.5MHz)
- mux 1 (212MHz * 4) = fclk_div3 (actual rate = 850MHz, off by 2MHz)
- mux 2 (255MHz * 2) = fclk_div5 (matches exactly 510MHz)
- mux 3 (182MHz * 2) = fclk_div7 (actual rate = 346.3MHz, off by 0.3MHz)

[0] https://github.com/khadas/linux/blob/9587681285cb/drivers/amlogic/amlnf/dev/amlnf_ctrl.c#L314

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c              | 51 ++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h              |  3 +-
 include/dt-bindings/clock/meson8b-clkc.h |  3 ++
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 20ab7190d328..929f6947e679 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -418,6 +418,51 @@ struct clk_gate meson8b_clk81 = {
 	},
 };
 
+struct clk_mux meson8b_nand_clk_sel = {
+	.reg = (void *)HHI_NAND_CLK_CNTL,
+	.mask = 0x7,
+	.shift = 9,
+	.flags = CLK_MUX_ROUND_CLOSEST,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "nand_clk_sel",
+		.ops = &clk_mux_ops,
+		/* FIXME all other parents are unknown: */
+		.parent_names = (const char *[]){ "fclk_div4", "fclk_div3",
+			"fclk_div5", "fclk_div7", "xtal" },
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_divider meson8b_nand_clk_div = {
+	.reg = (void *)HHI_NAND_CLK_CNTL,
+	.shift = 0,
+	.width = 7,
+	.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "nand_clk_div",
+		.ops = &clk_divider_ops,
+		.parent_names = (const char *[]){ "nand_clk_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+struct clk_gate meson8b_nand_clk_gate = {
+	.reg = (void *)HHI_NAND_CLK_CNTL,
+	.bit_idx = 8,
+	.lock = &clk_lock,
+	.hw.init = &(struct clk_init_data){
+		.name = "nand_clk_gate",
+		.ops = &clk_gate_ops,
+		.parent_names = (const char *[]){ "nand_clk_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -599,6 +644,9 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_MPLL0]		    = &meson8b_mpll0.hw,
 		[CLKID_MPLL1]		    = &meson8b_mpll1.hw,
 		[CLKID_MPLL2]		    = &meson8b_mpll2.hw,
+		[CLKID_NAND_SEL]	    = &meson8b_nand_clk_sel.hw,
+		[CLKID_NAND_DIV]	    = &meson8b_nand_clk_div.hw,
+		[CLKID_NAND_CLK]	    = &meson8b_nand_clk_gate.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -695,14 +743,17 @@ static struct clk_gate *const meson8b_clk_gates[] = {
 	&meson8b_ao_ahb_sram,
 	&meson8b_ao_ahb_bus,
 	&meson8b_ao_iface,
+	&meson8b_nand_clk_gate,
 };
 
 static struct clk_mux *const meson8b_clk_muxes[] = {
 	&meson8b_mpeg_clk_sel,
+	&meson8b_nand_clk_sel,
 };
 
 static struct clk_divider *const meson8b_clk_dividers[] = {
 	&meson8b_mpeg_clk_div,
+	&meson8b_nand_clk_div,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 2eaf8a52e7dd..87731d3c7e55 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -40,6 +40,7 @@
 #define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
 #define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
+#define HHI_NAND_CLK_CNTL		0x25c /* 0x97 offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
@@ -69,7 +70,7 @@
  * will remain defined here.
  */
 
-#define CLK_NR_CLKS		96
+#define CLK_NR_CLKS		99
 
 /*
  * include the CLKID and RESETID that have
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index dea9d46d4fa7..aa1a8148c785 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -102,5 +102,8 @@
 #define CLKID_MPLL0		93
 #define CLKID_MPLL1		94
 #define CLKID_MPLL2		95
+#define CLKID_NAND_SEL		96
+#define CLKID_NAND_DIV		97
+#define CLKID_NAND_CLK		98
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.15.1

