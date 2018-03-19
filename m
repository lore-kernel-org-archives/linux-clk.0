Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-eopbgr20051.outbound.protection.outlook.com ([40.107.2.51]:5758
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754218AbeCSCUL (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 18 Mar 2018 22:20:11 -0400
From: Jacky Bai <ping.bai@nxp.com>
To: "A.s. Dong" <aisheng.dong@nxp.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>
CC: Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "jacky.baip@gmail.com" <jacky.baip@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH v5 4/4] clk: imx: add clock driver for imx6sll
Date: Mon, 19 Mar 2018 02:20:04 +0000
Message-ID: <HE1PR04MB311386C7C74F4C6BE3082D3E87D40@HE1PR04MB3113.eurprd04.prod.outlook.com>
References: <1520846957-22348-1-git-send-email-ping.bai@nxp.com>
 <1520846957-22348-4-git-send-email-ping.bai@nxp.com>
 <AM3PR04MB306FE2F865B01DBBA6FF2A180D70@AM3PR04MB306.eurprd04.prod.outlook.com>
In-Reply-To: <AM3PR04MB306FE2F865B01DBBA6FF2A180D70@AM3PR04MB306.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

> > +++ b/drivers/clk/imx/clk-imx6sll.c
> > @@ -0,0 +1,343 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2016 Freescale Semiconductor, Inc.
> > + * Copyright 2017-2018 NXP.
> > + */
> > +
> > +#include <dt-bindings/clock/imx6sll-clock.h>
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/err.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
>=20
> [...]
>=20
> > +#include <linux/of_irq.h>
> > +#include <linux/types.h>
>=20
> Do we need above two things?
>=20

Ok will drop thest two include.

> > +
> > +#include "clk.h"
> > +

[...]

> > "pll3_usb_otg", base + 0xf0, 0);
> > +	clks[IMX6SLL_CLK_PLL3_PFD1] =3D imx_clk_pfd("pll3_pfd1_540m",
> > "pll3_usb_otg", base + 0xf0, 1);
> > +	clks[IMX6SLL_CLK_PLL3_PFD2] =3D imx_clk_pfd("pll3_pfd2_508m",
> > "pll3_usb_otg", base + 0xf0, 2);
> > +	clks[IMX6SLL_CLK_PLL3_PFD3] =3D imx_clk_pfd("pll3_pfd3_454m",
> > +"pll3_usb_otg", base + 0xf0, 3);
>=20
> It looks to me drivers/clk/imx/clk-pfd.c implementation may be buggy as
> imx6 Pfd is using share register for both divider and gate operation whil=
e no lock
> is kept.
>=20

Yes, this should be an issue. Will fix this in another patch.

> > +
> > +	clks[IMX6SLL_CLK_PLL4_POST_DIV]  =3D
> > clk_register_divider_table(NULL, "pll4_post_div", "pll4_audio",
> > +		 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0x70,
> > 19, 2, 0, post_div_table, &imx_ccm_lock);
> > +	clks[IMX6SLL_CLK_PLL4_AUDIO_DIV] =3D clk_register_divider(NULL,
> > "pll4_audio_div", "pll4_post_div",
> > +		 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base +
> > 0x170, 15, 1, 0, &imx_ccm_lock);
>=20
> From the reference manual, this divide bit actually is a AUDIO_DIV_LSB Wh=
ile
> there're another AUDIO_DIV_MSB.
>=20
> Definition as follows:
> NOTE: LSB bit value pertains to the last bit, please program the MSB bit =
(bit 23)
> as well, to change divider value for more information.
> 00 divide by 1 (Default)
> 01 divide by 2
> 10 divide by 1
> 11 divide by 4
>=20
> Seems we only use LSB here and reply on the HW reset value(0) of MSB bit.
> This makes us lose the divide 4 functionality. (MX6Q has the same issue).
>=20
> Due to MSB is bit 23 which Is not alongside with LSB,  the proper solutio=
n might
> be Invent imx specific clk_imx_register_discrete_divider_table.
> As this issue is already there and not affect function currently, it migh=
t be ok to
> do that later.
>=20

