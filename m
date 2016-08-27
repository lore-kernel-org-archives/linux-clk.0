Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v5 5/6] gxbb: clk: Adjust MESON_GATE macro to be shared with meson8b
Date: Sat, 27 Aug 2016 19:40:53 +0200
Message-Id: <1472319654-59048-6-git-send-email-serveralex@gmail.com>
In-Reply-To: <1472319654-59048-1-git-send-email-serveralex@gmail.com>
References: <1472319654-59048-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The macro used gxbb_ prefix for clock definitions. In order
to share the macro between gxbb and meson8b, the prefix must
be moved to gxbb.c.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/clkc.h |   2 +-
 drivers/clk/meson/gxbb.c | 162 +++++++++++++++++++++++------------------------
 2 files changed, 82 insertions(+), 82 deletions(-)

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 53326c3..9bb70e7 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -98,7 +98,7 @@ struct meson_clk_mpll {
 };
 
 #define MESON_GATE(_name, _reg, _bit)					\
-struct clk_gate gxbb_##_name = { 						\
+struct clk_gate _name = { 						\
 	.reg = (void __iomem *) _reg, 					\
 	.bit_idx = (_bit), 						\
 	.lock = &clk_lock,						\
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index a4c6684b..ab7a3b5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -565,90 +565,90 @@ static struct clk_gate gxbb_clk81 = {
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
+static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);
+static MESON_GATE(gxbb_dos, HHI_GCLK_MPEG0, 1);
+static MESON_GATE(gxbb_isa, HHI_GCLK_MPEG0, 5);
+static MESON_GATE(gxbb_pl301, HHI_GCLK_MPEG0, 6);
+static MESON_GATE(gxbb_periphs, HHI_GCLK_MPEG0, 7);
+static MESON_GATE(gxbb_spicc, HHI_GCLK_MPEG0, 8);
+static MESON_GATE(gxbb_i2c, HHI_GCLK_MPEG0, 9);
+static MESON_GATE(gxbb_sar_adc, HHI_GCLK_MPEG0, 10);
+static MESON_GATE(gxbb_smart_card, HHI_GCLK_MPEG0, 11);
+static MESON_GATE(gxbb_rng0, HHI_GCLK_MPEG0, 12);
+static MESON_GATE(gxbb_uart0, HHI_GCLK_MPEG0, 13);
+static MESON_GATE(gxbb_sdhc, HHI_GCLK_MPEG0, 14);
+static MESON_GATE(gxbb_stream, HHI_GCLK_MPEG0, 15);
+static MESON_GATE(gxbb_async_fifo, HHI_GCLK_MPEG0, 16);
+static MESON_GATE(gxbb_sdio, HHI_GCLK_MPEG0, 17);
+static MESON_GATE(gxbb_abuf, HHI_GCLK_MPEG0, 18);
+static MESON_GATE(gxbb_hiu_iface, HHI_GCLK_MPEG0, 19);
+static MESON_GATE(gxbb_assist_misc, HHI_GCLK_MPEG0, 23);
+static MESON_GATE(gxbb_spi, HHI_GCLK_MPEG0, 30);
+
+static MESON_GATE(gxbb_i2s_spdif, HHI_GCLK_MPEG1, 2);
+static MESON_GATE(gxbb_eth, HHI_GCLK_MPEG1, 3);
+static MESON_GATE(gxbb_demux, HHI_GCLK_MPEG1, 4);
+static MESON_GATE(gxbb_aiu_glue, HHI_GCLK_MPEG1, 6);
+static MESON_GATE(gxbb_iec958, HHI_GCLK_MPEG1, 7);
+static MESON_GATE(gxbb_i2s_out, HHI_GCLK_MPEG1, 8);
+static MESON_GATE(gxbb_amclk, HHI_GCLK_MPEG1, 9);
+static MESON_GATE(gxbb_aififo2, HHI_GCLK_MPEG1, 10);
+static MESON_GATE(gxbb_mixer, HHI_GCLK_MPEG1, 11);
+static MESON_GATE(gxbb_mixer_iface, HHI_GCLK_MPEG1, 12);
+static MESON_GATE(gxbb_adc, HHI_GCLK_MPEG1, 13);
+static MESON_GATE(gxbb_blkmv, HHI_GCLK_MPEG1, 14);
+static MESON_GATE(gxbb_aiu, HHI_GCLK_MPEG1, 15);
+static MESON_GATE(gxbb_uart1, HHI_GCLK_MPEG1, 16);
+static MESON_GATE(gxbb_g2d, HHI_GCLK_MPEG1, 20);
+static MESON_GATE(gxbb_usb0, HHI_GCLK_MPEG1, 21);
+static MESON_GATE(gxbb_usb1, HHI_GCLK_MPEG1, 22);
+static MESON_GATE(gxbb_reset, HHI_GCLK_MPEG1, 23);
+static MESON_GATE(gxbb_nand, HHI_GCLK_MPEG1, 24);
+static MESON_GATE(gxbb_dos_parser, HHI_GCLK_MPEG1, 25);
+static MESON_GATE(gxbb_usb, HHI_GCLK_MPEG1, 26);
+static MESON_GATE(gxbb_vdin1, HHI_GCLK_MPEG1, 28);
+static MESON_GATE(gxbb_ahb_arb0, HHI_GCLK_MPEG1, 29);
+static MESON_GATE(gxbb_efuse, HHI_GCLK_MPEG1, 30);
+static MESON_GATE(gxbb_boot_rom, HHI_GCLK_MPEG1, 31);
+
+static MESON_GATE(gxbb_ahb_data_bus, HHI_GCLK_MPEG2, 1);
+static MESON_GATE(gxbb_ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
+static MESON_GATE(gxbb_hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
+static MESON_GATE(gxbb_hdmi_pclk, HHI_GCLK_MPEG2, 4);
+static MESON_GATE(gxbb_usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
+static MESON_GATE(gxbb_usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
+static MESON_GATE(gxbb_mmc_pclk, HHI_GCLK_MPEG2, 11);
+static MESON_GATE(gxbb_dvin, HHI_GCLK_MPEG2, 12);
+static MESON_GATE(gxbb_uart2, HHI_GCLK_MPEG2, 15);
+static MESON_GATE(gxbb_sana, HHI_GCLK_MPEG2, 22);
+static MESON_GATE(gxbb_vpu_intr, HHI_GCLK_MPEG2, 25);
+static MESON_GATE(gxbb_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static MESON_GATE(gxbb_clk81_a53, HHI_GCLK_MPEG2, 29);
+
+static MESON_GATE(gxbb_vclk2_venci0, HHI_GCLK_OTHER, 1);
+static MESON_GATE(gxbb_vclk2_venci1, HHI_GCLK_OTHER, 2);
+static MESON_GATE(gxbb_vclk2_vencp0, HHI_GCLK_OTHER, 3);
+static MESON_GATE(gxbb_vclk2_vencp1, HHI_GCLK_OTHER, 4);
+static MESON_GATE(gxbb_gclk_venci_int0, HHI_GCLK_OTHER, 8);
+static MESON_GATE(gxbb_gclk_vencp_int, HHI_GCLK_OTHER, 9);
+static MESON_GATE(gxbb_dac_clk, HHI_GCLK_OTHER, 10);
+static MESON_GATE(gxbb_aoclk_gate, HHI_GCLK_OTHER, 14);
+static MESON_GATE(gxbb_iec958_gate, HHI_GCLK_OTHER, 16);
+static MESON_GATE(gxbb_enc480p, HHI_GCLK_OTHER, 20);
+static MESON_GATE(gxbb_rng1, HHI_GCLK_OTHER, 21);
+static MESON_GATE(gxbb_gclk_venci_int1, HHI_GCLK_OTHER, 22);
+static MESON_GATE(gxbb_vclk2_venclmcc, HHI_GCLK_OTHER, 24);
+static MESON_GATE(gxbb_vclk2_vencl, HHI_GCLK_OTHER, 25);
+static MESON_GATE(gxbb_vclk_other, HHI_GCLK_OTHER, 26);
+static MESON_GATE(gxbb_edp, HHI_GCLK_OTHER, 31);
 
 /* Always On (AO) domain gates */
 
-static MESON_GATE(ao_media_cpu, HHI_GCLK_AO, 0);
-static MESON_GATE(ao_ahb_sram, HHI_GCLK_AO, 1);
-static MESON_GATE(ao_ahb_bus, HHI_GCLK_AO, 2);
-static MESON_GATE(ao_iface, HHI_GCLK_AO, 3);
-static MESON_GATE(ao_i2c, HHI_GCLK_AO, 4);
+static MESON_GATE(gxbb_ao_media_cpu, HHI_GCLK_AO, 0);
+static MESON_GATE(gxbb_ao_ahb_sram, HHI_GCLK_AO, 1);
+static MESON_GATE(gxbb_ao_ahb_bus, HHI_GCLK_AO, 2);
+static MESON_GATE(gxbb_ao_iface, HHI_GCLK_AO, 3);
+static MESON_GATE(gxbb_ao_i2c, HHI_GCLK_AO, 4);
 
 /* Array of all clocks provided by this provider */
 
-- 
2.5.0
