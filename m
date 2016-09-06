Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 2/2] clk: zx: register ZX296718 clocks
Date: Tue,  6 Sep 2016 14:02:42 +0800
Message-Id: <1473141762-4775-3-git-send-email-jun.nie@linaro.org>
In-Reply-To: <1473141762-4775-1-git-send-email-jun.nie@linaro.org>
References: <1473141762-4775-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The ZX296718 clocks are statically listed and registered. More
clock will be added later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 .../devicetree/bindings/clock/zx296718-clk.txt     |  35 +
 drivers/clk/zte/Makefile                           |   1 +
 drivers/clk/zte/clk-zx296718.c                     | 924 +++++++++++++++++++++
 drivers/clk/zte/clk.h                              | 125 +++
 include/dt-bindings/clock/zx296718-clock.h         | 163 ++++
 5 files changed, 1248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zx296718-clk.txt
 create mode 100644 drivers/clk/zte/clk-zx296718.c
 create mode 100644 include/dt-bindings/clock/zx296718-clock.h

diff --git a/Documentation/devicetree/bindings/clock/zx296718-clk.txt b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
new file mode 100644
index 0000000..4cee11f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
@@ -0,0 +1,35 @@
+Device Tree Clock bindings for ZTE zx296718
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be one of the following:
+	"zte,zx296718-topcrm":
+		zx296718 top clock selection, divider and gating
+
+	"zte,zx296718-lsp0crm" and
+	"zte,zx296718-lsp1crm":
+		zx296718 device level clock selection and gating
+
+- reg: Address and length of the register set
+
+The clock consumer should specify the desired clock by having the clock
+ID in its "clocks" phandle cell. See include/dt-bindings/clock/zx296718-clock.h
+for the full list of zx296718 clock IDs.
+
+
+topclk: topcrm@9800000 {
+        compatible = "zte,zx296718-topcrm-clk";
+        reg = <0x01461000 0x1000>;
+        #clock-cells = <1>;
+};
+
+usbphy0:usb-phy0{
+	compatible = "zte,zx296718-usb-phy";
+	#phy-cells = <0>;
+	clocks = <&topcrm USB20_PHY_CLK>;
+	clock-names = "phyclk";
+	status = "okay";
+};
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
index 74005aa..83374bf 100644
--- a/drivers/clk/zte/Makefile
+++ b/drivers/clk/zte/Makefile
@@ -1,2 +1,3 @@
 obj-y := clk.o
 obj-$(CONFIG_SOC_ZX296702) += clk-zx296702.o
