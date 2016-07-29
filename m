Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 6/6] meson: clk: Add support for clock gates
Date: Fri, 29 Jul 2016 16:01:04 +0200
Message-Id: <1469800864-43440-7-git-send-email-serveralex@gmail.com>
In-Reply-To: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
References: <1469800864-43440-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

This patch adds support for the meson8b clock gates. Most of
them are disabled by Amlogic U-Boot, but need to be enabled
for ethernet, USB and many other components.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/meson8b.c | 249 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h |   5 +
 2 files changed, 254 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 9a656d9..1b212f9 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -311,6 +311,92 @@ struct clk_gate meson8b_clk81 = {
 	},
 };
 
+/* Everything Else (EE) domain gates */
+
+static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
+static MESON_GATE(meson8b_dos, HHI_GCLK_MPEG0, 1);
+static MESON_GATE(meson8b_isa, HHI_GCLK_MPEG0, 5);
+static MESON_GATE(meson8b_pl301, HHI_GCLK_MPEG0, 6);
+static MESON_GATE(meson8b_periphs, HHI_GCLK_MPEG0, 7);
+static MESON_GATE(meson8b_spicc, HHI_GCLK_MPEG0, 8);
+static MESON_GATE(meson8b_i2c, HHI_GCLK_MPEG0, 9);
+static MESON_GATE(meson8b_sar_adc, HHI_GCLK_MPEG0, 10);
+static MESON_GATE(meson8b_smart_card, HHI_GCLK_MPEG0, 11);
+static MESON_GATE(meson8b_rng0, HHI_GCLK_MPEG0, 12);
+static MESON_GATE(meson8b_uart0, HHI_GCLK_MPEG0, 13);
+static MESON_GATE(meson8b_sdhc, HHI_GCLK_MPEG0, 14);
+static MESON_GATE(meson8b_stream, HHI_GCLK_MPEG0, 15);
+static MESON_GATE(meson8b_async_fifo, HHI_GCLK_MPEG0, 16);
+static MESON_GATE(meson8b_sdio, HHI_GCLK_MPEG0, 17);
+static MESON_GATE(meson8b_abuf, HHI_GCLK_MPEG0, 18);
+static MESON_GATE(meson8b_hiu_iface, HHI_GCLK_MPEG0, 19);
+static MESON_GATE(meson8b_assist_misc, HHI_GCLK_MPEG0, 23);
+static MESON_GATE(meson8b_spi, HHI_GCLK_MPEG0, 30);
+
+static MESON_GATE(meson8b_i2s_spdif, HHI_GCLK_MPEG1, 2);
+static MESON_GATE(meson8b_eth, HHI_GCLK_MPEG1, 3);
+static MESON_GATE(meson8b_demux, HHI_GCLK_MPEG1, 4);
+static MESON_GATE(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6);
+static MESON_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
+static MESON_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
+static MESON_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
+static MESON_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
+static MESON_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
+static MESON_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
+static MESON_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
+static MESON_GATE(meson8b_blkmv, HHI_GCLK_MPEG1, 14);
+static MESON_GATE(meson8b_aiu, HHI_GCLK_MPEG1, 15);
+static MESON_GATE(meson8b_uart1, HHI_GCLK_MPEG1, 16);
+static MESON_GATE(meson8b_g2d, HHI_GCLK_MPEG1, 20);
+static MESON_GATE(meson8b_usb0, HHI_GCLK_MPEG1, 21);
+static MESON_GATE(meson8b_usb1, HHI_GCLK_MPEG1, 22);
+static MESON_GATE(meson8b_reset, HHI_GCLK_MPEG1, 23);
+static MESON_GATE(meson8b_nand, HHI_GCLK_MPEG1, 24);
+static MESON_GATE(meson8b_dos_parser, HHI_GCLK_MPEG1, 25);
+static MESON_GATE(meson8b_usb, HHI_GCLK_MPEG1, 26);
+static MESON_GATE(meson8b_vdin1, HHI_GCLK_MPEG1, 28);
+static MESON_GATE(meson8b_ahb_arb0, HHI_GCLK_MPEG1, 29);
+static MESON_GATE(meson8b_efuse, HHI_GCLK_MPEG1, 30);
+static MESON_GATE(meson8b_boot_rom, HHI_GCLK_MPEG1, 31);
+
+static MESON_GATE(meson8b_ahb_data_bus, HHI_GCLK_MPEG2, 1);
+static MESON_GATE(meson8b_ahb_ctrl_bus, HHI_GCLK_MPEG2, 2);
+static MESON_GATE(meson8b_hdmi_intr_sync, HHI_GCLK_MPEG2, 3);
+static MESON_GATE(meson8b_hdmi_pclk, HHI_GCLK_MPEG2, 4);
+static MESON_GATE(meson8b_usb1_ddr_bridge, HHI_GCLK_MPEG2, 8);
+static MESON_GATE(meson8b_usb0_ddr_bridge, HHI_GCLK_MPEG2, 9);
+static MESON_GATE(meson8b_mmc_pclk, HHI_GCLK_MPEG2, 11);
+static MESON_GATE(meson8b_dvin, HHI_GCLK_MPEG2, 12);
+static MESON_GATE(meson8b_uart2, HHI_GCLK_MPEG2, 15);
+static MESON_GATE(meson8b_sana, HHI_GCLK_MPEG2, 22);
+static MESON_GATE(meson8b_vpu_intr, HHI_GCLK_MPEG2, 25);
+static MESON_GATE(meson8b_sec_ahb_ahb3_bridge, HHI_GCLK_MPEG2, 26);
+static MESON_GATE(meson8b_clk81_a9, HHI_GCLK_MPEG2, 29);
+
+static MESON_GATE(meson8b_vclk2_venci0, HHI_GCLK_OTHER, 1);
+static MESON_GATE(meson8b_vclk2_venci1, HHI_GCLK_OTHER, 2);
+static MESON_GATE(meson8b_vclk2_vencp0, HHI_GCLK_OTHER, 3);
+static MESON_GATE(meson8b_vclk2_vencp1, HHI_GCLK_OTHER, 4);
+static MESON_GATE(meson8b_gclk_venci_int, HHI_GCLK_OTHER, 8);
+static MESON_GATE(meson8b_gclk_vencp_int, HHI_GCLK_OTHER, 9);
+static MESON_GATE(meson8b_dac_clk, HHI_GCLK_OTHER, 10);
+static MESON_GATE(meson8b_aoclk_gate, HHI_GCLK_OTHER, 14);
+static MESON_GATE(meson8b_iec958_gate, HHI_GCLK_OTHER, 16);
+static MESON_GATE(meson8b_enc480p, HHI_GCLK_OTHER, 20);
+static MESON_GATE(meson8b_rng1, HHI_GCLK_OTHER, 21);
+static MESON_GATE(meson8b_gclk_vencl_int, HHI_GCLK_OTHER, 22);
+static MESON_GATE(meson8b_vclk2_venclmcc, HHI_GCLK_OTHER, 24);
+static MESON_GATE(meson8b_vclk2_vencl, HHI_GCLK_OTHER, 25);
+static MESON_GATE(meson8b_vclk2_other, HHI_GCLK_OTHER, 26);
+static MESON_GATE(meson8b_edp, HHI_GCLK_OTHER, 31);
+
+/* Always On (AO) domain gates */
+
+static MESON_GATE(meson8b_ao_media_cpu, HHI_GCLK_AO, 0);
+static MESON_GATE(meson8b_ao_ahb_sram, HHI_GCLK_AO, 1);
+static MESON_GATE(meson8b_ao_ahb_bus, HHI_GCLK_AO, 2);
+static MESON_GATE(meson8b_ao_iface, HHI_GCLK_AO, 3);
+
 static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 	.hws = {
 		[CLKID_XTAL] = &meson8b_xtal.hw,
@@ -326,6 +412,83 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_MPEG_SEL] = &meson8b_mpeg_clk_sel.hw,
 		[CLKID_MPEG_DIV] = &meson8b_mpeg_clk_div.hw,
 		[CLKID_CLK81] = &meson8b_clk81.hw,
