Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:23:40 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 08/10] clk: sunxi-ng: support R40 SoC
Message-ID: <20170504142340.ckugq267n7phuzqi@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-9-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-9-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4646573368022912345=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4646573368022912345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n5wk367q2ae5q35n"
Content-Disposition: inline


--n5wk367q2ae5q35n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:50:04PM +0800, Icenowy Zheng wrote:
> From: Icenowy Zheng <icenowy@aosc.xyz>
>=20
> Allwinner R40 SoC have a clock controller module in the style of the
> SoCs beyond sun6i, however, it's more rich and complex.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Fixes according to the SoC's user manual.
>=20
>  drivers/clk/sunxi-ng/Kconfig              |   10 +
>  drivers/clk/sunxi-ng/Makefile             |    1 +
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c      | 1153 +++++++++++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.h      |   68 ++
>  include/dt-bindings/clock/sun8i-r40-ccu.h |  191 +++++
>  include/dt-bindings/reset/sun8i-r40-ccu.h |  129 ++++
>  6 files changed, 1552 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
>  create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
>  create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 64088e599404..e6884eafde44 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -140,6 +140,16 @@ config SUN8I_V3S_CCU
>  	default MACH_SUN8I
>  	depends on MACH_SUN8I || COMPILE_TEST
> =20
> +config SUN8I_R40_CCU
> +	bool "Support for the Allwinner R40 CCU"
> +	select SUNXI_CCU_DIV
> +	select SUNXI_CCU_NK
> +	select SUNXI_CCU_NKM
> +	select SUNXI_CCU_NKMP
> +	select SUNXI_CCU_NM
> +	select SUNXI_CCU_MP
> +	default MACH_SUN8I
> +
>  config SUN9I_A80_CCU
>  	bool "Support for the Allwinner A80 CCU"
>  	select SUNXI_CCU_DIV
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 0ec02fe14c50..aa00b641484e 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_SUN8I_A33_CCU)	+=3D ccu-sun8i-a33.o
>  obj-$(CONFIG_SUN8I_H3_CCU)	+=3D ccu-sun8i-h3.o
>  obj-$(CONFIG_SUN8I_V3S_CCU)	+=3D ccu-sun8i-v3s.o
>  obj-$(CONFIG_SUN8I_R_CCU)	+=3D ccu-sun8i-r.o
> +obj-$(CONFIG_SUN8I_R40_CCU)	+=3D ccu-sun8i-r40.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-de.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+=3D ccu-sun9i-a80-usb.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-r40.c
> new file mode 100644
> index 000000000000..0cc1b1ab7c3f
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
> @@ -0,0 +1,1153 @@
> +/*
> + * Copyright (c) 2016 Icenowy Zheng <icenowy@aosc.xyz>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_address.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +#include "ccu_mult.h"
> +#include "ccu_nk.h"
> +#include "ccu_nkm.h"
> +#include "ccu_nkmp.h"
> +#include "ccu_nm.h"
> +#include "ccu_phase.h"
> +
> +#include "ccu-sun8i-r40.h"
> +
> +static SUNXI_CCU_NKMP_WITH_GATE_LOCK(pll_cpu_clk, "pll-cpu",
> +				     "osc24M", 0x000,
> +				     8, 5,	/* N */
> +				     4, 2,	/* K */
> +				     0, 2,	/* M */
> +				     16, 2,	/* P */
> +				     BIT(31),	/* gate */
> +				     BIT(28),	/* lock */
> +				     0);
> +
> +/*
> + * The Audio PLL is supposed to have 4 outputs: 3 fixed factors from
> + * the base (2x, 4x and 8x), and one variable divider (the one true
> + * pll audio).
> + *
> + * We don't have any need for the variable divider for now, so we just
> + * hardcode it to match with the clock names
> + */
> +#define SUN8I_R40_PLL_AUDIO_REG	0x008
> +
> +static SUNXI_CCU_NM_WITH_GATE_LOCK(pll_audio_base_clk, "pll-audio-base",
> +				   "osc24M", 0x008,
> +				   8, 7,	/* N */
> +				   0, 5,	/* M */
> +				   BIT(31),	/* gate */
> +				   BIT(28),	/* lock */
> +				   0);
> +
> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_video0_clk, "pll-video0",
> +					"osc24M", 0x0010,
> +					8, 7,		/* N */
> +					0, 4,		/* M */
> +					BIT(24),	/* frac enable */
> +					BIT(25),	/* frac select */
> +					270000000,	/* frac rate 0 */
> +					297000000,	/* frac rate 1 */
> +					BIT(31),	/* gate */
> +					BIT(28),	/* lock */
> +					0);
> +
> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
> +					"osc24M", 0x0018,
> +					8, 7,		/* N */
> +					0, 4,		/* M */
> +					BIT(24),	/* frac enable */
> +					BIT(25),	/* frac select */
> +					270000000,	/* frac rate 0 */
> +					297000000,	/* frac rate 1 */
> +					BIT(31),	/* gate */
> +					BIT(28),	/* lock */
> +					0);
> +
> +static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_ddr0_clk, "pll-ddr0",
> +				    "osc24M", 0x020,
> +				    8, 5,	/* N */
> +				    4, 2,	/* K */
> +				    0, 2,	/* M */
> +				    BIT(31),	/* gate */
> +				    BIT(28),	/* lock */
> +				    0);
> +
> +/* According to the BSP driver, pll-periph{0,1} have M at 0:1 */
> +static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_periph0_clk, "pll-periph0",
> +				    "osc24M", 0x028,
> +				    8, 5,	/* N */
> +				    4, 2,	/* K */
> +				    0, 2,	/* M */
> +				    BIT(31),	/* gate */
> +				    BIT(28),	/* lock */
> +				    0);
> +
> +static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_periph1_clk, "pll-periph1",
> +				    "osc24M", 0x02c,
> +				    8, 5,	/* N */
> +				    4, 2,	/* K */
> +				    0, 2,	/* M */
> +				    BIT(31),	/* gate */
> +				    BIT(28),	/* lock */
> +				    0);
> +
> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_video1_clk, "pll-video1",
> +					"osc24M", 0x030,
> +					8, 7,		/* N */
> +					0, 4,		/* M */
> +					BIT(24),	/* frac enable */
> +					BIT(25),	/* frac select */
> +					270000000,	/* frac rate 0 */
> +					297000000,	/* frac rate 1 */
> +					BIT(31),	/* gate */
> +					BIT(28),	/* lock */
> +					CLK_SET_RATE_UNGATE);
> +
> +/*
> + * For the special bit in gate part, please see the BSP source code at
> + * https://github.com/BPI-SINOVOIP/BPI-M2U-bsp/blob/master/linux-sunxi/d=
rivers/clk/sunxi/clk-sun8iw11.c#L665
> + */