+obj-$(CONFIG_ARCH_ZX) += clk-zx296718.o
diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-zx296718.c
new file mode 100644
index 0000000..025e324
--- /dev/null
+++ b/drivers/clk/zte/clk-zx296718.c
@@ -0,0 +1,924 @@
+/*
+ * Copyright (C) 2015 - 2016 ZTE Corporation.
+ * Copyright (C) 2016 Linaro Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/zx296718-clock.h>
+#include "clk.h"
+
+/* TOP CRM */
+#define TOP_CLK_MUX0	0x04
+#define TOP_CLK_MUX1	0x08
+#define TOP_CLK_MUX2	0x0c
+#define TOP_CLK_MUX3	0x10
+#define TOP_CLK_MUX4	0x14
+#define TOP_CLK_MUX5	0x18
+#define TOP_CLK_MUX6	0x1c
+#define TOP_CLK_MUX7	0x20
+#define TOP_CLK_MUX9	0x28
+
+
+#define TOP_CLK_GATE0	0x34
+#define TOP_CLK_GATE1	0x38
+#define TOP_CLK_GATE2	0x3c
+#define TOP_CLK_GATE3	0x40
+#define TOP_CLK_GATE4	0x44
+#define TOP_CLK_GATE5	0x48
+#define TOP_CLK_GATE6	0x4c
+
+#define TOP_CLK_DIV0	0x58
+
+#define PLL_CPU_REG	0x80
+#define PLL_VGA_REG	0xb0
+#define PLL_DDR_REG	0xa0
+
+/* LSP0 CRM */
+#define LSP0_TIMER3_CLK	0x4
+#define LSP0_TIMER4_CLK	0x8
+#define LSP0_TIMER5_CLK	0xc
+#define LSP0_UART3_CLK	0x10
+#define LSP0_UART1_CLK	0x14
+#define LSP0_UART2_CLK	0x18
+#define LSP0_SPIFC0_CLK	0x1c
+#define LSP0_I2C4_CLK	0x20
+#define LSP0_I2C5_CLK	0x24
+#define LSP0_SSP0_CLK	0x28
+#define LSP0_SSP1_CLK	0x2c
+#define LSP0_USIM0_CLK	0x30
+#define LSP0_GPIO_CLK	0x34
+#define LSP0_I2C3_CLK	0x38
+
+/* LSP1 CRM */
+#define LSP1_UART4_CLK	0x08
+#define LSP1_UART5_CLK	0x0c
+#define LSP1_PWM_CLK	0x10
+#define LSP1_I2C2_CLK	0x14
+#define LSP1_SSP2_CLK	0x1c
+#define LSP1_SSP3_CLK	0x20
+#define LSP1_SSP4_CLK	0x24
+#define LSP1_USIM1_CLK	0x28
+
+/* audio lsp */
+#define AUDIO_I2S0_DIV_CFG1	0x10
+#define AUDIO_I2S0_DIV_CFG2	0x14
+#define AUDIO_I2S0_CLK		0x18
+#define AUDIO_I2S1_DIV_CFG1	0x20
+#define AUDIO_I2S1_DIV_CFG2	0x24
+#define AUDIO_I2S1_CLK		0x28
+#define AUDIO_I2S2_DIV_CFG1	0x30
+#define AUDIO_I2S2_DIV_CFG2	0x34
+#define AUDIO_I2S2_CLK		0x38
+#define AUDIO_I2S3_DIV_CFG1	0x40
+#define AUDIO_I2S3_DIV_CFG2	0x44
+#define AUDIO_I2S3_CLK		0x48
+#define AUDIO_I2C0_CLK		0x50
+#define AUDIO_SPDIF0_DIV_CFG1	0x60
+#define AUDIO_SPDIF0_DIV_CFG2	0x64
+#define AUDIO_SPDIF0_CLK	0x68
+#define AUDIO_SPDIF1_DIV_CFG1	0x70
+#define AUDIO_SPDIF1_DIV_CFG2	0x74
+#define AUDIO_SPDIF1_CLK	0x78
+#define AUDIO_TIMER_CLK		0x80
+#define AUDIO_TDM_CLK		0x90
+#define AUDIO_TS_CLK		0xa0
+
+static DEFINE_SPINLOCK(clk_lock);
+
+static struct zx_pll_config pll_cpu_table[] = {
+	PLL_RATE(1312000000, 0x00103621, 0x04aaaaaa),
+	PLL_RATE(1407000000, 0x00103a21, 0x04aaaaaa),
+	PLL_RATE(1503000000, 0x00103e21, 0x04aaaaaa),
+	PLL_RATE(1600000000, 0x00104221, 0x04aaaaaa),
+};
+
+PNAME(osc) = {
+	"osc24m",
+	"osc32k",
+};
+
+PNAME(dbg_wclk_p) = {
+	"clk334m",
+	"clk466m",
+	"clk396m",
+	"clk250m",
+};
+
+PNAME(a72_coreclk_p) = {
+	"osc24m",
+	"pll_mm0_1188m",
+	"pll_mm1_1296m",
+	"clk1000m",
+	"clk648m",
+	"clk1600m",
+	"pll_audio_1800m",
+	"pll_vga_1800m",
+};
+
+PNAME(cpu_periclk_p) = {
+	"osc24m",
+	"clk500m",
+	"clk594m",
+	"clk466m",
+	"clk294m",
+	"clk334m",
+	"clk250m",
+	"clk125m",
+};
+
+PNAME(a53_coreclk_p) = {
+	"osc24m",
+	"clk1000m",
+	"pll_mm0_1188m",
+	"clk648m",
+	"clk500m",
+	"clk800m",
+	"clk1600m",
+	"pll_audio_1800m",
+};
+
+PNAME(sec_wclk_p) = {
+	"osc24m",
+	"clk396m",
+	"clk334m",
+	"clk297m",
+	"clk250m",
+	"clk198m",
+	"clk148m5",
+	"clk99m",
+};
+
+PNAME(sd_nand_wclk_p) = {
+	"osc24m",
+	"clk49m5",
+	"clk99m",
+	"clk198m",
+	"clk167m",
+	"clk148m5",
+	"clk125m",
+	"clk216m",
+};
+
+PNAME(emmc_wclk_p) = {
+	"osc24m",
+	"clk198m",
+	"clk99m",
+	"clk396m",
+	"clk334m",
+	"clk297m",
+	"clk250m",
+	"clk148m5",
+};
+
+PNAME(clk32_p) = {
+	"osc32k",
+	"clk32k768",
+};
+
+PNAME(usb_ref24m_p) = {
+	"osc32k",
+	"clk32k768",
+};
+
+PNAME(sys_noc_alck_p) = {
+	"osc24m",
+	"clk250m",
+	"clk198m",
+	"clk148m5",
+	"clk108m",
+	"clk54m",
+	"clk216m",
+	"clk240m",
+};
+
+PNAME(vde_aclk_p) = {
+	"clk334m",
+	"clk594m",
+	"clk500m",
+	"clk432m",
+	"clk480m",
+	"clk297m",
+	"clk_vga",  /*600MHz*/
+	"clk294m",
+};
+
+PNAME(vce_aclk_p) = {
+	"clk334m",
+	"clk594m",
+	"clk500m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk_vga",  /*600MHz*/
+	"clk294m",
+};
+
+PNAME(hde_aclk_p) = {
+	"clk334m",
+	"clk594m",
+	"clk500m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk_vga",  /*600MHz*/
+	"clk294m",
+};
+
+PNAME(gpu_aclk_p) = {
+	"clk334m",
+	"clk648m",
+	"clk594m",
+	"clk500m",
+	"clk396m",
+	"clk297m",
+	"clk_vga",  /*600MHz*/
+	"clk294m",
+};
+
+PNAME(sappu_aclk_p) = {
+	"clk396m",
+	"clk500m",
+	"clk250m",
+	"clk148m5",
+};
+
+PNAME(sappu_wclk_p) = {
+	"clk198m",
+	"clk396m",
+	"clk334m",
+	"clk297m",
+	"clk250m",
+	"clk148m5",
+	"clk125m",
+	"clk99m",
+};
+
+PNAME(vou_aclk_p) = {
+	"clk334m",
+	"clk594m",
+	"clk500m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk_vga",  /*600MHz*/
+	"clk294m",
+};
+
+PNAME(vou_main_wclk_p) = {
+	"clk108m",
+	"clk594m",
+	"clk297m",
+	"clk148m5",
+	"clk74m25",
+	"clk54m",
+	"clk27m",
+	"clk_vga",
+};
+
+PNAME(vou_aux_wclk_p) = {
+	"clk108m",
+	"clk148m5",
+	"clk74m25",
+	"clk54m",
+	"clk27m",
+	"clk_vga",
+	"clk54m_mm0",
+	"clk"
+};
+
+PNAME(vou_ppu_wclk_p) = {
+	"clk334m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk250m",
+	"clk125m",
+	"clk198m",
+	"clk99m",
+};
+
+PNAME(vga_i2c_wclk_p) = {
+	"osc24m",
+	"clk99m",
+};
+
+PNAME(viu_m0_aclk_p) = {
+	"clk334m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk250m",
+	"clk125m",
+	"clk198m",
+	"osc24m",
+};
+
+PNAME(viu_m1_aclk_p) = {
+	"clk198m",
+	"clk250m",
+	"clk297m",
+	"clk125m",
+	"clk396m",
+	"clk334m",
+	"clk148m5",
+	"osc24m",
+};
+
+PNAME(viu_clk_p) = {
+	"clk198m",
+	"clk334m",
+	"clk297m",
+	"clk250m",
+	"clk396m",
+	"clk125m",
+	"clk99m",
+	"clk148m5",
+};
+
+PNAME(viu_jpeg_clk_p) = {
+	"clk334m",
+	"clk480m",
+	"clk432m",
+	"clk396m",
+	"clk297m",
+	"clk250m",
+	"clk125m",
+	"clk198m",
+};
+
+PNAME(ts_sys_clk_p) = {
+	"clk192m",
+	"clk167m",
+	"clk125m",
+	"clk99m",
+};
+
+PNAME(wdt_ares_p) = {
+	"osc24m",
+	"clk32k"
+};
+
+static struct clk_zx_pll zx296718_pll_clk[] = {
+	ZX296718_PLL("pll_cpu",	"osc24m",	PLL_CPU_REG,	pll_cpu_table),
+};
+
+static struct zx_clk_fixed_factor top_ffactor_clk[] = {
+	FFACTOR(0, "clk4m",		"osc24m", 1, 6,  0),
+	FFACTOR(0, "clk2m",		"osc24m", 1, 12, 0),
+	/* pll cpu */
+	FFACTOR(0, "clk1600m",		"pll_cpu", 1, 1, CLK_SET_RATE_PARENT),
+	FFACTOR(0, "clk800m",		"pll_cpu", 1, 2, CLK_SET_RATE_PARENT),
+	/* pll mac */
+	FFACTOR(0, "clk25m",		"pll_mac", 1, 40, 0),
+	FFACTOR(0, "clk125m",		"pll_mac", 1, 8, 0),
+	FFACTOR(0, "clk250m",		"pll_mac", 1, 4, 0),
+	FFACTOR(0, "clk50m",		"pll_mac", 1, 20, 0),
+	FFACTOR(0, "clk500m",		"pll_mac", 1, 2, 0),
+	FFACTOR(0, "clk1000m",		"pll_mac", 1, 1, 0),
+	FFACTOR(0, "clk334m",		"pll_mac", 1, 3, 0),
+	FFACTOR(0, "clk167m",		"pll_mac", 1, 6, 0),
+	/* pll mm */
+	FFACTOR(0, "clk54m_mm0",	"pll_mm0", 1, 22, 0),
+	FFACTOR(0, "clk74m25",		"pll_mm0", 1, 16, 0),
+	FFACTOR(0, "clk148m5",		"pll_mm0", 1, 8, 0),
+	FFACTOR(0, "clk297m",		"pll_mm0", 1, 4, 0),
+	FFACTOR(0, "clk594m",		"pll_mm0", 1, 2, 0),
+	FFACTOR(0, "pll_mm0_1188m",	"pll_mm0", 1, 1, 0),
+	FFACTOR(0, "clk396m",		"pll_mm0", 1, 3, 0),
+	FFACTOR(0, "clk198m",		"pll_mm0", 1, 6, 0),
+	FFACTOR(0, "clk99m",		"pll_mm0", 1, 12, 0),
+	FFACTOR(0, "clk49m5",		"pll_mm0", 1, 24, 0),
+	/* pll mm */
+	FFACTOR(0, "clk324m",		"pll_mm1", 1, 4, 0),
+	FFACTOR(0, "clk648m",		"pll_mm1", 1, 2, 0),
+	FFACTOR(0, "pll_mm1_1296m",	"pll_mm1", 1, 1, 0),
+	FFACTOR(0, "clk216m",		"pll_mm1", 1, 6, 0),
+	FFACTOR(0, "clk432m",		"pll_mm1", 1, 3, 0),
+	FFACTOR(0, "clk108m",		"pll_mm1", 1, 12, 0),
+	FFACTOR(0, "clk72m",		"pll_mm1", 1, 18, 0),
+	FFACTOR(0, "clk27m",		"pll_mm1", 1, 48, 0),
+	FFACTOR(0, "clk54m",		"pll_mm1", 1, 24, 0),
+	/* vga */
+	FFACTOR(0, "pll_vga_1800m",	"pll_vga", 1, 1, 0),
+	FFACTOR(0, "clk_vga",		"pll_vga", 1, 2, 0),
+	/* pll ddr */
+	FFACTOR(0, "clk466m",		"pll_ddr", 1, 2, 0),
+
+	/* pll audio */
+	FFACTOR(0, "pll_audio_1800m",	"pll_audio", 1, 1, 0),
+	FFACTOR(0, "clk32k768",		"pll_audio", 1, 27000, 0),
+	FFACTOR(0, "clk16m384",		"pll_audio", 1, 54, 0),
+	FFACTOR(0, "clk294m",		"pll_audio", 1, 3, 0),
+
+	/* pll hsic*/
+	FFACTOR(0, "clk240m",		"pll_hsic", 1, 4, 0),
+	FFACTOR(0, "clk480m",		"pll_hsic", 1, 2, 0),
+	FFACTOR(0, "clk192m",		"pll_hsic", 1, 5, 0),
+	FFACTOR(0, "clk_pll_24m",	"pll_hsic", 1, 40, 0),
+	FFACTOR(0, "emmc_mux_div2",	"emmc_mux", 1, 2, CLK_SET_RATE_PARENT),
+};
+
+static struct clk_div_table noc_div_table[] = {
+	{ .val = 1, .div = 2, },
+	{ .val = 3, .div = 4, },
+};
+static struct zx_clk_div top_div_clk[] = {
+	DIV_T(0, "sys_noc_hclk", "sys_noc_aclk", TOP_CLK_DIV0, 0, 2, 0, noc_div_table),
+	DIV_T(0, "sys_noc_pclk", "sys_noc_aclk", TOP_CLK_DIV0, 4, 2, 0, noc_div_table),
+};
+
+static struct zx_clk_mux top_mux_clk[] = {
+	MUX(0, "dbg_mux",	 dbg_wclk_p,	  TOP_CLK_MUX0, 12, 2),
+	MUX(0, "a72_mux",	 a72_coreclk_p,	  TOP_CLK_MUX0, 8, 3),
+	MUX(0, "cpu_peri_mux",	 cpu_periclk_p,	  TOP_CLK_MUX0, 4, 3),
+	MUX_F(0, "a53_mux",	 a53_coreclk_p,	  TOP_CLK_MUX0, 0, 3, CLK_SET_RATE_PARENT, 0),
+	MUX(0, "sys_noc_aclk",	 sys_noc_alck_p,  TOP_CLK_MUX1, 0, 3),
+	MUX(0, "sec_mux",	 sec_wclk_p,	  TOP_CLK_MUX2, 16, 3),
+	MUX(0, "sd1_mux",	 sd_nand_wclk_p,  TOP_CLK_MUX2, 12, 3),
+	MUX(0, "sd0_mux",	 sd_nand_wclk_p,  TOP_CLK_MUX2, 8, 3),
+	MUX(0, "emmc_mux",	 emmc_wclk_p,	  TOP_CLK_MUX2, 4, 3),
+	MUX(0, "nand_mux",	 sd_nand_wclk_p,  TOP_CLK_MUX2, 0, 3),
+	MUX(0, "usb_ref24m_mux", usb_ref24m_p,	  TOP_CLK_MUX9, 16, 1),
+	MUX(0, "clk32k",	 clk32_p,	  TOP_CLK_MUX9, 12, 1),
+	MUX_F(0, "wdt_mux",	 wdt_ares_p,	  TOP_CLK_MUX9, 8, 1, CLK_SET_RATE_PARENT, 0),
+	MUX(0, "timer_mux",	 osc,		  TOP_CLK_MUX9, 4, 1),
+	MUX(0, "vde_mux",	 vde_aclk_p,	  TOP_CLK_MUX4,  0, 3),
+	MUX(0, "vce_mux",	 vce_aclk_p,	  TOP_CLK_MUX4,  4, 3),
+	MUX(0, "hde_mux",	 hde_aclk_p,	  TOP_CLK_MUX4,  8, 3),
+	MUX(0, "gpu_mux",	 gpu_aclk_p,	  TOP_CLK_MUX5,  0, 3),
+	MUX(0, "sappu_a_mux",	 sappu_aclk_p,	  TOP_CLK_MUX5,  4, 2),
+	MUX(0, "sappu_w_mux",	 sappu_wclk_p,	  TOP_CLK_MUX5,  8, 3),
+	MUX(0, "vou_a_mux",	 vou_aclk_p,	  TOP_CLK_MUX7,  0, 3),
+	MUX(0, "vou_main_w_mux", vou_main_wclk_p, TOP_CLK_MUX7,  4, 3),
+	MUX(0, "vou_aux_w_mux",	 vou_aux_wclk_p,  TOP_CLK_MUX7,  8, 3),
+	MUX(0, "vou_ppu_w_mux",	 vou_ppu_wclk_p,  TOP_CLK_MUX7, 12, 3),
+	MUX(0, "vga_i2c_mux",	 vga_i2c_wclk_p,  TOP_CLK_MUX7, 16, 1),
+	MUX(0, "viu_m0_a_mux",	 viu_m0_aclk_p,	  TOP_CLK_MUX6,  0, 3),
+	MUX(0, "viu_m1_a_mux",	 viu_m1_aclk_p,	  TOP_CLK_MUX6,  4, 3),
+	MUX(0, "viu_w_mux",	 viu_clk_p,	  TOP_CLK_MUX6,  8, 3),
+	MUX(0, "viu_jpeg_w_mux", viu_jpeg_clk_p,  TOP_CLK_MUX6, 12, 3),
+	MUX(0, "ts_sys_mux",	 ts_sys_clk_p,    TOP_CLK_MUX6, 16, 2),
+};
+
+static struct zx_clk_gate top_gate_clk[] = {
+	GATE(CPU_DBG_GATE,    "dbg_wclk",        "dbg_mux",        TOP_CLK_GATE0, 4, CLK_SET_RATE_PARENT, 0),
+	GATE(A72_GATE,        "a72_coreclk",     "a72_mux",        TOP_CLK_GATE0, 3, CLK_SET_RATE_PARENT, 0),
+	GATE(CPU_PERI_GATE,   "cpu_peri",        "cpu_peri_mux",   TOP_CLK_GATE0, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(A53_GATE,        "a53_coreclk",     "a53_mux",        TOP_CLK_GATE0, 0, CLK_SET_RATE_PARENT, 0),
+	GATE(SD1_WCLK,        "sd1_wclk",        "sd1_mux",        TOP_CLK_GATE1, 13, CLK_SET_RATE_PARENT, 0),
+	GATE(SD0_WCLK,        "sd0_wclk",        "sd0_mux",        TOP_CLK_GATE1, 9, CLK_SET_RATE_PARENT, 0),
+	GATE(EMMC_WCLK,       "emmc_wclk",       "emmc_mux_div2",  TOP_CLK_GATE0, 5, CLK_SET_RATE_PARENT, 0),
+	GATE(EMMC_NAND_AXI,   "emmc_nand_aclk",  "sys_noc_aclk",   TOP_CLK_GATE1, 4, CLK_SET_RATE_PARENT, 0),
+	GATE(NAND_WCLK,       "nand_wclk",       "nand_mux",       TOP_CLK_GATE0, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(EMMC_NAND_AHB,   "emmc_nand_hclk",  "sys_noc_hclk",   TOP_CLK_GATE1, 0, CLK_SET_RATE_PARENT, 0),
+	GATE(0,               "lsp1_pclk",       "sys_noc_pclk",   TOP_CLK_GATE2, 31, 0,                  0),
+	GATE(LSP1_148M5,      "lsp1_148m5",      "clk148m5",       TOP_CLK_GATE2, 30, 0,                  0),
+	GATE(LSP1_99M,        "lsp1_99m",        "clk99m",         TOP_CLK_GATE2, 29, 0,                  0),
+	GATE(LSP1_24M,        "lsp1_24m",        "osc24m",         TOP_CLK_GATE2, 28, 0,                  0),
+	GATE(LSP0_74M25,      "lsp0_74m25",      "clk74m25",       TOP_CLK_GATE2, 25, 0,                  0),
+	GATE(0,               "lsp0_pclk",       "sys_noc_pclk",   TOP_CLK_GATE2, 24, 0,                  0),
+	GATE(LSP0_32K,        "lsp0_32k",        "osc32k",         TOP_CLK_GATE2, 23, 0,                  0),
+	GATE(LSP0_148M5,      "lsp0_148m5",      "clk148m5",       TOP_CLK_GATE2, 22, 0,                  0),
+	GATE(LSP0_99M,        "lsp0_99m",        "clk99m",         TOP_CLK_GATE2, 21, 0,                  0),
+	GATE(LSP0_24M,        "lsp0_24m",        "osc24m",         TOP_CLK_GATE2, 20, 0,                  0),
+	GATE(AUDIO_99M,       "audio_99m",       "clk99m",         TOP_CLK_GATE5, 27, 0,                  0),
+	GATE(AUDIO_24M,       "audio_24m",       "osc24m",         TOP_CLK_GATE5, 28, 0,                  0),
+	GATE(AUDIO_16M384,    "audio_16m384",    "clk16m384",      TOP_CLK_GATE5, 29, 0,                  0),
+	GATE(AUDIO_32K,       "audio_32k",       "clk32k",         TOP_CLK_GATE5, 30, 0,                  0),
+	GATE(WDT_WCLK,        "wdt_wclk",        "wdt_mux",        TOP_CLK_GATE6, 9, CLK_SET_RATE_PARENT, 0),
+	GATE(TIMER_WCLK,      "timer_wclk",      "timer_mux",      TOP_CLK_GATE6, 5, CLK_SET_RATE_PARENT, 0),
+	GATE(VDE_ACLK,        "vde_aclk",        "vde_mux",        TOP_CLK_GATE3, 0,  CLK_SET_RATE_PARENT, 0),
+	GATE(VCE_ACLK,        "vce_aclk",        "vce_mux",        TOP_CLK_GATE3, 4,  CLK_SET_RATE_PARENT, 0),
+	GATE(HDE_ACLK,        "hde_aclk",        "hde_mux",        TOP_CLK_GATE3, 8,  CLK_SET_RATE_PARENT, 0),
+	GATE(GPU_ACLK,        "gpu_aclk",        "gpu_mux",        TOP_CLK_GATE3, 16, CLK_SET_RATE_PARENT, 0),
+	GATE(SAPPU_ACLK,      "sappu_aclk",      "sappu_a_mux",    TOP_CLK_GATE3, 20, CLK_SET_RATE_PARENT, 0),
+	GATE(SAPPU_WCLK,      "sappu_wclk",      "sappu_w_mux",    TOP_CLK_GATE3, 22, CLK_SET_RATE_PARENT, 0),
+	GATE(VOU_ACLK,        "vou_aclk",        "vou_a_mux",      TOP_CLK_GATE4, 16, CLK_SET_RATE_PARENT, 0),
+	GATE(VOU_MAIN_WCLK,   "vou_main_wclk",   "vou_main_w_mux", TOP_CLK_GATE4, 18, CLK_SET_RATE_PARENT, 0),
+	GATE(VOU_AUX_WCLK,    "vou_aux_wclk",    "vou_aux_w_mux",  TOP_CLK_GATE4, 19, CLK_SET_RATE_PARENT, 0),
+	GATE(VOU_PPU_WCLK,    "vou_ppu_wclk",    "vou_ppu_w_mux",  TOP_CLK_GATE4, 20, CLK_SET_RATE_PARENT, 0),
+	GATE(MIPI_CFG_CLK,    "mipi_cfg_clk",    "osc24m",         TOP_CLK_GATE4, 21, 0,                   0),
+	GATE(VGA_I2C_WCLK,    "vga_i2c_wclk",    "vga_i2c_mux",    TOP_CLK_GATE4, 23, CLK_SET_RATE_PARENT, 0),
+	GATE(MIPI_REF_CLK,    "mipi_ref_clk",    "clk27m",         TOP_CLK_GATE4, 24, 0,                   0),
+	GATE(HDMI_OSC_CEC,    "hdmi_osc_cec",    "clk2m",          TOP_CLK_GATE4, 22, 0,                   0),
+	GATE(HDMI_OSC_CLK,    "hdmi_osc_clk",    "clk240m",        TOP_CLK_GATE4, 25, 0,                   0),
+	GATE(HDMI_XCLK,       "hdmi_xclk",       "osc24m",         TOP_CLK_GATE4, 26, 0,                   0),
+	GATE(VIU_M0_ACLK,     "viu_m0_aclk",     "viu_m0_a_mux",   TOP_CLK_GATE4, 0,  CLK_SET_RATE_PARENT, 0),
+	GATE(VIU_M1_ACLK,     "viu_m1_aclk",     "viu_m1_a_mux",   TOP_CLK_GATE4, 1,  CLK_SET_RATE_PARENT, 0),
+	GATE(VIU_WCLK,        "viu_wclk",        "viu_w_mux",      TOP_CLK_GATE4, 2,  CLK_SET_RATE_PARENT, 0),
+	GATE(VIU_JPEG_WCLK,   "viu_jpeg_wclk",   "viu_jpeg_w_mux", TOP_CLK_GATE4, 3,  CLK_SET_RATE_PARENT, 0),
+	GATE(VIU_CFG_CLK,     "viu_cfg_clk",     "osc24m",         TOP_CLK_GATE4, 6,  0,                   0),
+	GATE(TS_SYS_WCLK,     "ts_sys_wclk",     "ts_sys_mux",     TOP_CLK_GATE5, 2,  CLK_SET_RATE_PARENT, 0),
+	GATE(TS_SYS_108M,     "ts_sys_108m",     "clk108m",        TOP_CLK_GATE5, 3,  0,                   0),
+	GATE(USB20_HCLK,      "usb20_hclk",      "sys_noc_hclk",   TOP_CLK_GATE2, 12, 0,                   0),
+	GATE(USB20_PHY_CLK,   "usb20_phy_clk",   "usb_ref24m_mux", TOP_CLK_GATE2, 13, 0,                   0),
+	GATE(USB21_HCLK,      "usb21_hclk",      "sys_noc_hclk",   TOP_CLK_GATE2, 14, 0,                   0),
+	GATE(USB21_PHY_CLK,   "usb21_phy_clk",   "usb_ref24m_mux", TOP_CLK_GATE2, 15, 0,                   0),
+	GATE(GMAC_RMIICLK,    "gmac_rmii_clk",   "clk50m",         TOP_CLK_GATE2, 3, 0,                    0),
+	GATE(GMAC_PCLK,       "gmac_pclk",       "clk198m",        TOP_CLK_GATE2, 1, 0,                    0),
+	GATE(GMAC_ACLK,       "gmac_aclk",       "clk49m5",        TOP_CLK_GATE2, 0, 0,                    0),
+	GATE(GMAC_RFCLK,      "gmac_refclk",     "clk25m",         TOP_CLK_GATE2, 4, 0,                    0),
+	GATE(SD1_AHB,         "sd1_hclk",        "sys_noc_hclk",   TOP_CLK_GATE1, 12,  0,                  0),
+	GATE(SD0_AHB,         "sd0_hclk",        "sys_noc_hclk",   TOP_CLK_GATE1, 8,  0,                   0),
+	GATE(TEMPSENSOR_GATE, "tempsensor_gate", "clk4m",          TOP_CLK_GATE5, 31,  0,                  0),
+};
+
+static struct clk_hw_onecell_data top_hw_onecell_data = {
+	.num = TOP_NR_CLKS,
+	.hws = {
+		[TOP_NR_CLKS - 1] = NULL,
+	},
+};
+
+static int __init top_clocks_init(struct device_node *np)
+{
+	void __iomem *reg_base;
+	int i, ret;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base) {
+		pr_err("%s: Unable to map clk base\n", __func__);
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(zx296718_pll_clk); i++) {
+		zx296718_pll_clk[i].reg_base += (u64)reg_base;
+		ret = clk_hw_register(NULL, &zx296718_pll_clk[i].hw);
+		if (ret) {
+			pr_warn("top clk %s init error!\n",
+				zx296718_pll_clk[i].hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(top_ffactor_clk); i++) {
+		if (top_ffactor_clk[i].id)
+			top_hw_onecell_data.hws[top_ffactor_clk[i].id] =
+					&top_ffactor_clk[i].factor.hw;
+
+		ret = clk_hw_register(NULL, &top_ffactor_clk[i].factor.hw);
+		if (ret) {
+			pr_warn("top clk %s init error!\n",
+				top_ffactor_clk[i].factor.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(top_mux_clk); i++) {
+		if (top_mux_clk[i].id)
+			top_hw_onecell_data.hws[top_mux_clk[i].id] =
+					&top_mux_clk[i].mux.hw;
+
+		top_mux_clk[i].mux.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &top_mux_clk[i].mux.hw);
+		if (ret) {
+			pr_warn("top clk %s init error!\n",
+				top_mux_clk[i].mux.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(top_gate_clk); i++) {
+		if (top_gate_clk[i].id)
+			top_hw_onecell_data.hws[top_gate_clk[i].id] =
+					&top_gate_clk[i].gate.hw;
+
+		top_gate_clk[i].gate.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &top_gate_clk[i].gate.hw);
+		if (ret) {
+			pr_warn("top clk %s init error!\n",
+				top_gate_clk[i].gate.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(top_div_clk); i++) {
+		if (top_div_clk[i].id)
+			top_hw_onecell_data.hws[top_div_clk[i].id] =
+					&top_div_clk[i].div.hw;
+
+		top_div_clk[i].div.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &top_div_clk[i].div.hw);
+		if (ret) {
+			pr_warn("top clk %s init error!\n",
+				top_div_clk[i].div.hw.init->name);
+		}
+	}
+
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &top_hw_onecell_data))
+		panic("could not register clk provider\n");
+	pr_info("top clk init over, nr:%d\n", TOP_NR_CLKS);
+
+	return 0;
+}
+
+static struct clk_div_table common_even_div_table[] = {
+	{ .val = 0, .div = 1, },
+	{ .val = 1, .div = 2, },
+	{ .val = 3, .div = 4, },
+	{ .val = 5, .div = 6, },
+	{ .val = 7, .div = 8, },
+	{ .val = 9, .div = 10, },
+	{ .val = 11, .div = 12, },
+	{ .val = 13, .div = 14, },
+	{ .val = 15, .div = 16, },
+};
+
+static struct clk_div_table common_div_table[] = {
+	{ .val = 0, .div = 1, },
+	{ .val = 1, .div = 2, },
+	{ .val = 2, .div = 3, },
+	{ .val = 3, .div = 4, },
+	{ .val = 4, .div = 5, },
+	{ .val = 5, .div = 6, },
+	{ .val = 6, .div = 7, },
+	{ .val = 7, .div = 8, },
+	{ .val = 8, .div = 9, },
+	{ .val = 9, .div = 10, },
+	{ .val = 10, .div = 11, },
+	{ .val = 11, .div = 12, },
+	{ .val = 12, .div = 13, },
+	{ .val = 13, .div = 14, },
+	{ .val = 14, .div = 15, },
+	{ .val = 15, .div = 16, },
+};
+
+PNAME(lsp0_wclk_common_p) = {
+	"lsp0_24m",
+	"lsp0_99m",
+};
+
+PNAME(lsp0_wclk_timer3_p) = {
+	"timer3_div",
+	"lsp0_32k"
+};
+
+PNAME(lsp0_wclk_timer4_p) = {
+	"timer4_div",
+	"lsp0_32k"
+};
+
+PNAME(lsp0_wclk_timer5_p) = {
+	"timer5_div",
+	"lsp0_32k"
+};
+
+PNAME(lsp0_wclk_spifc0_p) = {
+	"lsp0_148m5",
+	"lsp0_24m",
+	"lsp0_99m",
+	"lsp0_74m25"
+};
+
+PNAME(lsp0_wclk_ssp_p) = {
+	"lsp0_148m5",
+	"lsp0_99m",
+	"lsp0_24m",
+};
+
+static struct zx_clk_mux lsp0_mux_clk[] = {
+	MUX(0, "timer3_wclk_mux", lsp0_wclk_timer3_p, LSP0_TIMER3_CLK, 4, 1),
+	MUX(0, "timer4_wclk_mux", lsp0_wclk_timer4_p, LSP0_TIMER4_CLK, 4, 1),
+	MUX(0, "timer5_wclk_mux", lsp0_wclk_timer5_p, LSP0_TIMER5_CLK, 4, 1),
+	MUX(0, "uart3_wclk_mux",  lsp0_wclk_common_p, LSP0_UART3_CLK,  4, 1),
+	MUX(0, "uart1_wclk_mux",  lsp0_wclk_common_p, LSP0_UART1_CLK,  4, 1),
+	MUX(0, "uart2_wclk_mux",  lsp0_wclk_common_p, LSP0_UART2_CLK,  4, 1),
+	MUX(0, "spifc0_wclk_mux", lsp0_wclk_spifc0_p, LSP0_SPIFC0_CLK, 4, 2),
+	MUX(0, "i2c4_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C4_CLK,   4, 1),
+	MUX(0, "i2c5_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C5_CLK,   4, 1),
+	MUX(0, "ssp0_wclk_mux",   lsp0_wclk_ssp_p,    LSP0_SSP0_CLK,   4, 1),
+	MUX(0, "ssp1_wclk_mux",   lsp0_wclk_ssp_p,    LSP0_SSP1_CLK,   4, 1),
+	MUX(0, "i2c3_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C3_CLK,   4, 1),
+};
+
+static struct zx_clk_gate lsp0_gate_clk[] = {
+	GATE(LSP0_TIMER3_WCLK, "timer3_wclk", "timer3_wclk_mux", LSP0_TIMER3_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_TIMER4_WCLK, "timer4_wclk", "timer4_wclk_mux", LSP0_TIMER4_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_TIMER5_WCLK, "timer5_wclk", "timer5_wclk_mux", LSP0_TIMER5_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_UART3_WCLK,  "uart3_wclk",  "uart3_wclk_mux",  LSP0_UART3_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_UART1_WCLK,  "uart1_wclk",  "uart1_wclk_mux",  LSP0_UART1_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_UART2_WCLK,  "uart2_wclk",  "uart2_wclk_mux",  LSP0_UART2_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_SPIFC0_WCLK, "spifc0_wclk", "spifc0_wclk_mux", LSP0_SPIFC0_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_I2C4_WCLK,   "i2c4_wclk",   "i2c4_wclk_mux",   LSP0_I2C4_CLK,   1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_I2C5_WCLK,   "i2c5_wclk",   "i2c5_wclk_mux",   LSP0_I2C5_CLK,   1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_SSP0_WCLK,   "ssp0_wclk",   "ssp0_div",        LSP0_SSP0_CLK,   1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_SSP1_WCLK,   "ssp1_wclk",   "ssp1_div",        LSP0_SSP1_CLK,   1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP0_I2C3_WCLK,   "i2c3_wclk",   "i2c3_wclk_mux",   LSP0_I2C3_CLK,   1, CLK_SET_RATE_PARENT, 0),
+};
+
+static struct zx_clk_div lsp0_div_clk[] = {
+	DIV_T(0, "timer3_div", "lsp0_24m", LSP0_TIMER3_CLK,  12, 4, 0, common_even_div_table),
+	DIV_T(0, "timer4_div", "lsp0_24m", LSP0_TIMER4_CLK,  12, 4, 0, common_even_div_table),
+	DIV_T(0, "timer5_div", "lsp0_24m", LSP0_TIMER5_CLK,  12, 4, 0, common_even_div_table),
+	DIV_T(0, "ssp0_div", "ssp0_wclk_mux", LSP0_SSP0_CLK, 12, 4, 0, common_even_div_table),
+	DIV_T(0, "ssp1_div", "ssp1_wclk_mux", LSP0_SSP1_CLK, 12, 4, 0, common_even_div_table),
+};
+
+static struct clk_hw_onecell_data lsp0_hw_onecell_data = {
+	.num = LSP0_NR_CLKS,
+	.hws = {
+		[LSP0_NR_CLKS - 1] = NULL,
+	},
+};
+
+static int __init lsp0_clocks_init(struct device_node *np)
+{
+	void __iomem *reg_base;
+	int i, ret;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base) {
+		pr_err("%s: Unable to map clk base\n", __func__);
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp0_mux_clk); i++) {
+		if (lsp0_mux_clk[i].id)
+			lsp0_hw_onecell_data.hws[lsp0_mux_clk[i].id] =
+					&lsp0_mux_clk[i].mux.hw;
+
+		lsp0_mux_clk[i].mux.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp0_mux_clk[i].mux.hw);
+		if (ret) {
+			pr_warn("lsp0 clk %s init error!\n",
+				lsp0_mux_clk[i].mux.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp0_gate_clk); i++) {
+		if (lsp0_gate_clk[i].id)
+			lsp0_hw_onecell_data.hws[lsp0_gate_clk[i].id] =
+					&lsp0_gate_clk[i].gate.hw;
+
+		lsp0_gate_clk[i].gate.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp0_gate_clk[i].gate.hw);
+		if (ret) {
+			pr_warn("lsp0 clk %s init error!\n",
+				lsp0_gate_clk[i].gate.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp0_div_clk); i++) {
+		if (lsp0_div_clk[i].id)
+			lsp0_hw_onecell_data.hws[lsp0_div_clk[i].id] =
+					&lsp0_div_clk[i].div.hw;
+
+		lsp0_div_clk[i].div.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp0_div_clk[i].div.hw);
+		if (ret) {
+			pr_warn("lsp0 clk %s init error!\n",
+				lsp0_div_clk[i].div.hw.init->name);
+		}
+	}
+
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &lsp0_hw_onecell_data))
+		panic("could not register clk provider\n");
+	pr_info("lsp0-clk init over:%d\n", LSP0_NR_CLKS);
+
+	return 0;
+}
+
+PNAME(lsp1_wclk_common_p) = {
+	"lsp1_24m",
+	"lsp1_99m",
+};
+
+PNAME(lsp1_wclk_ssp_p) = {
+	"lsp1_148m5",
+	"lsp1_99m",
+	"lsp1_24m",
+};
+
+static struct zx_clk_mux lsp1_mux_clk[] = {
+	MUX(0, "uart4_wclk_mux", lsp1_wclk_common_p, LSP1_UART4_CLK, 4, 1),
+	MUX(0, "uart5_wclk_mux", lsp1_wclk_common_p, LSP1_UART5_CLK, 4, 1),
+	MUX(0, "pwm_wclk_mux",   lsp1_wclk_common_p, LSP1_PWM_CLK,   4, 1),
+	MUX(0, "i2c2_wclk_mux",  lsp1_wclk_common_p, LSP1_I2C2_CLK,  4, 1),
+	MUX(0, "ssp2_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP2_CLK,  4, 2),
+	MUX(0, "ssp3_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP3_CLK,  4, 2),
+	MUX(0, "ssp4_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP4_CLK,  4, 2),
+	MUX(0, "usim1_wclk_mux", lsp1_wclk_common_p, LSP1_USIM1_CLK, 4, 1),
+};
+
+static struct zx_clk_div lsp1_div_clk[] = {
+	DIV_T(0, "pwm_div",  "pwm_wclk_mux",  LSP1_PWM_CLK,  12, 4, CLK_SET_RATE_PARENT, common_div_table),
+	DIV_T(0, "ssp2_div", "ssp2_wclk_mux", LSP1_SSP2_CLK, 12, 4, CLK_SET_RATE_PARENT, common_even_div_table),
+	DIV_T(0, "ssp3_div", "ssp3_wclk_mux", LSP1_SSP3_CLK, 12, 4, CLK_SET_RATE_PARENT, common_even_div_table),
+	DIV_T(0, "ssp4_div", "ssp4_wclk_mux", LSP1_SSP4_CLK, 12, 4, CLK_SET_RATE_PARENT, common_even_div_table),
+};
+
+static struct zx_clk_gate lsp1_gate_clk[] = {
+	GATE(LSP1_UART4_WCLK, "lsp1_uart4_wclk", "uart4_wclk_mux", LSP1_UART4_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_UART5_WCLK, "lsp1_uart5_wclk", "uart5_wclk_mux", LSP1_UART5_CLK, 1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_PWM_WCLK,   "lsp1_pwm_wclk",   "pwm_div",        LSP1_PWM_CLK,   1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_PWM_PCLK,   "lsp1_pwm_pclk",   "lsp1_pclk",      LSP1_PWM_CLK,   0, 0,		   0),
+	GATE(LSP1_I2C2_WCLK,  "lsp1_i2c2_wclk",  "i2c2_wclk_mux",  LSP1_I2C2_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_SSP2_WCLK,  "lsp1_ssp2_wclk",  "ssp2_div",       LSP1_SSP2_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_SSP3_WCLK,  "lsp1_ssp3_wclk",  "ssp3_div",       LSP1_SSP3_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_SSP4_WCLK,  "lsp1_ssp4_wclk",  "ssp4_div",       LSP1_SSP4_CLK,  1, CLK_SET_RATE_PARENT, 0),
+	GATE(LSP1_USIM1_WCLK, "lsp1_usim1_wclk", "usim1_wclk_mux", LSP1_USIM1_CLK, 1, CLK_SET_RATE_PARENT, 0),
+};
+
+static struct clk_hw_onecell_data lsp1_hw_onecell_data = {
+	.num = LSP1_NR_CLKS,
+	.hws = {
+		[LSP1_NR_CLKS - 1] = NULL,
+	},
+};
+
+static int __init lsp1_clocks_init(struct device_node *np)
+{
+	void __iomem *reg_base;
+	int i, ret;
+
+	reg_base = of_iomap(np, 0);
+	if (!reg_base) {
+		pr_err("%s: Unable to map clk base\n", __func__);
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp1_mux_clk); i++) {
+		if (lsp1_mux_clk[i].id)
+			lsp1_hw_onecell_data.hws[lsp1_mux_clk[i].id] =
+					&lsp0_mux_clk[i].mux.hw;
+
+		lsp1_mux_clk[i].mux.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp1_mux_clk[i].mux.hw);
+		if (ret) {
+			pr_warn("lsp1 clk %s init error!\n",
+				lsp1_mux_clk[i].mux.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp1_gate_clk); i++) {
+		if (lsp1_gate_clk[i].id)
+			lsp1_hw_onecell_data.hws[lsp1_gate_clk[i].id] =
+					&lsp1_gate_clk[i].gate.hw;
+
+		lsp1_gate_clk[i].gate.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp1_gate_clk[i].gate.hw);
+		if (ret) {
+			pr_warn("lsp1 clk %s init error!\n",
+				lsp1_gate_clk[i].gate.hw.init->name);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(lsp1_div_clk); i++) {
+		if (lsp1_div_clk[i].id)
+			lsp1_hw_onecell_data.hws[lsp1_div_clk[i].id] =
+					&lsp1_div_clk[i].div.hw;
+
+		lsp1_div_clk[i].div.reg += (u64)reg_base;
+		ret = clk_hw_register(NULL, &lsp1_div_clk[i].div.hw);
+		if (ret) {
+			pr_warn("lsp1 clk %s init error!\n",
+				lsp1_div_clk[i].div.hw.init->name);
+		}
+	}
+
+	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &lsp1_hw_onecell_data))
+		panic("could not register clk provider\n");
+	pr_info("lsp1-clk init over, nr:%d\n", LSP1_NR_CLKS);
+
+	return 0;
+}
+
+static const struct of_device_id zx_clkc_match_table[] = {
+	{ .compatible = "zte,zx296718-topcrm", .data = &top_clocks_init },
+	{ .compatible = "zte,zx296718-lsp0crm", .data = &lsp0_clocks_init },
+	{ .compatible = "zte,zx296718-lsp1crm", .data = &lsp1_clocks_init },
+	{ }
+};
+
+static int zx_clkc_probe(struct platform_device *pdev)
+{
+	int (*init_fn)(struct device_node *np);
+	struct device_node *np = pdev->dev.of_node;
+
+	init_fn = of_device_get_match_data(&pdev->dev);
+	if (!init_fn) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
+	}
+
+	return init_fn(np);
+}
+
+static struct platform_driver zx_clk_driver = {
+	.probe		= zx_clkc_probe,
+	.driver		= {
+		.name	= "zx296718-clkc",
+		.of_match_table = zx_clkc_match_table,
+	},
+};
+
+static int __init zx_clkc_init(void)
+{
+	return platform_driver_register(&zx_clk_driver);
+}
+device_initcall(zx_clkc_init);
diff --git a/drivers/clk/zte/clk.h b/drivers/clk/zte/clk.h
index 8f6b5f0..0df3474 100644
--- a/drivers/clk/zte/clk.h
+++ b/drivers/clk/zte/clk.h
@@ -12,6 +12,26 @@
 #include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 
+#define PNAME(x) static const char *x[]
+
+#define CLK_HW_INIT(_name, _parent, _ops, _flags)			\
+	&(struct clk_init_data) {					\
+		.flags		= _flags,				\
+		.name		= _name,				\
+		.parent_names	= (const char *[]) { _parent },		\
+		.num_parents	= 1,					\
+		.ops		= _ops,					\
+	}
+
+#define CLK_HW_INIT_PARENTS(_name, _parents, _ops, _flags)		\
+	&(struct clk_init_data) {					\
+		.flags		= _flags,				\
+		.name		= _name,				\
+		.parent_names	= _parents,				\
+		.num_parents	= ARRAY_SIZE(_parents),			\
+		.ops		= _ops,					\
+	}
+
 struct zx_pll_config {
 	unsigned long rate;
 	u32 cfg0;
@@ -28,6 +48,111 @@ struct clk_zx_pll {
 	u8 lock_bit;		/* pll lock flag bit */
 };
 
+#define PLL_RATE(_rate, _cfg0, _cfg1)	\
+{					\
+	.rate = _rate,			\
+	.cfg0 = _cfg0,			\
+	.cfg1 = _cfg1,			\
+}
+
+#define ZX_PLL(_name, _parent, _reg, _table, _pd, _lock)		\
+{									\
+	.reg_base	= (void __iomem *) _reg,			\
+	.lookup_table	= _table,					\
+	.count		= ARRAY_SIZE(_table),				\
+	.pd_bit		= _pd,						\
+	.lock_bit	= _lock,					\
+	.hw.init	 = CLK_HW_INIT(_name, _parent, &zx_pll_ops,	\
+				CLK_GET_RATE_NOCACHE),			\
+}
+
+#define ZX296718_PLL(_name, _parent, _reg, _table)			\
+ZX_PLL(_name, _parent, _reg, _table, 0, 30)
+
+struct zx_clk_gate {
+	struct clk_gate gate;
+	u16		id;
+};
+
+#define GATE(_id, _name, _parent, _reg, _bit, _flag, _gflags)		\
+{									\
+	.gate = {							\
+		.reg = (void __iomem *) _reg,				\
+		.bit_idx = (_bit),					\
+		.flags = _gflags,					\
+		.lock = &clk_lock,					\
+		.hw.init = CLK_HW_INIT(_name,				\
+					_parent,			\
+					&clk_gate_ops,			\
+					_flag | CLK_IGNORE_UNUSED),	\
+	},								\
+	.id	= _id,							\
+}
+
+struct zx_clk_fixed_factor {
+	struct clk_fixed_factor factor;
+	u16	id;
+};
+
+#define FFACTOR(_id, _name, _parent, _mult, _div, _flag)		\
+{									\
+	.factor = {							\
+		.div		= _div,					\
+		.mult		= _mult,				\
+		.hw.init	= CLK_HW_INIT(_name,			\
+					      _parent,			\
+					      &clk_fixed_factor_ops,	\
+					      _flag),			\
+	},								\
+	.id = _id,							\
+}
+
+struct zx_clk_mux {
+	struct clk_mux mux;
+	u16	id;
+};
+
+#define MUX_F(_id, _name, _parent, _reg, _shift, _width, _flag, _mflag)	\
+{									\
+	.mux = {							\
+		.reg		= (void __iomem *) _reg,		\
+		.mask		= BIT(_width) - 1,			\
+		.shift		= _shift,				\
+		.flags		= _mflag,				\
+		.lock		= &clk_lock,				\
+		.hw.init	= CLK_HW_INIT_PARENTS(_name,		\
+						      _parent,		\
+						      &clk_mux_ops,	\
+						      _flag),		\
+	},								\
+	.id = _id,							\
+}
+
+#define MUX(_id, _name, _parent, _reg, _shift, _width)			\
+MUX_F(_id, _name, _parent, _reg, _shift, _width, 0, 0)
+
+struct zx_clk_div {
+	struct clk_divider div;
+	u16	id;
+};
+
+#define DIV_T(_id, _name, _parent, _reg, _shift, _width, _flag, _table)	\
+{									\
+	.div = {							\
+		.reg		= (void __iomem *) _reg,		\
+		.shift		= _shift,				\
+		.width		= _width,				\
+		.flags		= 0,					\
+		.table		= _table,				\
+		.lock		= &clk_lock,				\
+		.hw.init	= CLK_HW_INIT(_name,			\
+					      _parent,			\
+					      &clk_divider_ops,		\
+					      _flag),			\
+	},								\
+	.id = _id,							\
+}
+
 struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
 	unsigned long flags, void __iomem *reg_base,
 	const struct zx_pll_config *lookup_table, int count, spinlock_t *lock);
diff --git a/include/dt-bindings/clock/zx296718-clock.h b/include/dt-bindings/clock/zx296718-clock.h
new file mode 100644
index 0000000..822d523
--- /dev/null
+++ b/include/dt-bindings/clock/zx296718-clock.h
@@ -0,0 +1,163 @@
+/*
+ * Copyright (C) 2015 - 2016 ZTE Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+#ifndef __DT_BINDINGS_CLOCK_ZX296718_H
+#define __DT_BINDINGS_CLOCK_ZX296718_H
+
+/* PLL */
+#define ZX296718_PLL_CPU	1
+#define ZX296718_PLL_MAC	2
+#define ZX296718_PLL_MM0	3
+#define ZX296718_PLL_MM1	4
+#define ZX296718_PLL_VGA	5
+#define ZX296718_PLL_DDR	6
+#define ZX296718_PLL_AUDIO	7
+#define ZX296718_PLL_HSIC	8
+#define CPU_DBG_GATE		9
+#define A72_GATE		10
+#define CPU_PERI_GATE		11
+#define A53_GATE		12
+#define DDR1_GATE		13
+#define DDR0_GATE		14
+#define SD1_WCLK		15
+#define SD1_AHB			16
+#define SD0_WCLK		17
+#define SD0_AHB			18
+#define EMMC_WCLK		19
+#define EMMC_NAND_AXI		20
+#define NAND_WCLK		21
+#define EMMC_NAND_AHB		22
+#define LSP1_148M5		23
+#define LSP1_99M		24
+#define LSP1_24M		25
+#define LSP0_74M25		26
+#define LSP0_32K		27
+#define LSP0_148M5		28
+#define LSP0_99M		29
+#define LSP0_24M		30
+#define DEMUX_AXI		31
+#define DEMUX_APB		32
+#define DEMUX_148M5		33
+#define DEMUX_108M		34
+#define AUDIO_APB		35
+#define AUDIO_99M		36
+#define AUDIO_24M		37
+#define AUDIO_16M384		38
+#define AUDIO_32K		39
+#define WDT_WCLK		40
+#define TIMER_WCLK		41
+#define VDE_ACLK		42
+#define VCE_ACLK		43
+#define HDE_ACLK		44
+#define GPU_ACLK		45
+#define SAPPU_ACLK		46
+#define SAPPU_WCLK		47
+#define VOU_ACLK		48
+#define VOU_MAIN_WCLK		49
+#define VOU_AUX_WCLK		50
+#define VOU_PPU_WCLK		51
+#define MIPI_CFG_CLK		52
+#define VGA_I2C_WCLK		53
+#define MIPI_REF_CLK		54
+#define HDMI_OSC_CEC		55
+#define HDMI_OSC_CLK		56
+#define HDMI_XCLK		57
+#define VIU_M0_ACLK		58
+#define VIU_M1_ACLK		59
+#define VIU_WCLK		60
+#define VIU_JPEG_WCLK		61
+#define VIU_CFG_CLK		62
+#define TS_SYS_WCLK		63
+#define TS_SYS_108M		64
+#define USB20_HCLK		65
+#define USB20_PHY_CLK		66
+#define USB21_HCLK		67
+#define USB21_PHY_CLK		68
+#define GMAC_RMIICLK		69
+#define GMAC_PCLK		70
+#define GMAC_ACLK		71
+#define GMAC_RFCLK		72
+#define TEMPSENSOR_GATE		73
+
+#define TOP_NR_CLKS		74
+
+
+#define LSP0_TIMER3_PCLK	1
+#define LSP0_TIMER3_WCLK	2
+#define LSP0_TIMER4_PCLK	3
+#define LSP0_TIMER4_WCLK	4
+#define LSP0_TIMER5_PCLK	5
+#define LSP0_TIMER5_WCLK	6
+#define LSP0_UART3_PCLK		7
+#define LSP0_UART3_WCLK		8
+#define LSP0_UART1_PCLK		9
+#define LSP0_UART1_WCLK		10
+#define LSP0_UART2_PCLK		11
+#define LSP0_UART2_WCLK		12
+#define LSP0_SPIFC0_PCLK	13
+#define LSP0_SPIFC0_WCLK	14
+#define LSP0_I2C4_PCLK		15
+#define LSP0_I2C4_WCLK		16
+#define LSP0_I2C5_PCLK		17
+#define LSP0_I2C5_WCLK		18
+#define LSP0_SSP0_PCLK		19
+#define LSP0_SSP0_WCLK		20
+#define LSP0_SSP1_PCLK		21
+#define LSP0_SSP1_WCLK		22
+#define LSP0_USIM_PCLK		23
+#define LSP0_USIM_WCLK		24
+#define LSP0_GPIO_PCLK		25
+#define LSP0_GPIO_WCLK		26
+#define LSP0_I2C3_PCLK		27
+#define LSP0_I2C3_WCLK		28
+
+#define LSP0_NR_CLKS		29
+
+
+#define LSP1_UART4_PCLK		1
+#define LSP1_UART4_WCLK		2
+#define LSP1_UART5_PCLK		3
+#define LSP1_UART5_WCLK		4
+#define LSP1_PWM_PCLK		5
+#define LSP1_PWM_WCLK		6
+#define LSP1_I2C2_PCLK		7
+#define LSP1_I2C2_WCLK		8
+#define LSP1_SSP2_PCLK		9
+#define LSP1_SSP2_WCLK		10
+#define LSP1_SSP3_PCLK		11
+#define LSP1_SSP3_WCLK		12
+#define LSP1_SSP4_PCLK		13
+#define LSP1_SSP4_WCLK		14
+#define LSP1_USIM1_PCLK		15
+#define LSP1_USIM1_WCLK		16
+
+#define LSP1_NR_CLKS		17
+
+
+#define AUDIO_I2S0_WCLK		1
+#define AUDIO_I2S0_PCLK		2
+#define AUDIO_I2S1_WCLK		3
+#define AUDIO_I2S1_PCLK		4
+#define AUDIO_I2S2_WCLK		5
+#define AUDIO_I2S2_PCLK		6
+#define AUDIO_I2S3_WCLK		7
+#define AUDIO_I2S3_PCLK		8
+#define AUDIO_I2C0_WCLK		9
+#define AUDIO_I2C0_PCLK		10
+#define AUDIO_SPDIF0_WCLK	11
+#define AUDIO_SPDIF0_PCLK	12
+#define AUDIO_SPDIF1_WCLK	13
+#define AUDIO_SPDIF1_PCLK	14
+#define AUDIO_TIMER_WCLK	15
+#define AUDIO_TIMER_PCLK	16
+#define AUDIO_TDM_WCLK		17
+#define AUDIO_TDM_PCLK		18
+#define AUDIO_TS_PCLK		19
+
+#define AUDIO_NR_CLKS		20
+
+#endif
-- 
1.9.1
