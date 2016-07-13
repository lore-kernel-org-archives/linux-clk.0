Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 6/7] gxbb: clk: Move MESON_GATE macro to gxbb
Date: Wed, 13 Jul 2016 19:49:40 +0200
Message-Id: <1468432181-9550-7-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/clkc.h |  14 ----
 drivers/clk/meson/gxbb.c | 176 +++++++++++++++++++++++++----------------------
 2 files changed, 95 insertions(+), 95 deletions(-)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 53326c3..061a01e 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -97,20 +97,6 @@ struct meson_clk_mpll {
 	spinlock_t *lock;
 };
 
-#define MESON_GATE(_name, _reg, _bit)					\
-struct clk_gate gxbb_##_name = { 						\
-	.reg = (void __iomem *) _reg, 					\
-	.bit_idx = (_bit), 						\
-	.lock = &clk_lock,						\
-	.hw.init = &(struct clk_init_data) { 				\
-		.name = #_name,					\
-		.ops = &clk_gate_ops,					\
-		.parent_names = (const char *[]){ "clk81" },		\
-		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED), 	\
-	},								\
-};
-
 /* clk_ops */
 extern const struct clk_ops meson_clk_pll_ro_ops;
 extern const struct clk_ops meson_clk_pll_ops;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 007b715..84500e0 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -24,6 +24,20 @@
 #include "clkc.h"
 #include "gxbb.h"
 