Please don't put URLs in there. They are meant to be broken.

> +static CLK_FIXED_FACTOR(osc24m_2x_clk, "osc24M-2x",
> +			"osc24M", 1, 2, 0);

There's a single user for this. You should just be using a factor to
the parent clock, there's no need to introduce a new clock.

> +static CLK_FIXED_FACTOR(osc24m_32k_clk, "osc24M-32k",
> +			"osc24M", 750, 1, 0);

This is fed from a 16MHz clock, likely the internal oscillator, that
is muxed from the RTC...

> +static struct clk_hw_onecell_data sun8i_r40_hw_clks =3D {
> +	.hws	=3D {
> +		[CLK_OSC24M_2X]		=3D &osc24m_2x_clk.hw,
> +		[CLK_OSC24M_32K]	=3D &osc24m_32k_clk.hw,

Which means that you should be a consumer of the RTC clock, not feed
it.

> +		[CLK_PLL_CPU]		=3D &pll_cpu_clk.common.hw,
> +		[CLK_PLL_AUDIO_BASE]	=3D &pll_audio_base_clk.common.hw,
> +		[CLK_PLL_AUDIO]		=3D &pll_audio_clk.hw,
> +		[CLK_PLL_AUDIO_2X]	=3D &pll_audio_2x_clk.hw,
> +		[CLK_PLL_AUDIO_4X]	=3D &pll_audio_4x_clk.hw,
> +		[CLK_PLL_AUDIO_8X]	=3D &pll_audio_8x_clk.hw,
> +		[CLK_PLL_VIDEO0]	=3D &pll_video0_clk.common.hw,
> +		[CLK_PLL_VIDEO0_2X]	=3D &pll_video0_2x_clk.hw,
> +		[CLK_PLL_VE]		=3D &pll_ve_clk.common.hw,
> +		[CLK_PLL_DDR0]		=3D &pll_ddr0_clk.common.hw,
> +		[CLK_PLL_PERIPH0]	=3D &pll_periph0_clk.common.hw,
> +		[CLK_PLL_PERIPH0_2X]	=3D &pll_periph0_2x_clk.hw,
> +		[CLK_PLL_PERIPH1]	=3D &pll_periph1_clk.common.hw,
> +		[CLK_PLL_PERIPH1_2X]	=3D &pll_periph1_2x_clk.hw,
> +		[CLK_PLL_VIDEO1]	=3D &pll_video1_clk.common.hw,
> +		[CLK_PLL_VIDEO1_2X]	=3D &pll_video1_2x_clk.hw,
> +		[CLK_PLL_SATA]		=3D &pll_sata_clk.common.hw,
> +		[CLK_PLL_GPU]		=3D &pll_gpu_clk.common.hw,
> +		[CLK_PLL_MIPI]		=3D &pll_mipi_clk.common.hw,
> +		[CLK_PLL_DE]		=3D &pll_de_clk.common.hw,
> +		[CLK_PLL_DDR1]		=3D &pll_ddr1_clk.common.hw,
> +		[CLK_CPU]		=3D &cpu_clk.common.hw,
> +		[CLK_AXI]		=3D &axi_clk.common.hw,
> +		[CLK_AHB1]		=3D &ahb1_clk.common.hw,
> +		[CLK_APB1]		=3D &apb1_clk.common.hw,
> +		[CLK_APB2]		=3D &apb2_clk.common.hw,
> +		[CLK_BUS_MIPI_DSI]	=3D &bus_mipi_dsi_clk.common.hw,
> +		[CLK_BUS_CE]		=3D &bus_ce_clk.common.hw,
> +		[CLK_BUS_DMA]		=3D &bus_dma_clk.common.hw,
> +		[CLK_BUS_MMC0]		=3D &bus_mmc0_clk.common.hw,
> +		[CLK_BUS_MMC1]		=3D &bus_mmc1_clk.common.hw,
> +		[CLK_BUS_MMC2]		=3D &bus_mmc2_clk.common.hw,
> +		[CLK_BUS_MMC3]		=3D &bus_mmc3_clk.common.hw,
> +		[CLK_BUS_NAND]		=3D &bus_nand_clk.common.hw,
> +		[CLK_BUS_DRAM]		=3D &bus_dram_clk.common.hw,
> +		[CLK_BUS_EMAC]		=3D &bus_emac_clk.common.hw,
> +		[CLK_BUS_TS]		=3D &bus_ts_clk.common.hw,
> +		[CLK_BUS_HSTIMER]	=3D &bus_hstimer_clk.common.hw,
> +		[CLK_BUS_SPI0]		=3D &bus_spi0_clk.common.hw,
> +		[CLK_BUS_SPI1]		=3D &bus_spi1_clk.common.hw,
> +		[CLK_BUS_SPI2]		=3D &bus_spi2_clk.common.hw,
> +		[CLK_BUS_SPI3]		=3D &bus_spi3_clk.common.hw,
> +		[CLK_BUS_SATA]		=3D &bus_sata_clk.common.hw,
> +		[CLK_BUS_OTG]		=3D &bus_otg_clk.common.hw,
> +		[CLK_BUS_EHCI0]		=3D &bus_ehci0_clk.common.hw,
> +		[CLK_BUS_EHCI1]		=3D &bus_ehci1_clk.common.hw,
> +		[CLK_BUS_EHCI2]		=3D &bus_ehci2_clk.common.hw,
> +		[CLK_BUS_OHCI0]		=3D &bus_ohci0_clk.common.hw,
> +		[CLK_BUS_OHCI1]		=3D &bus_ohci1_clk.common.hw,
> +		[CLK_BUS_OHCI2]		=3D &bus_ohci2_clk.common.hw,
> +		[CLK_BUS_VE]		=3D &bus_ve_clk.common.hw,
> +		[CLK_BUS_DE_MP]		=3D &bus_de_mp_clk.common.hw,
> +		[CLK_BUS_DEINTERLACE]	=3D &bus_deinterlace_clk.common.hw,
> +		[CLK_BUS_CSI0]		=3D &bus_csi0_clk.common.hw,
> +		[CLK_BUS_CSI1]		=3D &bus_csi1_clk.common.hw,
> +		[CLK_BUS_HDMI_SLOW]	=3D &bus_hdmi_slow_clk.common.hw,
> +		[CLK_BUS_HDMI]		=3D &bus_hdmi_clk.common.hw,
> +		[CLK_BUS_DE]		=3D &bus_de_clk.common.hw,
> +		[CLK_BUS_TVE0]		=3D &bus_tve0_clk.common.hw,
> +		[CLK_BUS_TVE1]		=3D &bus_tve1_clk.common.hw,
> +		[CLK_BUS_TVE_TOP]	=3D &bus_tve_top_clk.common.hw,
> +		[CLK_BUS_GMAC]		=3D &bus_gmac_clk.common.hw,
> +		[CLK_BUS_GPU]		=3D &bus_gpu_clk.common.hw,
> +		[CLK_BUS_TVD0]		=3D &bus_tvd0_clk.common.hw,
> +		[CLK_BUS_TVD1]		=3D &bus_tvd1_clk.common.hw,
> +		[CLK_BUS_TVD2]		=3D &bus_tvd2_clk.common.hw,
> +		[CLK_BUS_TVD3]		=3D &bus_tvd3_clk.common.hw,
> +		[CLK_BUS_TVD_TOP]	=3D &bus_tvd_top_clk.common.hw,
> +		[CLK_BUS_TCON0]		=3D &bus_tcon0_clk.common.hw,
> +		[CLK_BUS_TCON1]		=3D &bus_tcon1_clk.common.hw,
> +		[CLK_BUS_TVE0_TCON]	=3D &bus_tve0_tcon_clk.common.hw,
> +		[CLK_BUS_TVE1_TCON]	=3D &bus_tve1_tcon_clk.common.hw,
> +		[CLK_BUS_TCON_TOP]	=3D &bus_tcon_top_clk.common.hw,
> +		[CLK_BUS_CODEC]		=3D &bus_codec_clk.common.hw,
> +		[CLK_BUS_SPDIF]		=3D &bus_spdif_clk.common.hw,
> +		[CLK_BUS_AC97]		=3D &bus_ac97_clk.common.hw,
> +		[CLK_BUS_PIO]		=3D &bus_pio_clk.common.hw,
> +		[CLK_BUS_IR0]		=3D &bus_ir0_clk.common.hw,
> +		[CLK_BUS_IR1]		=3D &bus_ir1_clk.common.hw,
> +		[CLK_BUS_THS]		=3D &bus_ths_clk.common.hw,
> +		[CLK_BUS_KEYPAD]	=3D &bus_keypad_clk.common.hw,
> +		[CLK_BUS_I2S0]		=3D &bus_i2s0_clk.common.hw,
> +		[CLK_BUS_I2S1]		=3D &bus_i2s1_clk.common.hw,
> +		[CLK_BUS_I2S2]		=3D &bus_i2s2_clk.common.hw,
> +		[CLK_BUS_I2C0]		=3D &bus_i2c0_clk.common.hw,
> +		[CLK_BUS_I2C1]		=3D &bus_i2c1_clk.common.hw,
> +		[CLK_BUS_I2C2]		=3D &bus_i2c2_clk.common.hw,
> +		[CLK_BUS_I2C3]		=3D &bus_i2c3_clk.common.hw,
> +		[CLK_BUS_CAN]		=3D &bus_can_clk.common.hw,
> +		[CLK_BUS_SCR]		=3D &bus_scr_clk.common.hw,
> +		[CLK_BUS_PS20]		=3D &bus_ps20_clk.common.hw,
> +		[CLK_BUS_PS21]		=3D &bus_ps21_clk.common.hw,
> +		[CLK_BUS_I2C4]		=3D &bus_i2c4_clk.common.hw,
> +		[CLK_BUS_UART0]		=3D &bus_uart0_clk.common.hw,
> +		[CLK_BUS_UART1]		=3D &bus_uart1_clk.common.hw,
> +		[CLK_BUS_UART2]		=3D &bus_uart2_clk.common.hw,
> +		[CLK_BUS_UART3]		=3D &bus_uart3_clk.common.hw,
> +		[CLK_BUS_UART4]		=3D &bus_uart4_clk.common.hw,
> +		[CLK_BUS_UART5]		=3D &bus_uart5_clk.common.hw,
> +		[CLK_BUS_UART6]		=3D &bus_uart6_clk.common.hw,
> +		[CLK_BUS_UART7]		=3D &bus_uart7_clk.common.hw,
> +		[CLK_BUS_DBG]		=3D &bus_dbg_clk.common.hw,
> +		[CLK_THS]		=3D &ths_clk.common.hw,
> +		[CLK_NAND]		=3D &nand_clk.common.hw,
> +		[CLK_MMC0]		=3D &mmc0_clk.common.hw,
> +		[CLK_MMC1]		=3D &mmc1_clk.common.hw,
> +		[CLK_MMC2]		=3D &mmc2_clk.common.hw,
> +		[CLK_MMC3]		=3D &mmc3_clk.common.hw,
> +		[CLK_TS]		=3D &ts_clk.common.hw,
> +		[CLK_CE]		=3D &ce_clk.common.hw,
> +		[CLK_SPI0]		=3D &spi0_clk.common.hw,
> +		[CLK_SPI1]		=3D &spi1_clk.common.hw,
> +		[CLK_SPI2]		=3D &spi2_clk.common.hw,
> +		[CLK_SPI3]		=3D &spi3_clk.common.hw,
> +		[CLK_I2S0]		=3D &i2s0_clk.common.hw,
> +		[CLK_I2S1]		=3D &i2s1_clk.common.hw,
> +		[CLK_I2S2]		=3D &i2s2_clk.common.hw,
> +		[CLK_AC97]		=3D &ac97_clk.common.hw,
> +		[CLK_SPDIF]		=3D &spdif_clk.common.hw,
> +		[CLK_KEYPAD]		=3D &keypad_clk.common.hw,
> +		[CLK_SATA]		=3D &sata_clk.common.hw,
> +		[CLK_USB_PHY0]		=3D &usb_phy0_clk.common.hw,
> +		[CLK_USB_PHY1]		=3D &usb_phy1_clk.common.hw,
> +		[CLK_USB_PHY2]		=3D &usb_phy2_clk.common.hw,
> +		[CLK_USB_OHCI0]		=3D &usb_ohci0_clk.common.hw,
> +		[CLK_USB_OHCI1]		=3D &usb_ohci1_clk.common.hw,
> +		[CLK_USB_OHCI2]		=3D &usb_ohci2_clk.common.hw,
> +		[CLK_USB_OHCI0_12M]	=3D &usb_ohci0_12m_clk.common.hw,
> +		[CLK_USB_OHCI1_12M]	=3D &usb_ohci1_12m_clk.common.hw,
> +		[CLK_USB_OHCI2_12M]	=3D &usb_ohci2_12m_clk.common.hw,
> +		[CLK_IR0]		=3D &ir0_clk.common.hw,
> +		[CLK_IR1]		=3D &ir1_clk.common.hw,
> +		[CLK_DRAM]		=3D &dram_clk.common.hw,
> +		[CLK_DRAM_VE]		=3D &dram_ve_clk.common.hw,
> +		[CLK_DRAM_CSI0]		=3D &dram_csi0_clk.common.hw,
> +		[CLK_DRAM_CSI1]		=3D &dram_csi1_clk.common.hw,
> +		[CLK_DRAM_TS]		=3D &dram_ts_clk.common.hw,
> +		[CLK_DRAM_TVD]		=3D &dram_tvd_clk.common.hw,
> +		[CLK_DRAM_DE_MP]	=3D &dram_de_mp_clk.common.hw,
> +		[CLK_DRAM_DEINTERLACE]	=3D &dram_deinterlace_clk.common.hw,
> +		[CLK_DE]		=3D &de_clk.common.hw,
> +		[CLK_DE_MP]		=3D &de_mp_clk.common.hw,
> +		[CLK_TCON0]		=3D &tcon0_clk.common.hw,
> +		[CLK_TCON1]		=3D &tcon1_clk.common.hw,
> +		[CLK_TCON_TVE0]		=3D &tcon_tve0_clk.common.hw,
> +		[CLK_TCON_TVE1]		=3D &tcon_tve1_clk.common.hw,
> +		[CLK_DEINTERLACE]	=3D &deinterlace_clk.common.hw,
> +		[CLK_CSI1_MCLK]		=3D &csi1_mclk_clk.common.hw,
> +		[CLK_CSI_SCLK]		=3D &csi_sclk_clk.common.hw,
> +		[CLK_CSI0_MCLK]		=3D &csi0_mclk_clk.common.hw,
> +		[CLK_VE]		=3D &ve_clk.common.hw,
> +		[CLK_ADDA]		=3D &adda_clk.common.hw,
> +		[CLK_ADDA_4X]		=3D &adda_4x_clk.common.hw,
> +		[CLK_AVS]		=3D &avs_clk.common.hw,
> +		[CLK_HDMI]		=3D &hdmi_clk.common.hw,
> +		[CLK_HDMI_SLOW]		=3D &hdmi_slow_clk.common.hw,
> +		[CLK_MBUS]		=3D &mbus_clk.common.hw,
> +		[CLK_MIPI_DSI]		=3D &mipi_dsi_clk.common.hw,
> +		[CLK_TVE0]		=3D &tve0_clk.common.hw,
> +		[CLK_TVE1]		=3D &tve1_clk.common.hw,
> +		[CLK_TVD0]		=3D &tvd0_clk.common.hw,
> +		[CLK_TVD1]		=3D &tvd1_clk.common.hw,
> +		[CLK_TVD2]		=3D &tvd2_clk.common.hw,
> +		[CLK_TVD3]		=3D &tvd3_clk.common.hw,
> +		[CLK_GPU]		=3D &gpu_clk.common.hw,
> +		[CLK_OUTA]		=3D &outa_clk.common.hw,
> +		[CLK_OUTB]		=3D &outb_clk.common.hw,
> +	},
> +	.num	=3D CLK_NUMBER,
> +};
> +
> +static struct ccu_reset_map sun8i_r40_ccu_resets[] =3D {
> +	[RST_USB_PHY0]		=3D  { 0x0cc, BIT(0) },
> +	[RST_USB_PHY1]		=3D  { 0x0cc, BIT(1) },
> +	[RST_USB_PHY2]		=3D  { 0x0cc, BIT(2) },
> +
> +	[RST_MBUS]		=3D  { 0x0fc, BIT(31) },
> +
> +	[RST_BUS_MIPI_DSI]	=3D  { 0x2c0, BIT(1) },
> +	[RST_BUS_CE]		=3D  { 0x2c0, BIT(5) },
> +	[RST_BUS_DMA]		=3D  { 0x2c0, BIT(6) },
> +	[RST_BUS_MMC0]		=3D  { 0x2c0, BIT(8) },
> +	[RST_BUS_MMC1]		=3D  { 0x2c0, BIT(9) },
> +	[RST_BUS_MMC2]		=3D  { 0x2c0, BIT(10) },
> +	[RST_BUS_MMC3]		=3D  { 0x2c0, BIT(11) },
> +	[RST_BUS_NAND]		=3D  { 0x2c0, BIT(13) },
> +	[RST_BUS_DRAM]		=3D  { 0x2c0, BIT(14) },
> +	[RST_BUS_EMAC]		=3D  { 0x2c0, BIT(17) },
> +	[RST_BUS_TS]		=3D  { 0x2c0, BIT(18) },
> +	[RST_BUS_HSTIMER]	=3D  { 0x2c0, BIT(19) },
> +	[RST_BUS_SPI0]		=3D  { 0x2c0, BIT(20) },
> +	[RST_BUS_SPI1]		=3D  { 0x2c0, BIT(21) },
> +	[RST_BUS_SPI2]		=3D  { 0x2c0, BIT(22) },
> +	[RST_BUS_SPI3]		=3D  { 0x2c0, BIT(23) },
> +	[RST_BUS_SATA]		=3D  { 0x2c0, BIT(24) },
> +	[RST_BUS_OTG]		=3D  { 0x2c0, BIT(25) },
> +	[RST_BUS_EHCI0]		=3D  { 0x2c0, BIT(26) },
> +	[RST_BUS_EHCI1]		=3D  { 0x2c0, BIT(27) },
> +	[RST_BUS_EHCI2]		=3D  { 0x2c0, BIT(28) },
> +	[RST_BUS_OHCI0]		=3D  { 0x2c0, BIT(29) },
> +	[RST_BUS_OHCI1]		=3D  { 0x2c0, BIT(30) },
> +	[RST_BUS_OHCI2]		=3D  { 0x2c0, BIT(31) },
> +
> +	[RST_BUS_VE]		=3D  { 0x2c4, BIT(0) },
> +	[RST_BUS_DE_MP]		=3D  { 0x2c4, BIT(2) },
> +	[RST_BUS_DEINTERLACE]	=3D  { 0x2c4, BIT(5) },
> +	[RST_BUS_CSI0]		=3D  { 0x2c4, BIT(8) },
> +	[RST_BUS_CSI1]		=3D  { 0x2c4, BIT(9) },
> +	[RST_BUS_HDMI_SLOW]	=3D  { 0x2c4, BIT(10) },
> +	[RST_BUS_HDMI]		=3D  { 0x2c4, BIT(11) },
> +	[RST_BUS_DE]		=3D  { 0x2c4, BIT(12) },
> +	[RST_BUS_TVE0]		=3D  { 0x2c4, BIT(13) },
> +	[RST_BUS_TVE1]		=3D  { 0x2c4, BIT(14) },
> +	[RST_BUS_TVE_TOP]	=3D  { 0x2c4, BIT(15) },
> +	[RST_BUS_GMAC]		=3D  { 0x2c4, BIT(17) },
> +	[RST_BUS_GPU]		=3D  { 0x2c4, BIT(20) },
> +	[RST_BUS_TVD0]		=3D  { 0x2c4, BIT(21) },
> +	[RST_BUS_TVD1]		=3D  { 0x2c4, BIT(22) },
> +	[RST_BUS_TVD2]		=3D  { 0x2c4, BIT(23) },
> +	[RST_BUS_TVD3]		=3D  { 0x2c4, BIT(24) },
> +	[RST_BUS_TVD_TOP]	=3D  { 0x2c4, BIT(25) },
> +	[RST_BUS_TCON0]		=3D  { 0x2c4, BIT(26) },
> +	[RST_BUS_TCON1]		=3D  { 0x2c4, BIT(27) },
> +	[RST_BUS_TCON_TVE0]	=3D  { 0x2c4, BIT(28) },
> +	[RST_BUS_TCON_TVE1]	=3D  { 0x2c4, BIT(29) },
> +	[RST_BUS_TCON_TOP]	=3D  { 0x2c4, BIT(30) },
> +	[RST_BUS_DBG]		=3D  { 0x2c4, BIT(31) },
> +
> +	[RST_BUS_LVDS]		=3D  { 0x2c8, BIT(0) },
> +
> +	[RST_BUS_CODEC]		=3D  { 0x2d0, BIT(0) },
> +	[RST_BUS_SPDIF]		=3D  { 0x2d0, BIT(1) },
> +	[RST_BUS_AC97]		=3D  { 0x2d0, BIT(2) },
> +	[RST_BUS_IR0]		=3D  { 0x2d0, BIT(6) },
> +	[RST_BUS_IR1]		=3D  { 0x2d0, BIT(7) },
> +	[RST_BUS_THS]		=3D  { 0x2d0, BIT(8) },
> +	[RST_BUS_KEYPAD]	=3D  { 0x2d0, BIT(10) },
> +	[RST_BUS_I2S0]		=3D  { 0x2d0, BIT(12) },
> +	[RST_BUS_I2S1]		=3D  { 0x2d0, BIT(13) },
> +	[RST_BUS_I2S2]		=3D  { 0x2d0, BIT(14) },
> +
> +	[RST_BUS_I2C0]		=3D  { 0x2d8, BIT(0) },
> +	[RST_BUS_I2C1]		=3D  { 0x2d8, BIT(1) },
> +	[RST_BUS_I2C2]		=3D  { 0x2d8, BIT(2) },
> +	[RST_BUS_I2C3]		=3D  { 0x2d8, BIT(3) },
> +	[RST_BUS_CAN]		=3D  { 0x2d8, BIT(4) },
> +	[RST_BUS_SCR]		=3D  { 0x2d8, BIT(5) },
> +	[RST_BUS_PS20]		=3D  { 0x2d8, BIT(6) },
> +	[RST_BUS_PS21]		=3D  { 0x2d8, BIT(7) },
> +	[RST_BUS_I2C4]		=3D  { 0x2d8, BIT(15) },
> +	[RST_BUS_UART0]		=3D  { 0x2d8, BIT(16) },
> +	[RST_BUS_UART1]		=3D  { 0x2d8, BIT(17) },
> +	[RST_BUS_UART2]		=3D  { 0x2d8, BIT(18) },
> +	[RST_BUS_UART3]		=3D  { 0x2d8, BIT(19) },
> +	[RST_BUS_UART4]		=3D  { 0x2d8, BIT(20) },
> +	[RST_BUS_UART5]		=3D  { 0x2d8, BIT(21) },
> +	[RST_BUS_UART6]		=3D  { 0x2d8, BIT(22) },
> +	[RST_BUS_UART7]		=3D  { 0x2d8, BIT(23) },
> +};
> +
> +static const struct sunxi_ccu_desc sun8i_r40_ccu_desc =3D {
> +	.ccu_clks	=3D sun8i_r40_ccu_clks,
> +	.num_ccu_clks	=3D ARRAY_SIZE(sun8i_r40_ccu_clks),
> +
> +	.hw_clks	=3D &sun8i_r40_hw_clks,
> +
> +	.resets		=3D sun8i_r40_ccu_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun8i_r40_ccu_resets),
> +};
> +
> +static struct ccu_mux_nb sun8i_r40_cpu_nb =3D {
> +	.common		=3D &cpu_clk.common,
> +	.cm		=3D &cpu_clk.mux,
> +	.delay_us	=3D 1, /* > 8 clock cycles at 24 MHz */
> +	.bypass_index	=3D 1, /* index of 24 MHz oscillator */
> +};
> +
> +static void __init sun8i_r40_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	/* Force the PLL-Audio-1x divider to 4 */
> +	val =3D readl(reg + SUN8I_R40_PLL_AUDIO_REG);
> +	val &=3D ~GENMASK(19, 16);
> +	writel(val | (3 << 16), reg + SUN8I_R40_PLL_AUDIO_REG);
> +
> +	sunxi_ccu_probe(node, reg, &sun8i_r40_ccu_desc);
> +
> +	ccu_mux_notifier_register(pll_cpu_clk.common.hw.clk,
> +				  &sun8i_r40_cpu_nb);