+		[CLKID_DDR]		    = &meson8b_ddr.hw,
+		[CLKID_DOS]		    = &meson8b_dos.hw,
+		[CLKID_ISA]		    = &meson8b_isa.hw,
+		[CLKID_PL301]		    = &meson8b_pl301.hw,
+		[CLKID_PERIPHS]		    = &meson8b_periphs.hw,
+		[CLKID_SPICC]		    = &meson8b_spicc.hw,
+		[CLKID_I2C]		    = &meson8b_i2c.hw,
+		[CLKID_SAR_ADC]		    = &meson8b_sar_adc.hw,
+		[CLKID_SMART_CARD]	    = &meson8b_smart_card.hw,
+		[CLKID_RNG0]		    = &meson8b_rng0.hw,
+		[CLKID_UART0]		    = &meson8b_uart0.hw,
+		[CLKID_SDHC]		    = &meson8b_sdhc.hw,
+		[CLKID_STREAM]		    = &meson8b_stream.hw,
+		[CLKID_ASYNC_FIFO]	    = &meson8b_async_fifo.hw,
+		[CLKID_SDIO]		    = &meson8b_sdio.hw,
+		[CLKID_ABUF]		    = &meson8b_abuf.hw,
+		[CLKID_HIU_IFACE]	    = &meson8b_hiu_iface.hw,
+		[CLKID_ASSIST_MISC]	    = &meson8b_assist_misc.hw,
+		[CLKID_SPI]		    = &meson8b_spi.hw,
+		[CLKID_I2S_SPDIF]	    = &meson8b_i2s_spdif.hw,
+		[CLKID_ETH]		    = &meson8b_eth.hw,
+		[CLKID_DEMUX]		    = &meson8b_demux.hw,
+		[CLKID_AIU_GLUE]	    = &meson8b_aiu_glue.hw,
+		[CLKID_IEC958]		    = &meson8b_iec958.hw,
+		[CLKID_I2S_OUT]		    = &meson8b_i2s_out.hw,
+		[CLKID_AMCLK]		    = &meson8b_amclk.hw,
+		[CLKID_AIFIFO2]		    = &meson8b_aififo2.hw,
+		[CLKID_MIXER]		    = &meson8b_mixer.hw,
+		[CLKID_MIXER_IFACE]	    = &meson8b_mixer_iface.hw,
+		[CLKID_ADC]		    = &meson8b_adc.hw,
+		[CLKID_BLKMV]		    = &meson8b_blkmv.hw,
+		[CLKID_AIU]		    = &meson8b_aiu.hw,
+		[CLKID_UART1]		    = &meson8b_uart1.hw,
+		[CLKID_G2D]		    = &meson8b_g2d.hw,
+		[CLKID_USB0]		    = &meson8b_usb0.hw,
+		[CLKID_USB1]		    = &meson8b_usb1.hw,
+		[CLKID_RESET]		    = &meson8b_reset.hw,
+		[CLKID_NAND]		    = &meson8b_nand.hw,
+		[CLKID_DOS_PARSER]	    = &meson8b_dos_parser.hw,
+		[CLKID_USB]		    = &meson8b_usb.hw,
+		[CLKID_VDIN1]		    = &meson8b_vdin1.hw,
+		[CLKID_AHB_ARB0]	    = &meson8b_ahb_arb0.hw,
+		[CLKID_EFUSE]		    = &meson8b_efuse.hw,
+		[CLKID_BOOT_ROM]	    = &meson8b_boot_rom.hw,
+		[CLKID_AHB_DATA_BUS]	    = &meson8b_ahb_data_bus.hw,
+		[CLKID_AHB_CTRL_BUS]	    = &meson8b_ahb_ctrl_bus.hw,
+		[CLKID_HDMI_INTR_SYNC]	    = &meson8b_hdmi_intr_sync.hw,
+		[CLKID_HDMI_PCLK]	    = &meson8b_hdmi_pclk.hw,
+		[CLKID_USB1_DDR_BRIDGE]	    = &meson8b_usb1_ddr_bridge.hw,
+		[CLKID_USB0_DDR_BRIDGE]	    = &meson8b_usb0_ddr_bridge.hw,
+		[CLKID_MMC_PCLK]	    = &meson8b_mmc_pclk.hw,
+		[CLKID_DVIN]		    = &meson8b_dvin.hw,
+		[CLKID_UART2]		    = &meson8b_uart2.hw,
+		[CLKID_SANA]		    = &meson8b_sana.hw,
+		[CLKID_VPU_INTR]	    = &meson8b_vpu_intr.hw,
+		[CLKID_SEC_AHB_AHB3_BRIDGE] = &meson8b_sec_ahb_ahb3_bridge.hw,
+		[CLKID_CLK81_A9]	    = &meson8b_clk81_a9.hw,
+		[CLKID_VCLK2_VENCI0]	    = &meson8b_vclk2_venci0.hw,
+		[CLKID_VCLK2_VENCI1]	    = &meson8b_vclk2_venci1.hw,
+		[CLKID_VCLK2_VENCP0]	    = &meson8b_vclk2_vencp0.hw,
+		[CLKID_VCLK2_VENCP1]	    = &meson8b_vclk2_vencp1.hw,
+		[CLKID_GCLK_VENCI_INT]	    = &meson8b_gclk_venci_int.hw,
+		[CLKID_GCLK_VENCI_INT]	    = &meson8b_gclk_vencp_int.hw,
+		[CLKID_DAC_CLK]		    = &meson8b_dac_clk.hw,
+		[CLKID_AOCLK_GATE]	    = &meson8b_aoclk_gate.hw,
+		[CLKID_IEC958_GATE]	    = &meson8b_iec958_gate.hw,
+		[CLKID_ENC480P]		    = &meson8b_enc480p.hw,
+		[CLKID_RNG1]		    = &meson8b_rng1.hw,
+		[CLKID_GCLK_VENCL_INT]	    = &meson8b_gclk_vencl_int.hw,
+		[CLKID_VCLK2_VENCLMCC]	    = &meson8b_vclk2_venclmcc.hw,
+		[CLKID_VCLK2_VENCL]	    = &meson8b_vclk2_vencl.hw,
+		[CLKID_VCLK2_OTHER]	    = &meson8b_vclk2_other.hw,
+		[CLKID_EDP]		    = &meson8b_edp.hw,
+		[CLKID_AO_MEDIA_CPU]	    = &meson8b_ao_media_cpu.hw,
+		[CLKID_AO_AHB_SRAM]	    = &meson8b_ao_ahb_sram.hw,
+		[CLKID_AO_AHB_BUS]	    = &meson8b_ao_ahb_bus.hw,
+		[CLKID_AO_IFACE]	    = &meson8b_ao_iface.hw,
 	},
 	.num = CLK_NR_CLKS,
 };