+#define GXBB_GATE(_name, _reg, _bit)					\
+struct clk_gate gxbb_##_name = { 					\
+	.reg = (void __iomem *) _reg, 					\
+	.bit_idx = (_bit), 						\
+	.lock = &clk_lock,						\
+	.hw.init = &(struct clk_init_data) { 				\
+		.name = #_name,						\
+		.ops = &clk_gate_ops,					\
+		.parent_names = (const char *[]){ "clk81" },		\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED), 	\
+	},								\
+};
+
 static DEFINE_SPINLOCK(clk_lock);
 
 static const struct pll_rate_table sys_pll_rate_table[] = {
@@ -563,90 +577,90 @@ static struct clk_gate gxbb_clk81 = {
 };
 
 /* Everything Else (EE) domain gates */
-static MESON_GATE(ddr, HHI_GCLK_MPEG0, 0);
-static MESON_GATE(dos, HHI_GCLK_MPEG0, 1);
-static MESON_GATE(isa, HHI_GCLK_MPEG0, 5);
-static MESON_GATE(pl301, HHI_GCLK_MPEG0, 6);
-static MESON_GATE(periphs, HHI_GCLK_MPEG0, 7);
-static MESON_GATE(spicc, HHI_GCLK_MPEG0, 8);
-static MESON_GATE(i2c, HHI_GCLK_MPEG0, 9);
-static MESON_GATE(sar_adc, HHI_GCLK_MPEG0, 10);
-static MESON_GATE(smart_card, HHI_GCLK_MPEG0, 11);
-static MESON_GATE(rng0, HHI_GCLK_MPEG0, 12);
-static MESON_GATE(uart0, HHI_GCLK_MPEG0, 13);
-static MESON_GATE(sdhc, HHI_GCLK_MPEG0, 14);
-static MESON_GATE(stream, HHI_GCLK_MPEG0, 15);
-static MESON_GATE(async_fifo, HHI_GCLK_MPEG0, 16);
-static MESON_GATE(sdio, HHI_GCLK_MPEG0, 17);
-static MESON_GATE(abuf, HHI_GCLK_MPEG0, 18);
-static MESON_GATE(hiu_iface, HHI_GCLK_MPEG0, 19);
-static MESON_GATE(assist_misc, HHI_GCLK_MPEG0, 23);
-static MESON_GATE(spi, HHI_GCLK_MPEG0, 30);
-
-static MESON_GATE(i2s_spdif, HHI_GCLK_MPEG1, 2);
-static MESON_GATE(eth, HHI_GCLK_MPEG1, 3);
-static MESON_GATE(demux, HHI_GCLK_MPEG1, 4);
-static MESON_GATE(aiu_glue, HHI_GCLK_MPEG1, 6);
-static MESON_GATE(iec958, HHI_GCLK_MPEG1, 7);
-static MESON_GATE(i2s_out, HHI_GCLK_MPEG1, 8);
-static MESON_GATE(amclk, HHI_GCLK_MPEG1, 9);
-static MESON_GATE(aififo2, HHI_GCLK_MPEG1, 10);
-static MESON_GATE(mixer, HHI_GCLK_MPEG1, 11);
-static MESON_GATE(mixer_iface, HHI_GCLK_MPEG1, 12);
-static MESON_GATE(adc, HHI_GCLK_MPEG1, 13);
-static MESON_GATE(blkmv, HHI_GCLK_MPEG1, 14);
-static MESON_GATE(aiu, HHI_GCLK_MPEG1, 15);
-static MESON_GATE(uart1, HHI_GCLK_MPEG1, 16);
-static MESON_GATE(g2d, HHI_GCLK_MPEG1, 20);
-static MESON_GATE(usb0, HHI_GCLK_MPEG1, 21);
-static MESON_GATE(usb1, HHI_GCLK_MPEG1, 22);
-static MESON_GATE(reset, HHI_GCLK_MPEG1, 23);
-static MESON_GATE(nand, HHI_GCLK_MPEG1, 24);
-static MESON_GATE(dos_parser, HHI_GCLK_MPEG1, 25);
-static MESON_GATE(usb, HHI_GCLK_MPEG1, 26);
-static MESON_GATE(vdin1, HHI_GCLK_MPEG1, 28);
-static MESON_GATE(ahb_arb0, HHI_GCLK_MPEG1, 29);
-static MESON_GATE(efuse, HHI_GCLK_MPEG1, 30);
-static MESON_GATE(boot_rom, HHI_GCLK_MPEG1, 31);
-
-static MESON_GATE(ahb_data_bus, HHI_GCLK_MPEG2, 1);
-static MESON_GATE(ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
-static MESON_GATE(hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
-static MESON_GATE(hdmi_pclk, HHI_GCLK_MPEG2, 4);
-static MESON_GATE(usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
-static MESON_GATE(usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
-static MESON_GATE(mmc_pclk, HHI_GCLK_MPEG2, 11);
-static MESON_GATE(dvin, HHI_GCLK_MPEG2, 12);
-static MESON_GATE(uart2, HHI_GCLK_MPEG2, 15);
-static MESON_GATE(sana, HHI_GCLK_MPEG2, 22);
-static MESON_GATE(vpu_intr, HHI_GCLK_MPEG2, 25);
-static MESON_GATE(sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
-static MESON_GATE(clk81_a53, HHI_GCLK_MPEG2, 29);
-
-static MESON_GATE(vclk2_venci0, HHI_GCLK_OTHER, 1);
-static MESON_GATE(vclk2_venci1, HHI_GCLK_OTHER, 2);
-static MESON_GATE(vclk2_vencp0, HHI_GCLK_OTHER, 3);
-static MESON_GATE(vclk2_vencp1, HHI_GCLK_OTHER, 4);
-static MESON_GATE(gclk_venci_int0, HHI_GCLK_OTHER, 8);
-static MESON_GATE(gclk_vencp_int, HHI_GCLK_OTHER, 9);
-static MESON_GATE(dac_clk, HHI_GCLK_OTHER, 10);
-static MESON_GATE(aoclk_gate, HHI_GCLK_OTHER, 14);
-static MESON_GATE(iec958_gate, HHI_GCLK_OTHER, 16);
-static MESON_GATE(enc480p, HHI_GCLK_OTHER, 20);
-static MESON_GATE(rng1, HHI_GCLK_OTHER, 21);
-static MESON_GATE(gclk_venci_int1, HHI_GCLK_OTHER, 22);
-static MESON_GATE(vclk2_venclmcc, HHI_GCLK_OTHER, 24);
-static MESON_GATE(vclk2_vencl, HHI_GCLK_OTHER, 25);
-static MESON_GATE(vclk_other, HHI_GCLK_OTHER, 26);
-static MESON_GATE(edp, HHI_GCLK_OTHER, 31);
+static GXBB_GATE(ddr, HHI_GCLK_MPEG0, 0);
+static GXBB_GATE(dos, HHI_GCLK_MPEG0, 1);
+static GXBB_GATE(isa, HHI_GCLK_MPEG0, 5);
+static GXBB_GATE(pl301, HHI_GCLK_MPEG0, 6);
+static GXBB_GATE(periphs, HHI_GCLK_MPEG0, 7);
+static GXBB_GATE(spicc, HHI_GCLK_MPEG0, 8);
+static GXBB_GATE(i2c, HHI_GCLK_MPEG0, 9);
+static GXBB_GATE(sar_adc, HHI_GCLK_MPEG0, 10);
+static GXBB_GATE(smart_card, HHI_GCLK_MPEG0, 11);
+static GXBB_GATE(rng0, HHI_GCLK_MPEG0, 12);
+static GXBB_GATE(uart0, HHI_GCLK_MPEG0, 13);
+static GXBB_GATE(sdhc, HHI_GCLK_MPEG0, 14);
+static GXBB_GATE(stream, HHI_GCLK_MPEG0, 15);
+static GXBB_GATE(async_fifo, HHI_GCLK_MPEG0, 16);
+static GXBB_GATE(sdio, HHI_GCLK_MPEG0, 17);
+static GXBB_GATE(abuf, HHI_GCLK_MPEG0, 18);
+static GXBB_GATE(hiu_iface, HHI_GCLK_MPEG0, 19);
+static GXBB_GATE(assist_misc, HHI_GCLK_MPEG0, 23);
+static GXBB_GATE(spi, HHI_GCLK_MPEG0, 30);
+
+static GXBB_GATE(i2s_spdif, HHI_GCLK_MPEG1, 2);
+static GXBB_GATE(eth, HHI_GCLK_MPEG1, 3);
+static GXBB_GATE(demux, HHI_GCLK_MPEG1, 4);
+static GXBB_GATE(aiu_glue, HHI_GCLK_MPEG1, 6);
+static GXBB_GATE(iec958, HHI_GCLK_MPEG1, 7);
+static GXBB_GATE(i2s_out, HHI_GCLK_MPEG1, 8);
+static GXBB_GATE(amclk, HHI_GCLK_MPEG1, 9);
+static GXBB_GATE(aififo2, HHI_GCLK_MPEG1, 10);
+static GXBB_GATE(mixer, HHI_GCLK_MPEG1, 11);
+static GXBB_GATE(mixer_iface, HHI_GCLK_MPEG1, 12);
+static GXBB_GATE(adc, HHI_GCLK_MPEG1, 13);
+static GXBB_GATE(blkmv, HHI_GCLK_MPEG1, 14);
+static GXBB_GATE(aiu, HHI_GCLK_MPEG1, 15);
+static GXBB_GATE(uart1, HHI_GCLK_MPEG1, 16);
+static GXBB_GATE(g2d, HHI_GCLK_MPEG1, 20);
+static GXBB_GATE(usb0, HHI_GCLK_MPEG1, 21);
+static GXBB_GATE(usb1, HHI_GCLK_MPEG1, 22);
+static GXBB_GATE(reset, HHI_GCLK_MPEG1, 23);
+static GXBB_GATE(nand, HHI_GCLK_MPEG1, 24);
+static GXBB_GATE(dos_parser, HHI_GCLK_MPEG1, 25);
+static GXBB_GATE(usb, HHI_GCLK_MPEG1, 26);
+static GXBB_GATE(vdin1, HHI_GCLK_MPEG1, 28);
+static GXBB_GATE(ahb_arb0, HHI_GCLK_MPEG1, 29);
+static GXBB_GATE(efuse, HHI_GCLK_MPEG1, 30);
+static GXBB_GATE(boot_rom, HHI_GCLK_MPEG1, 31);
+
+static GXBB_GATE(ahb_data_bus, HHI_GCLK_MPEG2, 1);
+static GXBB_GATE(ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
+static GXBB_GATE(hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
+static GXBB_GATE(hdmi_pclk, HHI_GCLK_MPEG2, 4);
+static GXBB_GATE(usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
+static GXBB_GATE(usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
+static GXBB_GATE(mmc_pclk, HHI_GCLK_MPEG2, 11);
+static GXBB_GATE(dvin, HHI_GCLK_MPEG2, 12);
+static GXBB_GATE(uart2, HHI_GCLK_MPEG2, 15);
+static GXBB_GATE(sana, HHI_GCLK_MPEG2, 22);
+static GXBB_GATE(vpu_intr, HHI_GCLK_MPEG2, 25);
+static GXBB_GATE(sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static GXBB_GATE(clk81_a53, HHI_GCLK_MPEG2, 29);
+
+static GXBB_GATE(vclk2_venci0, HHI_GCLK_OTHER, 1);
+static GXBB_GATE(vclk2_venci1, HHI_GCLK_OTHER, 2);
+static GXBB_GATE(vclk2_vencp0, HHI_GCLK_OTHER, 3);
+static GXBB_GATE(vclk2_vencp1, HHI_GCLK_OTHER, 4);
+static GXBB_GATE(gclk_venci_int0, HHI_GCLK_OTHER, 8);
+static GXBB_GATE(gclk_vencp_int, HHI_GCLK_OTHER, 9);
+static GXBB_GATE(dac_clk, HHI_GCLK_OTHER, 10);
+static GXBB_GATE(aoclk_gate, HHI_GCLK_OTHER, 14);
+static GXBB_GATE(iec958_gate, HHI_GCLK_OTHER, 16);
+static GXBB_GATE(enc480p, HHI_GCLK_OTHER, 20);
+static GXBB_GATE(rng1, HHI_GCLK_OTHER, 21);
+static GXBB_GATE(gclk_venci_int1, HHI_GCLK_OTHER, 22);
+static GXBB_GATE(vclk2_venclmcc, HHI_GCLK_OTHER, 24);
+static GXBB_GATE(vclk2_vencl, HHI_GCLK_OTHER, 25);
+static GXBB_GATE(vclk_other, HHI_GCLK_OTHER, 26);
+static GXBB_GATE(edp, HHI_GCLK_OTHER, 31);
 
 /* Always On (AO) domain gates */
 
-static MESON_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
-static MESON_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
-static MESON_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
-static MESON_GATE(ao_iface, HHI_GCLK_AO, 3);
-static MESON_GATE(ao_i2c, HHI_GCLK_AO, 4);
+static GXBB_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
+static GXBB_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
+static GXBB_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
+static GXBB_GATE(ao_iface, HHI_GCLK_AO, 3);
+static GXBB_GATE(ao_i2c, HHI_GCLK_AO, 4);
 
 /* Array of all clocks provided by this provider */
 
-- 
2.5.0