Did you test cpufreq on it? IT's likely to miss the gating notifier...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--n5wk367q2ae5q35n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCzlnAAoJEBx+YmzsjxAgTdgP/jnBZ+FFJpWuh4YOP0N/RN2l
l/gnaBDjTt89xUOXpIoLMYz4voUulUWVuQg/0Y87S6SaQdtoY5Byvai7phZwYpp8
SpV8RyXHbXkuVnFfUzoqPZckYO3TTgY83USnNZ7nVu79I96xlLmzdn0qU4blfNQ1
qxLrZUJeQPJ1ke9l0jh7+EczBC0TZuHrqgeHrv3I/APJZYAOBSS89xhDUWnEWFSO
vTO7Or2Fmzlmyx5AN/N5zz9oawE8tsnurtwdeyTl6sZTqx8dw8cFvPi+Q0LU/ble
oqlVTFdsh2/XwP5XxfPQjQthHkse/ygIuIEHSbN4GVdSEOU4s/cEeomDT/qlRi4b
20pYm/Hmng1Gs7P3yNvVQFnkP75GscCKRDFrg1huP+UeEgGqeVqVt1F2ptln92Zg
t4xxnH890EkKV/YIk42PTjEUUKftN7hDGfUgWchUdNXgmaYVC4F2txvxffXWb4u0
fdmt4PFqAUsYgIkRr9G2D5PDVzhZCA/z2oOsku7lT5tOPqWIjqhg966g0tyDCMa/
VN4kQe6YSd3T6nBzi4QzfFU+udzVGcJB84GznlZWl6oRF/5TgBECUvDyy66pdD4m
u+S3hPs4PUhe9NCci4dRQoJ4Yb1svJzf6lzc1O/irwBEDbmVoJY8Mcwjzdz5BBP7
xyEH/Zmx7O0tapQBnxH4
=mlSc
-----END PGP SIGNATURE-----

--n5wk367q2ae5q35n--


--===============4646573368022912345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4646573368022912345==--
