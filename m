Return-Path: <jun.nie@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1469800698-9374-2-git-send-email-jun.nie@linaro.org>
References: <1469800698-9374-1-git-send-email-jun.nie@linaro.org> <1469800698-9374-2-git-send-email-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 26 Aug 2016 21:24:58 +0800
Message-ID: <CABymUCP9dQnyYQLQgAr0AX-f69+co_Mnd=jmQqgN56G9KueN+Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: zx: register ZX296718 clocks
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>,
	Jun Nie <jun.nie@linaro.org>
Content-Type: multipart/alternative; boundary=001a1137b98eeb7211053af97082
List-ID: <linux-clk.vger.kernel.org>

--001a1137b98eeb7211053af97082
Content-Type: text/plain; charset=UTF-8

2016-07-29 21:58 GMT+08:00 Jun Nie <jun.nie@linaro.org>:

> The ZX296718 clocks are statically listed and registered. More
> clock will be added later.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../devicetree/bindings/clock/zx296718-clk.txt     |  35 +
>  drivers/clk/zte/Makefile                           |   1 +
>  drivers/clk/zte/clk-zx296718.c                     | 870
> +++++++++++++++++++++
>  drivers/clk/zte/clk.h                              | 125 +++
>  include/dt-bindings/clock/zx296718-clock.h         | 140 ++++
>  5 files changed, 1171 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/zx296718-clk.
> txt
>  create mode 100644 drivers/clk/zte/clk-zx296718.c
>  create mode 100644 include/dt-bindings/clock/zx296718-clock.h
>
> diff --git a/Documentation/devicetree/bindings/clock/zx296718-clk.txt
> b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
> new file mode 100644
> index 0000000..a6c5d86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zx296718-clk.txt
> @@ -0,0 +1,35 @@
> +Device Tree Clock bindings for ZTE zx296718
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +Required properties:
> +- compatible : shall be one of the following:
> +       "zte,zx296718-topcrm":
> +               zx296718 top clock selection, divider and gating
> +
> +       "zte,zx296718-lsp0crm" and
> +       "zte,zx296718-lsp1crm":
> +               zx296718 device level clock selection and gating
> +
> +- reg: Address and length of the register set
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell. See include/dt-bindings/clock/
> zx296718-clock.h
> +for the full list of zx296718 clock IDs.
> +
> +
> +topclk: topcrm@0x09800000 {
> +        compatible = "zte,zx296718-topcrm-clk";
> +        reg = <0x01461000 0x1000>;
> +        #clock-cells = <1>;
> +};
> +
> +usbphy0:usb-phy0{
> +       compatible = "zte,zx296718-usb-phy";
> +       #phy-cells = <0>;
> +       clocks = <&topcrm USB20_PHY_CLK>;
> +       clock-names = "phyclk";
> +       status = "okay";
> +};
> diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
> index 74005aa..83374bf 100644
> --- a/drivers/clk/zte/Makefile
> +++ b/drivers/clk/zte/Makefile
> @@ -1,2 +1,3 @@
>  obj-y := clk.o
>  obj-$(CONFIG_SOC_ZX296702) += clk-zx296702.o
> +obj-$(CONFIG_ARCH_ZX) += clk-zx296718.o
> diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-
> zx296718.c
> new file mode 100644
> index 0000000..f82f5b43
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx296718.c
> @@ -0,0 +1,870 @@
> +/*
> + * Copyright (C) 2015 - 2016 ZTE Corporation.
> + * Copyright (C) 2016 Linaro Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#include <linux/clk-provider.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include <dt-bindings/clock/zx296718-clock.h>
> +#include "clk.h"
> +
> +/* TOP CRM */
> +#define TOP_CLK_MUX0   0x04
> +#define TOP_CLK_MUX1   0x08
> +#define TOP_CLK_MUX2   0x0c
> +#define TOP_CLK_MUX3   0x10
> +#define TOP_CLK_MUX4   0x14
> +#define TOP_CLK_MUX5   0x18
> +#define TOP_CLK_MUX6   0x1c
> +#define TOP_CLK_MUX7   0x20
> +#define TOP_CLK_MUX9   0x28
> +
> +
> +#define TOP_CLK_GATE0  0x34
> +#define TOP_CLK_GATE1  0x38
> +#define TOP_CLK_GATE2  0x3c
> +#define TOP_CLK_GATE3  0x40
> +#define TOP_CLK_GATE4  0x44
> +#define TOP_CLK_GATE5  0x48
> +#define TOP_CLK_GATE6  0x4c
> +
> +#define TOP_CLK_DIV0   0x58
> +
> +#define PLL_CPU_REG    0x80
> +#define PLL_VGA_REG    0xb0
> +#define PLL_DDR_REG    0xa0
> +
> +/* LSP0 CRM */
> +#define LSP0_TIMER3_CLK        0x4
> +#define LSP0_TIMER4_CLK        0x8
> +#define LSP0_TIMER5_CLK        0xc
> +#define LSP0_UART3_CLK 0x10
> +#define LSP0_UART1_CLK 0x14
> +#define LSP0_UART2_CLK 0x18
> +#define LSP0_SPIFC0_CLK        0x1c
> +#define LSP0_I2C4_CLK  0x20
> +#define LSP0_I2C5_CLK  0x24
> +#define LSP0_SSP0_CLK  0x28
> +#define LSP0_SSP1_CLK  0x2c
> +#define LSP0_USIM0_CLK 0x30
> +#define LSP0_GPIO_CLK  0x34
> +#define LSP0_I2C3_CLK  0x38
> +
> +/* LSP1 CRM */
> +#define LSP1_UART4_CLK 0x08
> +#define LSP1_UART5_CLK 0x0c
> +#define LSP1_PWM_CLK   0x10
> +#define LSP1_I2C2_CLK  0x14
> +#define LSP1_SSP2_CLK  0x1c
> +#define LSP1_SSP3_CLK  0x20
> +#define LSP1_SSP4_CLK  0x24
> +#define LSP1_USIM1_CLK 0x28
> +
> +/* audio lsp */
> +#define AUDIO_I2S0_DIV_CFG1    0x10
> +#define AUDIO_I2S0_DIV_CFG2    0x14
> +#define AUDIO_I2S0_CLK         0x18
> +#define AUDIO_I2S1_DIV_CFG1    0x20
> +#define AUDIO_I2S1_DIV_CFG2    0x24
> +#define AUDIO_I2S1_CLK         0x28
> +#define AUDIO_I2S2_DIV_CFG1    0x30
> +#define AUDIO_I2S2_DIV_CFG2    0x34
> +#define AUDIO_I2S2_CLK         0x38
> +#define AUDIO_I2S3_DIV_CFG1    0x40
> +#define AUDIO_I2S3_DIV_CFG2    0x44
> +#define AUDIO_I2S3_CLK         0x48
> +#define AUDIO_I2C0_CLK         0x50
> +#define AUDIO_SPDIF0_DIV_CFG1  0x60
> +#define AUDIO_SPDIF0_DIV_CFG2  0x64
> +#define AUDIO_SPDIF0_CLK       0x68
> +#define AUDIO_SPDIF1_DIV_CFG1  0x70
> +#define AUDIO_SPDIF1_DIV_CFG2  0x74
> +#define AUDIO_SPDIF1_CLK       0x78
> +#define AUDIO_TIMER_CLK                0x80
> +#define AUDIO_TDM_CLK          0x90
> +#define AUDIO_TS_CLK           0xa0
> +
> +static DEFINE_SPINLOCK(clk_lock);
> +
> +static struct zx_pll_config pll_cpu_table[] = {
> +       PLL_RATE(1312000000, 0x00103621, 0x04aaaaaa),
> +       PLL_RATE(1407000000, 0x00103a21, 0x04aaaaaa),
> +       PLL_RATE(1503000000, 0x00103e21, 0x04aaaaaa),
> +       PLL_RATE(1600000000, 0x00104221, 0x04aaaaaa),
> +};
> +
> +PNAME(osc) = {
> +       "osc24m",
> +       "osc32k",
> +};
> +
> +PNAME(dbg_wclk_p) = {
> +       "clk334m",
> +       "clk466m",
> +       "clk396m",
> +       "clk250m",
> +};
> +
> +PNAME(a72_coreclk_p) = {
> +       "osc24m",
> +       "pll_mm0_1188m",
> +       "pll_mm1_1296m",
> +       "clk1000m",
> +       "clk648m",
> +       "clk1600m",
> +       "pll_audio_1800m",
> +       "pll_vga_1800m",
> +};
> +
> +PNAME(cpu_periclk_p) = {
> +       "osc24m",
> +       "clk500m",
> +       "clk594m",
> +       "clk466m",
> +       "clk294m",
> +       "clk334m",
> +       "clk250m",
> +       "clk125m",
> +};
> +
> +PNAME(a53_coreclk_p) = {
> +       "osc24m",
> +       "clk1000m",
> +       "pll_mm0_1188m",
> +       "clk648m",
> +       "clk500m",
> +       "clk800m",
> +       "clk1600m",
> +       "pll_audio_1800m",
> +};
> +
> +PNAME(sec_wclk_p) = {
> +       "osc24m",
> +       "clk396m",
> +       "clk334m",
> +       "clk297m",
> +       "clk250m",
> +       "clk198m",
> +       "clk148m5",
> +       "clk99m",
> +};
> +
> +PNAME(sd_nand_wclk_p) = {
> +       "osc24m",
> +       "clk49m5",
> +       "clk99m",
> +       "clk198m",
> +       "clk167m",
> +       "clk148m5",
> +       "clk125m",
> +       "clk216m",
> +};
> +
> +PNAME(emmc_wclk_p) = {
> +       "osc24m",
> +       "clk198m",
> +       "clk99m",
> +       "clk396m",
> +       "clk334m",
> +       "clk297m",
> +       "clk250m",
> +       "clk148m5",
> +};
> +
> +PNAME(clk32_p) = {
> +       "osc32k",
> +       "clk32k768",
> +};
> +
> +PNAME(usb_ref24m_p) = {
> +       "osc32k",
> +       "clk32k768",
> +};
> +
> +PNAME(sys_noc_alck_p) = {
> +       "osc24m",
> +       "clk250m",
> +       "clk198m",
> +       "clk148m5",
> +       "clk108m",
> +       "clk54m",
> +       "clk216m",
> +       "clk240m",
> +};
> +
> +PNAME(vde_aclk_p) = {
> +       "clk334m",
> +       "clk594m",
> +       "clk500m",
> +       "clk432m",
> +       "clk480m",
> +       "clk297m",
> +       "clk_vga",  /*600MHz*/
> +       "clk294m",
> +};
> +
> +PNAME(vce_aclk_p) = {
> +       "clk334m",
> +       "clk594m",
> +       "clk500m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk_vga",  /*600MHz*/
> +       "clk294m",
> +};
> +
> +PNAME(hde_aclk_p) = {
> +       "clk334m",
> +       "clk594m",
> +       "clk500m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk_vga",  /*600MHz*/
> +       "clk294m",
> +};
> +
> +PNAME(gpu_aclk_p) = {
> +       "clk334m",
> +       "clk648m",
> +       "clk594m",
> +       "clk500m",
> +       "clk396m",
> +       "clk297m",
> +       "clk_vga",  /*600MHz*/
> +       "clk294m",
> +};
> +
> +PNAME(sappu_aclk_p) = {
> +       "clk396m",
> +       "clk500m",
> +       "clk250m",
> +       "clk148m5",
> +};
> +
> +PNAME(sappu_wclk_p) = {
> +       "clk198m",
> +       "clk396m",
> +       "clk334m",
> +       "clk297m",
> +       "clk250m",
> +       "clk148m5",
> +       "clk125m",
> +       "clk99m",
> +};
> +
> +PNAME(vou_aclk_p) = {
> +       "clk334m",
> +       "clk594m",
> +       "clk500m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk_vga",  /*600MHz*/
> +       "clk294m",
> +};
> +
> +PNAME(vou_main_wclk_p) = {
> +       "clk108m",
> +       "clk594m",
> +       "clk297m",
> +       "clk148m5",
> +       "clk74m25",
> +       "clk54m",
> +       "clk27m",
> +       "clk_vga",
> +};
> +
> +PNAME(vou_aux_wclk_p) = {
> +       "clk108m",
> +       "clk148m5",
> +       "clk74m25",
> +       "clk54m",
> +       "clk27m",
> +       "clk_vga",
> +       "clk54m_mm0",
> +       "clk"
> +};
> +
> +PNAME(vou_ppu_wclk_p) = {
> +       "clk334m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk250m",
> +       "clk125m",
> +       "clk198m",
> +       "clk99m",
> +};
> +
> +PNAME(vga_i2c_wclk_p) = {
> +       "osc24m",
> +       "clk99m",
> +};
> +
> +PNAME(viu_m0_aclk_p) = {
> +       "clk334m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk250m",
> +       "clk125m",
> +       "clk198m",
> +       "osc24m",
> +};
> +
> +PNAME(viu_m1_aclk_p) = {
> +       "clk198m",
> +       "clk250m",
> +       "clk297m",
> +       "clk125m",
> +       "clk396m",
> +       "clk334m",
> +       "clk148m5",
> +       "osc24m",
> +};
> +
> +PNAME(viu_clk_p) = {
> +       "clk198m",
> +       "clk334m",
> +       "clk297m",
> +       "clk250m",
> +       "clk396m",
> +       "clk125m",
> +       "clk99m",
> +       "clk148m5",
> +};
> +
> +PNAME(viu_jpeg_clk_p) = {
> +       "clk334m",
> +       "clk480m",
> +       "clk432m",
> +       "clk396m",
> +       "clk297m",
> +       "clk250m",
> +       "clk125m",
> +       "clk198m",
> +};
> +
> +PNAME(ts_sys_clk_p) = {
> +       "clk192m",
> +       "clk167m",
> +       "clk125m",
> +       "clk99m",
> +};
> +
> +PNAME(wdt_ares_p) = {
> +       "osc24m",
> +       "clk32k"
> +};
> +
> +static struct clk_zx_pll zx296718_pll_clk[] = {
> +       ZX296718_PLL("pll_cpu", "osc24m",       PLL_CPU_REG,
> pll_cpu_table),
> +};
> +
> +static struct zx_clk_fixed_factor top_ffactor_clk[] = {
> +       FFACTOR(0, "clk4m",             "osc24m", 1, 6,  0),
> +       FFACTOR(0, "clk2m",             "osc24m", 1, 12, 0),
> +       /* pll cpu */
> +       FFACTOR(0, "clk1600m",          "pll_cpu", 1, 1,
> CLK_SET_RATE_PARENT),
> +       FFACTOR(0, "clk800m",           "pll_cpu", 1, 2,
> CLK_SET_RATE_PARENT),
> +       /* pll mac */
> +       FFACTOR(0, "clk25m",            "pll_mac", 1, 40, 0),
> +       FFACTOR(0, "clk125m",           "pll_mac", 1, 8, 0),
> +       FFACTOR(0, "clk250m",           "pll_mac", 1, 4, 0),
> +       FFACTOR(0, "clk50m",            "pll_mac", 1, 20, 0),
> +       FFACTOR(0, "clk500m",           "pll_mac", 1, 2, 0),
> +       FFACTOR(0, "clk1000m",          "pll_mac", 1, 1, 0),
> +       FFACTOR(0, "clk334m",           "pll_mac", 1, 3, 0),
> +       FFACTOR(0, "clk167m",           "pll_mac", 1, 6, 0),
> +       /* pll mm */
> +       FFACTOR(0, "clk54m_mm0",        "pll_mm0", 1, 22, 0),
> +       FFACTOR(0, "clk74m25",          "pll_mm0", 1, 16, 0),
> +       FFACTOR(0, "clk148m5",          "pll_mm0", 1, 8, 0),
> +       FFACTOR(0, "clk297m",           "pll_mm0", 1, 4, 0),
> +       FFACTOR(0, "clk594m",           "pll_mm0", 1, 2, 0),
> +       FFACTOR(0, "pll_mm0_1188m",     "pll_mm0", 1, 1, 0),
> +       FFACTOR(0, "clk396m",           "pll_mm0", 1, 3, 0),
> +       FFACTOR(0, "clk198m",           "pll_mm0", 1, 6, 0),
> +       FFACTOR(0, "clk99m",            "pll_mm0", 1, 12, 0),
> +       FFACTOR(0, "clk49m5",           "pll_mm0", 1, 24, 0),
> +       /* pll mm */
> +       FFACTOR(0, "clk324m",           "pll_mm1", 1, 4, 0),
> +       FFACTOR(0, "clk648m",           "pll_mm1", 1, 2, 0),
> +       FFACTOR(0, "pll_mm1_1296m",     "pll_mm1", 1, 1, 0),
> +       FFACTOR(0, "clk216m",           "pll_mm1", 1, 6, 0),
> +       FFACTOR(0, "clk432m",           "pll_mm1", 1, 3, 0),
> +       FFACTOR(0, "clk108m",           "pll_mm1", 1, 12, 0),
> +       FFACTOR(0, "clk72m",            "pll_mm1", 1, 18, 0),
> +       FFACTOR(0, "clk27m",            "pll_mm1", 1, 48, 0),
> +       FFACTOR(0, "clk54m",            "pll_mm1", 1, 24, 0),
> +       /* vga */
> +       FFACTOR(0, "pll_vga_1800m",     "pll_vga", 1, 1, 0),
> +       FFACTOR(0, "clk_vga",           "pll_vga", 1, 2, 0),
> +       /* pll ddr */
> +       FFACTOR(0, "clk466m",           "pll_ddr", 1, 2, 0),
> +
> +       /* pll audio */
> +       FFACTOR(0, "pll_audio_1800m",   "pll_audio", 1, 1, 0),
> +       FFACTOR(0, "clk32k768",         "pll_audio", 1, 27000, 0),
> +       FFACTOR(0, "clk16m384",         "pll_audio", 1, 54, 0),
> +       FFACTOR(0, "clk294m",           "pll_audio", 1, 3, 0),
> +
> +       /* pll hsic*/
> +       FFACTOR(0, "clk240m",           "pll_hsic", 1, 4, 0),
> +       FFACTOR(0, "clk480m",           "pll_hsic", 1, 2, 0),
> +       FFACTOR(0, "clk192m",           "pll_hsic", 1, 5, 0),
> +       FFACTOR(0, "clk_pll_24m",       "pll_hsic", 1, 40, 0),
> +       FFACTOR(0, "emmc_mux_div2",     "emmc_mux", 1, 2,
> CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_div_table noc_div_table[] = {
> +       { .val = 1, .div = 2, },
> +       { .val = 3, .div = 4, },
> +};
> +static struct zx_clk_div top_div_clk[] = {
> +       DIV_T(0, "sys_noc_hclk", "sys_noc_aclk", TOP_CLK_DIV0, 0, 2, 0,
> noc_div_table),
> +       DIV_T(0, "sys_noc_pclk", "sys_noc_aclk", TOP_CLK_DIV0, 4, 2, 0,
> noc_div_table),
> +};
> +
> +static struct zx_clk_mux top_mux_clk[] = {
> +       MUX(0, "dbg_mux",        dbg_wclk_p,      TOP_CLK_MUX0, 12, 2),
> +       MUX(0, "a72_mux",        a72_coreclk_p,   TOP_CLK_MUX0, 8, 3),
> +       MUX(0, "cpu_peri_mux",   cpu_periclk_p,   TOP_CLK_MUX0, 4, 3),
> +       MUX_F(0, "a53_mux",      a53_coreclk_p,   TOP_CLK_MUX0, 0, 3,
> CLK_SET_RATE_PARENT, 0),
> +       MUX(0, "sys_noc_aclk",   sys_noc_alck_p,  TOP_CLK_MUX1, 0, 3),
> +       MUX(0, "sec_mux",        sec_wclk_p,      TOP_CLK_MUX2, 16, 3),
> +       MUX(0, "sd1_mux",        sd_nand_wclk_p,  TOP_CLK_MUX2, 12, 3),
> +       MUX(0, "sd0_mux",        sd_nand_wclk_p,  TOP_CLK_MUX2, 8, 3),
> +       MUX(0, "emmc_mux",       emmc_wclk_p,     TOP_CLK_MUX2, 4, 3),
> +       MUX(0, "nand_mux",       sd_nand_wclk_p,  TOP_CLK_MUX2, 0, 3),
> +       MUX(0, "usb_ref24m_mux", usb_ref24m_p,    TOP_CLK_MUX9, 16, 1),
> +       MUX(0, "clk32k",         clk32_p,         TOP_CLK_MUX9, 12, 1),
> +       MUX_F(0, "wdt_mux",      wdt_ares_p,      TOP_CLK_MUX9, 8, 1,
> CLK_SET_RATE_PARENT, 0),
> +       MUX(0, "timer_mux",      osc,             TOP_CLK_MUX9, 4, 1),
> +       MUX(0, "vde_mux",        vde_aclk_p,      TOP_CLK_MUX4,  0, 3),
> +       MUX(0, "vce_mux",        vce_aclk_p,      TOP_CLK_MUX4,  4, 3),
> +       MUX(0, "hde_mux",        hde_aclk_p,      TOP_CLK_MUX4,  8, 3),
> +       MUX(0, "gpu_mux",        gpu_aclk_p,      TOP_CLK_MUX5,  0, 3),
> +       MUX(0, "sappu_a_mux",    sappu_aclk_p,    TOP_CLK_MUX5,  4, 2),
> +       MUX(0, "sappu_w_mux",    sappu_wclk_p,    TOP_CLK_MUX5,  8, 3),
> +       MUX(0, "vou_a_mux",      vou_aclk_p,      TOP_CLK_MUX7,  0, 3),
> +       MUX(0, "vou_main_w_mux", vou_main_wclk_p, TOP_CLK_MUX7,  4, 3),
> +       MUX(0, "vou_aux_w_mux",  vou_aux_wclk_p,  TOP_CLK_MUX7,  8, 3),
> +       MUX(0, "vou_ppu_w_mux",  vou_ppu_wclk_p,  TOP_CLK_MUX7, 12, 3),
> +       MUX(0, "vga_i2c_mux",    vga_i2c_wclk_p,  TOP_CLK_MUX7, 16, 1),
> +       MUX(0, "viu_m0_a_mux",   viu_m0_aclk_p,   TOP_CLK_MUX6,  0, 3),
> +       MUX(0, "viu_m1_a_mux",   viu_m1_aclk_p,   TOP_CLK_MUX6,  4, 3),
> +       MUX(0, "viu_w_mux",      viu_clk_p,       TOP_CLK_MUX6,  8, 3),
> +       MUX(0, "viu_jpeg_w_mux", viu_jpeg_clk_p,  TOP_CLK_MUX6, 12, 3),
> +       MUX(0, "ts_sys_mux",     ts_sys_clk_p,    TOP_CLK_MUX6, 16, 2),
> +};
> +
> +static struct zx_clk_gate top_gate_clk[] = {
> +       GATE(CPU_DBG_GATE,    "dbg_wclk",        "dbg_mux",
> TOP_CLK_GATE0, 4, CLK_SET_RATE_PARENT, 0),
> +       GATE(A72_GATE,        "a72_coreclk",     "a72_mux",
> TOP_CLK_GATE0, 3, CLK_SET_RATE_PARENT, 0),
> +       GATE(CPU_PERI_GATE,   "cpu_peri",        "cpu_peri_mux",
>  TOP_CLK_GATE0, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(A53_GATE,        "a53_coreclk",     "a53_mux",
> TOP_CLK_GATE0, 0, CLK_SET_RATE_PARENT, 0),
> +       GATE(SD1_WCLK,        "sd1_wclk",        "sd1_mux",
> TOP_CLK_GATE1, 13, CLK_SET_RATE_PARENT, 0),
> +       GATE(SD0_WCLK,        "sd0_wclk",        "sd0_mux",
> TOP_CLK_GATE1, 9, CLK_SET_RATE_PARENT, 0),
> +       GATE(EMMC_WCLK,       "emmc_wclk",       "emmc_mux_div2",
> TOP_CLK_GATE0, 5, CLK_SET_RATE_PARENT, 0),
> +       GATE(EMMC_NAND_AXI,   "emmc_nand_aclk",  "sys_noc_aclk",
>  TOP_CLK_GATE1, 4, CLK_SET_RATE_PARENT, 0),
> +       GATE(NAND_WCLK,       "nand_wclk",       "nand_mux",
>  TOP_CLK_GATE0, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(EMMC_NAND_AHB,   "emmc_nand_hclk",  "sys_noc_hclk",
>  TOP_CLK_GATE1, 0, CLK_SET_RATE_PARENT, 0),
> +       GATE(0,               "lsp1_pclk",       "sys_noc_pclk",
>  TOP_CLK_GATE2, 31, 0,                  0),
> +       GATE(LSP1_148M5,      "lsp1_148m5",      "clk148m5",
>  TOP_CLK_GATE2, 30, 0,                  0),
> +       GATE(LSP1_99M,        "lsp1_99m",        "clk99m",
>  TOP_CLK_GATE2, 29, 0,                  0),
> +       GATE(LSP1_24M,        "lsp1_24m",        "osc24m",
>  TOP_CLK_GATE2, 28, 0,                  0),
> +       GATE(LSP0_74M25,      "lsp0_74m25",      "clk74m25",
>  TOP_CLK_GATE2, 25, 0,                  0),
> +       GATE(0,               "lsp0_pclk",       "sys_noc_pclk",
>  TOP_CLK_GATE2, 24, 0,                  0),
> +       GATE(LSP0_32K,        "lsp0_32k",        "osc32k",
>  TOP_CLK_GATE2, 23, 0,                  0),
> +       GATE(LSP0_148M5,      "lsp0_148m5",      "clk148m5",
>  TOP_CLK_GATE2, 22, 0,                  0),
> +       GATE(LSP0_99M,        "lsp0_99m",        "clk99m",
>  TOP_CLK_GATE2, 21, 0,                  0),
> +       GATE(LSP0_24M,        "lsp0_24m",        "osc24m",
>  TOP_CLK_GATE2, 20, 0,                  0),
> +       GATE(AUDIO_99M,       "audio_99m",       "clk99m",
>  TOP_CLK_GATE5, 27, 0,                  0),
> +       GATE(AUDIO_24M,       "audio_24m",       "osc24m",
>  TOP_CLK_GATE5, 28, 0,                  0),
> +       GATE(AUDIO_16M384,    "audio_16m384",    "clk16m384",
> TOP_CLK_GATE5, 29, 0,                  0),
> +       GATE(AUDIO_32K,       "audio_32k",       "clk32k",
>  TOP_CLK_GATE5, 30, 0,                  0),
> +       GATE(WDT_WCLK,        "wdt_wclk",        "wdt_mux",
> TOP_CLK_GATE6, 9, CLK_SET_RATE_PARENT, 0),
> +       GATE(TIMER_WCLK,      "timer_wclk",      "timer_mux",
> TOP_CLK_GATE6, 5, CLK_SET_RATE_PARENT, 0),
> +       GATE(VDE_ACLK,        "vde_aclk",        "vde_mux",
> TOP_CLK_GATE3, 0,  CLK_SET_RATE_PARENT, 0),
> +       GATE(VCE_ACLK,        "vce_aclk",        "vce_mux",
> TOP_CLK_GATE3, 4,  CLK_SET_RATE_PARENT, 0),
> +       GATE(HDE_ACLK,        "hde_aclk",        "hde_mux",
> TOP_CLK_GATE3, 8,  CLK_SET_RATE_PARENT, 0),
> +       GATE(GPU_ACLK,        "gpu_aclk",        "gpu_mux",
> TOP_CLK_GATE3, 16, CLK_SET_RATE_PARENT, 0),
> +       GATE(SAPPU_ACLK,      "sappu_aclk",      "sappu_a_mux",
> TOP_CLK_GATE3, 20, CLK_SET_RATE_PARENT, 0),
> +       GATE(SAPPU_WCLK,      "sappu_wclk",      "sappu_w_mux",
> TOP_CLK_GATE3, 22, CLK_SET_RATE_PARENT, 0),
> +       GATE(VOU_ACLK,        "vou_aclk",        "vou_a_mux",
> TOP_CLK_GATE4, 16, CLK_SET_RATE_PARENT, 0),
> +       GATE(VOU_MAIN_WCLK,   "vou_main_wclk",   "vou_main_w_mux",
> TOP_CLK_GATE4, 18, CLK_SET_RATE_PARENT, 0),
> +       GATE(VOU_AUX_WCLK,    "vou_aux_wclk",    "vou_aux_w_mux",
> TOP_CLK_GATE4, 19, CLK_SET_RATE_PARENT, 0),
> +       GATE(VOU_PPU_WCLK,    "vou_ppu_wclk",    "vou_ppu_w_mux",
> TOP_CLK_GATE4, 20, CLK_SET_RATE_PARENT, 0),
> +       GATE(MIPI_CFG_CLK,    "mipi_cfg_clk",    "osc24m",
>  TOP_CLK_GATE4, 21, 0,                   0),
> +       GATE(VGA_I2C_WCLK,    "vga_i2c_wclk",    "vga_i2c_mux",
> TOP_CLK_GATE4, 23, CLK_SET_RATE_PARENT, 0),
> +       GATE(MIPI_REF_CLK,    "mipi_ref_clk",    "clk27m",
>  TOP_CLK_GATE4, 24, 0,                   0),
> +       GATE(HDMI_OSC_CEC,    "hdmi_osc_cec",    "clk2m",
> TOP_CLK_GATE4, 22, 0,                   0),
> +       GATE(HDMI_OSC_CLK,    "hdmi_osc_clk",    "clk240m",
> TOP_CLK_GATE4, 25, 0,                   0),
> +       GATE(HDMI_XCLK,       "hdmi_xclk",       "osc24m",
>  TOP_CLK_GATE4, 26, 0,                   0),
> +       GATE(VIU_M0_ACLK,     "viu_m0_aclk",     "viu_m0_a_mux",
>  TOP_CLK_GATE4, 0,  CLK_SET_RATE_PARENT, 0),
> +       GATE(VIU_M1_ACLK,     "viu_m1_aclk",     "viu_m1_a_mux",
>  TOP_CLK_GATE4, 1,  CLK_SET_RATE_PARENT, 0),
> +       GATE(VIU_WCLK,        "viu_wclk",        "viu_w_mux",
> TOP_CLK_GATE4, 2,  CLK_SET_RATE_PARENT, 0),
> +       GATE(VIU_JPEG_WCLK,   "viu_jpeg_wclk",   "viu_jpeg_w_mux",
> TOP_CLK_GATE4, 3,  CLK_SET_RATE_PARENT, 0),
> +       GATE(VIU_CFG_CLK,     "viu_cfg_clk",     "osc24m",
>  TOP_CLK_GATE4, 6,  0,                   0),
> +       GATE(TS_SYS_WCLK,     "ts_sys_wclk",     "ts_sys_mux",
>  TOP_CLK_GATE5, 2,  CLK_SET_RATE_PARENT, 0),
> +       GATE(TS_SYS_108M,     "ts_sys_108m",     "clk108m",
> TOP_CLK_GATE5, 3,  0,                   0),
> +       GATE(USB20_HCLK,      "usb20_hclk",      "sys_noc_hclk",
>  TOP_CLK_GATE2, 12, 0,                   0),
> +       GATE(USB20_PHY_CLK,   "usb20_phy_clk",   "usb_ref24m_mux",
> TOP_CLK_GATE2, 13, 0,                   0),
> +       GATE(USB21_HCLK,      "usb21_hclk",      "sys_noc_hclk",
>  TOP_CLK_GATE2, 14, 0,                   0),
> +       GATE(USB21_PHY_CLK,   "usb21_phy_clk",   "usb_ref24m_mux",
> TOP_CLK_GATE2, 15, 0,                   0),
> +       GATE(GMAC_RMIICLK,    "gmac_rmii_clk",   "clk50m",
>  TOP_CLK_GATE2, 3, 0,                    0),
> +       GATE(GMAC_PCLK,       "gmac_pclk",       "clk198m",
> TOP_CLK_GATE2, 1, 0,                    0),
> +       GATE(GMAC_ACLK,       "gmac_aclk",       "clk49m5",
> TOP_CLK_GATE2, 0, 0,                    0),
> +       GATE(GMAC_RFCLK,      "gmac_refclk",     "clk25m",
>  TOP_CLK_GATE2, 4, 0,                    0),
> +       GATE(SD1_AHB,         "sd1_hclk",        "sys_noc_hclk",
>  TOP_CLK_GATE1, 12,  0,                  0),
> +       GATE(SD0_AHB,         "sd0_hclk",        "sys_noc_hclk",
>  TOP_CLK_GATE1, 8,  0,                   0),
> +       GATE(TEMPSENSOR_GATE, "tempsensor_gate", "clk4m",
> TOP_CLK_GATE5, 31,  0,                  0),
> +};
> +
> +static struct clk_hw_onecell_data top_hw_onecell_data = {
> +       .num = TOP_NR_CLKS,
> +       .hws = {
> +               [TOP_NR_CLKS - 1] = NULL,
> +       },
> +};
> +
> +static void __init zx296718_top_clocks_init(struct device_node *np)
> +{
> +       void __iomem *reg_base;
> +       int i, ret;
> +
> +       reg_base = of_iomap(np, 0);
> +       for (i = 0; i < ARRAY_SIZE(zx296718_pll_clk); i++) {
> +               zx296718_pll_clk[i].reg_base += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &zx296718_pll_clk[i].hw);
> +               if (ret) {
> +                       pr_warn("top clk %s init error!\n",
> +                               zx296718_pll_clk[i].hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(top_ffactor_clk); i++) {
> +               if (top_ffactor_clk[i].id)
> +                       top_hw_onecell_data.hws[top_ffactor_clk[i].id] =
> +                                       &top_ffactor_clk[i].factor.hw;
> +
> +               ret = clk_hw_register(NULL, &top_ffactor_clk[i].factor.hw)
> ;
> +               if (ret) {
> +                       pr_warn("top clk %s init error!\n",
> +                               top_ffactor_clk[i].factor.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(top_mux_clk); i++) {
> +               if (top_mux_clk[i].id)
> +                       top_hw_onecell_data.hws[top_mux_clk[i].id] =
> +                                       &top_mux_clk[i].mux.hw;
> +
> +               top_mux_clk[i].mux.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &top_mux_clk[i].mux.hw);
> +               if (ret) {
> +                       pr_warn("top clk %s init error!\n",
> +                               top_mux_clk[i].mux.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(top_gate_clk); i++) {
> +               if (top_gate_clk[i].id)
> +                       top_hw_onecell_data.hws[top_gate_clk[i].id] =
> +                                       &top_gate_clk[i].gate.hw;
> +
> +               top_gate_clk[i].gate.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &top_gate_clk[i].gate.hw);
> +               if (ret) {
> +                       pr_warn("top clk %s init error!\n",
> +                               top_gate_clk[i].gate.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(top_div_clk); i++) {
> +               if (top_div_clk[i].id)
> +                       top_hw_onecell_data.hws[top_div_clk[i].id] =
> +                                       &top_div_clk[i].div.hw;
> +
> +               top_div_clk[i].div.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &top_div_clk[i].div.hw);
> +               if (ret) {
> +                       pr_warn("top clk %s init error!\n",
> +                               top_div_clk[i].div.hw.init->name);
> +               }
> +       }
> +
> +       if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> &top_hw_onecell_data))
> +               panic("could not register clk provider\n");
> +       pr_info("top clk init over, nr:%d\n", TOP_NR_CLKS);
> +}
> +CLK_OF_DECLARE(zx296718_top_clk, "zte,zx296718-topcrm",
> zx296718_top_clocks_init);
> +
> +static struct clk_div_table common_even_div_table[] = {
> +       { .val = 0, .div = 1, },
> +       { .val = 1, .div = 2, },
> +       { .val = 3, .div = 4, },
> +       { .val = 5, .div = 6, },
> +       { .val = 7, .div = 8, },
> +       { .val = 9, .div = 10, },
> +       { .val = 11, .div = 12, },
> +       { .val = 13, .div = 14, },
> +       { .val = 15, .div = 16, },
> +};
> +
> +static struct clk_div_table common_div_table[] = {
> +       { .val = 0, .div = 1, },
> +       { .val = 1, .div = 2, },
> +       { .val = 2, .div = 3, },
> +       { .val = 3, .div = 4, },
> +       { .val = 4, .div = 5, },
> +       { .val = 5, .div = 6, },
> +       { .val = 6, .div = 7, },
> +       { .val = 7, .div = 8, },
> +       { .val = 8, .div = 9, },
> +       { .val = 9, .div = 10, },
> +       { .val = 10, .div = 11, },
> +       { .val = 11, .div = 12, },
> +       { .val = 12, .div = 13, },
> +       { .val = 13, .div = 14, },
> +       { .val = 14, .div = 15, },
> +       { .val = 15, .div = 16, },
> +};
> +
> +PNAME(lsp0_wclk_common_p) = {
> +       "lsp0_24m",
> +       "lsp0_99m",
> +};
> +
> +PNAME(lsp0_wclk_timer3_p) = {
> +       "timer3_div",
> +       "lsp0_32k"
> +};
> +
> +PNAME(lsp0_wclk_timer4_p) = {
> +       "timer4_div",
> +       "lsp0_32k"
> +};
> +
> +PNAME(lsp0_wclk_timer5_p) = {
> +       "timer5_div",
> +       "lsp0_32k"
> +};
> +
> +PNAME(lsp0_wclk_spifc0_p) = {
> +       "lsp0_148m5",
> +       "lsp0_24m",
> +       "lsp0_99m",
> +       "lsp0_74m25"
> +};
> +
> +PNAME(lsp0_wclk_ssp_p) = {
> +       "lsp0_148m5",
> +       "lsp0_99m",
> +       "lsp0_24m",
> +};
> +
> +static struct zx_clk_mux lsp0_mux_clk[] = {
> +       MUX(0, "timer3_wclk_mux", lsp0_wclk_timer3_p, LSP0_TIMER3_CLK, 4,
> 1),
> +       MUX(0, "timer4_wclk_mux", lsp0_wclk_timer4_p, LSP0_TIMER4_CLK, 4,
> 1),
> +       MUX(0, "timer5_wclk_mux", lsp0_wclk_timer5_p, LSP0_TIMER5_CLK, 4,
> 1),
> +       MUX(0, "uart3_wclk_mux",  lsp0_wclk_common_p, LSP0_UART3_CLK,  4,
> 1),
> +       MUX(0, "uart1_wclk_mux",  lsp0_wclk_common_p, LSP0_UART1_CLK,  4,
> 1),
> +       MUX(0, "uart2_wclk_mux",  lsp0_wclk_common_p, LSP0_UART2_CLK,  4,
> 1),
> +       MUX(0, "spifc0_wclk_mux", lsp0_wclk_spifc0_p, LSP0_SPIFC0_CLK, 4,
> 2),
> +       MUX(0, "i2c4_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C4_CLK,   4,
> 1),
> +       MUX(0, "i2c5_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C5_CLK,   4,
> 1),
> +       MUX(0, "ssp0_wclk_mux",   lsp0_wclk_ssp_p,    LSP0_SSP0_CLK,   4,
> 1),
> +       MUX(0, "ssp1_wclk_mux",   lsp0_wclk_ssp_p,    LSP0_SSP1_CLK,   4,
> 1),
> +       MUX(0, "i2c3_wclk_mux",   lsp0_wclk_common_p, LSP0_I2C3_CLK,   4,
> 1),
> +};
> +
> +static struct zx_clk_gate lsp0_gate_clk[] = {
> +       GATE(LSP0_TIMER3_WCLK, "timer3_wclk", "timer3_wclk_mux",
> LSP0_TIMER3_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_TIMER4_WCLK, "timer4_wclk", "timer4_wclk_mux",
> LSP0_TIMER4_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_TIMER5_WCLK, "timer5_wclk", "timer5_wclk_mux",
> LSP0_TIMER5_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_UART3_WCLK,  "uart3_wclk",  "uart3_wclk_mux",
> LSP0_UART3_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_UART1_WCLK,  "uart1_wclk",  "uart1_wclk_mux",
> LSP0_UART1_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_UART2_WCLK,  "uart2_wclk",  "uart2_wclk_mux",
> LSP0_UART2_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_SPIFC0_WCLK, "spifc0_wclk", "spifc0_wclk_mux",
> LSP0_SPIFC0_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_I2C4_WCLK,   "i2c4_wclk",   "i2c4_wclk_mux",
>  LSP0_I2C4_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_I2C5_WCLK,   "i2c5_wclk",   "i2c5_wclk_mux",
>  LSP0_I2C5_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_SSP0_WCLK,   "ssp0_wclk",   "ssp0_div",
> LSP0_SSP0_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_SSP1_WCLK,   "ssp1_wclk",   "ssp1_div",
> LSP0_SSP1_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP0_I2C3_WCLK,   "i2c3_wclk",   "i2c3_wclk_mux",
>  LSP0_I2C3_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +};
> +
> +static struct zx_clk_div lsp0_div_clk[] = {
> +       DIV_T(0, "timer3_div", "lsp0_24m", LSP0_TIMER3_CLK,  12, 4, 0,
> common_even_div_table),
> +       DIV_T(0, "timer4_div", "lsp0_24m", LSP0_TIMER4_CLK,  12, 4, 0,
> common_even_div_table),
> +       DIV_T(0, "timer5_div", "lsp0_24m", LSP0_TIMER5_CLK,  12, 4, 0,
> common_even_div_table),
> +       DIV_T(0, "ssp0_div", "ssp0_wclk_mux", LSP0_SSP0_CLK, 12, 4, 0,
> common_even_div_table),
> +       DIV_T(0, "ssp1_div", "ssp1_wclk_mux", LSP0_SSP1_CLK, 12, 4, 0,
> common_even_div_table),
> +};
> +
> +static struct clk_hw_onecell_data lsp0_hw_onecell_data = {
> +       .num = LSP0_NR_CLKS,
> +       .hws = {
> +               [LSP0_NR_CLKS - 1] = NULL,
> +       },
> +};
> +
> +static void __init lsp0_clocks_init(struct device_node *np)
> +{
> +       void __iomem *reg_base;
> +       int i, ret;
> +
> +       reg_base = of_iomap(np, 0);
> +
> +       for (i = 0; i < ARRAY_SIZE(lsp0_mux_clk); i++) {
> +               if (lsp0_mux_clk[i].id)
> +                       lsp0_hw_onecell_data.hws[lsp0_mux_clk[i].id] =
> +                                       &lsp0_mux_clk[i].mux.hw;
> +
> +               lsp0_mux_clk[i].mux.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp0_mux_clk[i].mux.hw);
> +               if (ret) {
> +                       pr_warn("lsp0 clk %s init error!\n",
> +                               lsp0_mux_clk[i].mux.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lsp0_gate_clk); i++) {
> +               if (lsp0_gate_clk[i].id)
> +                       lsp0_hw_onecell_data.hws[lsp0_gate_clk[i].id] =
> +                                       &lsp0_gate_clk[i].gate.hw;
> +
> +               lsp0_gate_clk[i].gate.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp0_gate_clk[i].gate.hw);
> +               if (ret) {
> +                       pr_warn("lsp0 clk %s init error!\n",
> +                               lsp0_gate_clk[i].gate.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lsp0_div_clk); i++) {
> +               if (lsp0_div_clk[i].id)
> +                       lsp0_hw_onecell_data.hws[lsp0_div_clk[i].id] =
> +                                       &lsp0_div_clk[i].div.hw;
> +
> +               lsp0_div_clk[i].div.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp0_div_clk[i].div.hw);
> +               if (ret) {
> +                       pr_warn("lsp0 clk %s init error!\n",
> +                               lsp0_div_clk[i].div.hw.init->name);
> +               }
> +       }
> +
> +       if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> &lsp0_hw_onecell_data))
> +               panic("could not register clk provider\n");
> +       pr_info("lsp0 init over:%d\n", LSP0_NR_CLKS);
> +}
> +CLK_OF_DECLARE(lsp0_clk, "zte,zx296718-lsp0crm", lsp0_clocks_init);
> +
> +PNAME(lsp1_wclk_common_p) = {
> +       "lsp1_24m",
> +       "lsp1_99m",
> +};
> +
> +PNAME(lsp1_wclk_ssp_p) = {
> +       "lsp1_148m5",
> +       "lsp1_99m",
> +       "lsp1_24m",
> +};
> +
> +static struct zx_clk_mux lsp1_mux_clk[] = {
> +       MUX(0, "uart4_wclk_mux", lsp1_wclk_common_p, LSP1_UART4_CLK, 4, 1),
> +       MUX(0, "uart5_wclk_mux", lsp1_wclk_common_p, LSP1_UART5_CLK, 4, 1),
> +       MUX(0, "pwm_wclk_mux",   lsp1_wclk_common_p, LSP1_PWM_CLK,   4, 1),
> +       MUX(0, "i2c2_wclk_mux",  lsp1_wclk_common_p, LSP1_I2C2_CLK,  4, 1),
> +       MUX(0, "ssp2_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP2_CLK,  4, 2),
> +       MUX(0, "ssp3_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP3_CLK,  4, 2),
> +       MUX(0, "ssp4_wclk_mux",  lsp1_wclk_ssp_p,    LSP1_SSP4_CLK,  4, 2),
> +       MUX(0, "usim1_wclk_mux", lsp1_wclk_common_p, LSP1_USIM1_CLK, 4, 1),
> +};
> +
> +static struct zx_clk_div lsp1_div_clk[] = {
> +       DIV_T(0, "pwm_div",  "pwm_wclk_mux",  LSP1_PWM_CLK,  12, 4,
> CLK_SET_RATE_PARENT, common_div_table),
> +       DIV_T(0, "ssp2_div", "ssp2_wclk_mux", LSP1_SSP2_CLK, 12, 4,
> CLK_SET_RATE_PARENT, common_even_div_table),
> +       DIV_T(0, "ssp3_div", "ssp3_wclk_mux", LSP1_SSP3_CLK, 12, 4,
> CLK_SET_RATE_PARENT, common_even_div_table),
> +       DIV_T(0, "ssp4_div", "ssp4_wclk_mux", LSP1_SSP4_CLK, 12, 4,
> CLK_SET_RATE_PARENT, common_even_div_table),
> +};
> +
> +static struct zx_clk_gate lsp1_gate_clk[] = {
> +       GATE(LSP1_UART4_WCLK, "lsp1_uart4_wclk", "uart4_wclk_mux",
> LSP1_UART4_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_UART5_WCLK, "lsp1_uart5_wclk", "uart5_wclk_mux",
> LSP1_UART5_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_PWM_WCLK,   "lsp1_pwm_wclk",   "pwm_div",
> LSP1_PWM_CLK,   1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_PWM_PCLK,   "lsp1_pwm_pclk",   "lsp1_pclk",
> LSP1_PWM_CLK,   0, 0,                   0),
> +       GATE(LSP1_I2C2_WCLK,  "lsp1_i2c2_wclk",  "i2c2_wclk_mux",
> LSP1_I2C2_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_SSP2_WCLK,  "lsp1_ssp2_wclk",  "ssp2_div",
>  LSP1_SSP2_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_SSP3_WCLK,  "lsp1_ssp3_wclk",  "ssp3_div",
>  LSP1_SSP3_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_SSP4_WCLK,  "lsp1_ssp4_wclk",  "ssp4_div",
>  LSP1_SSP4_CLK,  1, CLK_SET_RATE_PARENT, 0),
> +       GATE(LSP1_USIM1_WCLK, "lsp1_usim1_wclk", "usim1_wclk_mux",
> LSP1_USIM1_CLK, 1, CLK_SET_RATE_PARENT, 0),
> +};
> +
> +static struct clk_hw_onecell_data lsp1_hw_onecell_data = {
> +       .num = LSP1_NR_CLKS,
> +       .hws = {
> +               [LSP1_NR_CLKS - 1] = NULL,
> +       },
> +};
> +
> +static void __init lsp1_clocks_init(struct device_node *np)
> +{
> +       void __iomem *reg_base;
> +       int i, ret;
> +
> +       reg_base = of_iomap(np, 0);
> +       for (i = 0; i < ARRAY_SIZE(lsp1_mux_clk); i++) {
> +               if (lsp1_mux_clk[i].id)
> +                       lsp1_hw_onecell_data.hws[lsp1_mux_clk[i].id] =
> +                                       &lsp0_mux_clk[i].mux.hw;
> +
> +               lsp1_mux_clk[i].mux.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp1_mux_clk[i].mux.hw);
> +               if (ret) {
> +                       pr_warn("lsp1 clk %s init error!\n",
> +                               lsp1_mux_clk[i].mux.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lsp1_gate_clk); i++) {
> +               if (lsp1_gate_clk[i].id)
> +                       lsp1_hw_onecell_data.hws[lsp1_gate_clk[i].id] =
> +                                       &lsp1_gate_clk[i].gate.hw;
> +
> +               lsp1_gate_clk[i].gate.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp1_gate_clk[i].gate.hw);
> +               if (ret) {
> +                       pr_warn("lsp1 clk %s init error!\n",
> +                               lsp1_gate_clk[i].gate.hw.init->name);
> +               }
> +       }
> +
> +       for (i = 0; i < ARRAY_SIZE(lsp1_div_clk); i++) {
> +               if (lsp1_div_clk[i].id)
> +                       lsp1_hw_onecell_data.hws[lsp1_div_clk[i].id] =
> +                                       &lsp1_div_clk[i].div.hw;
> +
> +               lsp1_div_clk[i].div.reg += (u64)reg_base;
> +               ret = clk_hw_register(NULL, &lsp1_div_clk[i].div.hw);
> +               if (ret) {
> +                       pr_warn("lsp1 clk %s init error!\n",
> +                               lsp1_div_clk[i].div.hw.init->name);
> +               }
> +       }
> +
> +       if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
> &lsp1_hw_onecell_data))
> +               panic("could not register clk provider\n");
> +       pr_info("lsp1-clk init over, nr:%d\n", LSP1_NR_CLKS);
> +}
> +CLK_OF_DECLARE(lsp1_clk, "zte,zx296718-lsp1crm", lsp1_clocks_init);
> diff --git a/drivers/clk/zte/clk.h b/drivers/clk/zte/clk.h
> index 8f6b5f0..0df3474 100644
> --- a/drivers/clk/zte/clk.h
> +++ b/drivers/clk/zte/clk.h
> @@ -12,6 +12,26 @@
>  #include <linux/clk-provider.h>
>  #include <linux/spinlock.h>
>
> +#define PNAME(x) static const char *x[]
> +
> +#define CLK_HW_INIT(_name, _parent, _ops, _flags)                      \
> +       &(struct clk_init_data) {                                       \
> +               .flags          = _flags,                               \
> +               .name           = _name,                                \
> +               .parent_names   = (const char *[]) { _parent },         \
> +               .num_parents    = 1,                                    \
> +               .ops            = _ops,                                 \
> +       }
> +
> +#define CLK_HW_INIT_PARENTS(_name, _parents, _ops, _flags)             \
> +       &(struct clk_init_data) {                                       \
> +               .flags          = _flags,                               \
> +               .name           = _name,                                \
> +               .parent_names   = _parents,                             \
> +               .num_parents    = ARRAY_SIZE(_parents),                 \
> +               .ops            = _ops,                                 \
> +       }
> +
>  struct zx_pll_config {
>         unsigned long rate;
>         u32 cfg0;
> @@ -28,6 +48,111 @@ struct clk_zx_pll {
>         u8 lock_bit;            /* pll lock flag bit */
>  };
>
> +#define PLL_RATE(_rate, _cfg0, _cfg1)  \
> +{                                      \
> +       .rate = _rate,                  \
> +       .cfg0 = _cfg0,                  \
> +       .cfg1 = _cfg1,                  \
> +}
> +
> +#define ZX_PLL(_name, _parent, _reg, _table, _pd, _lock)               \
> +{                                                                      \
> +       .reg_base       = (void __iomem *) _reg,                        \
> +       .lookup_table   = _table,                                       \
> +       .count          = ARRAY_SIZE(_table),                           \
> +       .pd_bit         = _pd,                                          \
> +       .lock_bit       = _lock,                                        \
> +       .hw.init         = CLK_HW_INIT(_name, _parent, &zx_pll_ops,     \
> +                               CLK_GET_RATE_NOCACHE),                  \
> +}
> +
> +#define ZX296718_PLL(_name, _parent, _reg, _table)                     \
> +ZX_PLL(_name, _parent, _reg, _table, 0, 30)
> +
> +struct zx_clk_gate {
> +       struct clk_gate gate;
> +       u16             id;
> +};
> +
> +#define GATE(_id, _name, _parent, _reg, _bit, _flag, _gflags)          \
> +{                                                                      \
> +       .gate = {                                                       \
> +               .reg = (void __iomem *) _reg,                           \
> +               .bit_idx = (_bit),                                      \
> +               .flags = _gflags,                                       \
> +               .lock = &clk_lock,                                      \
> +               .hw.init = CLK_HW_INIT(_name,                           \
> +                                       _parent,                        \
> +                                       &clk_gate_ops,                  \
> +                                       _flag | CLK_IGNORE_UNUSED),     \
> +       },                                                              \
> +       .id     = _id,                                                  \
> +}
> +
> +struct zx_clk_fixed_factor {
> +       struct clk_fixed_factor factor;
> +       u16     id;
> +};
> +
> +#define FFACTOR(_id, _name, _parent, _mult, _div, _flag)               \
> +{                                                                      \
> +       .factor = {                                                     \
> +               .div            = _div,                                 \
> +               .mult           = _mult,                                \
> +               .hw.init        = CLK_HW_INIT(_name,                    \
> +                                             _parent,                  \
> +                                             &clk_fixed_factor_ops,    \
> +                                             _flag),                   \
> +       },                                                              \
> +       .id = _id,                                                      \
> +}
> +
> +struct zx_clk_mux {
> +       struct clk_mux mux;
> +       u16     id;
> +};
> +
> +#define MUX_F(_id, _name, _parent, _reg, _shift, _width, _flag, _mflag)
>       \
> +{                                                                      \
> +       .mux = {                                                        \
> +               .reg            = (void __iomem *) _reg,                \
> +               .mask           = BIT(_width) - 1,                      \
> +               .shift          = _shift,                               \
> +               .flags          = _mflag,                               \
> +               .lock           = &clk_lock,                            \
> +               .hw.init        = CLK_HW_INIT_PARENTS(_name,            \
> +                                                     _parent,          \
> +                                                     &clk_mux_ops,     \
> +                                                     _flag),           \
> +       },                                                              \
> +       .id = _id,                                                      \
> +}
> +
> +#define MUX(_id, _name, _parent, _reg, _shift, _width)                 \
> +MUX_F(_id, _name, _parent, _reg, _shift, _width, 0, 0)
> +
> +struct zx_clk_div {
> +       struct clk_divider div;
> +       u16     id;
> +};
> +
> +#define DIV_T(_id, _name, _parent, _reg, _shift, _width, _flag, _table)
>       \
> +{                                                                      \
> +       .div = {                                                        \
> +               .reg            = (void __iomem *) _reg,                \
> +               .shift          = _shift,                               \
> +               .width          = _width,                               \
> +               .flags          = 0,                                    \
> +               .table          = _table,                               \
> +               .lock           = &clk_lock,                            \
> +               .hw.init        = CLK_HW_INIT(_name,                    \
> +                                             _parent,                  \
> +                                             &clk_divider_ops,         \
> +                                             _flag),                   \
> +       },                                                              \
> +       .id = _id,                                                      \
> +}
> +
>  struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
>         unsigned long flags, void __iomem *reg_base,
>         const struct zx_pll_config *lookup_table, int count, spinlock_t
> *lock);
> diff --git a/include/dt-bindings/clock/zx296718-clock.h
> b/include/dt-bindings/clock/zx296718-clock.h
> new file mode 100644
> index 0000000..97d45e2
> --- /dev/null
> +++ b/include/dt-bindings/clock/zx296718-clock.h
> @@ -0,0 +1,140 @@
> +/*
> + * Copyright (C) 2015 - 2016 ZTE Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_ZX296718_H
> +#define __DT_BINDINGS_CLOCK_ZX296718_H
> +
> +/* PLL */
> +#define ZX296718_OSC           0
> +#define ZX296718_PLL_CPU       1
> +#define ZX296718_PLL_MAC       2
> +#define ZX296718_PLL_MM0       3
> +#define ZX296718_PLL_MM1       4
> +#define ZX296718_PLL_VGA       5
> +#define ZX296718_PLL_DDR       6
> +#define ZX296718_PLL_AUDIO     7
> +#define ZX296718_PLL_HSIC      8
> +#define CPU_DBG_GATE           9
> +#define A72_GATE               10
> +#define CPU_PERI_GATE          11
> +#define A53_GATE               12
> +#define DDR1_GATE              13
> +#define DDR0_GATE              14
> +#define SD1_WCLK               15
> +#define SD1_AHB                        16
> +#define SD0_WCLK               17
> +#define SD0_AHB                        18
> +#define EMMC_WCLK              19
> +#define EMMC_NAND_AXI          20
> +#define NAND_WCLK              21
> +#define EMMC_NAND_AHB          22
> +#define LSP1_148M5             23
> +#define LSP1_99M               24
> +#define LSP1_24M               25
> +#define LSP0_74M25             26
> +#define LSP0_32K               27
> +#define LSP0_148M5             28
> +#define LSP0_99M               29
> +#define LSP0_24M               30
> +#define DEMUX_AXI              31
> +#define DEMUX_APB              32
> +#define DEMUX_148M5            33
> +#define DEMUX_108M             34
> +#define AUDIO_APB              35
> +#define AUDIO_99M              36
> +#define AUDIO_24M              37
> +#define AUDIO_16M384           38
> +#define AUDIO_32K              39
> +#define WDT_WCLK               40
> +#define TIMER_WCLK             41
> +#define VDE_ACLK               42
> +#define VCE_ACLK               43
> +#define HDE_ACLK               44
> +#define GPU_ACLK               45
> +#define SAPPU_ACLK             46
> +#define SAPPU_WCLK             47
> +#define VOU_ACLK               48
> +#define VOU_MAIN_WCLK          49
> +#define VOU_AUX_WCLK           50
> +#define VOU_PPU_WCLK           51
> +#define MIPI_CFG_CLK           52
> +#define VGA_I2C_WCLK           53
> +#define MIPI_REF_CLK           54
> +#define HDMI_OSC_CEC           55
> +#define HDMI_OSC_CLK           56
> +#define HDMI_XCLK              57
> +#define VIU_M0_ACLK            58
> +#define VIU_M1_ACLK            59
> +#define VIU_WCLK               60
> +#define VIU_JPEG_WCLK          61
> +#define VIU_CFG_CLK            62
> +#define TS_SYS_WCLK            63
> +#define TS_SYS_108M            64
> +#define USB20_HCLK             65
> +#define USB20_PHY_CLK          66
> +#define USB21_HCLK             67
> +#define USB21_PHY_CLK          68
> +#define GMAC_RMIICLK           69
> +#define GMAC_PCLK              70
> +#define GMAC_ACLK              71
> +#define GMAC_RFCLK             72
> +#define TEMPSENSOR_GATE                73
> +
> +#define TOP_NR_CLKS            74
> +
> +
> +#define LSP0_TIMER3_PCLK       1
> +#define LSP0_TIMER3_WCLK       2
> +#define LSP0_TIMER4_PCLK       3
> +#define LSP0_TIMER4_WCLK       4
> +#define LSP0_TIMER5_PCLK       5
> +#define LSP0_TIMER5_WCLK       6
> +#define LSP0_UART3_PCLK                7
> +#define LSP0_UART3_WCLK                8
> +#define LSP0_UART1_PCLK                9
> +#define LSP0_UART1_WCLK                10
> +#define LSP0_UART2_PCLK                11
> +#define LSP0_UART2_WCLK                12
> +#define LSP0_SPIFC0_PCLK       13
> +#define LSP0_SPIFC0_WCLK       14
> +#define LSP0_I2C4_PCLK         15
> +#define LSP0_I2C4_WCLK         16
> +#define LSP0_I2C5_PCLK         17
> +#define LSP0_I2C5_WCLK         18
> +#define LSP0_SSP0_PCLK         19
> +#define LSP0_SSP0_WCLK         20
> +#define LSP0_SSP1_PCLK         21
> +#define LSP0_SSP1_WCLK         22
> +#define LSP0_USIM_PCLK         23
> +#define LSP0_USIM_WCLK         24
> +#define LSP0_GPIO_PCLK         25
> +#define LSP0_GPIO_WCLK         26
> +#define LSP0_I2C3_PCLK         27
> +#define LSP0_I2C3_WCLK         28
> +
> +#define LSP0_NR_CLKS           29
> +
> +
> +#define LSP1_UART4_PCLK                1
> +#define LSP1_UART4_WCLK                2
> +#define LSP1_UART5_PCLK                3
> +#define LSP1_UART5_WCLK                4
> +#define LSP1_PWM_PCLK          5
> +#define LSP1_PWM_WCLK          6
> +#define LSP1_I2C2_PCLK         7
> +#define LSP1_I2C2_WCLK         8
> +#define LSP1_SSP2_PCLK         9
> +#define LSP1_SSP2_WCLK         10
> +#define LSP1_SSP3_PCLK         11
> +#define LSP1_SSP3_WCLK         12
> +#define LSP1_SSP4_PCLK         13
> +#define LSP1_SSP4_WCLK         14
> +#define LSP1_USIM1_PCLK                15
> +#define LSP1_USIM1_WCLK                16
> +
> +#define LSP1_NR_CLKS           17
> +#endif
> --
> 1.9.1
>
> Mike,

Do you have more comments on version 2 patches? Or you already plan to
merge them?

Thank you!
Jun

--001a1137b98eeb7211053af97082
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUiPjIwMTYtMDctMjkgMjE6NTggR01UKzA4OjAwIEp1biBOaWUgPHNwYW4g
ZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86anVuLm5pZUBsaW5hcm8ub3JnIiB0YXJnZXQ9
Il9ibGFuayI+anVuLm5pZUBsaW5hcm8ub3JnPC9hPiZndDs8L3NwYW4+Ojxicj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVm
dDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5UaGUgWlgyOTY3MTggY2xvY2tzIGFy
ZSBzdGF0aWNhbGx5IGxpc3RlZCBhbmQgcmVnaXN0ZXJlZC4gTW9yZTxicj4NCmNsb2NrIHdpbGwg
YmUgYWRkZWQgbGF0ZXIuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogSnVuIE5pZSAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmp1bi5uaWVAbGluYXJvLm9yZyI+anVuLm5pZUBsaW5hcm8ub3JnPC9hPiZn
dDs8YnI+DQotLS08YnI+DQrCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrLzx3YnI+engy
OTY3MTgtY2xrLnR4dMKgIMKgIMKgfMKgIDM1ICs8YnI+DQrCoGRyaXZlcnMvY2xrL3p0ZS9NYWtl
ZmlsZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfMKgIMKgMSArPGJy
Pg0KwqBkcml2ZXJzL2Nsay96dGUvY2xrLXp4Mjk2NzE4LmPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHwgODcwICsrKysrKysrKysrKysrKysrKysrKzxicj4NCsKgZHJpdmVycy9jbGsv
enRlL2Nsay5owqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfCAx
MjUgKysrPGJyPg0KwqBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrLzx3YnI+engyOTY3MTgtY2xv
Y2suaMKgIMKgIMKgIMKgIMKgfCAxNDAgKysrKzxicj4NCsKgNSBmaWxlcyBjaGFuZ2VkLCAxMTcx
IGluc2VydGlvbnMoKyk8YnI+DQrCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvPHdicj5iaW5kaW5ncy9jbG9jay96eDI5NjcxOC1jbGsuPHdicj50eHQ8YnI+DQrC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay96dGUvY2xrLXp4Mjk2NzE4LmM8YnI+DQrC
oGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrLzx3YnI+engyOTY3
MTgtY2xvY2suaDxicj4NCjxicj4NCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvPHdicj5iaW5kaW5ncy9jbG9jay96eDI5NjcxOC1jbGsuPHdicj50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvPHdicj5iaW5kaW5ncy9jbG9jay96eDI5NjcxOC1jbGsuPHdicj50eHQ8
YnI+DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAuLmE2YzVkODY8YnI+
DQotLS0gL2Rldi9udWxsPGJyPg0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlLzx3YnI+
YmluZGluZ3MvY2xvY2svengyOTY3MTgtY2xrLjx3YnI+dHh0PGJyPg0KQEAgLTAsMCArMSwzNSBA
QDxicj4NCitEZXZpY2UgVHJlZSBDbG9jayBiaW5kaW5ncyBmb3IgWlRFIHp4Mjk2NzE4PGJyPg0K
Kzxicj4NCitUaGlzIGJpbmRpbmcgdXNlcyB0aGUgY29tbW9uIGNsb2NrIGJpbmRpbmdbMV0uPGJy
Pg0KKzxicj4NCitbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlLzx3YnI+YmluZGluZ3MvY2xv
Y2svY2xvY2stYmluZGluZ3MuPHdicj50eHQ8YnI+DQorPGJyPg0KK1JlcXVpcmVkIHByb3BlcnRp
ZXM6PGJyPg0KKy0gY29tcGF0aWJsZSA6IHNoYWxsIGJlIG9uZSBvZiB0aGUgZm9sbG93aW5nOjxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O3p0ZSx6eDI5NjcxOC10b3Bjcm0mcXVvdDs6PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgengyOTY3MTggdG9wIGNsb2NrIHNlbGVjdGlvbiwgZGl2aWRl
ciBhbmQgZ2F0aW5nPGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCZxdW90O3p0ZSx6eDI5NjcxOC1s
c3AwY3JtJnF1b3Q7IGFuZDxicj4NCivCoCDCoCDCoCDCoCZxdW90O3p0ZSx6eDI5NjcxOC1sc3Ax
Y3JtJnF1b3Q7Ojxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHp4Mjk2NzE4IGRldmljZSBs
ZXZlbCBjbG9jayBzZWxlY3Rpb24gYW5kIGdhdGluZzxicj4NCis8YnI+DQorLSByZWc6IEFkZHJl
c3MgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0PGJyPg0KKzxicj4NCitUaGUgY2xvY2sg
Y29uc3VtZXIgc2hvdWxkIHNwZWNpZnkgdGhlIGRlc2lyZWQgY2xvY2sgYnkgaGF2aW5nIHRoZSBj
bG9jazxicj4NCitJRCBpbiBpdHMgJnF1b3Q7Y2xvY2tzJnF1b3Q7IHBoYW5kbGUgY2VsbC4gU2Vl
IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svPHdicj56eDI5NjcxOC1jbG9jay5oPGJyPg0KK2Zv
ciB0aGUgZnVsbCBsaXN0IG9mIHp4Mjk2NzE4IGNsb2NrIElEcy48YnI+DQorPGJyPg0KKzxicj4N
Cit0b3BjbGs6IHRvcGNybUAweDA5ODAwMDAwIHs8YnI+DQorwqAgwqAgwqAgwqAgY29tcGF0aWJs
ZSA9ICZxdW90O3p0ZSx6eDI5NjcxOC10b3Bjcm0tY2xrJnF1b3Q7Ozxicj4NCivCoCDCoCDCoCDC
oCByZWcgPSAmbHQ7MHgwMTQ2MTAwMCAweDEwMDAmZ3Q7Ozxicj4NCivCoCDCoCDCoCDCoCAjY2xv
Y2stY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KK307PGJyPg0KKzxicj4NCit1c2JwaHkwOnVzYi1w
aHkwezxicj4NCivCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDt6dGUsengyOTY3MTgtdXNi
LXBoeSZxdW90Ozs8YnI+DQorwqAgwqAgwqAgwqAjcGh5LWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4N
CivCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3RvcGNybSBVU0IyMF9QSFlfQ0xLJmd0Ozs8
YnI+DQorwqAgwqAgwqAgwqBjbG9jay1uYW1lcyA9ICZxdW90O3BoeWNsayZxdW90Ozs8YnI+DQor
wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCit9Ozxicj4NCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay96dGUvTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay96dGUvTWFrZWZp
bGU8YnI+DQppbmRleCA3NDAwNWFhLi44MzM3NGJmIDEwMDY0NDxicj4NCi0tLSBhL2RyaXZlcnMv
Y2xrL3p0ZS9NYWtlZmlsZTxicj4NCisrKyBiL2RyaXZlcnMvY2xrL3p0ZS9NYWtlZmlsZTxicj4N
CkBAIC0xLDIgKzEsMyBAQDxicj4NCsKgb2JqLXkgOj0gY2xrLm88YnI+DQrCoG9iai0kKENPTkZJ
R19TT0NfWlgyOTY3MDIpICs9IGNsay16eDI5NjcwMi5vPGJyPg0KK29iai0kKENPTkZJR19BUkNI
X1pYKSArPSBjbGstengyOTY3MTgubzxicj4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay96dGUv
Y2xrLTx3YnI+engyOTY3MTguYyBiL2RyaXZlcnMvY2xrL3p0ZS9jbGstPHdicj56eDI5NjcxOC5j
PGJyPg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCAwMDAwMDAwLi5mODJmNWI0Mzxi
cj4NCi0tLSAvZGV2L251bGw8YnI+DQorKysgYi9kcml2ZXJzL2Nsay96dGUvY2xrLTx3YnI+engy
OTY3MTguYzxicj4NCkBAIC0wLDAgKzEsODcwIEBAPGJyPg0KKy8qPGJyPg0KKyAqIENvcHlyaWdo
dCAoQykgMjAxNSAtIDIwMTYgWlRFIENvcnBvcmF0aW9uLjxicj4NCisgKiBDb3B5cmlnaHQgKEMp
IDIwMTYgTGluYXJvIEx0ZC48YnI+DQorICo8YnI+DQorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnk8YnI+DQorICog
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJz
aW9uIDIgYXM8YnI+DQorICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b24uPGJyPg0KKyAqLzxicj4NCisjaW5jbHVkZSAmbHQ7bGludXgvY2xrLXByb3ZpZGVyLmgmZ3Q7
PGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC9rZXJuZWwuaCZndDs8YnI+DQorI2luY2x1ZGUgJmx0
O2xpbnV4L29mLmgmZ3Q7PGJyPg0KKyNpbmNsdWRlICZsdDtsaW51eC9vZl9hZGRyZXNzLmgmZ3Q7
PGJyPg0KKzxicj4NCisjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvY2xvY2svengyOTY3MTgtPHdi
cj5jbG9jay5oJmd0Ozxicj4NCisjaW5jbHVkZSAmcXVvdDtjbGsuaCZxdW90Ozxicj4NCis8YnI+
DQorLyogVE9QIENSTSAqLzxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVYMMKgIMKgMHgwNDxicj4N
CisjZGVmaW5lIFRPUF9DTEtfTVVYMcKgIMKgMHgwODxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVY
MsKgIMKgMHgwYzxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVYM8KgIMKgMHgxMDxicj4NCisjZGVm
aW5lIFRPUF9DTEtfTVVYNMKgIMKgMHgxNDxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVYNcKgIMKg
MHgxODxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVYNsKgIMKgMHgxYzxicj4NCisjZGVmaW5lIFRP
UF9DTEtfTVVYN8KgIMKgMHgyMDxicj4NCisjZGVmaW5lIFRPUF9DTEtfTVVYOcKgIMKgMHgyODxi
cj4NCis8YnI+DQorPGJyPg0KKyNkZWZpbmUgVE9QX0NMS19HQVRFMMKgIDB4MzQ8YnI+DQorI2Rl
ZmluZSBUT1BfQ0xLX0dBVEUxwqAgMHgzODxicj4NCisjZGVmaW5lIFRPUF9DTEtfR0FURTLCoCAw
eDNjPGJyPg0KKyNkZWZpbmUgVE9QX0NMS19HQVRFM8KgIDB4NDA8YnI+DQorI2RlZmluZSBUT1Bf
Q0xLX0dBVEU0wqAgMHg0NDxicj4NCisjZGVmaW5lIFRPUF9DTEtfR0FURTXCoCAweDQ4PGJyPg0K
KyNkZWZpbmUgVE9QX0NMS19HQVRFNsKgIDB4NGM8YnI+DQorPGJyPg0KKyNkZWZpbmUgVE9QX0NM
S19ESVYwwqAgwqAweDU4PGJyPg0KKzxicj4NCisjZGVmaW5lIFBMTF9DUFVfUkVHwqAgwqAgMHg4
MDxicj4NCisjZGVmaW5lIFBMTF9WR0FfUkVHwqAgwqAgMHhiMDxicj4NCisjZGVmaW5lIFBMTF9E
RFJfUkVHwqAgwqAgMHhhMDxicj4NCis8YnI+DQorLyogTFNQMCBDUk0gKi88YnI+DQorI2RlZmlu
ZSBMU1AwX1RJTUVSM19DTEvCoCDCoCDCoCDCoCAweDQ8YnI+DQorI2RlZmluZSBMU1AwX1RJTUVS
NF9DTEvCoCDCoCDCoCDCoCAweDg8YnI+DQorI2RlZmluZSBMU1AwX1RJTUVSNV9DTEvCoCDCoCDC
oCDCoCAweGM8YnI+DQorI2RlZmluZSBMU1AwX1VBUlQzX0NMSyAweDEwPGJyPg0KKyNkZWZpbmUg
TFNQMF9VQVJUMV9DTEsgMHgxNDxicj4NCisjZGVmaW5lIExTUDBfVUFSVDJfQ0xLIDB4MTg8YnI+
DQorI2RlZmluZSBMU1AwX1NQSUZDMF9DTEvCoCDCoCDCoCDCoCAweDFjPGJyPg0KKyNkZWZpbmUg
TFNQMF9JMkM0X0NMS8KgIDB4MjA8YnI+DQorI2RlZmluZSBMU1AwX0kyQzVfQ0xLwqAgMHgyNDxi
cj4NCisjZGVmaW5lIExTUDBfU1NQMF9DTEvCoCAweDI4PGJyPg0KKyNkZWZpbmUgTFNQMF9TU1Ax
X0NMS8KgIDB4MmM8YnI+DQorI2RlZmluZSBMU1AwX1VTSU0wX0NMSyAweDMwPGJyPg0KKyNkZWZp
bmUgTFNQMF9HUElPX0NMS8KgIDB4MzQ8YnI+DQorI2RlZmluZSBMU1AwX0kyQzNfQ0xLwqAgMHgz
ODxicj4NCis8YnI+DQorLyogTFNQMSBDUk0gKi88YnI+DQorI2RlZmluZSBMU1AxX1VBUlQ0X0NM
SyAweDA4PGJyPg0KKyNkZWZpbmUgTFNQMV9VQVJUNV9DTEsgMHgwYzxicj4NCisjZGVmaW5lIExT
UDFfUFdNX0NMS8KgIMKgMHgxMDxicj4NCisjZGVmaW5lIExTUDFfSTJDMl9DTEvCoCAweDE0PGJy
Pg0KKyNkZWZpbmUgTFNQMV9TU1AyX0NMS8KgIDB4MWM8YnI+DQorI2RlZmluZSBMU1AxX1NTUDNf
Q0xLwqAgMHgyMDxicj4NCisjZGVmaW5lIExTUDFfU1NQNF9DTEvCoCAweDI0PGJyPg0KKyNkZWZp
bmUgTFNQMV9VU0lNMV9DTEsgMHgyODxicj4NCis8YnI+DQorLyogYXVkaW8gbHNwICovPGJyPg0K
KyNkZWZpbmUgQVVESU9fSTJTMF9ESVZfQ0ZHMcKgIMKgIDB4MTA8YnI+DQorI2RlZmluZSBBVURJ
T19JMlMwX0RJVl9DRkcywqAgwqAgMHgxNDxicj4NCisjZGVmaW5lIEFVRElPX0kyUzBfQ0xLwqAg
wqAgwqAgwqAgwqAweDE4PGJyPg0KKyNkZWZpbmUgQVVESU9fSTJTMV9ESVZfQ0ZHMcKgIMKgIDB4
MjA8YnI+DQorI2RlZmluZSBBVURJT19JMlMxX0RJVl9DRkcywqAgwqAgMHgyNDxicj4NCisjZGVm
aW5lIEFVRElPX0kyUzFfQ0xLwqAgwqAgwqAgwqAgwqAweDI4PGJyPg0KKyNkZWZpbmUgQVVESU9f
STJTMl9ESVZfQ0ZHMcKgIMKgIDB4MzA8YnI+DQorI2RlZmluZSBBVURJT19JMlMyX0RJVl9DRkcy
wqAgwqAgMHgzNDxicj4NCisjZGVmaW5lIEFVRElPX0kyUzJfQ0xLwqAgwqAgwqAgwqAgwqAweDM4
PGJyPg0KKyNkZWZpbmUgQVVESU9fSTJTM19ESVZfQ0ZHMcKgIMKgIDB4NDA8YnI+DQorI2RlZmlu
ZSBBVURJT19JMlMzX0RJVl9DRkcywqAgwqAgMHg0NDxicj4NCisjZGVmaW5lIEFVRElPX0kyUzNf
Q0xLwqAgwqAgwqAgwqAgwqAweDQ4PGJyPg0KKyNkZWZpbmUgQVVESU9fSTJDMF9DTEvCoCDCoCDC
oCDCoCDCoDB4NTA8YnI+DQorI2RlZmluZSBBVURJT19TUERJRjBfRElWX0NGRzHCoCAweDYwPGJy
Pg0KKyNkZWZpbmUgQVVESU9fU1BESUYwX0RJVl9DRkcywqAgMHg2NDxicj4NCisjZGVmaW5lIEFV
RElPX1NQRElGMF9DTEvCoCDCoCDCoCDCoDB4Njg8YnI+DQorI2RlZmluZSBBVURJT19TUERJRjFf
RElWX0NGRzHCoCAweDcwPGJyPg0KKyNkZWZpbmUgQVVESU9fU1BESUYxX0RJVl9DRkcywqAgMHg3
NDxicj4NCisjZGVmaW5lIEFVRElPX1NQRElGMV9DTEvCoCDCoCDCoCDCoDB4Nzg8YnI+DQorI2Rl
ZmluZSBBVURJT19USU1FUl9DTEvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAweDgwPGJyPg0KKyNk
ZWZpbmUgQVVESU9fVERNX0NMS8KgIMKgIMKgIMKgIMKgIDB4OTA8YnI+DQorI2RlZmluZSBBVURJ
T19UU19DTEvCoCDCoCDCoCDCoCDCoCDCoDB4YTA8YnI+DQorPGJyPg0KK3N0YXRpYyBERUZJTkVf
U1BJTkxPQ0soY2xrX2xvY2spOzxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCB6eF9wbGxfY29u
ZmlnIHBsbF9jcHVfdGFibGVbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqBQTExfUkFURSgxMzEyMDAw
MDAwLCAweDAwMTAzNjIxLCAweDA0YWFhYWFhKSw8YnI+DQorwqAgwqAgwqAgwqBQTExfUkFURSgx
NDA3MDAwMDAwLCAweDAwMTAzYTIxLCAweDA0YWFhYWFhKSw8YnI+DQorwqAgwqAgwqAgwqBQTExf
UkFURSgxNTAzMDAwMDAwLCAweDAwMTAzZTIxLCAweDA0YWFhYWFhKSw8YnI+DQorwqAgwqAgwqAg
wqBQTExfUkFURSgxNjAwMDAwMDAwLCAweDAwMTA0MjIxLCAweDA0YWFhYWFhKSw8YnI+DQorfTs8
YnI+DQorPGJyPg0KK1BOQU1FKG9zYykgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7b3NjMjRt
JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O29zYzMyayZxdW90Oyw8YnI+DQorfTs8YnI+
DQorPGJyPg0KK1BOQU1FKGRiZ193Y2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Ns
azMzNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNDY2bSZxdW90Oyw8YnI+DQor
wqAgwqAgwqAgwqAmcXVvdDtjbGszOTZtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Ns
azI1MG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRShhNzJfY29yZWNsa19wKSA9
IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtvc2MyNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKg
JnF1b3Q7cGxsX21tMF8xMTg4bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtwbGxfbW0x
XzEyOTZtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazEwMDBtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazY0OG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrMTYwMG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7cGxsX2F1ZGlvXzE4MDBtJnF1
b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O3BsbF92Z2FfMTgwMG0mcXVvdDssPGJyPg0KK307
PGJyPg0KKzxicj4NCitQTkFNRShjcHVfcGVyaWNsa19wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAm
cXVvdDtvc2MyNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNTAwbSZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs1OTRtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZx
dW90O2NsazQ2Nm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk0bSZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszMzRtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZx
dW90O2NsazI1MG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTI1bSZxdW90Oyw8
YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKGE1M19jb3JlY2xrX3ApID0gezxicj4NCivCoCDC
oCDCoCDCoCZxdW90O29zYzI0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxMDAw
bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtwbGxfbW0wXzExODhtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazY0OG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNTAwbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs4MDBtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazE2MDBtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90
O3BsbF9hdWRpb18xODAwbSZxdW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHNlY193
Y2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O29zYzI0bSZxdW90Oyw8YnI+DQorwqAg
wqAgwqAgwqAmcXVvdDtjbGszOTZtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazMz
NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk3bSZxdW90Oyw8YnI+DQorwqAg
wqAgwqAgwqAmcXVvdDtjbGsyNTBtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE5
OG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTQ4bTUmcXVvdDssPGJyPg0KK8Kg
IMKgIMKgIMKgJnF1b3Q7Y2xrOTltJnF1b3Q7LDxicj4NCit9Ozxicj4NCis8YnI+DQorUE5BTUUo
c2RfbmFuZF93Y2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O29zYzI0bSZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs0OW01JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZx
dW90O2Nsazk5bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxOThtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE2N20mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1
b3Q7Y2xrMTQ4bTUmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTI1bSZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyMTZtJnF1b3Q7LDxicj4NCit9Ozxicj4NCis8YnI+
DQorUE5BTUUoZW1tY193Y2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O29zYzI0bSZx
dW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxOThtJnF1b3Q7LDxicj4NCivCoCDCoCDC
oCDCoCZxdW90O2Nsazk5bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszOTZtJnF1
b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazMzNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKg
IMKgJnF1b3Q7Y2xrMjk3bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyNTBtJnF1
b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE0OG01JnF1b3Q7LDxicj4NCit9Ozxicj4N
Cis8YnI+DQorUE5BTUUoY2xrMzJfcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7b3NjMzJr
JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazMyazc2OCZxdW90Oyw8YnI+DQorfTs8
YnI+DQorPGJyPg0KK1BOQU1FKHVzYl9yZWYyNG1fcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1
b3Q7b3NjMzJrJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazMyazc2OCZxdW90Oyw8
YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHN5c19ub2NfYWxja19wKSA9IHs8YnI+DQorwqAg
wqAgwqAgwqAmcXVvdDtvc2MyNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjUw
bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxOThtJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCZxdW90O2NsazE0OG01JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazEw
OG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNTRtJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCZxdW90O2NsazIxNm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjQw
bSZxdW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHZkZV9hY2xrX3ApID0gezxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazMzNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNTk0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs1MDBtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazQzMm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNDgwbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyOTdtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2Nsa192Z2EmcXVvdDsswqAgLyo2MDBNSHoqLzxicj4NCivCoCDC
oCDCoCDCoCZxdW90O2NsazI5NG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRSh2
Y2VfYWNsa19wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszMzRtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazU5NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNTAwbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs0MzJtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazM5Nm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrMjk3bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGtfdmdhJnF1b3Q7LMKgIC8q
NjAwTUh6Ki88YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyOTRtJnF1b3Q7LDxicj4NCit9Ozxi
cj4NCis8YnI+DQorUE5BTUUoaGRlX2FjbGtfcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrMzM0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs1OTRtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazUwMG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNDMybSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszOTZtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazI5N20mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrX3ZnYSZxdW90OyzCoCAvKjYwME1IeiovPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk0
bSZxdW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKGdwdV9hY2xrX3ApID0gezxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazMzNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrNjQ4bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs1OTRtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2NsazUwMG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
Y2xrMzk2bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyOTdtJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2Nsa192Z2EmcXVvdDsswqAgLyo2MDBNSHoqLzxicj4NCivCoCDC
oCDCoCDCoCZxdW90O2NsazI5NG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRShz
YXBwdV9hY2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazM5Nm0mcXVvdDssPGJy
Pg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNTAwbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVv
dDtjbGsyNTBtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE0OG01JnF1b3Q7LDxi
cj4NCit9Ozxicj4NCis8YnI+DQorUE5BTUUoc2FwcHVfd2Nsa19wKSA9IHs8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtjbGsxOThtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazM5Nm0m
cXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMzM0bSZxdW90Oyw8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtjbGsyOTdtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazI1MG0m
cXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTQ4bTUmcXVvdDssPGJyPg0KK8KgIMKg
IMKgIMKgJnF1b3Q7Y2xrMTI1bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs5OW0m
cXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRSh2b3VfYWNsa19wKSA9IHs8YnI+DQor
wqAgwqAgwqAgwqAmcXVvdDtjbGszMzRtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Ns
azU5NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNTAwbSZxdW90Oyw8YnI+DQor
wqAgwqAgwqAgwqAmcXVvdDtjbGs0MzJtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Ns
azM5Nm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk3bSZxdW90Oyw8YnI+DQor
wqAgwqAgwqAgwqAmcXVvdDtjbGtfdmdhJnF1b3Q7LMKgIC8qNjAwTUh6Ki88YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtjbGsyOTRtJnF1b3Q7LDxicj4NCit9Ozxicj4NCis8YnI+DQorUE5BTUUodm91
X21haW5fd2Nsa19wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxMDhtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazU5NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1
b3Q7Y2xrMjk3bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxNDhtNSZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs3NG0yNSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAm
cXVvdDtjbGs1NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjdtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2Nsa192Z2EmcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4N
CitQTkFNRSh2b3VfYXV4X3djbGtfcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTA4
bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxNDhtNSZxdW90Oyw8YnI+DQorwqAg
wqAgwqAgwqAmcXVvdDtjbGs3NG0yNSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGs1
NG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjdtJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCZxdW90O2Nsa192Z2EmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrNTRt
X21tMCZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsmcXVvdDs8YnI+DQorfTs8YnI+
DQorPGJyPg0KK1BOQU1FKHZvdV9wcHVfd2Nsa19wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVv
dDtjbGszMzRtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazQzMm0mcXVvdDssPGJy
Pg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMzk2bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVv
dDtjbGsyOTdtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazI1MG0mcXVvdDssPGJy
Pg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTI1bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVv
dDtjbGsxOThtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Nsazk5bSZxdW90Oyw8YnI+
DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHZnYV9pMmNfd2Nsa19wKSA9IHs8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtvc2MyNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrOTltJnF1
b3Q7LDxicj4NCit9Ozxicj4NCis8YnI+DQorUE5BTUUodml1X20wX2FjbGtfcCkgPSB7PGJyPg0K
K8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMzM0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtj
bGs0MzJtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazM5Nm0mcXVvdDssPGJyPg0K
K8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk3bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtj
bGsyNTBtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazEyNW0mcXVvdDssPGJyPg0K
K8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTk4bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtv
c2MyNG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRSh2aXVfbTFfYWNsa19wKSA9
IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxOThtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDC
oCZxdW90O2NsazI1MG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMjk3bSZxdW90
Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxMjVtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDC
oCZxdW90O2NsazM5Nm0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMzM0bSZxdW90
Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxNDhtNSZxdW90Oyw8YnI+DQorwqAgwqAgwqAg
wqAmcXVvdDtvc2MyNG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRSh2aXVfY2xr
X3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE5OG0mcXVvdDssPGJyPg0KK8KgIMKg
IMKgIMKgJnF1b3Q7Y2xrMzM0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsyOTdt
JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazI1MG0mcXVvdDssPGJyPg0KK8KgIMKg
IMKgIMKgJnF1b3Q7Y2xrMzk2bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxMjVt
JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Nsazk5bSZxdW90Oyw8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtjbGsxNDhtNSZxdW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHZp
dV9qcGVnX2Nsa19wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszMzRtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazQ4MG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1
b3Q7Y2xrNDMybSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGszOTZtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazI5N20mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1
b3Q7Y2xrMjUwbSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsxMjVtJnF1b3Q7LDxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE5OG0mcXVvdDssPGJyPg0KK307PGJyPg0KKzxicj4N
CitQTkFNRSh0c19zeXNfY2xrX3ApID0gezxicj4NCivCoCDCoCDCoCDCoCZxdW90O2NsazE5Mm0m
cXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7Y2xrMTY3bSZxdW90Oyw8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtjbGsxMjVtJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2Nsazk5bSZx
dW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKHdkdF9hcmVzX3ApID0gezxicj4NCivC
oCDCoCDCoCDCoCZxdW90O29zYzI0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtjbGsz
MmsmcXVvdDs8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3QgY2xrX3p4X3BsbCB6
eDI5NjcxOF9wbGxfY2xrW10gPSB7PGJyPg0KK8KgIMKgIMKgIMKgWlgyOTY3MThfUExMKCZxdW90
O3BsbF9jcHUmcXVvdDssICZxdW90O29zYzI0bSZxdW90OyzCoCDCoCDCoCDCoFBMTF9DUFVfUkVH
LMKgIMKgIHBsbF9jcHVfdGFibGUpLDxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIHN0cnVj
dCB6eF9jbGtfZml4ZWRfZmFjdG9yIHRvcF9mZmFjdG9yX2Nsa1tdID0gezxicj4NCivCoCDCoCDC
oCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrNG0mcXVvdDsswqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDtvc2MyNG0mcXVvdDssIDEsIDYswqAgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAm
cXVvdDtjbGsybSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCDCoCZxdW90O29zYzI0bSZxdW90Oywg
MSwgMTIsIDApLDxicj4NCivCoCDCoCDCoCDCoC8qIHBsbCBjcHUgKi88YnI+DQorwqAgwqAgwqAg
wqBGRkFDVE9SKDAsICZxdW90O2NsazE2MDBtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgICZxdW90O3Bs
bF9jcHUmcXVvdDssIDEsIDEsIENMS19TRVRfUkFURV9QQVJFTlQpLDxicj4NCivCoCDCoCDCoCDC
oEZGQUNUT1IoMCwgJnF1b3Q7Y2xrODAwbSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3Bs
bF9jcHUmcXVvdDssIDEsIDIsIENMS19TRVRfUkFURV9QQVJFTlQpLDxicj4NCivCoCDCoCDCoCDC
oC8qIHBsbCBtYWMgKi88YnI+DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90O2NsazI1bSZx
dW90OyzCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtwbGxfbWFjJnF1b3Q7LCAxLCA0MCwgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGsxMjVtJnF1b3Q7LMKgIMKgIMKgIMKg
IMKgIMKgJnF1b3Q7cGxsX21hYyZxdW90OywgMSwgOCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZB
Q1RPUigwLCAmcXVvdDtjbGsyNTBtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21h
YyZxdW90OywgMSwgNCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGs1
MG0mcXVvdDsswqAgwqAgwqAgwqAgwqAgwqAgJnF1b3Q7cGxsX21hYyZxdW90OywgMSwgMjAsIDAp
LDxicj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrNTAwbSZxdW90OyzCoCDCoCDC
oCDCoCDCoCDCoCZxdW90O3BsbF9tYWMmcXVvdDssIDEsIDIsIDApLDxicj4NCivCoCDCoCDCoCDC
oEZGQUNUT1IoMCwgJnF1b3Q7Y2xrMTAwMG0mcXVvdDsswqAgwqAgwqAgwqAgwqAgJnF1b3Q7cGxs
X21hYyZxdW90OywgMSwgMSwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtj
bGszMzRtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21hYyZxdW90OywgMSwgMywg
MCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGsxNjdtJnF1b3Q7LMKgIMKg
IMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21hYyZxdW90OywgMSwgNiwgMCksPGJyPg0KK8KgIMKgIMKg
IMKgLyogcGxsIG1tICovPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGs1NG1f
bW0wJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDIyLCAwKSw8YnI+
DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90O2Nsazc0bTI1JnF1b3Q7LMKgIMKgIMKgIMKg
IMKgICZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDE2LCAwKSw8YnI+DQorwqAgwqAgwqAgwqBGRkFD
VE9SKDAsICZxdW90O2NsazE0OG01JnF1b3Q7LMKgIMKgIMKgIMKgIMKgICZxdW90O3BsbF9tbTAm
cXVvdDssIDEsIDgsIDApLDxicj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrMjk3
bSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDQsIDApLDxi
cj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrNTk0bSZxdW90OyzCoCDCoCDCoCDC
oCDCoCDCoCZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDIsIDApLDxicj4NCivCoCDCoCDCoCDCoEZG
QUNUT1IoMCwgJnF1b3Q7cGxsX21tMF8xMTg4bSZxdW90OyzCoCDCoCDCoCZxdW90O3BsbF9tbTAm
cXVvdDssIDEsIDEsIDApLDxicj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrMzk2
bSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDMsIDApLDxi
cj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrMTk4bSZxdW90OyzCoCDCoCDCoCDC
oCDCoCDCoCZxdW90O3BsbF9tbTAmcXVvdDssIDEsIDYsIDApLDxicj4NCivCoCDCoCDCoCDCoEZG
QUNUT1IoMCwgJnF1b3Q7Y2xrOTltJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O3BsbF9t
bTAmcXVvdDssIDEsIDEyLCAwKSw8YnI+DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90O2Ns
azQ5bTUmcXVvdDsswqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtwbGxfbW0wJnF1b3Q7LCAxLCAyNCwg
MCksPGJyPg0KK8KgIMKgIMKgIMKgLyogcGxsIG1tICovPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RP
UigwLCAmcXVvdDtjbGszMjRtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21tMSZx
dW90OywgMSwgNCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGs2NDht
JnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21tMSZxdW90OywgMSwgMiwgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtwbGxfbW0xXzEyOTZtJnF1b3Q7LMKgIMKg
IMKgJnF1b3Q7cGxsX21tMSZxdW90OywgMSwgMSwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RP
UigwLCAmcXVvdDtjbGsyMTZtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21tMSZx
dW90OywgMSwgNiwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGs0MzJt
JnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX21tMSZxdW90OywgMSwgMywgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGsxMDhtJnF1b3Q7LMKgIMKgIMKgIMKg
IMKgIMKgJnF1b3Q7cGxsX21tMSZxdW90OywgMSwgMTIsIDApLDxicj4NCivCoCDCoCDCoCDCoEZG
QUNUT1IoMCwgJnF1b3Q7Y2xrNzJtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgIMKgICZxdW90O3BsbF9t
bTEmcXVvdDssIDEsIDE4LCAwKSw8YnI+DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90O2Ns
azI3bSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtwbGxfbW0xJnF1b3Q7LCAxLCA0OCwg
MCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGs1NG0mcXVvdDsswqAgwqAg
wqAgwqAgwqAgwqAgJnF1b3Q7cGxsX21tMSZxdW90OywgMSwgMjQsIDApLDxicj4NCivCoCDCoCDC
oCDCoC8qIHZnYSAqLzxicj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7cGxsX3ZnYV8x
ODAwbSZxdW90OyzCoCDCoCDCoCZxdW90O3BsbF92Z2EmcXVvdDssIDEsIDEsIDApLDxicj4NCivC
oCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrX3ZnYSZxdW90OyzCoCDCoCDCoCDCoCDCoCDC
oCZxdW90O3BsbF92Z2EmcXVvdDssIDEsIDIsIDApLDxicj4NCivCoCDCoCDCoCDCoC8qIHBsbCBk
ZHIgKi88YnI+DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90O2NsazQ2Nm0mcXVvdDsswqAg
wqAgwqAgwqAgwqAgwqAmcXVvdDtwbGxfZGRyJnF1b3Q7LCAxLCAyLCAwKSw8YnI+DQorPGJyPg0K
K8KgIMKgIMKgIMKgLyogcGxsIGF1ZGlvICovPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAm
cXVvdDtwbGxfYXVkaW9fMTgwMG0mcXVvdDsswqAgwqAmcXVvdDtwbGxfYXVkaW8mcXVvdDssIDEs
IDEsIDApLDxicj4NCivCoCDCoCDCoCDCoEZGQUNUT1IoMCwgJnF1b3Q7Y2xrMzJrNzY4JnF1b3Q7
LMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGxsX2F1ZGlvJnF1b3Q7LCAxLCAyNzAwMCwgMCksPGJyPg0K
K8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGsxNm0zODQmcXVvdDsswqAgwqAgwqAgwqAg
wqAmcXVvdDtwbGxfYXVkaW8mcXVvdDssIDEsIDU0LCAwKSw8YnI+DQorwqAgwqAgwqAgwqBGRkFD
VE9SKDAsICZxdW90O2NsazI5NG0mcXVvdDsswqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtwbGxfYXVk
aW8mcXVvdDssIDEsIDMsIDApLDxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKiBwbGwgaHNpYyov
PGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGsyNDBtJnF1b3Q7LMKgIMKgIMKg
IMKgIMKgIMKgJnF1b3Q7cGxsX2hzaWMmcXVvdDssIDEsIDQsIDApLDxicj4NCivCoCDCoCDCoCDC
oEZGQUNUT1IoMCwgJnF1b3Q7Y2xrNDgwbSZxdW90OyzCoCDCoCDCoCDCoCDCoCDCoCZxdW90O3Bs
bF9oc2ljJnF1b3Q7LCAxLCAyLCAwKSw8YnI+DQorwqAgwqAgwqAgwqBGRkFDVE9SKDAsICZxdW90
O2NsazE5Mm0mcXVvdDsswqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtwbGxfaHNpYyZxdW90OywgMSwg
NSwgMCksPGJyPg0KK8KgIMKgIMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtjbGtfcGxsXzI0bSZxdW90
OyzCoCDCoCDCoCDCoCZxdW90O3BsbF9oc2ljJnF1b3Q7LCAxLCA0MCwgMCksPGJyPg0KK8KgIMKg
IMKgIMKgRkZBQ1RPUigwLCAmcXVvdDtlbW1jX211eF9kaXYyJnF1b3Q7LMKgIMKgIMKgJnF1b3Q7
ZW1tY19tdXgmcXVvdDssIDEsIDIsIENMS19TRVRfUkFURV9QQVJFTlQpLDxicj4NCit9Ozxicj4N
Cis8YnI+DQorc3RhdGljIHN0cnVjdCBjbGtfZGl2X3RhYmxlIG5vY19kaXZfdGFibGVbXSA9IHs8
YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSAxLCAuZGl2ID0gMiwgfSw8YnI+DQorwqAgwqAgwqAg
wqB7IC52YWwgPSAzLCAuZGl2ID0gNCwgfSw8YnI+DQorfTs8YnI+DQorc3RhdGljIHN0cnVjdCB6
eF9jbGtfZGl2IHRvcF9kaXZfY2xrW10gPSB7PGJyPg0KK8KgIMKgIMKgIMKgRElWX1QoMCwgJnF1
b3Q7c3lzX25vY19oY2xrJnF1b3Q7LCAmcXVvdDtzeXNfbm9jX2FjbGsmcXVvdDssIFRPUF9DTEtf
RElWMCwgMCwgMiwgMCwgbm9jX2Rpdl90YWJsZSksPGJyPg0KK8KgIMKgIMKgIMKgRElWX1QoMCwg
JnF1b3Q7c3lzX25vY19wY2xrJnF1b3Q7LCAmcXVvdDtzeXNfbm9jX2FjbGsmcXVvdDssIFRPUF9D
TEtfRElWMCwgNCwgMiwgMCwgbm9jX2Rpdl90YWJsZSksPGJyPg0KK307PGJyPg0KKzxicj4NCitz
dGF0aWMgc3RydWN0IHp4X2Nsa19tdXggdG9wX211eF9jbGtbXSA9IHs8YnI+DQorwqAgwqAgwqAg
wqBNVVgoMCwgJnF1b3Q7ZGJnX211eCZxdW90OyzCoCDCoCDCoCDCoCBkYmdfd2Nsa19wLMKgIMKg
IMKgIFRPUF9DTEtfTVVYMCwgMTIsIDIpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDth
NzJfbXV4JnF1b3Q7LMKgIMKgIMKgIMKgIGE3Ml9jb3JlY2xrX3AswqAgwqBUT1BfQ0xLX01VWDAs
IDgsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDtjcHVfcGVyaV9tdXgmcXVvdDss
wqAgwqBjcHVfcGVyaWNsa19wLMKgIMKgVE9QX0NMS19NVVgwLCA0LCAzKSw8YnI+DQorwqAgwqAg
wqAgwqBNVVhfRigwLCAmcXVvdDthNTNfbXV4JnF1b3Q7LMKgIMKgIMKgIGE1M19jb3JlY2xrX3As
wqAgwqBUT1BfQ0xLX01VWDAsIDAsIDMsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivC
oCDCoCDCoCDCoE1VWCgwLCAmcXVvdDtzeXNfbm9jX2FjbGsmcXVvdDsswqAgwqBzeXNfbm9jX2Fs
Y2tfcCzCoCBUT1BfQ0xLX01VWDEsIDAsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVv
dDtzZWNfbXV4JnF1b3Q7LMKgIMKgIMKgIMKgIHNlY193Y2xrX3AswqAgwqAgwqAgVE9QX0NMS19N
VVgyLCAxNiwgMyksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O3NkMV9tdXgmcXVvdDss
wqAgwqAgwqAgwqAgc2RfbmFuZF93Y2xrX3AswqAgVE9QX0NMS19NVVgyLCAxMiwgMyksPGJyPg0K
K8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O3NkMF9tdXgmcXVvdDsswqAgwqAgwqAgwqAgc2RfbmFu
ZF93Y2xrX3AswqAgVE9QX0NMS19NVVgyLCA4LCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwg
JnF1b3Q7ZW1tY19tdXgmcXVvdDsswqAgwqAgwqAgwqBlbW1jX3djbGtfcCzCoCDCoCDCoFRPUF9D
TEtfTVVYMiwgNCwgMyksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O25hbmRfbXV4JnF1
b3Q7LMKgIMKgIMKgIMKgc2RfbmFuZF93Y2xrX3AswqAgVE9QX0NMS19NVVgyLCAwLCAzKSw8YnI+
DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dXNiX3JlZjI0bV9tdXgmcXVvdDssIHVzYl9yZWYy
NG1fcCzCoCDCoCBUT1BfQ0xLX01VWDksIDE2LCAxKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwg
JnF1b3Q7Y2xrMzJrJnF1b3Q7LMKgIMKgIMKgIMKgIMKgY2xrMzJfcCzCoCDCoCDCoCDCoCDCoFRP
UF9DTEtfTVVYOSwgMTIsIDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWF9GKDAsICZxdW90O3dkdF9t
dXgmcXVvdDsswqAgwqAgwqAgd2R0X2FyZXNfcCzCoCDCoCDCoCBUT1BfQ0xLX01VWDksIDgsIDEs
IENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt0
aW1lcl9tdXgmcXVvdDsswqAgwqAgwqAgb3NjLMKgIMKgIMKgIMKgIMKgIMKgIMKgVE9QX0NMS19N
VVg5LCA0LCAxKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dmRlX211eCZxdW90OyzC
oCDCoCDCoCDCoCB2ZGVfYWNsa19wLMKgIMKgIMKgIFRPUF9DTEtfTVVYNCzCoCAwLCAzKSw8YnI+
DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dmNlX211eCZxdW90OyzCoCDCoCDCoCDCoCB2Y2Vf
YWNsa19wLMKgIMKgIMKgIFRPUF9DTEtfTVVYNCzCoCA0LCAzKSw8YnI+DQorwqAgwqAgwqAgwqBN
VVgoMCwgJnF1b3Q7aGRlX211eCZxdW90OyzCoCDCoCDCoCDCoCBoZGVfYWNsa19wLMKgIMKgIMKg
IFRPUF9DTEtfTVVYNCzCoCA4LCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7Z3B1
X211eCZxdW90OyzCoCDCoCDCoCDCoCBncHVfYWNsa19wLMKgIMKgIMKgIFRPUF9DTEtfTVVYNSzC
oCAwLCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7c2FwcHVfYV9tdXgmcXVvdDss
wqAgwqAgc2FwcHVfYWNsa19wLMKgIMKgIFRPUF9DTEtfTVVYNSzCoCA0LCAyKSw8YnI+DQorwqAg
wqAgwqAgwqBNVVgoMCwgJnF1b3Q7c2FwcHVfd19tdXgmcXVvdDsswqAgwqAgc2FwcHVfd2Nsa19w
LMKgIMKgIFRPUF9DTEtfTVVYNSzCoCA4LCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1
b3Q7dm91X2FfbXV4JnF1b3Q7LMKgIMKgIMKgIHZvdV9hY2xrX3AswqAgwqAgwqAgVE9QX0NMS19N
VVg3LMKgIDAsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt2b3VfbWFpbl93X211
eCZxdW90Oywgdm91X21haW5fd2Nsa19wLCBUT1BfQ0xLX01VWDcswqAgNCwgMyksPGJyPg0KK8Kg
IMKgIMKgIMKgTVVYKDAsICZxdW90O3ZvdV9hdXhfd19tdXgmcXVvdDsswqAgdm91X2F1eF93Y2xr
X3AswqAgVE9QX0NMS19NVVg3LMKgIDgsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVv
dDt2b3VfcHB1X3dfbXV4JnF1b3Q7LMKgIHZvdV9wcHVfd2Nsa19wLMKgIFRPUF9DTEtfTVVYNywg
MTIsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt2Z2FfaTJjX211eCZxdW90OyzC
oCDCoCB2Z2FfaTJjX3djbGtfcCzCoCBUT1BfQ0xLX01VWDcsIDE2LCAxKSw8YnI+DQorwqAgwqAg
wqAgwqBNVVgoMCwgJnF1b3Q7dml1X20wX2FfbXV4JnF1b3Q7LMKgIMKgdml1X20wX2FjbGtfcCzC
oCDCoFRPUF9DTEtfTVVYNizCoCAwLCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7
dml1X20xX2FfbXV4JnF1b3Q7LMKgIMKgdml1X20xX2FjbGtfcCzCoCDCoFRPUF9DTEtfTVVYNizC
oCA0LCAzKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dml1X3dfbXV4JnF1b3Q7LMKg
IMKgIMKgIHZpdV9jbGtfcCzCoCDCoCDCoCDCoFRPUF9DTEtfTVVYNizCoCA4LCAzKSw8YnI+DQor
wqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dml1X2pwZWdfd19tdXgmcXVvdDssIHZpdV9qcGVnX2Ns
a19wLMKgIFRPUF9DTEtfTVVYNiwgMTIsIDMpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVv
dDt0c19zeXNfbXV4JnF1b3Q7LMKgIMKgIMKgdHNfc3lzX2Nsa19wLMKgIMKgIFRPUF9DTEtfTVVY
NiwgMTYsIDIpLDxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCB6eF9jbGtfZ2F0
ZSB0b3BfZ2F0ZV9jbGtbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqBHQVRFKENQVV9EQkdfR0FURSzC
oCDCoCAmcXVvdDtkYmdfd2NsayZxdW90OyzCoCDCoCDCoCDCoCAmcXVvdDtkYmdfbXV4JnF1b3Q7
LMKgIMKgIMKgIMKgIFRPUF9DTEtfR0FURTAsIDQsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxi
cj4NCivCoCDCoCDCoCDCoEdBVEUoQTcyX0dBVEUswqAgwqAgwqAgwqAgJnF1b3Q7YTcyX2NvcmVj
bGsmcXVvdDsswqAgwqAgwqAmcXVvdDthNzJfbXV4JnF1b3Q7LMKgIMKgIMKgIMKgIFRPUF9DTEtf
R0FURTAsIDMsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUo
Q1BVX1BFUklfR0FURSzCoCDCoCZxdW90O2NwdV9wZXJpJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90
O2NwdV9wZXJpX211eCZxdW90OyzCoCDCoFRPUF9DTEtfR0FURTAsIDEsIENMS19TRVRfUkFURV9Q
QVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoQTUzX0dBVEUswqAgwqAgwqAgwqAgJnF1
b3Q7YTUzX2NvcmVjbGsmcXVvdDsswqAgwqAgwqAmcXVvdDthNTNfbXV4JnF1b3Q7LMKgIMKgIMKg
IMKgIFRPUF9DTEtfR0FURTAsIDAsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDC
oCDCoCDCoEdBVEUoU0QxX1dDTEsswqAgwqAgwqAgwqAgJnF1b3Q7c2QxX3djbGsmcXVvdDsswqAg
wqAgwqAgwqAgJnF1b3Q7c2QxX211eCZxdW90OyzCoCDCoCDCoCDCoCBUT1BfQ0xLX0dBVEUxLCAx
MywgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShTRDBfV0NM
SyzCoCDCoCDCoCDCoCAmcXVvdDtzZDBfd2NsayZxdW90OyzCoCDCoCDCoCDCoCAmcXVvdDtzZDBf
bXV4JnF1b3Q7LMKgIMKgIMKgIMKgIFRPUF9DTEtfR0FURTEsIDksIENMS19TRVRfUkFURV9QQVJF
TlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoRU1NQ19XQ0xLLMKgIMKgIMKgIMKgJnF1b3Q7
ZW1tY193Y2xrJnF1b3Q7LMKgIMKgIMKgIMKgJnF1b3Q7ZW1tY19tdXhfZGl2MiZxdW90OyzCoCBU
T1BfQ0xLX0dBVEUwLCA1LCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAg
wqBHQVRFKEVNTUNfTkFORF9BWEkswqAgwqAmcXVvdDtlbW1jX25hbmRfYWNsayZxdW90OyzCoCAm
cXVvdDtzeXNfbm9jX2FjbGsmcXVvdDsswqAgwqBUT1BfQ0xLX0dBVEUxLCA0LCBDTEtfU0VUX1JB
VEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKE5BTkRfV0NMSyzCoCDCoCDCoCDC
oCZxdW90O25hbmRfd2NsayZxdW90OyzCoCDCoCDCoCDCoCZxdW90O25hbmRfbXV4JnF1b3Q7LMKg
IMKgIMKgIMKgVE9QX0NMS19HQVRFMCwgMSwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0K
K8KgIMKgIMKgIMKgR0FURShFTU1DX05BTkRfQUhCLMKgIMKgJnF1b3Q7ZW1tY19uYW5kX2hjbGsm
cXVvdDsswqAgJnF1b3Q7c3lzX25vY19oY2xrJnF1b3Q7LMKgIMKgVE9QX0NMS19HQVRFMSwgMCwg
Q0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURSgwLMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJnF1b3Q7bHNwMV9wY2xrJnF1b3Q7LMKgIMKgIMKgIMKgJnF1b3Q7c3lz
X25vY19wY2xrJnF1b3Q7LMKgIMKgVE9QX0NMS19HQVRFMiwgMzEsIDAswqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShMU1AxXzE0OE01LMKgIMKgIMKg
ICZxdW90O2xzcDFfMTQ4bTUmcXVvdDsswqAgwqAgwqAgJnF1b3Q7Y2xrMTQ4bTUmcXVvdDsswqAg
wqAgwqAgwqBUT1BfQ0xLX0dBVEUyLCAzMCwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
KSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDFfOTlNLMKgIMKgIMKgIMKgICZxdW90O2xzcDFf
OTltJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O2Nsazk5bSZxdW90OyzCoCDCoCDCoCDCoCDCoFRP
UF9DTEtfR0FURTIsIDI5LCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDApLDxicj4NCivC
oCDCoCDCoCDCoEdBVEUoTFNQMV8yNE0swqAgwqAgwqAgwqAgJnF1b3Q7bHNwMV8yNG0mcXVvdDss
wqAgwqAgwqAgwqAgJnF1b3Q7b3NjMjRtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19HQVRF
MiwgMjgsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCksPGJyPg0KK8KgIMKgIMKgIMKg
R0FURShMU1AwXzc0TTI1LMKgIMKgIMKgICZxdW90O2xzcDBfNzRtMjUmcXVvdDsswqAgwqAgwqAg
JnF1b3Q7Y2xrNzRtMjUmcXVvdDsswqAgwqAgwqAgwqBUT1BfQ0xLX0dBVEUyLCAyNSwgMCzCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKDAswqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtsc3AwX3BjbGsmcXVvdDsswqAgwqAgwqAgwqAmcXVvdDtz
eXNfbm9jX3BjbGsmcXVvdDsswqAgwqBUT1BfQ0xLX0dBVEUyLCAyNCwgMCzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDBfMzJLLMKgIMKgIMKg
IMKgICZxdW90O2xzcDBfMzJrJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O29zYzMyayZxdW90OyzC
oCDCoCDCoCDCoCDCoFRPUF9DTEtfR0FURTIsIDIzLCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMF8xNDhNNSzCoCDCoCDCoCAmcXVvdDts
c3AwXzE0OG01JnF1b3Q7LMKgIMKgIMKgICZxdW90O2NsazE0OG01JnF1b3Q7LMKgIMKgIMKgIMKg
VE9QX0NMS19HQVRFMiwgMjIsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCksPGJyPg0K
K8KgIMKgIMKgIMKgR0FURShMU1AwXzk5TSzCoCDCoCDCoCDCoCAmcXVvdDtsc3AwXzk5bSZxdW90
OyzCoCDCoCDCoCDCoCAmcXVvdDtjbGs5OW0mcXVvdDsswqAgwqAgwqAgwqAgwqBUT1BfQ0xLX0dB
VEUyLCAyMSwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwKSw8YnI+DQorwqAgwqAgwqAg
wqBHQVRFKExTUDBfMjRNLMKgIMKgIMKgIMKgICZxdW90O2xzcDBfMjRtJnF1b3Q7LMKgIMKgIMKg
IMKgICZxdW90O29zYzI0bSZxdW90OyzCoCDCoCDCoCDCoCDCoFRPUF9DTEtfR0FURTIsIDIwLCAw
LMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoQVVE
SU9fOTlNLMKgIMKgIMKgIMKgJnF1b3Q7YXVkaW9fOTltJnF1b3Q7LMKgIMKgIMKgIMKgJnF1b3Q7
Y2xrOTltJnF1b3Q7LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19HQVRFNSwgMjcsIDAswqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShBVURJT18yNE0swqAg
wqAgwqAgwqAmcXVvdDthdWRpb18yNG0mcXVvdDsswqAgwqAgwqAgwqAmcXVvdDtvc2MyNG0mcXVv
dDsswqAgwqAgwqAgwqAgwqBUT1BfQ0xLX0dBVEU1LCAyOCwgMCzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEFVRElPXzE2TTM4NCzCoCDCoCAmcXVv
dDthdWRpb18xNm0zODQmcXVvdDsswqAgwqAgJnF1b3Q7Y2xrMTZtMzg0JnF1b3Q7LMKgIMKgIMKg
IFRPUF9DTEtfR0FURTUsIDI5LCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDApLDxicj4N
CivCoCDCoCDCoCDCoEdBVEUoQVVESU9fMzJLLMKgIMKgIMKgIMKgJnF1b3Q7YXVkaW9fMzJrJnF1
b3Q7LMKgIMKgIMKgIMKgJnF1b3Q7Y2xrMzJrJnF1b3Q7LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19H
QVRFNSwgMzAsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCksPGJyPg0KK8KgIMKgIMKg
IMKgR0FURShXRFRfV0NMSyzCoCDCoCDCoCDCoCAmcXVvdDt3ZHRfd2NsayZxdW90OyzCoCDCoCDC
oCDCoCAmcXVvdDt3ZHRfbXV4JnF1b3Q7LMKgIMKgIMKgIMKgIFRPUF9DTEtfR0FURTYsIDksIENM
S19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoVElNRVJfV0NMSyzC
oCDCoCDCoCAmcXVvdDt0aW1lcl93Y2xrJnF1b3Q7LMKgIMKgIMKgICZxdW90O3RpbWVyX211eCZx
dW90OyzCoCDCoCDCoCBUT1BfQ0xLX0dBVEU2LCA1LCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8
YnI+DQorwqAgwqAgwqAgwqBHQVRFKFZERV9BQ0xLLMKgIMKgIMKgIMKgICZxdW90O3ZkZV9hY2xr
JnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O3ZkZV9tdXgmcXVvdDsswqAgwqAgwqAgwqAgVE9QX0NM
S19HQVRFMywgMCzCoCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBH
QVRFKFZDRV9BQ0xLLMKgIMKgIMKgIMKgICZxdW90O3ZjZV9hY2xrJnF1b3Q7LMKgIMKgIMKgIMKg
ICZxdW90O3ZjZV9tdXgmcXVvdDsswqAgwqAgwqAgwqAgVE9QX0NMS19HQVRFMywgNCzCoCBDTEtf
U0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEhERV9BQ0xLLMKgIMKg
IMKgIMKgICZxdW90O2hkZV9hY2xrJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O2hkZV9tdXgmcXVv
dDsswqAgwqAgwqAgwqAgVE9QX0NMS19HQVRFMywgOCzCoCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAw
KSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEdQVV9BQ0xLLMKgIMKgIMKgIMKgICZxdW90O2dwdV9h
Y2xrJnF1b3Q7LMKgIMKgIMKgIMKgICZxdW90O2dwdV9tdXgmcXVvdDsswqAgwqAgwqAgwqAgVE9Q
X0NMS19HQVRFMywgMTYsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDC
oEdBVEUoU0FQUFVfQUNMSyzCoCDCoCDCoCAmcXVvdDtzYXBwdV9hY2xrJnF1b3Q7LMKgIMKgIMKg
ICZxdW90O3NhcHB1X2FfbXV4JnF1b3Q7LMKgIMKgIFRPUF9DTEtfR0FURTMsIDIwLCBDTEtfU0VU
X1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKFNBUFBVX1dDTEsswqAgwqAg
wqAgJnF1b3Q7c2FwcHVfd2NsayZxdW90OyzCoCDCoCDCoCAmcXVvdDtzYXBwdV93X211eCZxdW90
OyzCoCDCoCBUT1BfQ0xLX0dBVEUzLCAyMiwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0K
K8KgIMKgIMKgIMKgR0FURShWT1VfQUNMSyzCoCDCoCDCoCDCoCAmcXVvdDt2b3VfYWNsayZxdW90
OyzCoCDCoCDCoCDCoCAmcXVvdDt2b3VfYV9tdXgmcXVvdDsswqAgwqAgwqAgVE9QX0NMS19HQVRF
NCwgMTYsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoVk9V
X01BSU5fV0NMSyzCoCDCoCZxdW90O3ZvdV9tYWluX3djbGsmcXVvdDsswqAgwqAmcXVvdDt2b3Vf
bWFpbl93X211eCZxdW90OywgVE9QX0NMS19HQVRFNCwgMTgsIENMS19TRVRfUkFURV9QQVJFTlQs
IDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoVk9VX0FVWF9XQ0xLLMKgIMKgICZxdW90O3ZvdV9h
dXhfd2NsayZxdW90OyzCoCDCoCAmcXVvdDt2b3VfYXV4X3dfbXV4JnF1b3Q7LMKgIFRPUF9DTEtf
R0FURTQsIDE5LCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRF
KFZPVV9QUFVfV0NMSyzCoCDCoCAmcXVvdDt2b3VfcHB1X3djbGsmcXVvdDsswqAgwqAgJnF1b3Q7
dm91X3BwdV93X211eCZxdW90OyzCoCBUT1BfQ0xLX0dBVEU0LCAyMCwgQ0xLX1NFVF9SQVRFX1BB
UkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShNSVBJX0NGR19DTEsswqAgwqAgJnF1b3Q7
bWlwaV9jZmdfY2xrJnF1b3Q7LMKgIMKgICZxdW90O29zYzI0bSZxdW90OyzCoCDCoCDCoCDCoCDC
oFRPUF9DTEtfR0FURTQsIDIxLCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgR0FURShWR0FfSTJDX1dDTEsswqAgwqAgJnF1b3Q7dmdhX2kyY193Y2xr
JnF1b3Q7LMKgIMKgICZxdW90O3ZnYV9pMmNfbXV4JnF1b3Q7LMKgIMKgIFRPUF9DTEtfR0FURTQs
IDIzLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKE1JUElf
UkVGX0NMSyzCoCDCoCAmcXVvdDttaXBpX3JlZl9jbGsmcXVvdDsswqAgwqAgJnF1b3Q7Y2xrMjdt
JnF1b3Q7LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19HQVRFNCwgMjQsIDAswqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEhETUlfT1NDX0NFQyzCoCDC
oCAmcXVvdDtoZG1pX29zY19jZWMmcXVvdDsswqAgwqAgJnF1b3Q7Y2xrMm0mcXVvdDsswqAgwqAg
wqAgwqAgwqAgVE9QX0NMS19HQVRFNCwgMjIsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEhETUlfT1NDX0NMSyzCoCDCoCAmcXVvdDtoZG1p
X29zY19jbGsmcXVvdDsswqAgwqAgJnF1b3Q7Y2xrMjQwbSZxdW90OyzCoCDCoCDCoCDCoCBUT1Bf
Q0xLX0dBVEU0LCAyNSwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDApLDxicj4NCivC
oCDCoCDCoCDCoEdBVEUoSERNSV9YQ0xLLMKgIMKgIMKgIMKgJnF1b3Q7aGRtaV94Y2xrJnF1b3Q7
LMKgIMKgIMKgIMKgJnF1b3Q7b3NjMjRtJnF1b3Q7LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19HQVRF
NCwgMjYsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwKSw8YnI+DQorwqAgwqAgwqAg
wqBHQVRFKFZJVV9NMF9BQ0xLLMKgIMKgIMKgJnF1b3Q7dml1X20wX2FjbGsmcXVvdDsswqAgwqAg
wqAmcXVvdDt2aXVfbTBfYV9tdXgmcXVvdDsswqAgwqBUT1BfQ0xLX0dBVEU0LCAwLMKgIENMS19T
RVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoVklVX00xX0FDTEsswqAg
wqAgwqAmcXVvdDt2aXVfbTFfYWNsayZxdW90OyzCoCDCoCDCoCZxdW90O3ZpdV9tMV9hX211eCZx
dW90OyzCoCDCoFRPUF9DTEtfR0FURTQsIDEswqAgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgR0FURShWSVVfV0NMSyzCoCDCoCDCoCDCoCAmcXVvdDt2aXVfd2NsayZx
dW90OyzCoCDCoCDCoCDCoCAmcXVvdDt2aXVfd19tdXgmcXVvdDsswqAgwqAgwqAgVE9QX0NMS19H
QVRFNCwgMizCoCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRF
KFZJVV9KUEVHX1dDTEsswqAgwqAmcXVvdDt2aXVfanBlZ193Y2xrJnF1b3Q7LMKgIMKgJnF1b3Q7
dml1X2pwZWdfd19tdXgmcXVvdDssIFRPUF9DTEtfR0FURTQsIDMswqAgQ0xLX1NFVF9SQVRFX1BB
UkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShWSVVfQ0ZHX0NMSyzCoCDCoCDCoCZxdW90
O3ZpdV9jZmdfY2xrJnF1b3Q7LMKgIMKgIMKgJnF1b3Q7b3NjMjRtJnF1b3Q7LMKgIMKgIMKgIMKg
IMKgVE9QX0NMS19HQVRFNCwgNizCoCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMCks
PGJyPg0KK8KgIMKgIMKgIMKgR0FURShUU19TWVNfV0NMSyzCoCDCoCDCoCZxdW90O3RzX3N5c193
Y2xrJnF1b3Q7LMKgIMKgIMKgJnF1b3Q7dHNfc3lzX211eCZxdW90OyzCoCDCoCDCoFRPUF9DTEtf
R0FURTUsIDIswqAgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FU
RShUU19TWVNfMTA4TSzCoCDCoCDCoCZxdW90O3RzX3N5c18xMDhtJnF1b3Q7LMKgIMKgIMKgJnF1
b3Q7Y2xrMTA4bSZxdW90OyzCoCDCoCDCoCDCoCBUT1BfQ0xLX0dBVEU1LCAzLMKgIDAswqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKFVTQjIwX0hD
TEsswqAgwqAgwqAgJnF1b3Q7dXNiMjBfaGNsayZxdW90OyzCoCDCoCDCoCAmcXVvdDtzeXNfbm9j
X2hjbGsmcXVvdDsswqAgwqBUT1BfQ0xLX0dBVEUyLCAxMiwgMCzCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoVVNCMjBfUEhZX0NMSyzCoCDCoCZx
dW90O3VzYjIwX3BoeV9jbGsmcXVvdDsswqAgwqAmcXVvdDt1c2JfcmVmMjRtX211eCZxdW90Oywg
VE9QX0NMS19HQVRFMiwgMTMsIDAswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwKSw8YnI+
DQorwqAgwqAgwqAgwqBHQVRFKFVTQjIxX0hDTEsswqAgwqAgwqAgJnF1b3Q7dXNiMjFfaGNsayZx
dW90OyzCoCDCoCDCoCAmcXVvdDtzeXNfbm9jX2hjbGsmcXVvdDsswqAgwqBUT1BfQ0xLX0dBVEUy
LCAxNCwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDApLDxicj4NCivCoCDCoCDCoCDC
oEdBVEUoVVNCMjFfUEhZX0NMSyzCoCDCoCZxdW90O3VzYjIxX3BoeV9jbGsmcXVvdDsswqAgwqAm
cXVvdDt1c2JfcmVmMjRtX211eCZxdW90OywgVE9QX0NMS19HQVRFMiwgMTUsIDAswqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEdNQUNfUk1JSUNM
SyzCoCDCoCAmcXVvdDtnbWFjX3JtaWlfY2xrJnF1b3Q7LMKgIMKgJnF1b3Q7Y2xrNTBtJnF1b3Q7
LMKgIMKgIMKgIMKgIMKgVE9QX0NMS19HQVRFMiwgMywgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEdNQUNfUENMSyzCoCDCoCDCoCDCoCZx
dW90O2dtYWNfcGNsayZxdW90OyzCoCDCoCDCoCDCoCZxdW90O2NsazE5OG0mcXVvdDsswqAgwqAg
wqAgwqAgVE9QX0NMS19HQVRFMiwgMSwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
KSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKEdNQUNfQUNMSyzCoCDCoCDCoCDCoCZxdW90O2dtYWNf
YWNsayZxdW90OyzCoCDCoCDCoCDCoCZxdW90O2NsazQ5bTUmcXVvdDsswqAgwqAgwqAgwqAgVE9Q
X0NMS19HQVRFMiwgMCwgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwKSw8YnI+DQor
wqAgwqAgwqAgwqBHQVRFKEdNQUNfUkZDTEsswqAgwqAgwqAgJnF1b3Q7Z21hY19yZWZjbGsmcXVv
dDsswqAgwqAgwqAmcXVvdDtjbGsyNW0mcXVvdDsswqAgwqAgwqAgwqAgwqBUT1BfQ0xLX0dBVEUy
LCA0LCAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDApLDxicj4NCivCoCDCoCDCoCDC
oEdBVEUoU0QxX0FIQizCoCDCoCDCoCDCoCDCoCZxdW90O3NkMV9oY2xrJnF1b3Q7LMKgIMKgIMKg
IMKgICZxdW90O3N5c19ub2NfaGNsayZxdW90OyzCoCDCoFRPUF9DTEtfR0FURTEsIDEyLMKgIDAs
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShTRDBf
QUhCLMKgIMKgIMKgIMKgIMKgJnF1b3Q7c2QwX2hjbGsmcXVvdDsswqAgwqAgwqAgwqAgJnF1b3Q7
c3lzX25vY19oY2xrJnF1b3Q7LMKgIMKgVE9QX0NMS19HQVRFMSwgOCzCoCAwLMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShURU1QU0VOU09SX0dB
VEUsICZxdW90O3RlbXBzZW5zb3JfZ2F0ZSZxdW90OywgJnF1b3Q7Y2xrNG0mcXVvdDsswqAgwqAg
wqAgwqAgwqAgVE9QX0NMS19HQVRFNSwgMzEswqAgMCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAwKSw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3QgY2xrX2h3X29uZWNlbGxf
ZGF0YSB0b3BfaHdfb25lY2VsbF9kYXRhID0gezxicj4NCivCoCDCoCDCoCDCoC5udW0gPSBUT1Bf
TlJfQ0xLUyw8YnI+DQorwqAgwqAgwqAgwqAuaHdzID0gezxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFtUT1BfTlJfQ0xLUyAtIDFdID0gTlVMTCw8YnI+DQorwqAgwqAgwqAgwqB9LDxicj4N
Cit9Ozxicj4NCis8YnI+DQorc3RhdGljIHZvaWQgX19pbml0IHp4Mjk2NzE4X3RvcF9jbG9ja3Nf
aW5pdCg8d2JyPnN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAg
wqB2b2lkIF9faW9tZW0gKnJlZ19iYXNlOzxicj4NCivCoCDCoCDCoCDCoGludCBpLCByZXQ7PGJy
Pg0KKzxicj4NCivCoCDCoCDCoCDCoHJlZ19iYXNlID0gb2ZfaW9tYXAobnAsIDApOzxicj4NCivC
oCDCoCDCoCDCoGZvciAoaSA9IDA7IGkgJmx0OyBBUlJBWV9TSVpFKHp4Mjk2NzE4X3BsbF9jbGsp
OyBpKyspIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB6eDI5NjcxOF9wbGxfY2xrW2ld
LnJlZ19iYXNlICs9ICh1NjQpcmVnX2Jhc2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0ID0gY2xrX2h3X3JlZ2lzdGVyKE5VTEwsICZhbXA7engyOTY3MThfcGxsX2Nsa1tpXS5odyk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCkgezxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByX3dhcm4oJnF1b3Q7dG9wIGNsayAlcyBpbml0IGVy
cm9yIVxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHp4Mjk2NzE4X3BsbF9jbGtbaV0uaHcuaW5pdC0mZ3Q7PHdicj5uYW1lKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRSh0b3BfZmZhY3Rvcl9j
bGspOyBpKyspIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAodG9wX2ZmYWN0b3Jf
Y2xrW2ldLmlkKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRvcF9o
d19vbmVjZWxsX2RhdGEuaHdzW3RvcF88d2JyPmZmYWN0b3JfY2xrW2ldLmlkXSA9PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JmFtcDt0b3BfZmZhY3Rvcl9jbGtbaV0uZmFjdG9yLmh3Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqByZXQgPSBjbGtfaHdfcmVnaXN0ZXIoTlVMTCwgJmFtcDt0b3BfZmZhY3Rv
cl9jbGtbaV0uZmFjdG9yLmh3KTx3YnI+Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChyZXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcl93YXJu
KCZxdW90O3RvcCBjbGsgJXMgaW5pdCBlcnJvciFcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0b3BfZmZhY3Rvcl9jbGtbaV0uZmFj
dG9yLmh3Ljx3YnI+aW5pdC0mZ3Q7bmFtZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZm9yIChpID0gMDsg
aSAmbHQ7IEFSUkFZX1NJWkUodG9wX211eF9jbGspOyBpKyspIHs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAodG9wX211eF9jbGtbaV0uaWQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdG9wX2h3X29uZWNlbGxfZGF0YS5od3NbdG9wXzx3YnI+bXV4X2Ns
a1tpXS5pZF0gPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7dG9wX211eF9jbGtbaV0ubXV4Lmh3Ozxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0b3BfbXV4X2Nsa1tpXS5tdXgucmVnICs9ICh1NjQp
cmVnX2Jhc2U7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gY2xrX2h3X3JlZ2lz
dGVyKE5VTEwsICZhbXA7dG9wX211eF9jbGtbaV0ubXV4Lmh3KTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcHJfd2FybigmcXVvdDt0b3AgY2xrICVzIGluaXQgZXJyb3IhXG4mcXVvdDssPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdG9wX211eF9j
bGtbaV0ubXV4Lmh3LmluaXQtJmd0Ozx3YnI+bmFtZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZm9yIChp
ID0gMDsgaSAmbHQ7IEFSUkFZX1NJWkUodG9wX2dhdGVfY2xrKTsgaSsrKSB7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKHRvcF9nYXRlX2Nsa1tpXS5pZCk8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0b3BfaHdfb25lY2VsbF9kYXRhLmh3c1t0b3BfPHdi
cj5nYXRlX2Nsa1tpXS5pZF0gPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7dG9wX2dhdGVfY2xrW2ldLmdhdGUuaHc7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRvcF9nYXRlX2Nsa1tpXS5nYXRl
LnJlZyArPSAodTY0KXJlZ19iYXNlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9
IGNsa19od19yZWdpc3RlcihOVUxMLCAmYW1wO3RvcF9nYXRlX2Nsa1tpXS5nYXRlLmh3KTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJfd2FybigmcXVvdDt0b3AgY2xrICVzIGluaXQgZXJyb3Ih
XG4mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdG9wX2dhdGVfY2xrW2ldLmdhdGUuaHcuaW5pdC0mZ3Q7PHdicj5uYW1lKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRSh0b3BfZGl2X2Nsayk7IGkr
Kykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICh0b3BfZGl2X2Nsa1tpXS5pZCk8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0b3BfaHdfb25lY2VsbF9k
YXRhLmh3c1t0b3BfPHdicj5kaXZfY2xrW2ldLmlkXSA9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDt0b3BfZGl2X2Ns
a1tpXS5kaXYuaHc7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRvcF9kaXZf
Y2xrW2ldLmRpdi5yZWcgKz0gKHU2NClyZWdfYmFzZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZXQgPSBjbGtfaHdfcmVnaXN0ZXIoTlVMTCwgJmFtcDt0b3BfZGl2X2Nsa1tpXS5kaXYu
aHcpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwcl93YXJuKCZxdW90O3RvcCBjbGsgJXMgaW5p
dCBlcnJvciFcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0b3BfZGl2X2Nsa1tpXS5kaXYuaHcuaW5pdC0mZ3Q7PHdicj5uYW1lKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8
YnI+DQorwqAgwqAgwqAgwqBpZiAob2ZfY2xrX2FkZF9od19wcm92aWRlcihucCwgb2ZfY2xrX2h3
X29uZWNlbGxfZ2V0LCAmYW1wO3RvcF9od19vbmVjZWxsX2RhdGEpKTxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBhbmljKCZxdW90O2NvdWxkIG5vdCByZWdpc3RlciBjbGsgcHJvdmlkZXJc
biZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgcHJfaW5mbygmcXVvdDt0b3AgY2xrIGluaXQgb3Zl
ciwgbnI6JWRcbiZxdW90OywgVE9QX05SX0NMS1MpOzxicj4NCit9PGJyPg0KK0NMS19PRl9ERUNM
QVJFKHp4Mjk2NzE4X3RvcF88d2JyPmNsaywgJnF1b3Q7enRlLHp4Mjk2NzE4LXRvcGNybSZxdW90
OywgengyOTY3MThfdG9wX2Nsb2Nrc19pbml0KTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3Qg
Y2xrX2Rpdl90YWJsZSBjb21tb25fZXZlbl9kaXZfdGFibGVbXSA9IHs8YnI+DQorwqAgwqAgwqAg
wqB7IC52YWwgPSAwLCAuZGl2ID0gMSwgfSw8YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSAxLCAu
ZGl2ID0gMiwgfSw8YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSAzLCAuZGl2ID0gNCwgfSw8YnI+
DQorwqAgwqAgwqAgwqB7IC52YWwgPSA1LCAuZGl2ID0gNiwgfSw8YnI+DQorwqAgwqAgwqAgwqB7
IC52YWwgPSA3LCAuZGl2ID0gOCwgfSw8YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSA5LCAuZGl2
ID0gMTAsIH0sPGJyPg0KK8KgIMKgIMKgIMKgeyAudmFsID0gMTEsIC5kaXYgPSAxMiwgfSw8YnI+
DQorwqAgwqAgwqAgwqB7IC52YWwgPSAxMywgLmRpdiA9IDE0LCB9LDxicj4NCivCoCDCoCDCoCDC
oHsgLnZhbCA9IDE1LCAuZGl2ID0gMTYsIH0sPGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMg
c3RydWN0IGNsa19kaXZfdGFibGUgY29tbW9uX2Rpdl90YWJsZVtdID0gezxicj4NCivCoCDCoCDC
oCDCoHsgLnZhbCA9IDAsIC5kaXYgPSAxLCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDEs
IC5kaXYgPSAyLCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDIsIC5kaXYgPSAzLCB9LDxi
cj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDMsIC5kaXYgPSA0LCB9LDxicj4NCivCoCDCoCDCoCDC
oHsgLnZhbCA9IDQsIC5kaXYgPSA1LCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDUsIC5k
aXYgPSA2LCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDYsIC5kaXYgPSA3LCB9LDxicj4N
CivCoCDCoCDCoCDCoHsgLnZhbCA9IDcsIC5kaXYgPSA4LCB9LDxicj4NCivCoCDCoCDCoCDCoHsg
LnZhbCA9IDgsIC5kaXYgPSA5LCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDksIC5kaXYg
PSAxMCwgfSw8YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSAxMCwgLmRpdiA9IDExLCB9LDxicj4N
CivCoCDCoCDCoCDCoHsgLnZhbCA9IDExLCAuZGl2ID0gMTIsIH0sPGJyPg0KK8KgIMKgIMKgIMKg
eyAudmFsID0gMTIsIC5kaXYgPSAxMywgfSw8YnI+DQorwqAgwqAgwqAgwqB7IC52YWwgPSAxMywg
LmRpdiA9IDE0LCB9LDxicj4NCivCoCDCoCDCoCDCoHsgLnZhbCA9IDE0LCAuZGl2ID0gMTUsIH0s
PGJyPg0KK8KgIMKgIMKgIMKgeyAudmFsID0gMTUsIC5kaXYgPSAxNiwgfSw8YnI+DQorfTs8YnI+
DQorPGJyPg0KK1BOQU1FKGxzcDBfd2Nsa19jb21tb25fcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKg
JnF1b3Q7bHNwMF8yNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7bHNwMF85OW0mcXVv
dDssPGJyPg0KK307PGJyPg0KKzxicj4NCitQTkFNRShsc3AwX3djbGtfdGltZXIzX3ApID0gezxi
cj4NCivCoCDCoCDCoCDCoCZxdW90O3RpbWVyM19kaXYmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKg
JnF1b3Q7bHNwMF8zMmsmcXVvdDs8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKGxzcDBfd2Ns
a190aW1lcjRfcCkgPSB7PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7dGltZXI0X2RpdiZxdW90Oyw8
YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtsc3AwXzMyayZxdW90Ozxicj4NCit9Ozxicj4NCis8YnI+
DQorUE5BTUUobHNwMF93Y2xrX3RpbWVyNV9wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDt0
aW1lcjVfZGl2JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2xzcDBfMzJrJnF1b3Q7PGJy
Pg0KK307PGJyPg0KKzxicj4NCitQTkFNRShsc3AwX3djbGtfc3BpZmMwX3ApID0gezxicj4NCivC
oCDCoCDCoCDCoCZxdW90O2xzcDBfMTQ4bTUmcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7
bHNwMF8yNG0mcXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7bHNwMF85OW0mcXVvdDssPGJy
Pg0KK8KgIMKgIMKgIMKgJnF1b3Q7bHNwMF83NG0yNSZxdW90Ozxicj4NCit9Ozxicj4NCis8YnI+
DQorUE5BTUUobHNwMF93Y2xrX3NzcF9wKSA9IHs8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtsc3Aw
XzE0OG01JnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCZxdW90O2xzcDBfOTltJnF1b3Q7LDxicj4N
CivCoCDCoCDCoCDCoCZxdW90O2xzcDBfMjRtJnF1b3Q7LDxicj4NCit9Ozxicj4NCis8YnI+DQor
c3RhdGljIHN0cnVjdCB6eF9jbGtfbXV4IGxzcDBfbXV4X2Nsa1tdID0gezxicj4NCivCoCDCoCDC
oCDCoE1VWCgwLCAmcXVvdDt0aW1lcjNfd2Nsa19tdXgmcXVvdDssIGxzcDBfd2Nsa190aW1lcjNf
cCwgTFNQMF9USU1FUjNfQ0xLLCA0LCAxKSw8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7
dGltZXI0X3djbGtfbXV4JnF1b3Q7LCBsc3AwX3djbGtfdGltZXI0X3AsIExTUDBfVElNRVI0X0NM
SywgNCwgMSksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O3RpbWVyNV93Y2xrX211eCZx
dW90OywgbHNwMF93Y2xrX3RpbWVyNV9wLCBMU1AwX1RJTUVSNV9DTEssIDQsIDEpLDxicj4NCivC
oCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt1YXJ0M193Y2xrX211eCZxdW90OyzCoCBsc3AwX3djbGtf
Y29tbW9uX3AsIExTUDBfVUFSVDNfQ0xLLMKgIDQsIDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgw
LCAmcXVvdDt1YXJ0MV93Y2xrX211eCZxdW90OyzCoCBsc3AwX3djbGtfY29tbW9uX3AsIExTUDBf
VUFSVDFfQ0xLLMKgIDQsIDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt1YXJ0Ml93
Y2xrX211eCZxdW90OyzCoCBsc3AwX3djbGtfY29tbW9uX3AsIExTUDBfVUFSVDJfQ0xLLMKgIDQs
IDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDtzcGlmYzBfd2Nsa19tdXgmcXVvdDss
IGxzcDBfd2Nsa19zcGlmYzBfcCwgTFNQMF9TUElGQzBfQ0xLLCA0LCAyKSw8YnI+DQorwqAgwqAg
wqAgwqBNVVgoMCwgJnF1b3Q7aTJjNF93Y2xrX211eCZxdW90OyzCoCDCoGxzcDBfd2Nsa19jb21t
b25fcCwgTFNQMF9JMkM0X0NMSyzCoCDCoDQsIDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAm
cXVvdDtpMmM1X3djbGtfbXV4JnF1b3Q7LMKgIMKgbHNwMF93Y2xrX2NvbW1vbl9wLCBMU1AwX0ky
QzVfQ0xLLMKgIMKgNCwgMSksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O3NzcDBfd2Ns
a19tdXgmcXVvdDsswqAgwqBsc3AwX3djbGtfc3NwX3AswqAgwqAgTFNQMF9TU1AwX0NMSyzCoCDC
oDQsIDEpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDtzc3AxX3djbGtfbXV4JnF1b3Q7
LMKgIMKgbHNwMF93Y2xrX3NzcF9wLMKgIMKgIExTUDBfU1NQMV9DTEsswqAgwqA0LCAxKSw8YnI+
DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7aTJjM193Y2xrX211eCZxdW90OyzCoCDCoGxzcDBf
d2Nsa19jb21tb25fcCwgTFNQMF9JMkMzX0NMSyzCoCDCoDQsIDEpLDxicj4NCit9Ozxicj4NCis8
YnI+DQorc3RhdGljIHN0cnVjdCB6eF9jbGtfZ2F0ZSBsc3AwX2dhdGVfY2xrW10gPSB7PGJyPg0K
K8KgIMKgIMKgIMKgR0FURShMU1AwX1RJTUVSM19XQ0xLLCAmcXVvdDt0aW1lcjNfd2NsayZxdW90
OywgJnF1b3Q7dGltZXIzX3djbGtfbXV4JnF1b3Q7LCBMU1AwX1RJTUVSM19DTEssIDEsIENMS19T
RVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMF9USU1FUjRfV0NM
SywgJnF1b3Q7dGltZXI0X3djbGsmcXVvdDssICZxdW90O3RpbWVyNF93Y2xrX211eCZxdW90Oywg
TFNQMF9USU1FUjRfQ0xLLCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAg
wqAgwqBHQVRFKExTUDBfVElNRVI1X1dDTEssICZxdW90O3RpbWVyNV93Y2xrJnF1b3Q7LCAmcXVv
dDt0aW1lcjVfd2Nsa19tdXgmcXVvdDssIExTUDBfVElNRVI1X0NMSywgMSwgQ0xLX1NFVF9SQVRF
X1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FURShMU1AwX1VBUlQzX1dDTEsswqAgJnF1
b3Q7dWFydDNfd2NsayZxdW90OyzCoCAmcXVvdDt1YXJ0M193Y2xrX211eCZxdW90OyzCoCBMU1Aw
X1VBUlQzX0NMSyzCoCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAg
wqBHQVRFKExTUDBfVUFSVDFfV0NMSyzCoCAmcXVvdDt1YXJ0MV93Y2xrJnF1b3Q7LMKgICZxdW90
O3VhcnQxX3djbGtfbXV4JnF1b3Q7LMKgIExTUDBfVUFSVDFfQ0xLLMKgIDEsIENMS19TRVRfUkFU
RV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMF9VQVJUMl9XQ0xLLMKgICZx
dW90O3VhcnQyX3djbGsmcXVvdDsswqAgJnF1b3Q7dWFydDJfd2Nsa19tdXgmcXVvdDsswqAgTFNQ
MF9VQVJUMl9DTEsswqAgMSwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKg
IMKgR0FURShMU1AwX1NQSUZDMF9XQ0xLLCAmcXVvdDtzcGlmYzBfd2NsayZxdW90OywgJnF1b3Q7
c3BpZmMwX3djbGtfbXV4JnF1b3Q7LCBMU1AwX1NQSUZDMF9DTEssIDEsIENMS19TRVRfUkFURV9Q
QVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMF9JMkM0X1dDTEsswqAgwqAmcXVv
dDtpMmM0X3djbGsmcXVvdDsswqAgwqAmcXVvdDtpMmM0X3djbGtfbXV4JnF1b3Q7LMKgIMKgTFNQ
MF9JMkM0X0NMSyzCoCDCoDEsIENMS19TRVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDC
oCDCoEdBVEUoTFNQMF9JMkM1X1dDTEsswqAgwqAmcXVvdDtpMmM1X3djbGsmcXVvdDsswqAgwqAm
cXVvdDtpMmM1X3djbGtfbXV4JnF1b3Q7LMKgIMKgTFNQMF9JMkM1X0NMSyzCoCDCoDEsIENMS19T
RVRfUkFURV9QQVJFTlQsIDApLDxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMF9TU1AwX1dDTEss
wqAgwqAmcXVvdDtzc3AwX3djbGsmcXVvdDsswqAgwqAmcXVvdDtzc3AwX2RpdiZxdW90OyzCoCDC
oCDCoCDCoCBMU1AwX1NTUDBfQ0xLLMKgIMKgMSwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJy
Pg0KK8KgIMKgIMKgIMKgR0FURShMU1AwX1NTUDFfV0NMSyzCoCDCoCZxdW90O3NzcDFfd2NsayZx
dW90OyzCoCDCoCZxdW90O3NzcDFfZGl2JnF1b3Q7LMKgIMKgIMKgIMKgIExTUDBfU1NQMV9DTEss
wqAgwqAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExT
UDBfSTJDM19XQ0xLLMKgIMKgJnF1b3Q7aTJjM193Y2xrJnF1b3Q7LMKgIMKgJnF1b3Q7aTJjM193
Y2xrX211eCZxdW90OyzCoCDCoExTUDBfSTJDM19DTEsswqAgwqAxLCBDTEtfU0VUX1JBVEVfUEFS
RU5ULCAwKSw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3QgenhfY2xrX2RpdiBs
c3AwX2Rpdl9jbGtbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqBESVZfVCgwLCAmcXVvdDt0aW1lcjNf
ZGl2JnF1b3Q7LCAmcXVvdDtsc3AwXzI0bSZxdW90OywgTFNQMF9USU1FUjNfQ0xLLMKgIDEyLCA0
LCAwLCBjb21tb25fZXZlbl9kaXZfdGFibGUpLDxicj4NCivCoCDCoCDCoCDCoERJVl9UKDAsICZx
dW90O3RpbWVyNF9kaXYmcXVvdDssICZxdW90O2xzcDBfMjRtJnF1b3Q7LCBMU1AwX1RJTUVSNF9D
TEsswqAgMTIsIDQsIDAsIGNvbW1vbl9ldmVuX2Rpdl90YWJsZSksPGJyPg0KK8KgIMKgIMKgIMKg
RElWX1QoMCwgJnF1b3Q7dGltZXI1X2RpdiZxdW90OywgJnF1b3Q7bHNwMF8yNG0mcXVvdDssIExT
UDBfVElNRVI1X0NMSyzCoCAxMiwgNCwgMCwgY29tbW9uX2V2ZW5fZGl2X3RhYmxlKSw8YnI+DQor
wqAgwqAgwqAgwqBESVZfVCgwLCAmcXVvdDtzc3AwX2RpdiZxdW90OywgJnF1b3Q7c3NwMF93Y2xr
X211eCZxdW90OywgTFNQMF9TU1AwX0NMSywgMTIsIDQsIDAsIGNvbW1vbl9ldmVuX2Rpdl90YWJs
ZSksPGJyPg0KK8KgIMKgIMKgIMKgRElWX1QoMCwgJnF1b3Q7c3NwMV9kaXYmcXVvdDssICZxdW90
O3NzcDFfd2Nsa19tdXgmcXVvdDssIExTUDBfU1NQMV9DTEssIDEyLCA0LCAwLCBjb21tb25fZXZl
bl9kaXZfdGFibGUpLDxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCBjbGtfaHdf
b25lY2VsbF9kYXRhIGxzcDBfaHdfb25lY2VsbF9kYXRhID0gezxicj4NCivCoCDCoCDCoCDCoC5u
dW0gPSBMU1AwX05SX0NMS1MsPGJyPg0KK8KgIMKgIMKgIMKgLmh3cyA9IHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbTFNQMF9OUl9DTEtTIC0gMV0gPSBOVUxMLDxicj4NCivCoCDCoCDC
oCDCoH0sPGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBfX2luaXQgbHNwMF9jbG9j
a3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
dm9pZCBfX2lvbWVtICpyZWdfYmFzZTs8YnI+DQorwqAgwqAgwqAgwqBpbnQgaSwgcmV0Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqByZWdfYmFzZSA9IG9mX2lvbWFwKG5wLCAwKTs8YnI+DQorPGJy
Pg0KK8KgIMKgIMKgIMKgZm9yIChpID0gMDsgaSAmbHQ7IEFSUkFZX1NJWkUobHNwMF9tdXhfY2xr
KTsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGxzcDBfbXV4X2Nsa1tp
XS5pZCk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsc3AwX2h3X29u
ZWNlbGxfZGF0YS5od3NbbHNwMF88d2JyPm11eF9jbGtbaV0uaWRdID08YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAmYW1wO2xz
cDBfbXV4X2Nsa1tpXS5tdXguaHc7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGxzcDBfbXV4X2Nsa1tpXS5tdXgucmVnICs9ICh1NjQpcmVnX2Jhc2U7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgcmV0ID0gY2xrX2h3X3JlZ2lzdGVyKE5VTEwsICZhbXA7bHNwMF9tdXhf
Y2xrW2ldLm11eC5odyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHJldCkgezxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHByX3dhcm4oJnF1b3Q7bHNw
MCBjbGsgJXMgaW5pdCBlcnJvciFcbiZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsc3AwX211eF9jbGtbaV0ubXV4Lmh3LmluaXQtJmd0
Ozx3YnI+bmFtZSk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDC
oCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgZm9yIChpID0gMDsgaSAmbHQ7IEFSUkFZX1NJ
WkUobHNwMF9nYXRlX2Nsayk7IGkrKykgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChsc3AwX2dhdGVfY2xrW2ldLmlkKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGxzcDBfaHdfb25lY2VsbF9kYXRhLmh3c1tsc3AwXzx3YnI+Z2F0ZV9jbGtbaV0uaWRd
ID08YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAmYW1wO2xzcDBfZ2F0ZV9jbGtbaV0uZ2F0ZS5odzs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgbHNwMF9nYXRlX2Nsa1tpXS5nYXRlLnJlZyArPSAodTY0KXJl
Z19iYXNlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IGNsa19od19yZWdpc3Rl
cihOVUxMLCAmYW1wO2xzcDBfZ2F0ZV9jbGtbaV0uZ2F0ZS5odyk7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgaWYgKHJldCkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHByX3dhcm4oJnF1b3Q7bHNwMCBjbGsgJXMgaW5pdCBlcnJvciFcbiZxdW90Oyw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsc3AwX2dh
dGVfY2xrW2ldLmdhdGUuaHcuaW5pdC08d2JyPiZndDtuYW1lKTs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBm
b3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRShsc3AwX2Rpdl9jbGspOyBpKyspIHs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobHNwMF9kaXZfY2xrW2ldLmlkKTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxzcDBfaHdfb25lY2VsbF9kYXRhLmh3c1ts
c3AwXzx3YnI+ZGl2X2Nsa1tpXS5pZF0gPTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7bHNwMF9kaXZfY2xrW2ldLmRp
di5odzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbHNwMF9kaXZfY2xrW2ld
LmRpdi5yZWcgKz0gKHU2NClyZWdfYmFzZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZXQgPSBjbGtfaHdfcmVnaXN0ZXIoTlVMTCwgJmFtcDtsc3AwX2Rpdl9jbGtbaV0uZGl2Lmh3KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJfd2FybigmcXVvdDtsc3AwIGNsayAlcyBpbml0IGVy
cm9yIVxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGxzcDBfZGl2X2Nsa1tpXS5kaXYuaHcuaW5pdC0mZ3Q7PHdicj5uYW1lKTs8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBpZiAob2ZfY2xrX2FkZF9od19wcm92aWRlcihucCwgb2ZfY2xrX2h3X29u
ZWNlbGxfZ2V0LCAmYW1wO2xzcDBfaHdfb25lY2VsbF9kYXRhKSk8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBwYW5pYygmcXVvdDtjb3VsZCBub3QgcmVnaXN0ZXIgY2xrIHByb3ZpZGVyXG4m
cXVvdDspOzxicj4NCivCoCDCoCDCoCDCoHByX2luZm8oJnF1b3Q7bHNwMCBpbml0IG92ZXI6JWRc
biZxdW90OywgTFNQMF9OUl9DTEtTKTs8YnI+DQorfTxicj4NCitDTEtfT0ZfREVDTEFSRShsc3Aw
X2NsaywgJnF1b3Q7enRlLHp4Mjk2NzE4LWxzcDBjcm0mcXVvdDssIGxzcDBfY2xvY2tzX2luaXQp
Ozxicj4NCis8YnI+DQorUE5BTUUobHNwMV93Y2xrX2NvbW1vbl9wKSA9IHs8YnI+DQorwqAgwqAg
wqAgwqAmcXVvdDtsc3AxXzI0bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtsc3AxXzk5
bSZxdW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK1BOQU1FKGxzcDFfd2Nsa19zc3BfcCkgPSB7
PGJyPg0KK8KgIMKgIMKgIMKgJnF1b3Q7bHNwMV8xNDhtNSZxdW90Oyw8YnI+DQorwqAgwqAgwqAg
wqAmcXVvdDtsc3AxXzk5bSZxdW90Oyw8YnI+DQorwqAgwqAgwqAgwqAmcXVvdDtsc3AxXzI0bSZx
dW90Oyw8YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3QgenhfY2xrX211eCBsc3Ax
X211eF9jbGtbXSA9IHs8YnI+DQorwqAgwqAgwqAgwqBNVVgoMCwgJnF1b3Q7dWFydDRfd2Nsa19t
dXgmcXVvdDssIGxzcDFfd2Nsa19jb21tb25fcCwgTFNQMV9VQVJUNF9DTEssIDQsIDEpLDxicj4N
CivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt1YXJ0NV93Y2xrX211eCZxdW90OywgbHNwMV93Y2xr
X2NvbW1vbl9wLCBMU1AxX1VBUlQ1X0NMSywgNCwgMSksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAs
ICZxdW90O3B3bV93Y2xrX211eCZxdW90OyzCoCDCoGxzcDFfd2Nsa19jb21tb25fcCwgTFNQMV9Q
V01fQ0xLLMKgIMKgNCwgMSksPGJyPg0KK8KgIMKgIMKgIMKgTVVYKDAsICZxdW90O2kyYzJfd2Ns
a19tdXgmcXVvdDsswqAgbHNwMV93Y2xrX2NvbW1vbl9wLCBMU1AxX0kyQzJfQ0xLLMKgIDQsIDEp
LDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDtzc3AyX3djbGtfbXV4JnF1b3Q7LMKgIGxz
cDFfd2Nsa19zc3BfcCzCoCDCoCBMU1AxX1NTUDJfQ0xLLMKgIDQsIDIpLDxicj4NCivCoCDCoCDC
oCDCoE1VWCgwLCAmcXVvdDtzc3AzX3djbGtfbXV4JnF1b3Q7LMKgIGxzcDFfd2Nsa19zc3BfcCzC
oCDCoCBMU1AxX1NTUDNfQ0xLLMKgIDQsIDIpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVv
dDtzc3A0X3djbGtfbXV4JnF1b3Q7LMKgIGxzcDFfd2Nsa19zc3BfcCzCoCDCoCBMU1AxX1NTUDRf
Q0xLLMKgIDQsIDIpLDxicj4NCivCoCDCoCDCoCDCoE1VWCgwLCAmcXVvdDt1c2ltMV93Y2xrX211
eCZxdW90OywgbHNwMV93Y2xrX2NvbW1vbl9wLCBMU1AxX1VTSU0xX0NMSywgNCwgMSksPGJyPg0K
K307PGJyPg0KKzxicj4NCitzdGF0aWMgc3RydWN0IHp4X2Nsa19kaXYgbHNwMV9kaXZfY2xrW10g
PSB7PGJyPg0KK8KgIMKgIMKgIMKgRElWX1QoMCwgJnF1b3Q7cHdtX2RpdiZxdW90OyzCoCAmcXVv
dDtwd21fd2Nsa19tdXgmcXVvdDsswqAgTFNQMV9QV01fQ0xLLMKgIDEyLCA0LCBDTEtfU0VUX1JB
VEVfUEFSRU5ULCBjb21tb25fZGl2X3RhYmxlKSw8YnI+DQorwqAgwqAgwqAgwqBESVZfVCgwLCAm
cXVvdDtzc3AyX2RpdiZxdW90OywgJnF1b3Q7c3NwMl93Y2xrX211eCZxdW90OywgTFNQMV9TU1Ay
X0NMSywgMTIsIDQsIENMS19TRVRfUkFURV9QQVJFTlQsIGNvbW1vbl9ldmVuX2Rpdl90YWJsZSks
PGJyPg0KK8KgIMKgIMKgIMKgRElWX1QoMCwgJnF1b3Q7c3NwM19kaXYmcXVvdDssICZxdW90O3Nz
cDNfd2Nsa19tdXgmcXVvdDssIExTUDFfU1NQM19DTEssIDEyLCA0LCBDTEtfU0VUX1JBVEVfUEFS
RU5ULCBjb21tb25fZXZlbl9kaXZfdGFibGUpLDxicj4NCivCoCDCoCDCoCDCoERJVl9UKDAsICZx
dW90O3NzcDRfZGl2JnF1b3Q7LCAmcXVvdDtzc3A0X3djbGtfbXV4JnF1b3Q7LCBMU1AxX1NTUDRf
Q0xLLCAxMiwgNCwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgY29tbW9uX2V2ZW5fZGl2X3RhYmxlKSw8
YnI+DQorfTs8YnI+DQorPGJyPg0KK3N0YXRpYyBzdHJ1Y3QgenhfY2xrX2dhdGUgbHNwMV9nYXRl
X2Nsa1tdID0gezxicj4NCivCoCDCoCDCoCDCoEdBVEUoTFNQMV9VQVJUNF9XQ0xLLCAmcXVvdDts
c3AxX3VhcnQ0X3djbGsmcXVvdDssICZxdW90O3VhcnQ0X3djbGtfbXV4JnF1b3Q7LCBMU1AxX1VB
UlQ0X0NMSywgMSwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwgMCksPGJyPg0KK8KgIMKgIMKgIMKgR0FU
RShMU1AxX1VBUlQ1X1dDTEssICZxdW90O2xzcDFfdWFydDVfd2NsayZxdW90OywgJnF1b3Q7dWFy
dDVfd2Nsa19tdXgmcXVvdDssIExTUDFfVUFSVDVfQ0xLLCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5U
LCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDFfUFdNX1dDTEsswqAgwqAmcXVvdDtsc3Ax
X3B3bV93Y2xrJnF1b3Q7LMKgIMKgJnF1b3Q7cHdtX2RpdiZxdW90OyzCoCDCoCDCoCDCoCBMU1Ax
X1BXTV9DTEsswqAgwqAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAg
wqBHQVRFKExTUDFfUFdNX1BDTEsswqAgwqAmcXVvdDtsc3AxX3B3bV9wY2xrJnF1b3Q7LMKgIMKg
JnF1b3Q7bHNwMV9wY2xrJnF1b3Q7LMKgIMKgIMKgIExTUDFfUFdNX0NMSyzCoCDCoDAsIDAswqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDFf
STJDMl9XQ0xLLMKgICZxdW90O2xzcDFfaTJjMl93Y2xrJnF1b3Q7LMKgICZxdW90O2kyYzJfd2Ns
a19tdXgmcXVvdDsswqAgTFNQMV9JMkMyX0NMSyzCoCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAw
KSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDFfU1NQMl9XQ0xLLMKgICZxdW90O2xzcDFfc3Nw
Ml93Y2xrJnF1b3Q7LMKgICZxdW90O3NzcDJfZGl2JnF1b3Q7LMKgIMKgIMKgIMKgTFNQMV9TU1Ay
X0NMSyzCoCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRF
KExTUDFfU1NQM19XQ0xLLMKgICZxdW90O2xzcDFfc3NwM193Y2xrJnF1b3Q7LMKgICZxdW90O3Nz
cDNfZGl2JnF1b3Q7LMKgIMKgIMKgIMKgTFNQMV9TU1AzX0NMSyzCoCAxLCBDTEtfU0VUX1JBVEVf
UEFSRU5ULCAwKSw8YnI+DQorwqAgwqAgwqAgwqBHQVRFKExTUDFfU1NQNF9XQ0xLLMKgICZxdW90
O2xzcDFfc3NwNF93Y2xrJnF1b3Q7LMKgICZxdW90O3NzcDRfZGl2JnF1b3Q7LMKgIMKgIMKgIMKg
TFNQMV9TU1A0X0NMSyzCoCAxLCBDTEtfU0VUX1JBVEVfUEFSRU5ULCAwKSw8YnI+DQorwqAgwqAg
wqAgwqBHQVRFKExTUDFfVVNJTTFfV0NMSywgJnF1b3Q7bHNwMV91c2ltMV93Y2xrJnF1b3Q7LCAm
cXVvdDt1c2ltMV93Y2xrX211eCZxdW90OywgTFNQMV9VU0lNMV9DTEssIDEsIENMS19TRVRfUkFU
RV9QQVJFTlQsIDApLDxicj4NCit9Ozxicj4NCis8YnI+DQorc3RhdGljIHN0cnVjdCBjbGtfaHdf
b25lY2VsbF9kYXRhIGxzcDFfaHdfb25lY2VsbF9kYXRhID0gezxicj4NCivCoCDCoCDCoCDCoC5u
dW0gPSBMU1AxX05SX0NMS1MsPGJyPg0KK8KgIMKgIMKgIMKgLmh3cyA9IHs8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBbTFNQMV9OUl9DTEtTIC0gMV0gPSBOVUxMLDxicj4NCivCoCDCoCDC
oCDCoH0sPGJyPg0KK307PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBfX2luaXQgbHNwMV9jbG9j
a3NfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKg
dm9pZCBfX2lvbWVtICpyZWdfYmFzZTs8YnI+DQorwqAgwqAgwqAgwqBpbnQgaSwgcmV0Ozxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqByZWdfYmFzZSA9IG9mX2lvbWFwKG5wLCAwKTs8YnI+DQorwqAg
wqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRShsc3AxX211eF9jbGspOyBpKysp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAobHNwMV9tdXhfY2xrW2ldLmlkKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxzcDFfaHdfb25lY2VsbF9k
YXRhLmh3c1tsc3AxXzx3YnI+bXV4X2Nsa1tpXS5pZF0gPTxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7bHNwMF9tdXhf
Y2xrW2ldLm11eC5odzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbHNwMV9t
dXhfY2xrW2ldLm11eC5yZWcgKz0gKHU2NClyZWdfYmFzZTs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqByZXQgPSBjbGtfaHdfcmVnaXN0ZXIoTlVMTCwgJmFtcDtsc3AxX211eF9jbGtbaV0u
bXV4Lmh3KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocmV0KSB7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHJfd2FybigmcXVvdDtsc3AxIGNsayAl
cyBpbml0IGVycm9yIVxuJnF1b3Q7LDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGxzcDFfbXV4X2Nsa1tpXS5tdXguaHcuaW5pdC0mZ3Q7PHdicj5u
YW1lKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KK8KgIMKgIMKgIMKgfTxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpICZsdDsgQVJSQVlfU0laRShsc3Ax
X2dhdGVfY2xrKTsgaSsrKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKGxzcDFf
Z2F0ZV9jbGtbaV0uaWQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
bHNwMV9od19vbmVjZWxsX2RhdGEuaHdzW2xzcDFfPHdicj5nYXRlX2Nsa1tpXS5pZF0gPTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCZhbXA7bHNwMV9nYXRlX2Nsa1tpXS5nYXRlLmh3Ozxicj4NCis8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBsc3AxX2dhdGVfY2xrW2ldLmdhdGUucmVnICs9ICh1NjQpcmVnX2Jhc2U7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0ID0gY2xrX2h3X3JlZ2lzdGVyKE5VTEws
ICZhbXA7bHNwMV9nYXRlX2Nsa1tpXS5nYXRlLmh3KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAocmV0KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cHJfd2FybigmcXVvdDtsc3AxIGNsayAlcyBpbml0IGVycm9yIVxuJnF1b3Q7LDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxzcDFfZ2F0ZV9jbGtb
aV0uZ2F0ZS5ody5pbml0LTx3YnI+Jmd0O25hbWUpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGZvciAoaSA9
IDA7IGkgJmx0OyBBUlJBWV9TSVpFKGxzcDFfZGl2X2Nsayk7IGkrKykgezxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmIChsc3AxX2Rpdl9jbGtbaV0uaWQpPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbHNwMV9od19vbmVjZWxsX2RhdGEuaHdzW2xzcDFfPHdi
cj5kaXZfY2xrW2ldLmlkXSA9PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtsc3AxX2Rpdl9jbGtbaV0uZGl2Lmh3Ozxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsc3AxX2Rpdl9jbGtbaV0uZGl2LnJl
ZyArPSAodTY0KXJlZ19iYXNlOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IGNs
a19od19yZWdpc3RlcihOVUxMLCAmYW1wO2xzcDFfZGl2X2Nsa1tpXS5kaXYuaHcpOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChyZXQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwcl93YXJuKCZxdW90O2xzcDEgY2xrICVzIGluaXQgZXJyb3IhXG4m
cXVvdDssPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgbHNwMV9kaXZfY2xrW2ldLmRpdi5ody5pbml0LSZndDs8d2JyPm5hbWUpOzxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQorwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDC
oCDCoCDCoGlmIChvZl9jbGtfYWRkX2h3X3Byb3ZpZGVyKG5wLCBvZl9jbGtfaHdfb25lY2VsbF9n
ZXQsICZhbXA7bHNwMV9od19vbmVjZWxsX2RhdGEpKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHBhbmljKCZxdW90O2NvdWxkIG5vdCByZWdpc3RlciBjbGsgcHJvdmlkZXJcbiZxdW90Oyk7
PGJyPg0KK8KgIMKgIMKgIMKgcHJfaW5mbygmcXVvdDtsc3AxLWNsayBpbml0IG92ZXIsIG5yOiVk
XG4mcXVvdDssIExTUDFfTlJfQ0xLUyk7PGJyPg0KK308YnI+DQorQ0xLX09GX0RFQ0xBUkUobHNw
MV9jbGssICZxdW90O3p0ZSx6eDI5NjcxOC1sc3AxY3JtJnF1b3Q7LCBsc3AxX2Nsb2Nrc19pbml0
KTs8YnI+DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvenRlL2Nsay5oIGIvZHJpdmVycy9jbGsv
enRlL2Nsay5oPGJyPg0KaW5kZXggOGY2YjVmMC4uMGRmMzQ3NCAxMDA2NDQ8YnI+DQotLS0gYS9k
cml2ZXJzL2Nsay96dGUvY2xrLmg8YnI+DQorKysgYi9kcml2ZXJzL2Nsay96dGUvY2xrLmg8YnI+
DQpAQCAtMTIsNiArMTIsMjYgQEA8YnI+DQrCoCNpbmNsdWRlICZsdDtsaW51eC9jbGstcHJvdmlk
ZXIuaCZndDs8YnI+DQrCoCNpbmNsdWRlICZsdDtsaW51eC9zcGlubG9jay5oJmd0Ozxicj4NCjxi
cj4NCisjZGVmaW5lIFBOQU1FKHgpIHN0YXRpYyBjb25zdCBjaGFyICp4W108YnI+DQorPGJyPg0K
KyNkZWZpbmUgQ0xLX0hXX0lOSVQoX25hbWUsIF9wYXJlbnQsIF9vcHMsIF9mbGFncynCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgJmFtcDsoc3RydWN0
IGNsa19pbml0X2RhdGEpIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuZmxhZ3PC
oCDCoCDCoCDCoCDCoCA9IF9mbGFncyzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubmFtZcKgIMKgIMKg
IMKgIMKgIMKgPSBfbmFtZSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnBhcmVudF9uYW1lc8KgIMKg
PSAoY29uc3QgY2hhciAqW10pIHsgX3BhcmVudCB9LMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC5udW1fcGFyZW50c8KgIMKgID0gMSzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgLm9wc8KgIMKgIMKgIMKgIMKgIMKgID0gX29wcyzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqB9PGJy
Pg0KKzxicj4NCisjZGVmaW5lIENMS19IV19JTklUX1BBUkVOVFMoX25hbWUsIF9wYXJlbnRzLCBf
b3BzLCBfZmxhZ3MpwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgJmFtcDso
c3RydWN0IGNsa19pbml0X2RhdGEpIHvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAu
ZmxhZ3PCoCDCoCDCoCDCoCDCoCA9IF9mbGFncyzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubmFtZcKg
IMKgIMKgIMKgIMKgIMKgPSBfbmFtZSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnBhcmVudF9uYW1l
c8KgIMKgPSBfcGFyZW50cyzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubnVtX3BhcmVudHPCoCDCoCA9IEFS
UkFZX1NJWkUoX3BhcmVudHMpLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoC5vcHPCoCDCoCDCoCDCoCDCoCDCoCA9IF9vcHMswqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKg
IMKgfTxicj4NCis8YnI+DQrCoHN0cnVjdCB6eF9wbGxfY29uZmlnIHs8YnI+DQrCoCDCoCDCoCDC
oCB1bnNpZ25lZCBsb25nIHJhdGU7PGJyPg0KwqAgwqAgwqAgwqAgdTMyIGNmZzA7PGJyPg0KQEAg
LTI4LDYgKzQ4LDExMSBAQCBzdHJ1Y3QgY2xrX3p4X3BsbCB7PGJyPg0KwqAgwqAgwqAgwqAgdTgg
bG9ja19iaXQ7wqAgwqAgwqAgwqAgwqAgwqAgLyogcGxsIGxvY2sgZmxhZyBiaXQgKi88YnI+DQrC
oH07PGJyPg0KPGJyPg0KKyNkZWZpbmUgUExMX1JBVEUoX3JhdGUsIF9jZmcwLCBfY2ZnMSnCoCBc
PGJyPg0KK3vCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLnJhdGUgPSBfcmF0ZSzCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLmNmZzAgPSBfY2ZnMCzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLmNmZzEgPSBfY2ZnMSzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK308YnI+DQorPGJyPg0KKyNkZWZpbmUgWlhfUExMKF9u
YW1lLCBfcGFyZW50LCBfcmVnLCBfdGFibGUsIF9wZCwgX2xvY2spwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBcPGJyPg0KK3vCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLnJlZ19iYXNlwqAgwqAgwqAgwqA9ICh2b2lkIF9faW9t
ZW0gKikgX3JlZyzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8Kg
IMKgIMKgIMKgLmxvb2t1cF90YWJsZcKgIMKgPSBfdGFibGUswqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKg
LmNvdW50wqAgwqAgwqAgwqAgwqAgPSBBUlJBWV9TSVpFKF90YWJsZSkswqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgLnBkX2JpdMKgIMKg
IMKgIMKgIMKgPSBfcGQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoC5sb2NrX2JpdMKgIMKgIMKg
IMKgPSBfbG9jayzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLmh3LmluaXTCoCDCoCDCoCDCoCDCoD0g
Q0xLX0hXX0lOSVQoX25hbWUsIF9wYXJlbnQsICZhbXA7enhfcGxsX29wcyzCoCDCoCDCoFw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBDTEtfR0VU
X1JBVEVfTk9DQUNIRSkswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCit9PGJyPg0K
Kzxicj4NCisjZGVmaW5lIFpYMjk2NzE4X1BMTChfbmFtZSwgX3BhcmVudCwgX3JlZywgX3RhYmxl
KcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCitaWF9QTEwoX25hbWUsIF9w
YXJlbnQsIF9yZWcsIF90YWJsZSwgMCwgMzApPGJyPg0KKzxicj4NCitzdHJ1Y3QgenhfY2xrX2dh
dGUgezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBjbGtfZ2F0ZSBnYXRlOzxicj4NCivCoCDCoCDC
oCDCoHUxNsKgIMKgIMKgIMKgIMKgIMKgIMKgaWQ7PGJyPg0KK307PGJyPg0KKzxicj4NCisjZGVm
aW5lIEdBVEUoX2lkLCBfbmFtZSwgX3BhcmVudCwgX3JlZywgX2JpdCwgX2ZsYWcsIF9nZmxhZ3Mp
wqAgwqAgwqAgwqAgwqAgXDxicj4NCit7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoC5nYXRlID0ge8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5yZWcgPSAodm9pZCBf
X2lvbWVtICopIF9yZWcswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBc
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmJpdF9pZHggPSAoX2JpdCkswqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5mbGFncyA9IF9nZmxhZ3MswqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLmxvY2sgPSAmYW1wO2Nsa19sb2NrLMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAuaHcuaW5pdCA9IENMS19IV19JTklUKF9uYW1lLMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9wYXJlbnQswqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZhbXA7Y2xrX2dhdGVfb3BzLMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfZmxhZyB8IENMS19JR05PUkVfVU5VU0VEKSzC
oCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqB9LMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAuaWTCoCDCoCDCoD0gX2lkLMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQorfTxicj4NCis8YnI+DQorc3RydWN0IHp4X2Nsa19maXhlZF9mYWN0b3Igezxi
cj4NCivCoCDCoCDCoCDCoHN0cnVjdCBjbGtfZml4ZWRfZmFjdG9yIGZhY3Rvcjs8YnI+DQorwqAg
wqAgwqAgwqB1MTbCoCDCoCDCoGlkOzxicj4NCit9Ozxicj4NCis8YnI+DQorI2RlZmluZSBGRkFD
VE9SKF9pZCwgX25hbWUsIF9wYXJlbnQsIF9tdWx0LCBfZGl2LCBfZmxhZynCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoFw8YnI+DQore8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAuZmFjdG9yID0ge8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5kaXbCoCDCoCDCoCDCoCDCoCDC
oCA9IF9kaXYswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm11bHTCoCDCoCDCoCDCoCDCoCDCoD0g
X211bHQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5ody5pbml0wqAgwqAgwqAgwqAgPSBDTEtfSFdf
SU5JVChfbmFtZSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgX3BhcmVudCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
JmFtcDtjbGtfZml4ZWRfZmFjdG9yX29wcyzCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX2ZsYWcp
LMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoH0swqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoC5pZCA9IF9p
ZCzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK308YnI+DQorPGJyPg0KK3N0cnVjdCB6
eF9jbGtfbXV4IHs8YnI+DQorwqAgwqAgwqAgwqBzdHJ1Y3QgY2xrX211eCBtdXg7PGJyPg0KK8Kg
IMKgIMKgIMKgdTE2wqAgwqAgwqBpZDs8YnI+DQorfTs8YnI+DQorPGJyPg0KKyNkZWZpbmUgTVVY
X0YoX2lkLCBfbmFtZSwgX3BhcmVudCwgX3JlZywgX3NoaWZ0LCBfd2lkdGgsIF9mbGFnLCBfbWZs
YWcpwqAgwqAgwqAgwqAgXDxicj4NCit7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoC5tdXggPSB7wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC5yZWfCoCDCoCDCoCDC
oCDCoCDCoCA9ICh2b2lkIF9faW9tZW0gKikgX3JlZyzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBc
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLm1hc2vCoCDCoCDCoCDCoCDCoCDCoD0gQklU
KF93aWR0aCkgLSAxLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAuc2hpZnTCoCDCoCDCoCDCoCDCoCA9IF9zaGlmdCzCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAuZmxhZ3PCoCDCoCDCoCDCoCDCoCA9IF9tZmxhZyzCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAubG9ja8KgIMKgIMKgIMKgIMKgIMKgPSAmYW1wO2Nsa19sb2NrLMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAuaHcuaW5pdMKgIMKgIMKgIMKgID0gQ0xLX0hXX0lOSVRfUEFSRU5UUyhfbmFtZSzCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgX3BhcmVudCzCoCDC
oCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJmFtcDtjbGtfbXV4X29w
cyzCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBfZmxhZykswqAgwqAgwqAg
wqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgfSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgLmlkID0gX2lkLMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIFw8YnI+DQorfTxicj4NCis8YnI+DQorI2RlZmluZSBNVVgoX2lkLCBfbmFtZSwgX3BhcmVu
dCwgX3JlZywgX3NoaWZ0LCBfd2lkdGgpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
K01VWF9GKF9pZCwgX25hbWUsIF9wYXJlbnQsIF9yZWcsIF9zaGlmdCwgX3dpZHRoLCAwLCAwKTxi
cj4NCis8YnI+DQorc3RydWN0IHp4X2Nsa19kaXYgezxicj4NCivCoCDCoCDCoCDCoHN0cnVjdCBj
bGtfZGl2aWRlciBkaXY7PGJyPg0KK8KgIMKgIMKgIMKgdTE2wqAgwqAgwqBpZDs8YnI+DQorfTs8
YnI+DQorPGJyPg0KKyNkZWZpbmUgRElWX1QoX2lkLCBfbmFtZSwgX3BhcmVudCwgX3JlZywgX3No
aWZ0LCBfd2lkdGgsIF9mbGFnLCBfdGFibGUpwqAgwqAgwqAgwqAgXDxicj4NCit7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDC
oC5kaXYgPSB7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC5yZWfCoCDCoCDCoCDCoCDCoCDCoCA9ICh2b2lkIF9faW9tZW0gKikgX3JlZyzC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLnNo
aWZ0wqAgwqAgwqAgwqAgwqAgPSBfc2hpZnQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLndpZHRowqAg
wqAgwqAgwqAgwqAgPSBfd2lkdGgswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLmZsYWdzwqAgwqAgwqAg
wqAgwqAgPSAwLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAudGFibGXCoCDCoCDCoCDCoCDC
oCA9IF90YWJsZSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oFw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAubG9ja8KgIMKgIMKgIMKgIMKgIMKgPSAm
YW1wO2Nsa19sb2NrLMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuaHcuaW5pdMKgIMKgIMKgIMKgID0gQ0xLX0hX
X0lOSVQoX25hbWUswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoF9wYXJlbnQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCZhbXA7Y2xrX2RpdmlkZXJfb3BzLMKgIMKgIMKgIMKgIMKgXDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF9m
bGFnKSzCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQorwqAgwqAgwqAgwqB9LMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+DQorwqAgwqAgwqAgwqAuaWQg
PSBfaWQswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCit9PGJyPg0KKzxicj4NCsKgc3Ry
dWN0IGNsayAqY2xrX3JlZ2lzdGVyX3p4X3BsbChjb25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFy
ICpwYXJlbnRfbmFtZSw8YnI+DQrCoCDCoCDCoCDCoCB1bnNpZ25lZCBsb25nIGZsYWdzLCB2b2lk
IF9faW9tZW0gKnJlZ19iYXNlLDxicj4NCsKgIMKgIMKgIMKgIGNvbnN0IHN0cnVjdCB6eF9wbGxf
Y29uZmlnICpsb29rdXBfdGFibGUsIGludCBjb3VudCwgc3BpbmxvY2tfdCAqbG9jayk7PGJyPg0K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svPHdicj56eDI5NjcxOC1jbG9j
ay5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay88d2JyPnp4Mjk2NzE4LWNsb2NrLmg8YnI+
DQpuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDAwMDAwMDAuLjk3ZDQ1ZTI8YnI+DQot
LS0gL2Rldi9udWxsPGJyPg0KKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay88d2JyPnp4
Mjk2NzE4LWNsb2NrLmg8YnI+DQpAQCAtMCwwICsxLDE0MCBAQDxicj4NCisvKjxicj4NCisgKiBD
b3B5cmlnaHQgKEMpIDIwMTUgLSAyMDE2IFpURSBDb3Jwb3JhdGlvbi48YnI+DQorICo8YnI+DQor
ICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0
IGFuZC9vciBtb2RpZnk8YnI+DQorICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXM8YnI+DQorICogcHVibGlzaGVkIGJ5IHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uPGJyPg0KKyAqLzxicj4NCisjaWZuZGVmIF9fRFRf
QklORElOR1NfQ0xPQ0tfWlgyOTY3MThfSDxicj4NCisjZGVmaW5lIF9fRFRfQklORElOR1NfQ0xP
Q0tfWlgyOTY3MThfSDxicj4NCis8YnI+DQorLyogUExMICovPGJyPg0KKyNkZWZpbmUgWlgyOTY3
MThfT1NDwqAgwqAgwqAgwqAgwqAgwqAwPGJyPg0KKyNkZWZpbmUgWlgyOTY3MThfUExMX0NQVcKg
IMKgIMKgIMKgMTxicj4NCisjZGVmaW5lIFpYMjk2NzE4X1BMTF9NQUPCoCDCoCDCoCDCoDI8YnI+
DQorI2RlZmluZSBaWDI5NjcxOF9QTExfTU0wwqAgwqAgwqAgwqAzPGJyPg0KKyNkZWZpbmUgWlgy
OTY3MThfUExMX01NMcKgIMKgIMKgIMKgNDxicj4NCisjZGVmaW5lIFpYMjk2NzE4X1BMTF9WR0HC
oCDCoCDCoCDCoDU8YnI+DQorI2RlZmluZSBaWDI5NjcxOF9QTExfRERSwqAgwqAgwqAgwqA2PGJy
Pg0KKyNkZWZpbmUgWlgyOTY3MThfUExMX0FVRElPwqAgwqAgwqA3PGJyPg0KKyNkZWZpbmUgWlgy
OTY3MThfUExMX0hTSUPCoCDCoCDCoCA4PGJyPg0KKyNkZWZpbmUgQ1BVX0RCR19HQVRFwqAgwqAg
wqAgwqAgwqAgwqA5PGJyPg0KKyNkZWZpbmUgQTcyX0dBVEXCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oDEwPGJyPg0KKyNkZWZpbmUgQ1BVX1BFUklfR0FURcKgIMKgIMKgIMKgIMKgIDExPGJyPg0KKyNk
ZWZpbmUgQTUzX0dBVEXCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDEyPGJyPg0KKyNkZWZpbmUgRERS
MV9HQVRFwqAgwqAgwqAgwqAgwqAgwqAgwqAgMTM8YnI+DQorI2RlZmluZSBERFIwX0dBVEXCoCDC
oCDCoCDCoCDCoCDCoCDCoCAxNDxicj4NCisjZGVmaW5lIFNEMV9XQ0xLwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAxNTxicj4NCisjZGVmaW5lIFNEMV9BSELCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAxNjxicj4NCisjZGVmaW5lIFNEMF9XQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAxNzxicj4NCisjZGVmaW5lIFNEMF9BSELCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAxODxicj4NCisjZGVmaW5lIEVNTUNfV0NMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIDE5PGJy
Pg0KKyNkZWZpbmUgRU1NQ19OQU5EX0FYScKgIMKgIMKgIMKgIMKgIDIwPGJyPg0KKyNkZWZpbmUg
TkFORF9XQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgMjE8YnI+DQorI2RlZmluZSBFTU1DX05BTkRf
QUhCwqAgwqAgwqAgwqAgwqAgMjI8YnI+DQorI2RlZmluZSBMU1AxXzE0OE01wqAgwqAgwqAgwqAg
wqAgwqAgwqAyMzxicj4NCisjZGVmaW5lIExTUDFfOTlNwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAy
NDxicj4NCisjZGVmaW5lIExTUDFfMjRNwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAyNTxicj4NCisj
ZGVmaW5lIExTUDBfNzRNMjXCoCDCoCDCoCDCoCDCoCDCoCDCoDI2PGJyPg0KKyNkZWZpbmUgTFNQ
MF8zMkvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDI3PGJyPg0KKyNkZWZpbmUgTFNQMF8xNDhNNcKg
IMKgIMKgIMKgIMKgIMKgIMKgMjg8YnI+DQorI2RlZmluZSBMU1AwXzk5TcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgMjk8YnI+DQorI2RlZmluZSBMU1AwXzI0TcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
MzA8YnI+DQorI2RlZmluZSBERU1VWF9BWEnCoCDCoCDCoCDCoCDCoCDCoCDCoCAzMTxicj4NCisj
ZGVmaW5lIERFTVVYX0FQQsKgIMKgIMKgIMKgIMKgIMKgIMKgIDMyPGJyPg0KKyNkZWZpbmUgREVN
VVhfMTQ4TTXCoCDCoCDCoCDCoCDCoCDCoCAzMzxicj4NCisjZGVmaW5lIERFTVVYXzEwOE3CoCDC
oCDCoCDCoCDCoCDCoCDCoDM0PGJyPg0KKyNkZWZpbmUgQVVESU9fQVBCwqAgwqAgwqAgwqAgwqAg
wqAgwqAgMzU8YnI+DQorI2RlZmluZSBBVURJT185OU3CoCDCoCDCoCDCoCDCoCDCoCDCoCAzNjxi
cj4NCisjZGVmaW5lIEFVRElPXzI0TcKgIMKgIMKgIMKgIMKgIMKgIMKgIDM3PGJyPg0KKyNkZWZp
bmUgQVVESU9fMTZNMzg0wqAgwqAgwqAgwqAgwqAgwqAzODxicj4NCisjZGVmaW5lIEFVRElPXzMy
S8KgIMKgIMKgIMKgIMKgIMKgIMKgIDM5PGJyPg0KKyNkZWZpbmUgV0RUX1dDTEvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoDQwPGJyPg0KKyNkZWZpbmUgVElNRVJfV0NMS8KgIMKgIMKgIMKgIMKgIMKg
IMKgNDE8YnI+DQorI2RlZmluZSBWREVfQUNMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNDI8YnI+
DQorI2RlZmluZSBWQ0VfQUNMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNDM8YnI+DQorI2RlZmlu
ZSBIREVfQUNMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNDQ8YnI+DQorI2RlZmluZSBHUFVfQUNM
S8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNDU8YnI+DQorI2RlZmluZSBTQVBQVV9BQ0xLwqAgwqAg
wqAgwqAgwqAgwqAgwqA0Njxicj4NCisjZGVmaW5lIFNBUFBVX1dDTEvCoCDCoCDCoCDCoCDCoCDC
oCDCoDQ3PGJyPg0KKyNkZWZpbmUgVk9VX0FDTEvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDQ4PGJy
Pg0KKyNkZWZpbmUgVk9VX01BSU5fV0NMS8KgIMKgIMKgIMKgIMKgIDQ5PGJyPg0KKyNkZWZpbmUg
Vk9VX0FVWF9XQ0xLwqAgwqAgwqAgwqAgwqAgwqA1MDxicj4NCisjZGVmaW5lIFZPVV9QUFVfV0NM
S8KgIMKgIMKgIMKgIMKgIMKgNTE8YnI+DQorI2RlZmluZSBNSVBJX0NGR19DTEvCoCDCoCDCoCDC
oCDCoCDCoDUyPGJyPg0KKyNkZWZpbmUgVkdBX0kyQ19XQ0xLwqAgwqAgwqAgwqAgwqAgwqA1Mzxi
cj4NCisjZGVmaW5lIE1JUElfUkVGX0NMS8KgIMKgIMKgIMKgIMKgIMKgNTQ8YnI+DQorI2RlZmlu
ZSBIRE1JX09TQ19DRUPCoCDCoCDCoCDCoCDCoCDCoDU1PGJyPg0KKyNkZWZpbmUgSERNSV9PU0Nf
Q0xLwqAgwqAgwqAgwqAgwqAgwqA1Njxicj4NCisjZGVmaW5lIEhETUlfWENMS8KgIMKgIMKgIMKg
IMKgIMKgIMKgIDU3PGJyPg0KKyNkZWZpbmUgVklVX00wX0FDTEvCoCDCoCDCoCDCoCDCoCDCoCA1
ODxicj4NCisjZGVmaW5lIFZJVV9NMV9BQ0xLwqAgwqAgwqAgwqAgwqAgwqAgNTk8YnI+DQorI2Rl
ZmluZSBWSVVfV0NMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgNjA8YnI+DQorI2RlZmluZSBWSVVf
SlBFR19XQ0xLwqAgwqAgwqAgwqAgwqAgNjE8YnI+DQorI2RlZmluZSBWSVVfQ0ZHX0NMS8KgIMKg
IMKgIMKgIMKgIMKgIDYyPGJyPg0KKyNkZWZpbmUgVFNfU1lTX1dDTEvCoCDCoCDCoCDCoCDCoCDC
oCA2Mzxicj4NCisjZGVmaW5lIFRTX1NZU18xMDhNwqAgwqAgwqAgwqAgwqAgwqAgNjQ8YnI+DQor
I2RlZmluZSBVU0IyMF9IQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqA2NTxicj4NCisjZGVmaW5lIFVT
QjIwX1BIWV9DTEvCoCDCoCDCoCDCoCDCoCA2Njxicj4NCisjZGVmaW5lIFVTQjIxX0hDTEvCoCDC
oCDCoCDCoCDCoCDCoCDCoDY3PGJyPg0KKyNkZWZpbmUgVVNCMjFfUEhZX0NMS8KgIMKgIMKgIMKg
IMKgIDY4PGJyPg0KKyNkZWZpbmUgR01BQ19STUlJQ0xLwqAgwqAgwqAgwqAgwqAgwqA2OTxicj4N
CisjZGVmaW5lIEdNQUNfUENMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIDcwPGJyPg0KKyNkZWZpbmUg
R01BQ19BQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgNzE8YnI+DQorI2RlZmluZSBHTUFDX1JGQ0xL
wqAgwqAgwqAgwqAgwqAgwqAgwqA3Mjxicj4NCisjZGVmaW5lIFRFTVBTRU5TT1JfR0FURcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIDczPGJyPg0KKzxicj4NCisjZGVmaW5lIFRPUF9OUl9DTEtTwqAg
wqAgwqAgwqAgwqAgwqAgNzQ8YnI+DQorPGJyPg0KKzxicj4NCisjZGVmaW5lIExTUDBfVElNRVIz
X1BDTEvCoCDCoCDCoCDCoDE8YnI+DQorI2RlZmluZSBMU1AwX1RJTUVSM19XQ0xLwqAgwqAgwqAg
wqAyPGJyPg0KKyNkZWZpbmUgTFNQMF9USU1FUjRfUENMS8KgIMKgIMKgIMKgMzxicj4NCisjZGVm
aW5lIExTUDBfVElNRVI0X1dDTEvCoCDCoCDCoCDCoDQ8YnI+DQorI2RlZmluZSBMU1AwX1RJTUVS
NV9QQ0xLwqAgwqAgwqAgwqA1PGJyPg0KKyNkZWZpbmUgTFNQMF9USU1FUjVfV0NMS8KgIMKgIMKg
IMKgNjxicj4NCisjZGVmaW5lIExTUDBfVUFSVDNfUENMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IDc8YnI+DQorI2RlZmluZSBMU1AwX1VBUlQzX1dDTEvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA4
PGJyPg0KKyNkZWZpbmUgTFNQMF9VQVJUMV9QQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgOTxi
cj4NCisjZGVmaW5lIExTUDBfVUFSVDFfV0NMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDEwPGJy
Pg0KKyNkZWZpbmUgTFNQMF9VQVJUMl9QQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMTE8YnI+
DQorI2RlZmluZSBMU1AwX1VBUlQyX1dDTEvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAxMjxicj4N
CisjZGVmaW5lIExTUDBfU1BJRkMwX1BDTEvCoCDCoCDCoCDCoDEzPGJyPg0KKyNkZWZpbmUgTFNQ
MF9TUElGQzBfV0NMS8KgIMKgIMKgIMKgMTQ8YnI+DQorI2RlZmluZSBMU1AwX0kyQzRfUENMS8Kg
IMKgIMKgIMKgIMKgMTU8YnI+DQorI2RlZmluZSBMU1AwX0kyQzRfV0NMS8KgIMKgIMKgIMKgIMKg
MTY8YnI+DQorI2RlZmluZSBMU1AwX0kyQzVfUENMS8KgIMKgIMKgIMKgIMKgMTc8YnI+DQorI2Rl
ZmluZSBMU1AwX0kyQzVfV0NMS8KgIMKgIMKgIMKgIMKgMTg8YnI+DQorI2RlZmluZSBMU1AwX1NT
UDBfUENMS8KgIMKgIMKgIMKgIMKgMTk8YnI+DQorI2RlZmluZSBMU1AwX1NTUDBfV0NMS8KgIMKg
IMKgIMKgIMKgMjA8YnI+DQorI2RlZmluZSBMU1AwX1NTUDFfUENMS8KgIMKgIMKgIMKgIMKgMjE8
YnI+DQorI2RlZmluZSBMU1AwX1NTUDFfV0NMS8KgIMKgIMKgIMKgIMKgMjI8YnI+DQorI2RlZmlu
ZSBMU1AwX1VTSU1fUENMS8KgIMKgIMKgIMKgIMKgMjM8YnI+DQorI2RlZmluZSBMU1AwX1VTSU1f
V0NMS8KgIMKgIMKgIMKgIMKgMjQ8YnI+DQorI2RlZmluZSBMU1AwX0dQSU9fUENMS8KgIMKgIMKg
IMKgIMKgMjU8YnI+DQorI2RlZmluZSBMU1AwX0dQSU9fV0NMS8KgIMKgIMKgIMKgIMKgMjY8YnI+
DQorI2RlZmluZSBMU1AwX0kyQzNfUENMS8KgIMKgIMKgIMKgIMKgMjc8YnI+DQorI2RlZmluZSBM
U1AwX0kyQzNfV0NMS8KgIMKgIMKgIMKgIMKgMjg8YnI+DQorPGJyPg0KKyNkZWZpbmUgTFNQMF9O
Ul9DTEtTwqAgwqAgwqAgwqAgwqAgwqAyOTxicj4NCis8YnI+DQorPGJyPg0KKyNkZWZpbmUgTFNQ
MV9VQVJUNF9QQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMTxicj4NCisjZGVmaW5lIExTUDFf
VUFSVDRfV0NMS8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDI8YnI+DQorI2RlZmluZSBMU1AxX1VB
UlQ1X1BDTEvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAzPGJyPg0KKyNkZWZpbmUgTFNQMV9VQVJU
NV9XQ0xLwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgNDxicj4NCisjZGVmaW5lIExTUDFfUFdNX1BD
TEvCoCDCoCDCoCDCoCDCoCA1PGJyPg0KKyNkZWZpbmUgTFNQMV9QV01fV0NMS8KgIMKgIMKgIMKg
IMKgIDY8YnI+DQorI2RlZmluZSBMU1AxX0kyQzJfUENMS8KgIMKgIMKgIMKgIMKgNzxicj4NCisj
ZGVmaW5lIExTUDFfSTJDMl9XQ0xLwqAgwqAgwqAgwqAgwqA4PGJyPg0KKyNkZWZpbmUgTFNQMV9T
U1AyX1BDTEvCoCDCoCDCoCDCoCDCoDk8YnI+DQorI2RlZmluZSBMU1AxX1NTUDJfV0NMS8KgIMKg
IMKgIMKgIMKgMTA8YnI+DQorI2RlZmluZSBMU1AxX1NTUDNfUENMS8KgIMKgIMKgIMKgIMKgMTE8
YnI+DQorI2RlZmluZSBMU1AxX1NTUDNfV0NMS8KgIMKgIMKgIMKgIMKgMTI8YnI+DQorI2RlZmlu
ZSBMU1AxX1NTUDRfUENMS8KgIMKgIMKgIMKgIMKgMTM8YnI+DQorI2RlZmluZSBMU1AxX1NTUDRf
V0NMS8KgIMKgIMKgIMKgIMKgMTQ8YnI+DQorI2RlZmluZSBMU1AxX1VTSU0xX1BDTEvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAxNTxicj4NCisjZGVmaW5lIExTUDFfVVNJTTFfV0NMS8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIDE2PGJyPg0KKzxicj4NCisjZGVmaW5lIExTUDFfTlJfQ0xLU8KgIMKg
IMKgIMKgIMKgIMKgMTc8YnI+DQorI2VuZGlmPGJyPg0KPHNwYW4gY2xhc3M9IkhPRW5aYiI+PGZv
bnQgY29sb3I9IiM4ODg4ODgiPi0tPGJyPg0KMS45LjE8YnI+DQo8YnI+DQo8L2ZvbnQ+PC9zcGFu
PjwvYmxvY2txdW90ZT48L2Rpdj5NaWtlLDwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48
YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPkRvIHlvdSBoYXZlIG1vcmUgY29tbWVu
dHMgb24gdmVyc2lvbiAyIHBhdGNoZXM/IE9yIHlvdSBhbHJlYWR5IHBsYW4gdG8gbWVyZ2UgdGhl
bT88L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRyYSI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX2V4dHJhIj5UaGFuayB5b3UhPC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPkp1bjwv
ZGl2PjwvZGl2Pg0K
--001a1137b98eeb7211053af97082--
