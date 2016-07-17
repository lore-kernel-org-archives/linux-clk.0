Return-Path: <serveralex@gmail.com>
Return-Path: <serveralex@gmail.com>
From: =?UTF-8?q?Alexander=20M=C3=BCller?= <serveralex@gmail.com>
To: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 4/6] clk: meson: Copy meson8b CLKID defines to private header file
Date: Sun, 17 Jul 2016 20:44:49 +0200
Message-Id: <1468781091-39119-5-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468781091-39119-1-git-send-email-serveralex@gmail.com>
References: <1468781091-39119-1-git-send-email-serveralex@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Only expose future CLKID constants if necessary. This patch
removes CLK_NR_CLKS from the DT bindings but leaves all previously
defined CLKIDs there to keep backward compatibility.

Signed-off-by: Alexander Müller <serveralex@gmail.com>
---
 drivers/clk/meson/meson8b.c              |   1 -
 drivers/clk/meson/meson8b.h              | 104 +++++++++++++++++++++++++++++++
 include/dt-bindings/clock/meson8b-clkc.h |   2 -
 3 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 0c6e26f..9a656d9 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of_address.h>
-#include <dt-bindings/clock/meson8b-clkc.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
 
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b2f29f7..8bd91cf 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -36,4 +36,108 @@
 #define HHI_SYS_PLL_CNTL		0x300 /* 0xc0 offset in data sheet */
 #define HHI_VID_PLL_CNTL		0x320 /* 0xc8 offset in data sheet */
 
+/*
+ * CLKID index values
+ *
+ * These indices are entirely contrived and do not map onto the hardware.
+ * Migrate them out of this header and into the DT header file when they need
+ * to be exposed to client nodes in DT: include/dt-bindings/clock/meson8b-clkc.h
+ */
+
+#define CLKID_UNUSED		0
+#define CLKID_XTAL		1
+#define CLKID_PLL_FIXED		2
+#define CLKID_PLL_VID		3
+#define CLKID_PLL_SYS		4
+#define CLKID_FCLK_DIV2		5
+#define CLKID_FCLK_DIV3		6
+#define CLKID_FCLK_DIV4		7
+#define CLKID_FCLK_DIV5		8
+#define CLKID_FCLK_DIV7		9
+#define CLKID_CLK81		10
+#define CLKID_MALI		11
+#define CLKID_CPUCLK		12
+#define CLKID_ZERO		13
+#define CLKID_MPEG_SEL		14
+#define CLKID_MPEG_DIV		15
+#define CLKID_DDR		16
+#define CLKID_DOS		17
+#define CLKID_ISA		18
+#define CLKID_PL301		19
+#define CLKID_PERIPHS		20
+#define CLKID_SPICC		21
+#define CLKID_I2C		22
+#define CLKID_SAR_ADC		23
+#define CLKID_SMART_CARD	24
+#define CLKID_RNG0		25
+#define CLKID_UART0		26
+#define CLKID_SDHC		27
+#define CLKID_STREAM		28
+#define CLKID_ASYNC_FIFO	29
+#define CLKID_SDIO		30
+#define CLKID_ABUF		31
+#define CLKID_HIU_IFACE		32
+#define CLKID_ASSIST_MISC	33
+#define CLKID_SPI		34
+#define CLKID_I2S_SPDIF		35
+#define CLKID_ETH		36
+#define CLKID_DEMUX		37
+#define CLKID_AIU_GLUE		38
+#define CLKID_IEC958		39
+#define CLKID_I2S_OUT		40
+#define CLKID_AMCLK		41
+#define CLKID_AIFIFO2		42
+#define CLKID_MIXER		43
+#define CLKID_MIXER_IFACE	44
+#define CLKID_ADC		45
+#define CLKID_BLKMV		46
+#define CLKID_AIU		47
+#define CLKID_UART1		48
+#define CLKID_G2D		49
+#define CLKID_USB0		50
+#define CLKID_USB1		51
+#define CLKID_RESET		52
+#define CLKID_NAND		53
+#define CLKID_DOS_PARSER	54
+#define CLKID_USB		55
+#define CLKID_VDIN1		56
+#define CLKID_AHB_ARB0		57
+#define CLKID_EFUSE		58
+#define CLKID_BOOT_ROM		59
+#define CLKID_AHB_DATA_BUS	60
+#define CLKID_AHB_CTRL_BUS	61
+#define CLKID_HDMI_INTR_SYNC	62
+#define CLKID_HDMI_PCLK		63
+#define CLKID_USB1_DDR_BRIDGE	64
+#define CLKID_USB0_DDR_BRIDGE	65
+#define CLKID_MMC_PCLK		66
+#define CLKID_DVIN		67
+#define CLKID_UART2		68
+#define CLKID_SANA		69
+#define CLKID_VPU_INTR		70
+#define CLKID_SEC_AHB_AHB3_BRIDGE	71
+#define CLKID_CLK81_A9		72
+#define CLKID_VCLK2_VENCI0	73
+#define CLKID_VCLK2_VENCI1	74
+#define CLKID_VCLK2_VENCP0	75
+#define CLKID_VCLK2_VENCP1	76
+#define CLKID_GCLK_VENCI_INT	77
+#define CLKID_GCLK_VENCP_INT	78
+#define CLKID_DAC_CLK		79
+#define CLKID_AOCLK_GATE	80
+#define CLKID_IEC958_GATE	81
+#define CLKID_ENC480P		82
+#define CLKID_RNG1		83
+#define CLKID_GCLK_VENCL_INT	84
+#define CLKID_VCLK2_VENCLMCC	85
+#define CLKID_VCLK2_VENCL	86
+#define CLKID_VCLK2_OTHER	87
+#define CLKID_EDP		88
+#define CLKID_AO_MEDIA_CPU	89
+#define CLKID_AO_AHB_SRAM	90
+#define CLKID_AO_AHB_BUS	91
+#define CLKID_AO_IFACE		92
+
+#define CLK_NR_CLKS		93
+
 #endif /* __MESON8B_H */
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 595a58d..a55ff8c 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -22,6 +22,4 @@
 #define CLKID_MPEG_SEL		14
 #define CLKID_MPEG_DIV		15
 
-#define CLK_NR_CLKS		(CLKID_MPEG_DIV + 1)
-
 #endif /* __MESON8B_CLKC_H */
-- 
2.5.0