OK, we can just keep it no change now.

> > +	clks[IMX6SLL_CLK_PLL5_POST_DIV]  =3D
> > clk_register_divider_table(NULL, "pll5_post_div", "pll5_video",
> > +		 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base + 0xa0,
> > 19, 2, 0, post_div_table, &imx_ccm_lock);
> > +	clks[IMX6SLL_CLK_PLL5_VIDEO_DIV] =3D
> > clk_register_divider_table(NULL, "pll5_video_div", "pll5_post_div",
> > +		 CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE, base +
> > 0x170, 30, 2, 0,
> > +video_div_table, &imx_ccm_lock);
> > +
> > +	/*						   name
> > 	parent_name	 mult  div */
> > +	clks[IMX6SLL_CLK_PLL2_198M] =3D imx_clk_fixed_factor("pll2_198m",
> > "pll2_pfd2_396m", 1, 2);
> > +	clks[IMX6SLL_CLK_PLL3_120M] =3D imx_clk_fixed_factor("pll3_120m",
> > "pll3_usb_otg",   1, 4);
> > +	clks[IMX6SLL_CLK_PLL3_80M]  =3D imx_clk_fixed_factor("pll3_80m",
> > "pll3_usb_otg",   1, 6);
> > +	clks[IMX6SLL_CLK_PLL3_60M]  =3D imx_clk_fixed_factor("pll3_60m",
> > "pll3_usb_otg",   1, 8);
> > +
> > +	np =3D ccm_node;
> > +	base =3D of_iomap(np, 0);
> > +	WARN_ON(!base);
> > +
> > +	clks[IMX6SLL_CLK_STEP] 	 	  =3D imx_clk_mux("step", base
> > + 0x0c, 8, 1, step_sels, ARRAY_SIZE(step_sels));
> > +	clks[IMX6SLL_CLK_PLL1_SW] 	  =3D imx_clk_mux_flags("pll1_sw",
> > base + 0x0c, 2,  1, pll1_sw_sels, ARRAY_SIZE(pll1_sw_sels), 0);
> > +	clks[IMX6SLL_CLK_AXI_ALT_SEL]	  =3D imx_clk_mux("axi_alt_sel",
> > 	   base + 0x14, 7,  1, axi_alt_sels, ARRAY_SIZE(axi_alt_sels));
> > +	clks[IMX6SLL_CLK_AXI_SEL] 	  =3D imx_clk_mux_flags("axi_sel",
> > base + 0x14, 6,  1, axi_sels, ARRAY_SIZE(axi_sels), 0);
> > +	clks[IMX6SLL_CLK_PERIPH_PRE]	  =3D
> > imx_clk_mux("periph_pre",      base + 0x18, 18, 2, periph_pre_sels,
> > ARRAY_SIZE(periph_pre_sels));
> > +	clks[IMX6SLL_CLK_PERIPH2_PRE]	  =3D
> > imx_clk_mux("periph2_pre",     base + 0x18, 21, 2, periph2_pre_sels,
> > ARRAY_SIZE(periph2_pre_sels));
> > +	clks[IMX6SLL_CLK_PERIPH_CLK2_SEL]  =3D
> > imx_clk_mux("periph_clk2_sel",  base + 0x18, 12, 2, periph_clk2_sels,
> > ARRAY_SIZE(periph_clk2_sels));
> > +	clks[IMX6SLL_CLK_PERIPH2_CLK2_SEL] =3D
> > imx_clk_mux("periph2_clk2_sel", base + 0x18, 20, 1, periph2_clk2_sels,
> > ARRAY_SIZE(periph2_clk2_sels));
> > +	clks[IMX6SLL_CLK_USDHC2_SEL]	  =3D
> > imx_clk_mux("usdhc2_sel",   base + 0x1c, 17, 1, usdhc_sels,
> > ARRAY_SIZE(usdhc_sels));
>=20
> Any reason not in order?
>=20