@@ -336,6 +499,87 @@ static struct meson_clk_pll *const meson8b_clk_plls[] = {
 	&meson8b_sys_pll,
 };
 
+static struct clk_gate *meson8b_clk_gates[] = {
+	&meson8b_clk81,
+	&meson8b_ddr,
+	&meson8b_dos,
+	&meson8b_isa,
+	&meson8b_pl301,
+	&meson8b_periphs,
+	&meson8b_spicc,
+	&meson8b_i2c,
+	&meson8b_sar_adc,
+	&meson8b_smart_card,
+	&meson8b_rng0,
+	&meson8b_uart0,
+	&meson8b_sdhc,
+	&meson8b_stream,
+	&meson8b_async_fifo,
+	&meson8b_sdio,
+	&meson8b_abuf,
+	&meson8b_hiu_iface,
+	&meson8b_assist_misc,
+	&meson8b_spi,
+	&meson8b_i2s_spdif,
+	&meson8b_eth,
+	&meson8b_demux,
+	&meson8b_aiu_glue,
+	&meson8b_iec958,
+	&meson8b_i2s_out,
+	&meson8b_amclk,
+	&meson8b_aififo2,
+	&meson8b_mixer,
+	&meson8b_mixer_iface,
+	&meson8b_adc,
+	&meson8b_blkmv,
+	&meson8b_aiu,
+	&meson8b_uart1,
+	&meson8b_g2d,
+	&meson8b_usb0,
+	&meson8b_usb1,
+	&meson8b_reset,
+	&meson8b_nand,
+	&meson8b_dos_parser,
+	&meson8b_usb,
+	&meson8b_vdin1,
+	&meson8b_ahb_arb0,
+	&meson8b_efuse,
+	&meson8b_boot_rom,
+	&meson8b_ahb_data_bus,
+	&meson8b_ahb_ctrl_bus,
+	&meson8b_hdmi_intr_sync,
+	&meson8b_hdmi_pclk,
+	&meson8b_usb1_ddr_bridge,
+	&meson8b_usb0_ddr_bridge,
+	&meson8b_mmc_pclk,
+	&meson8b_dvin,
+	&meson8b_uart2,
+	&meson8b_sana,
+	&meson8b_vpu_intr,
+	&meson8b_sec_ahb_ahb3_bridge,
+	&meson8b_clk81_a9,
+	&meson8b_vclk2_venci0,
+	&meson8b_vclk2_venci1,
+	&meson8b_vclk2_vencp0,
+	&meson8b_vclk2_vencp1,
+	&meson8b_gclk_venci_int,
+	&meson8b_gclk_vencp_int,
+	&meson8b_dac_clk,
+	&meson8b_aoclk_gate,
+	&meson8b_iec958_gate,
+	&meson8b_enc480p,
+	&meson8b_rng1,
+	&meson8b_gclk_vencl_int,
+	&meson8b_vclk2_venclmcc,
+	&meson8b_vclk2_vencl,
+	&meson8b_vclk2_other,
+	&meson8b_edp,
+	&meson8b_ao_media_cpu,
+	&meson8b_ao_ahb_sram,
+	&meson8b_ao_ahb_bus,
+	&meson8b_ao_iface,
+};
+
 static int meson8b_clkc_probe(struct platform_device *pdev)
 {
 	void __iomem *clk_base;
@@ -363,6 +607,11 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
 	meson8b_mpeg_clk_div.reg = clk_base + (u32)meson8b_mpeg_clk_div.reg;
 	meson8b_clk81.reg = clk_base + (u32)meson8b_clk81.reg;
 
+	/* Populate base address for gates */
+	for (i = 0; i < ARRAY_SIZE(meson8b_clk_gates); i++)
+		meson8b_clk_gates[i]->reg = clk_base +
+			(u32)meson8b_clk_gates[i]->reg;
+
 	/*
 	 * register all clks
 	 * CLKID_UNUSED = 0, so skip it and start with CLKID_XTAL = 1
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 86efe6a..010e958 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -30,6 +30,11 @@
  *
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
+#define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
+#define HHI_GCLK_MPEG1			0x144 /* 0x51 offset in data sheet */
+#define HHI_GCLK_MPEG2			0x148 /* 0x52 offset in data sheet */
+#define HHI_GCLK_OTHER			0x150 /* 0x54 offset in data sheet */
+#define HHI_GCLK_AO			0x154 /* 0x55 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL1		0x15c /* 0x57 offset in data sheet */
 #define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
 #define HHI_MPLL_CNTL			0x280 /* 0xa0 offset in data sheet */
-- 
2.5.0
