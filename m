Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 30 Jan 2017 10:04:22 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v3 04/10] clk: sunxi-ng: add support for Allwinner H5 SoC
Message-ID: <20170130090422.sizypnxu3prah4sc@lukather>
References: <20170129023331.62106-1-icenowy@aosc.xyz>
 <20170129023331.62106-5-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170129023331.62106-5-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Vinod Koul <vinod.koul@intel.com>, Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4149740822402033632=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4149740822402033632==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wkz2hzr2bp72vr6p"
Content-Disposition: inline


--wkz2hzr2bp72vr6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2017 at 10:33:25AM +0800, Icenowy Zheng wrote:
> Allwinner H5 is a SoC that features a CCU like H3, but with MMC phase
> clocks removed (for new MMC controller) and a new bus gate/reset
> imported.
>=20
> Add support for it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> See the comments of the previous patch.
>=20
>  .../devicetree/bindings/clock/sunxi-ccu.txt        |   1 +
>  drivers/clk/sunxi-ng/Kconfig                       |   2 +-
>  drivers/clk/sunxi-ng/ccu-sunxi-h3-h5.c             | 137 +++++++++++++++=
++++++
>  drivers/clk/sunxi-ng/ccu-sunxi-h3-h5.h             |   5 +-
>  include/dt-bindings/clock/sunxi-h3-h5-ccu.h        |   3 +
>  include/dt-bindings/reset/sunxi-h3-h5-ccu.h        |   3 +
>  6 files changed, 149 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Docu=
mentation/devicetree/bindings/clock/sunxi-ccu.txt
> index f6032cf63f12..a33a4a5ecffa 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
> @@ -9,6 +9,7 @@ Required properties :
>  		- "allwinner,sun8i-h3-ccu"
>  		- "allwinner,sun8i-v3s-ccu"
>  		- "allwinner,sun50i-a64-ccu"
> +		- "allwinner,sun50i-h5-ccu"
> =20
>  - reg: Must contain the registers base address and length
>  - clocks: phandle to the oscillators feeding the CCU. Two are needed:
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index 4be083ae717f..bdf18e846731 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -117,7 +117,7 @@ config SUNXI_H3_H5_CCU
>  	select SUNXI_CCU_NM
>  	select SUNXI_CCU_MP
>  	select SUNXI_CCU_PHASE
> -	default MACH_SUN8I
> +	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
> =20
>  config SUN8I_V3S_CCU
>  	bool "Support for the Allwinner V3s CCU"
> diff --git a/drivers/clk/sunxi-ng/ccu-sunxi-h3-h5.c b/drivers/clk/sunxi-n=
g/ccu-sunxi-h3-h5.c
> index be63b56315f5..b7b9f85f5c9f 100644
> --- a/drivers/clk/sunxi-ng/ccu-sunxi-h3-h5.c
> +++ b/drivers/clk/sunxi-ng/ccu-sunxi-h3-h5.c
> @@ -302,6 +302,8 @@ static SUNXI_CCU_GATE(bus_uart3_clk,	"bus-uart3",	"ap=
b2",
>  		      0x06c, BIT(19), 0);
>  static SUNXI_CCU_GATE(bus_scr0_clk,	"bus-scr0",	"apb2",
>  		      0x06c, BIT(20), 0);
> +static SUNXI_CCU_GATE(bus_scr1_clk,	"bus-scr1",	"apb2",
> +		      0x06c, BIT(21), 0);
> =20
>  static SUNXI_CCU_GATE(bus_ephy_clk,	"bus-ephy",	"ahb1",
>  		      0x070, BIT(0), 0);
> @@ -547,6 +549,7 @@ static struct ccu_common *sunxi_h3_h5_ccu_clks[] =3D {
>  	&bus_uart2_clk.common,
>  	&bus_uart3_clk.common,
>  	&bus_scr0_clk.common,
> +	&bus_scr1_clk.common,
>  	&bus_ephy_clk.common,
>  	&bus_dbg_clk.common,
>  	&ths_clk.common,
> @@ -730,6 +733,122 @@ static struct clk_hw_onecell_data sun8i_h3_hw_clks =
=3D {
>  	.num	=3D CLK_NUMBER,
>  };
> =20
> +static struct clk_hw_onecell_data sun50i_h5_hw_clks =3D {
> +	.hws	=3D {
> +		[CLK_PLL_CPUX]		=3D &pll_cpux_clk.common.hw,
> +		[CLK_PLL_AUDIO_BASE]	=3D &pll_audio_base_clk.common.hw,
> +		[CLK_PLL_AUDIO]		=3D &pll_audio_clk.hw,
> +		[CLK_PLL_AUDIO_2X]	=3D &pll_audio_2x_clk.hw,
> +		[CLK_PLL_AUDIO_4X]	=3D &pll_audio_4x_clk.hw,
> +		[CLK_PLL_AUDIO_8X]	=3D &pll_audio_8x_clk.hw,
> +		[CLK_PLL_VIDEO]		=3D &pll_video_clk.common.hw,
> +		[CLK_PLL_VE]		=3D &pll_ve_clk.common.hw,
> +		[CLK_PLL_DDR]		=3D &pll_ddr_clk.common.hw,
> +		[CLK_PLL_PERIPH0]	=3D &pll_periph0_clk.common.hw,
> +		[CLK_PLL_PERIPH0_2X]	=3D &pll_periph0_2x_clk.hw,
> +		[CLK_PLL_GPU]		=3D &pll_gpu_clk.common.hw,
> +		[CLK_PLL_PERIPH1]	=3D &pll_periph1_clk.common.hw,
> +		[CLK_PLL_DE]		=3D &pll_de_clk.common.hw,
> +		[CLK_CPUX]		=3D &cpux_clk.common.hw,
> +		[CLK_AXI]		=3D &axi_clk.common.hw,
> +		[CLK_AHB1]		=3D &ahb1_clk.common.hw,
> +		[CLK_APB1]		=3D &apb1_clk.common.hw,
> +		[CLK_APB2]		=3D &apb2_clk.common.hw,
> +		[CLK_AHB2]		=3D &ahb2_clk.common.hw,
> +		[CLK_BUS_CE]		=3D &bus_ce_clk.common.hw,
> +		[CLK_BUS_DMA]		=3D &bus_dma_clk.common.hw,
> +		[CLK_BUS_MMC0]		=3D &bus_mmc0_clk.common.hw,
> +		[CLK_BUS_MMC1]		=3D &bus_mmc1_clk.common.hw,
> +		[CLK_BUS_MMC2]		=3D &bus_mmc2_clk.common.hw,
> +		[CLK_BUS_NAND]		=3D &bus_nand_clk.common.hw,
> +		[CLK_BUS_DRAM]		=3D &bus_dram_clk.common.hw,
> +		[CLK_BUS_EMAC]		=3D &bus_emac_clk.common.hw,
> +		[CLK_BUS_TS]		=3D &bus_ts_clk.common.hw,
> +		[CLK_BUS_HSTIMER]	=3D &bus_hstimer_clk.common.hw,
> +		[CLK_BUS_SPI0]		=3D &bus_spi0_clk.common.hw,
> +		[CLK_BUS_SPI1]		=3D &bus_spi1_clk.common.hw,
> +		[CLK_BUS_OTG]		=3D &bus_otg_clk.common.hw,
> +		[CLK_BUS_EHCI0]		=3D &bus_ehci0_clk.common.hw,
> +		[CLK_BUS_EHCI1]		=3D &bus_ehci1_clk.common.hw,
> +		[CLK_BUS_EHCI2]		=3D &bus_ehci2_clk.common.hw,
> +		[CLK_BUS_EHCI3]		=3D &bus_ehci3_clk.common.hw,
> +		[CLK_BUS_OHCI0]		=3D &bus_ohci0_clk.common.hw,
> +		[CLK_BUS_OHCI1]		=3D &bus_ohci1_clk.common.hw,
> +		[CLK_BUS_OHCI2]		=3D &bus_ohci2_clk.common.hw,
> +		[CLK_BUS_OHCI3]		=3D &bus_ohci3_clk.common.hw,
> +		[CLK_BUS_VE]		=3D &bus_ve_clk.common.hw,
> +		[CLK_BUS_TCON0]		=3D &bus_tcon0_clk.common.hw,
> +		[CLK_BUS_TCON1]		=3D &bus_tcon1_clk.common.hw,
> +		[CLK_BUS_DEINTERLACE]	=3D &bus_deinterlace_clk.common.hw,
> +		[CLK_BUS_CSI]		=3D &bus_csi_clk.common.hw,
> +		[CLK_BUS_TVE]		=3D &bus_tve_clk.common.hw,
> +		[CLK_BUS_HDMI]		=3D &bus_hdmi_clk.common.hw,
> +		[CLK_BUS_DE]		=3D &bus_de_clk.common.hw,
> +		[CLK_BUS_GPU]		=3D &bus_gpu_clk.common.hw,
> +		[CLK_BUS_MSGBOX]	=3D &bus_msgbox_clk.common.hw,
> +		[CLK_BUS_SPINLOCK]	=3D &bus_spinlock_clk.common.hw,
> +		[CLK_BUS_CODEC]		=3D &bus_codec_clk.common.hw,
> +		[CLK_BUS_SPDIF]		=3D &bus_spdif_clk.common.hw,
> +		[CLK_BUS_PIO]		=3D &bus_pio_clk.common.hw,
> +		[CLK_BUS_THS]		=3D &bus_ths_clk.common.hw,
> +		[CLK_BUS_I2S0]		=3D &bus_i2s0_clk.common.hw,
> +		[CLK_BUS_I2S1]		=3D &bus_i2s1_clk.common.hw,
> +		[CLK_BUS_I2S2]		=3D &bus_i2s2_clk.common.hw,
> +		[CLK_BUS_I2C0]		=3D &bus_i2c0_clk.common.hw,
> +		[CLK_BUS_I2C1]		=3D &bus_i2c1_clk.common.hw,
> +		[CLK_BUS_I2C2]		=3D &bus_i2c2_clk.common.hw,
> +		[CLK_BUS_UART0]		=3D &bus_uart0_clk.common.hw,
> +		[CLK_BUS_UART1]		=3D &bus_uart1_clk.common.hw,
> +		[CLK_BUS_UART2]		=3D &bus_uart2_clk.common.hw,
> +		[CLK_BUS_UART3]		=3D &bus_uart3_clk.common.hw,
> +		[CLK_BUS_SCR0]		=3D &bus_scr0_clk.common.hw,
> +		[CLK_BUS_SCR1]		=3D &bus_scr1_clk.common.hw,
> +		[CLK_BUS_EPHY]		=3D &bus_ephy_clk.common.hw,
> +		[CLK_BUS_DBG]		=3D &bus_dbg_clk.common.hw,
> +		[CLK_THS]		=3D &ths_clk.common.hw,
> +		[CLK_NAND]		=3D &nand_clk.common.hw,
> +		[CLK_MMC0]		=3D &mmc0_clk.common.hw,
> +		[CLK_MMC1]		=3D &mmc1_clk.common.hw,
> +		[CLK_MMC2]		=3D &mmc2_clk.common.hw,
> +		[CLK_TS]		=3D &ts_clk.common.hw,
> +		[CLK_CE]		=3D &ce_clk.common.hw,
> +		[CLK_SPI0]		=3D &spi0_clk.common.hw,
> +		[CLK_SPI1]		=3D &spi1_clk.common.hw,
> +		[CLK_I2S0]		=3D &i2s0_clk.common.hw,
> +		[CLK_I2S1]		=3D &i2s1_clk.common.hw,
> +		[CLK_I2S2]		=3D &i2s2_clk.common.hw,
> +		[CLK_SPDIF]		=3D &spdif_clk.common.hw,
> +		[CLK_USB_PHY0]		=3D &usb_phy0_clk.common.hw,
> +		[CLK_USB_PHY1]		=3D &usb_phy1_clk.common.hw,
> +		[CLK_USB_PHY2]		=3D &usb_phy2_clk.common.hw,
> +		[CLK_USB_PHY3]		=3D &usb_phy3_clk.common.hw,
> +		[CLK_USB_OHCI0]		=3D &usb_ohci0_clk.common.hw,
> +		[CLK_USB_OHCI1]		=3D &usb_ohci1_clk.common.hw,
> +		[CLK_USB_OHCI2]		=3D &usb_ohci2_clk.common.hw,
> +		[CLK_USB_OHCI3]		=3D &usb_ohci3_clk.common.hw,
> +		[CLK_DRAM]		=3D &dram_clk.common.hw,
> +		[CLK_DRAM_VE]		=3D &dram_ve_clk.common.hw,
> +		[CLK_DRAM_CSI]		=3D &dram_csi_clk.common.hw,
> +		[CLK_DRAM_DEINTERLACE]	=3D &dram_deinterlace_clk.common.hw,
> +		[CLK_DRAM_TS]		=3D &dram_ts_clk.common.hw,
> +		[CLK_DE]		=3D &de_clk.common.hw,
> +		[CLK_TCON0]		=3D &tcon_clk.common.hw,
> +		[CLK_TVE]		=3D &tve_clk.common.hw,
> +		[CLK_DEINTERLACE]	=3D &deinterlace_clk.common.hw,
> +		[CLK_CSI_MISC]		=3D &csi_misc_clk.common.hw,
> +		[CLK_CSI_SCLK]		=3D &csi_sclk_clk.common.hw,
> +		[CLK_CSI_MCLK]		=3D &csi_mclk_clk.common.hw,
> +		[CLK_VE]		=3D &ve_clk.common.hw,
> +		[CLK_AC_DIG]		=3D &ac_dig_clk.common.hw,
> +		[CLK_AVS]		=3D &avs_clk.common.hw,
> +		[CLK_HDMI]		=3D &hdmi_clk.common.hw,
> +		[CLK_HDMI_DDC]		=3D &hdmi_ddc_clk.common.hw,
> +		[CLK_MBUS]		=3D &mbus_clk.common.hw,
> +		[CLK_GPU]		=3D &gpu_clk.common.hw,
> +	},
> +	.num	=3D CLK_NUMBER,
> +};
> +
>  static struct ccu_reset_map sunxi_h3_h5_ccu_resets[] =3D {
>  	[RST_USB_PHY0]		=3D  { 0x0cc, BIT(0) },
>  	[RST_USB_PHY1]		=3D  { 0x0cc, BIT(1) },
> @@ -791,6 +910,7 @@ static struct ccu_reset_map sunxi_h3_h5_ccu_resets[] =
=3D {
>  	[RST_BUS_UART2]		=3D  { 0x2d8, BIT(18) },
>  	[RST_BUS_UART3]		=3D  { 0x2d8, BIT(19) },
>  	[RST_BUS_SCR0]		=3D  { 0x2d8, BIT(20) },
> +	[RST_BUS_SCR1]		=3D  { 0x2d8, BIT(21) },

That reset line is not valid on the H3.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wkz2hzr2bp72vr6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYjwGWAAoJEBx+YmzsjxAg70QP/23mMGzj5KyK4fSfQbo5eYtN
mIu1SO2qzUyd0qCritOOIGoalYnAX8avF2lCs7MmOuF4ZqT5b75Id2vQmPbnz1qG
4yy7uTPWS+vIXQ/7dMzsCzoKdaNKEqRWXZpsscfzNASfcueKpveQ0HTse/Rdb+Kz
6P7aXwVDPklfnpdUpUhRUTZV+d7FB9xcNDOuu+skwFTGkmheKFhmIH2WYRfOhJ5p
TJHEIbfHmHhb7NQXATzGqnCONB01eaqHZTmSDmuJ80amdu0YIGdZ+GHE1ysiUruX
Szvhe/PoVTn6ALQcIv79Ai4KTeWhPfeLa3N8xVilk2JbVAbvqusGo8B5AOQ3Lbr7
j4eiGxFbDe8vVmD1YCj0Yrlq99EvbUbBInC9XbTFA9hNj/A+bfaVP7fWhNUCyqC4
j78E7f/JS0kad4XE1c51gPTHL5Y3Iv0gfaMa+Kr9PoZaOi3Ihkz+jIsC9qM9OG1p
1oujMvJlpwk/0Zv5dPMasukQ4Eyvthgg7rRvWJRtXCloPWjj7o0QU3MruGS1cvlu
hB3Q352n0so9cqMcs4yZiej4n9F7KliNsQZKTBmNlV7Lo3ovlRQ1PTlLFQ8xREtA
WHjh8uE0bLtwXI83ZzzgbwfLx8nh24HDQSKru+nfYELNGqONyEG3GfjSc57c/pIW
IDCeUwBNP7AP/JS8f7sw
=AkWy
-----END PGP SIGNATURE-----

--wkz2hzr2bp72vr6p--


--===============4149740822402033632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4149740822402033632==--