Will be fixed

Jacky
> > +	clks[IMX6SLL_CLK_USDHC1_SEL]	  =3D
> > imx_clk_mux("usdhc1_sel",   base + 0x1c, 16, 1, usdhc_sels,
> > ARRAY_SIZE(usdhc_sels));
> > +	clks[IMX6SLL_CLK_USDHC3_SEL]	  =3D
> > imx_clk_mux("usdhc3_sel",   base + 0x1c, 18, 1, usdhc_sels,
> > ARRAY_SIZE(usdhc_sels));
> > +	clks[IMX6SLL_CLK_SSI1_SEL]	  =3D imx_clk_mux("ssi1_sel",     base +
> > 0x1c, 10, 2, ssi_sels, ARRAY_SIZE(ssi_sels));
> > +	clks[IMX6SLL_CLK_SSI2_SEL]	  =3D imx_clk_mux("ssi2_sel",     base +
> > 0x1c, 12, 2, ssi_sels, ARRAY_SIZE(ssi_sels));
> > +	clks[IMX6SLL_CLK_SSI3_SEL]	  =3D imx_clk_mux("ssi3_sel",     base +
> > 0x1c, 14, 2, ssi_sels, ARRAY_SIZE(ssi_sels));
> > +	clks[IMX6SLL_CLK_PERCLK_SEL] 	  =3D imx_clk_mux("perclk_sel",
> > 	base + 0x1c, 6,  1, perclk_sels, ARRAY_SIZE(perclk_sels));
> > +	clks[IMX6SLL_CLK_UART_SEL]	  =3D imx_clk_mux("uart_sel",	base
> > + 0x24, 6,  1, uart_sels, ARRAY_SIZE(uart_sels));
> > +	clks[IMX6SLL_CLK_SPDIF_SEL]	  =3D imx_clk_mux("spdif_sel",	base
> > + 0x30, 20, 2, spdif_sels, ARRAY_SIZE(spdif_sels));
> > +	clks[IMX6SLL_CLK_EXTERN_AUDIO_SEL] =3D
> > imx_clk_mux("extern_audio_sel", base + 0x30, 7,  2, spdif_sels,
> > ARRAY_SIZE(spdif_sels));
> > +	clks[IMX6SLL_CLK_EPDC_PRE_SEL]	  =3D
> > imx_clk_mux("epdc_pre_sel",	base + 0x34, 15, 3, epdc_pre_sels,
> > ARRAY_SIZE(epdc_pre_sels));
> > +	clks[IMX6SLL_CLK_EPDC_SEL]	  =3D imx_clk_mux("epdc_sel",	base
> > + 0x34, 9, 3, epdc_sels, ARRAY_SIZE(epdc_sels));
> > +	clks[IMX6SLL_CLK_ECSPI_SEL]	  =3D imx_clk_mux("ecspi_sel",	base
> > + 0x38, 18, 1, ecspi_sels, ARRAY_SIZE(ecspi_sels));
> > +	clks[IMX6SLL_CLK_LCDIF_PRE_SEL]	  =3D
> > imx_clk_mux("lcdif_pre_sel", base + 0x38, 15, 3, lcdif_pre_sels,
> > ARRAY_SIZE(lcdif_pre_sels));
> > +	clks[IMX6SLL_CLK_LCDIF_SEL]	  =3D imx_clk_mux("lcdif_sel",
> base
> > + 0x38, 9, 3, lcdif_sels, ARRAY_SIZE(lcdif_sels));
> > +
> > +	clks[IMX6SLL_CLK_PERIPH]  =3D imx_clk_busy_mux("periph",  base +
> > 0x14, 25, 1, base + 0x48, 5, periph_sels, ARRAY_SIZE(periph_sels));
> > +	clks[IMX6SLL_CLK_PERIPH2] =3D imx_clk_busy_mux("periph2", base +
> > 0x14,
> > +26, 1, base + 0x48, 3, periph2_sels, ARRAY_SIZE(periph2_sels));
> > +
> > +	clks[IMX6SLL_CLK_PERIPH_CLK2]	=3D
> > imx_clk_divider("periph_clk2",   "periph_clk2_sel",  	base + 0x14, 27, =
3);
> > +	clks[IMX6SLL_CLK_PERIPH2_CLK2]	=3D
> > imx_clk_divider("periph2_clk2",  "periph2_clk2_sel", 	base + 0x14, 0,  =
3);
> > +	clks[IMX6SLL_CLK_IPG]		=3D imx_clk_divider("ipg",
> > 	   "ahb",		base + 0x14, 8,	 2);
> > +	clks[IMX6SLL_CLK_LCDIF_PODF]	=3D
> > imx_clk_divider("lcdif_podf",	   "lcdif_pred",	base + 0x18, 23, 3);
> > +	clks[IMX6SLL_CLK_PERCLK]	=3D imx_clk_divider("perclk",
> > "perclk_sel",	base + 0x1c, 0,  6);
> > +	clks[IMX6SLL_CLK_USDHC3_PODF]   =3D
> > imx_clk_divider("usdhc3_podf",   "usdhc3_sel",	base + 0x24, 19, 3);
> > +	clks[IMX6SLL_CLK_USDHC2_PODF]	=3D
> > imx_clk_divider("usdhc2_podf",   "usdhc2_sel",	base + 0x24, 16, 3);
> > +	clks[IMX6SLL_CLK_USDHC1_PODF]	=3D
> > imx_clk_divider("usdhc1_podf",   "usdhc1_sel",	base + 0x24, 11, 3);
> > +	clks[IMX6SLL_CLK_UART_PODF]	=3D
> > imx_clk_divider("uart_podf",	   "uart_sel",		base + 0x24, 0,  6);
> > +	clks[IMX6SLL_CLK_SSI3_PRED]	=3D imx_clk_divider("ssi3_pred",
> > "ssi3_sel",		base + 0x28, 22, 3);
> > +	clks[IMX6SLL_CLK_SSI3_PODF]	=3D imx_clk_divider("ssi3_podf",
> > "ssi3_pred",		base + 0x28, 16, 6);
> > +	clks[IMX6SLL_CLK_SSI1_PRED]	=3D imx_clk_divider("ssi1_pred",
> > "ssi1_sel",		base + 0x28, 6,	 3);
> > +	clks[IMX6SLL_CLK_SSI1_PODF]	=3D imx_clk_divider("ssi1_podf",
> > "ssi1_pred",		base + 0x28, 0,	 6);
> > +	clks[IMX6SLL_CLK_SSI2_PRED]	=3D imx_clk_divider("ssi2_pred",
> > "ssi2_sel",		base + 0x2c, 6,	 3);
> > +	clks[IMX6SLL_CLK_SSI2_PODF]	=3D imx_clk_divider("ssi2_podf",
> > "ssi2_pred",		base + 0x2c, 0,  6);
> > +	clks[IMX6SLL_CLK_SPDIF_PRED]	=3D
> > imx_clk_divider("spdif_pred",	   "spdif_sel",		base + 0x30, 25, 3);
> > +	clks[IMX6SLL_CLK_SPDIF_PODF]	=3D
> > imx_clk_divider("spdif_podf",	   "spdif_pred",	base + 0x30, 22, 3);
> > +	clks[IMX6SLL_CLK_EXTERN_AUDIO_PRED] =3D
> > imx_clk_divider("extern_audio_pred", "extern_audio_sel",  base + 0x30,
> > 12, 3);
> > +	clks[IMX6SLL_CLK_EXTERN_AUDIO_PODF] =3D
> > imx_clk_divider("extern_audio_podf", "extern_audio_pred", base + 0x30,
> > 9, 3);
> > +	clks[IMX6SLL_CLK_EPDC_PODF]  =3D imx_clk_divider("epdc_podf",
> > "epdc_pre_sel",  base + 0x34, 12, 3);
> > +	clks[IMX6SLL_CLK_ECSPI_PODF] =3D imx_clk_divider("ecspi_podf",
> > "ecspi_sel",     base + 0x38, 19, 6);
> > +	clks[IMX6SLL_CLK_LCDIF_PRED] =3D imx_clk_divider("lcdif_pred",
> > +"lcdif_pre_sel", base + 0x38, 12, 3);
> > +
> > +	clks[IMX6SLL_CLK_ARM]		=3D
> > imx_clk_busy_divider("arm", 	    "pll1_sw",	base +	0x10, 0,  3,
> base +
> > 0x48, 16);
> > +	clks[IMX6SLL_CLK_MMDC_PODF]	=3D
> > imx_clk_busy_divider("mmdc_podf", "periph2",	base +  0x14, 3,  3,
> > base + 0x48, 2);
> > +	clks[IMX6SLL_CLK_AXI_PODF]	=3D imx_clk_busy_divider("axi",
> > "axi_sel",	base +  0x14, 16, 3,  base + 0x48, 0);
> > +	clks[IMX6SLL_CLK_AHB]		=3D
> > imx_clk_busy_divider("ahb",	    "periph",	base +  0x14, 10, 3,  base +
> > 0x48, 1);
> > +
> > +	clks[IMX6SLL_CLK_LDB_DI0_DIV_3_5] =3D
> > imx_clk_fixed_factor("ldb_di0_div_3_5", "ldb_di0_sel", 2, 7);
> > +	clks[IMX6SLL_CLK_LDB_DI0_DIV_7]	  =3D
> > imx_clk_fixed_factor("ldb_di0_div_7",   "ldb_di0_sel", 1, 7);
> > +	clks[IMX6SLL_CLK_LDB_DI1_DIV_3_5] =3D
> > imx_clk_fixed_factor("ldb_di1_div_3_5", "ldb_di1_sel", 2, 7);
> > +	clks[IMX6SLL_CLK_LDB_DI1_DIV_7]	  =3D
> > imx_clk_fixed_factor("ldb_di1_div_7",   "ldb_di1_sel", 1, 7);
> > +
> > +	clks[IMX6SLL_CLK_LDB_DI0_SEL]	=3D imx_clk_mux("ldb_di0_sel",
> > base + 0x2c, 9, 3, ldb_di0_sels, ARRAY_SIZE(ldb_di0_sels));
> > +	clks[IMX6SLL_CLK_LDB_DI1_SEL]   =3D imx_clk_mux("ldb_di1_sel",
> > base + 0x1c, 7, 3, ldb_di1_sels, ARRAY_SIZE(ldb_di1_sels));
> > +	clks[IMX6SLL_CLK_LDB_DI0_DIV_SEL] =3D
> > imx_clk_mux("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels,
> > ARRAY_SIZE(ldb_di0_div_sels));
> > +	clks[IMX6SLL_CLK_LDB_DI1_DIV_SEL] =3D
> > imx_clk_mux("ldb_di1_div_sel",
> > +base + 0x20, 10, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
> > +
> > +	/* CCGR0 */
> > +	clks[IMX6SLL_CLK_AIPSTZ1]	=3D imx_clk_gate2_flags("aips_tz1",
> > "ahb", base + 0x68, 0, CLK_IS_CRITICAL);
> > +	clks[IMX6SLL_CLK_AIPSTZ2]	=3D imx_clk_gate2_flags("aips_tz2",
> > "ahb", base + 0x68, 2, CLK_IS_CRITICAL);
> > +	clks[IMX6SLL_CLK_DCP]		=3D imx_clk_gate2("dcp", "ahb",
> > base + 0x68, 10);
> > +	clks[IMX6SLL_CLK_UART2_IPG]	=3D imx_clk_gate2("uart2_ipg",
> > "ipg", base + 0x68, 28);
> > +	clks[IMX6SLL_CLK_UART2_SERIAL]	=3D
> > imx_clk_gate2("uart2_serial",	"uart_podf", base + 0x68, 28);
> > +
> > +	/* CCGR1 */
> > +	clks[IMX6SLL_CLK_ECSPI1]	=3D imx_clk_gate2("ecspi1",
> > 	"ecspi_podf", base + 0x6c, 0);
> > +	clks[IMX6SLL_CLK_ECSPI2]	=3D imx_clk_gate2("ecspi2",
> > 	"ecspi_podf", base + 0x6c, 2);
> > +	clks[IMX6SLL_CLK_ECSPI3]	=3D imx_clk_gate2("ecspi3",
> > 	"ecspi_podf", base + 0x6c, 4);
> > +	clks[IMX6SLL_CLK_ECSPI4]	=3D imx_clk_gate2("ecspi4",
> > 	"ecspi_podf", base + 0x6c, 6);
> > +	clks[IMX6SLL_CLK_UART3_IPG]	=3D imx_clk_gate2("uart3_ipg",
> > 	"ipg", base + 0x6c, 10);
> > +	clks[IMX6SLL_CLK_UART3_SERIAL]	=3D
> > imx_clk_gate2("uart3_serial",	"uart_podf", base + 0x6c, 10);
> > +	clks[IMX6SLL_CLK_EPIT1]		=3D imx_clk_gate2("epit1",
> > 	"perclk", base + 0x6c, 12);
> > +	clks[IMX6SLL_CLK_EPIT2]		=3D imx_clk_gate2("epit2",
> > 	"perclk", base + 0x6c, 14);
> > +	clks[IMX6SLL_CLK_GPT_BUS]	=3D imx_clk_gate2("gpt1_bus",
> > 	"perclk", base + 0x6c, 20);
> > +	clks[IMX6SLL_CLK_GPT_SERIAL]	=3D
> > imx_clk_gate2("gpt1_serial",	"perclk", base + 0x6c, 22);
> > +	clks[IMX6SLL_CLK_UART4_IPG]	=3D imx_clk_gate2("uart4_ipg",
> > 	"ipg", base + 0x6c, 24);
> > +	clks[IMX6SLL_CLK_UART4_SERIAL]	=3D
> > imx_clk_gate2("uart4_serail",	"uart_podf", base + 0x6c, 24);
> > +
> > +	/* CCGR2 */
> > +	clks[IMX6SLL_CLK_CSI]		=3D imx_clk_gate2("csi",		"axi",
> > base + 0x70,	2);
> > +	clks[IMX6SLL_CLK_I2C1]		=3D imx_clk_gate2("i2c1",
> > 		"perclk", base + 0x70,	6);
> > +	clks[IMX6SLL_CLK_I2C2]		=3D imx_clk_gate2("i2c2",
> > 		"perclk", base + 0x70,	8);
> > +	clks[IMX6SLL_CLK_I2C3]		=3D imx_clk_gate2("i2c3",
> > 		"perclk", base + 0x70,	10);
> > +	clks[IMX6SLL_CLK_OCOTP]		=3D imx_clk_gate2("ocotp",
> > 	"ipg",    base + 0x70,	12);
> > +	clks[IMX6SLL_CLK_LCDIF_APB]	=3D imx_clk_gate2("lcdif_apb",	"axi",
> > base + 0x70,	28);
> > +	clks[IMX6SLL_CLK_PXP]		=3D imx_clk_gate2("pxp",
> > 		"axi",    base + 0x70,	30);
> > +
> > +	/* CCGR3 */
> > +	clks[IMX6SLL_CLK_UART5_IPG]	=3D imx_clk_gate2("uart5_ipg",
> > 	"ipg",		base + 0x74, 2);
> > +	clks[IMX6SLL_CLK_UART5_SERIAL]	=3D
> > imx_clk_gate2("uart5_serial",	"uart_podf",	base + 0x74, 2);
> > +	clks[IMX6SLL_CLK_EPDC_AXI]	=3D imx_clk_gate2("epdc_aclk",	"axi",
> > 		base + 0x74, 4);
> > +	clks[IMX6SLL_CLK_EPDC_PIX]	=3D imx_clk_gate2("epdc_pix",
> > 	"epdc_podf",	base + 0x74, 4);
> > +	clks[IMX6SLL_CLK_LCDIF_PIX]	=3D imx_clk_gate2("lcdif_pix",
> > 	"lcdif_podf",	base + 0x74, 10);
> > +	clks[IMX6SLL_CLK_WDOG1]		=3D imx_clk_gate2("wdog1",
> > 	"ipg",		base + 0x74, 16);
> > +	clks[IMX6SLL_CLK_MMDC_P0_FAST]	=3D
> > imx_clk_gate_flags("mmdc_p0_fast", "mmdc_podf",  base + 0x74,	20,
> > CLK_IS_CRITICAL);
> > +	clks[IMX6SLL_CLK_MMDC_P0_IPG]	=3D
> > imx_clk_gate2_flags("mmdc_p0_ipg", "ipg",	   base + 0x74,	24,
> > CLK_IS_CRITICAL);
> > +	clks[IMX6SLL_CLK_OCRAM]		=3D
> > imx_clk_gate_flags("ocram","ahb",		   base + 0x74,	28,
> > CLK_IS_CRITICAL);
> > +
> > +	/* CCGR4 */
> > +	clks[IMX6SLL_CLK_PWM1]		=3D imx_clk_gate2("pwm1",
> > "perclk", base + 0x78, 16);
> > +	clks[IMX6SLL_CLK_PWM2]		=3D imx_clk_gate2("pwm2",
> > "perclk", base + 0x78, 18);
> > +	clks[IMX6SLL_CLK_PWM3]		=3D imx_clk_gate2("pwm3",
> > "perclk", base + 0x78, 20);
> > +	clks[IMX6SLL_CLK_PWM4]		=3D imx_clk_gate2("pwm4",
> > "perclk", base + 0x78, 22);
> > +
> > +	/* CCGR5 */
> > +	clks[IMX6SLL_CLK_ROM]		=3D imx_clk_gate2_flags("rom",
> > "ahb", base + 0x7c, 0, CLK_IS_CRITICAL);
> > +	clks[IMX6SLL_CLK_SDMA]		=3D imx_clk_gate2("sdma",
> > 	 "ahb",	base + 0x7c, 6);
> > +	clks[IMX6SLL_CLK_WDOG2]		=3D imx_clk_gate2("wdog2",
> > "ipg",	base + 0x7c, 10);
> > +	clks[IMX6SLL_CLK_SPBA]		=3D imx_clk_gate2("spba",
> > 	 "ipg",	base + 0x7c, 12);
> > +	clks[IMX6SLL_CLK_EXTERN_AUDIO]	=3D
> > imx_clk_gate2_shared("extern_audio",  "extern_audio_podf", base +
> > 0x7c, 14, &share_count_audio);
> > +	clks[IMX6SLL_CLK_SPDIF]		=3D
> > imx_clk_gate2_shared("spdif",		"spdif_podf",	base + 0x7c, 14,
> > &share_count_audio);
> > +	clks[IMX6SLL_CLK_SPDIF_GCLK]	=3D
> > imx_clk_gate2_shared("spdif_gclk",	"ipg",		base + 0x7c, 14,
> > &share_count_audio);
> > +	clks[IMX6SLL_CLK_SSI1]		=3D
> > imx_clk_gate2_shared("ssi1",		"ssi1_podf",	base + 0x7c, 18,
> > &share_count_ssi1);
> > +	clks[IMX6SLL_CLK_SSI1_IPG]	=3D imx_clk_gate2_shared("ssi1_ipg",
> > 	"ipg",		base + 0x7c, 18, &share_count_ssi1);
> > +	clks[IMX6SLL_CLK_SSI2]		=3D
> > imx_clk_gate2_shared("ssi2",		"ssi2_podf",	base + 0x7c, 20,
> > &share_count_ssi2);
> > +	clks[IMX6SLL_CLK_SSI2_IPG]	=3D imx_clk_gate2_shared("ssi2_ipg",
> > 	"ipg",		base + 0x7c, 20, &share_count_ssi2);
> > +	clks[IMX6SLL_CLK_SSI3]		=3D
> > imx_clk_gate2_shared("ssi3",		"ssi3_podf",	base + 0x7c, 22,
> > &share_count_ssi3);
> > +	clks[IMX6SLL_CLK_SSI3_IPG]	=3D imx_clk_gate2_shared("ssi3_ipg",
> > 	"ipg",		base + 0x7c, 22, &share_count_ssi3);
> > +	clks[IMX6SLL_CLK_UART1_IPG]	=3D imx_clk_gate2("uart1_ipg",
> > 	"ipg",		base + 0x7c, 24);
> > +	clks[IMX6SLL_CLK_UART1_SERIAL]	=3D
> > imx_clk_gate2("uart1_serial",	"uart_podf",	base + 0x7c, 24);
> > +
> > +	/* CCGR6 */
> > +	clks[IMX6SLL_CLK_USBOH3]	=3D imx_clk_gate2("usboh3", "ipg",
> > 	  base + 0x80,	0);
> > +	clks[IMX6SLL_CLK_USDHC1]	=3D imx_clk_gate2("usdhc1",
> > "usdhc1_podf",  base + 0x80,	2);
> > +	clks[IMX6SLL_CLK_USDHC2]	=3D imx_clk_gate2("usdhc2",
> > "usdhc2_podf",  base + 0x80,	4);
> > +	clks[IMX6SLL_CLK_USDHC3]	=3D imx_clk_gate2("usdhc3",
> > "usdhc3_podf",  base + 0x80,	6);
> > +
> > +	/* mask handshake of mmdc */
> > +	writel_relaxed(BM_CCM_CCDR_MMDC_CH0_MASK, base + 0x4);
> > +
> > +	imx_check_clocks(clks, ARRAY_SIZE(clks));
> > +
> > +	clk_data.clks =3D clks;
> > +	clk_data.clk_num =3D ARRAY_SIZE(clks);
> > +	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> > +
> > +	/* Lower the AHB clock rate before changing the clock source. */
> > +	clk_set_rate(clks[IMX6SLL_CLK_AHB], 99000000);
> > +
> > +	/* Change periph_pre clock to pll2_bus to adjust AXI rate to 264MHz
> > */
> > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH_CLK2_SEL],
> > clks[IMX6SLL_CLK_PLL3_USB_OTG]);
> > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH],
> > clks[IMX6SLL_CLK_PERIPH_CLK2]);
> > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH_PRE],
> > clks[IMX6SLL_CLK_PLL2_BUS]);
> > +	clk_set_parent(clks[IMX6SLL_CLK_PERIPH],
> > +clks[IMX6SLL_CLK_PERIPH_PRE]);
> > +
> > +	clk_set_rate(clks[IMX6SLL_CLK_AHB], 132000000); }
> > +
> > +CLK_OF_DECLARE(imx6sll, "fsl,imx6sll-ccm", imx6sll_clocks_init);
>=20
> As mentioned in another mail, I was requested to switch to clk_hw API by
> Stephen When upstreaming mx7ulp driver. As well as changing to
> CLK_OF_DECLARE_DRIVER.
>=20
> I need Stephen's confirm whether we can keep the old way.
>=20
> Stephen,
> Would you please comment here?
>=20
> Regards
> Dong Aisheng
>=20
> > --
> > 1.9.1

