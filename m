Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 17 Sep 2016 16:08:03 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH v2 1/4] clk: sunxi-ng: Add A64 clocks
Message-ID: <20160917140803.GC17518@lukather>
References: <20160909201029.24530-1-maxime.ripard@free-electrons.com>
 <20160909201029.24530-2-maxime.ripard@free-electrons.com>
 <CAGb2v65fg_5j7RmiwHUSJfiZfR78Dmv7EOLEm9eDNtxMJ-MuFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
In-Reply-To: <CAGb2v65fg_5j7RmiwHUSJfiZfR78Dmv7EOLEm9eDNtxMJ-MuFQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 10, 2016 at 11:24:48AM +0800, Chen-Yu Tsai wrote:
> > +static SUNXI_CCU_NK_WITH_GATE_LOCK_POSTDIV(pll_periph0_clk, "pll-perip=
h0",
> > +                                          "osc24M", 0x028,
> > +                                          8, 5,        /* N */
> > +                                          4, 2,        /* K */
>=20
> The manual says to give preference to K >=3D 2. I suggest swapping N/K and
> leaving a note about it, so the actual K is in the inner loop (see ccu_nk=
=2Ec)
> of the factor calculation.

It also says that we should fix that frequency (and we don't), so we
don't really care.

> > +static SUNXI_CCU_NKM_WITH_GATE_LOCK(pll_mipi_clk, "pll-mipi",
> > +                                   "pll-video0", 0x040,
> > +                                   8, 4,       /* N */
> > +                                   4, 2,       /* K */
>=20
> You need a table for K. (Manual says K >=3D 2).

Not really a table, but a minimum, like we have a maximum already.

> > +static SUNXI_CCU_DIV_TABLE_WITH_GATE(ths_clk, "ths", "osc24M",
> > +                                    0x074, 0, 2, ths_div_table, BIT(31=
), 0);
>=20
> Even though the mux has only one valid parent, I suggest you still implem=
ent it,
> in case some bogus value gets put in before the kernel loads.

Ack.

> > +static const char * const ts_parents[] =3D { "osc24M", "pll-periph0", =
};
> > +static SUNXI_CCU_MP_WITH_MUX_GATE(ts_clk, "ts", ts_parents, 0x098,
> > +                                 0, 4,         /* M */
> > +                                 16, 2,        /* P */
> > +                                 24, 2,        /* mux */
>=20
> Manual says the mux is 4 bits wide.

Ack.

> > +static const char * const i2s_parents[] =3D { "pll-audio-8x", "pll-aud=
io-4x",
> > +                                           "pll-audio-2x", "pll-audio"=
 };
> > +static SUNXI_CCU_MUX_WITH_GATE(i2s0_clk, "i2s0", i2s_parents,
> > +                              0x0b0, 16, 2, BIT(31), 0);
> > +
> > +static SUNXI_CCU_MUX_WITH_GATE(i2s1_clk, "i2s1", i2s_parents,
> > +                              0x0b4, 16, 2, BIT(31), 0);
> > +
> > +static SUNXI_CCU_MUX_WITH_GATE(i2s2_clk, "i2s2", i2s_parents,
> > +                              0x0b8, 16, 2, BIT(31), 0);
> > +
> > +static SUNXI_CCU_M_WITH_GATE(spdif_clk, "spdif", "pll-audio",
> > +                            0x0c0, 0, 4, BIT(31), 0);
>=20
> CLK_SET_PARENT_RATE for the above audio clocks?

Indeed.

> > +static SUNXI_CCU_GATE(usb_phy0_clk,    "usb-phy0",     "osc24M",
> > +                     0x0cc, BIT(8), 0);
> > +static SUNXI_CCU_GATE(usb_phy1_clk,    "usb-phy1",     "osc24M",
> > +                     0x0cc, BIT(9), 0);
> > +static SUNXI_CCU_GATE(usb_hsic_clk,    "usb-hsic",     "pll-hsic",
> > +                     0x0cc, BIT(10), 0);
> > +static SUNXI_CCU_GATE(usb_hsic_12m_clk,        "usb-hsic-12M", "osc12M=
",
> > +                     0x0cc, BIT(11), 0);
> > +static SUNXI_CCU_GATE(usb_ohci0_clk,   "usb-ohci0",    "osc12M",
> > +                     0x0cc, BIT(16), 0);
> > +static SUNXI_CCU_GATE(usb_ohci1_clk,   "usb-ohci1",    "usb-ohci0",
> > +                     0x0cc, BIT(17), 0);
>=20
> I guess we aren't modeling the 2 OHCI 12M muxes?

To be honest, I can't even make sense of it. Which clocks are using it
is unclear to me, so yeah, I don't know. I can probably leave some ID
for it though, just in case.

> > +static const char * const tcon1_parents[] =3D { "pll-video0", "pll-vid=
eo1" };
> > +static const u8 tcon1_table[] =3D { 0, 2, };
> > +struct ccu_div tcon1_clk =3D {
> > +       .enable         =3D BIT(31),
> > +       .div            =3D _SUNXI_CCU_DIV(0, 4),
> > +       .mux            =3D _SUNXI_CCU_MUX_TABLE(24, 3, tcon1_table),
> > +       .common         =3D {
> > +               .reg            =3D 0x11c,
> > +               .hw.init        =3D CLK_HW_INIT_PARENTS("tcon1",
> > +                                                     tcon1_parents,
> > +                                                     &ccu_div_ops,
> > +                                                     0),
> > +       },
> > +};
>=20
> CLK_SET_PARENT_RATE for the TCON clocks?

Yep

> > +static SUNXI_CCU_GATE(ac_dig_clk,      "ac-dig",       "pll-audio",
> > +                     0x140, BIT(31), 0);
> > +
> > +static SUNXI_CCU_GATE(ac_dig_4x_clk,   "ac-dig-4x",    "pll-audio-4x",
> > +                     0x140, BIT(30), 0);
>=20
> CLK_SET_PARENT_RATE for the above audio clocks?

Ack.

> > +static SUNXI_CCU_GATE(avs_clk,         "avs",          "osc24M",
> > +                     0x144, BIT(31), 0);
> > +
> > +static const char * const hdmi_parents[] =3D { "pll-video0", "pll-vide=
o1" };
> > +static SUNXI_CCU_M_WITH_MUX_GATE(hdmi_clk, "hdmi", hdmi_parents,
> > +                                0x150, 0, 4, 24, 2, BIT(31), 0);
>=20
> Might need CLK_SET_PARENT_RATE for hdmi?

Ack

> > +static SUNXI_CCU_GATE(hdmi_ddc_clk,    "hdmi-ddc",     "osc24M",
> > +                     0x154, BIT(31), 0);
> > +
> > +static const char * const mbus_parents[] =3D { "osc24M", "pll-periph0-=
2x",
> > +                                                "pll-ddr0", "pll-ddr1"=
 };
> > +static SUNXI_CCU_M_WITH_MUX_GATE(mbus_clk, "mbus", mbus_parents,
> > +                                0x15c, 0, 3, 24, 2, BIT(31), CLK_IS_CR=
ITICAL);
> > +
> > +static const char * const dsi_dphy_parents[] =3D { "pll-video0", "pll-=
periph0" };
>=20
> You need a mux table =3D { 0, 2 } here.

Indeed

> > +static SUNXI_CCU_M_WITH_MUX_GATE(dsi_dphy_clk, "dsi-dphy", dsi_dphy_pa=
rents,
> > +                                0x168, 0, 3, 24, 2, BIT(31), 0);
> > +
> > +static SUNXI_CCU_M_WITH_GATE(gpu_clk, "gpu", "pll-gpu",
> > +                            0x1a0, 0, 3, BIT(31), 0);
>=20
> CLK_SET_PARENT_RATE for the GPU clock?

Ack

> > +static CLK_FIXED_FACTOR(pll_video0_2x_clk, "pll-video0-2x",
> > +                       "pll-video0", 1, 2, 0);
>=20
> CLK_SET_PARENT_RATE for pll-video0-2x.

Ack

>=20
> > +
> > +static struct ccu_common *sun50i_a64_ccu_clks[] =3D {
> > +       &pll_cpux_clk.common,
> > +       &pll_audio_base_clk.common,
> > +       &pll_video0_clk.common,
> > +       &pll_ve_clk.common,
> > +       &pll_ddr0_clk.common,
> > +       &pll_periph0_clk.common,
> > +       &pll_periph1_clk.common,
> > +       &pll_video1_clk.common,
> > +       &pll_gpu_clk.common,
> > +       &pll_mipi_clk.common,
> > +       &pll_hsic_clk.common,
> > +       &pll_de_clk.common,
> > +       &pll_ddr1_clk.common,
> > +       &cpux_clk.common,
> > +       &axi_clk.common,
> > +       &ahb1_clk.common,
> > +       &apb1_clk.common,
> > +       &apb2_clk.common,
> > +       &ahb2_clk.common,
> > +       &bus_mipi_dsi_clk.common,
> > +       &bus_ce_clk.common,
> > +       &bus_dma_clk.common,
> > +       &bus_mmc0_clk.common,
> > +       &bus_mmc1_clk.common,
> > +       &bus_mmc2_clk.common,
> > +       &bus_nand_clk.common,
> > +       &bus_dram_clk.common,
> > +       &bus_emac_clk.common,
> > +       &bus_ts_clk.common,
> > +       &bus_hstimer_clk.common,
> > +       &bus_spi0_clk.common,
> > +       &bus_spi1_clk.common,
> > +       &bus_otg_clk.common,
> > +       &bus_ehci0_clk.common,
> > +       &bus_ehci1_clk.common,
> > +       &bus_ohci0_clk.common,
> > +       &bus_ohci1_clk.common,
> > +       &bus_ve_clk.common,
> > +       &bus_tcon0_clk.common,
> > +       &bus_tcon1_clk.common,
> > +       &bus_deinterlace_clk.common,
> > +       &bus_csi_clk.common,
> > +       &bus_hdmi_clk.common,
> > +       &bus_de_clk.common,
> > +       &bus_gpu_clk.common,
> > +       &bus_msgbox_clk.common,
> > +       &bus_spinlock_clk.common,
> > +       &bus_codec_clk.common,
> > +       &bus_spdif_clk.common,
> > +       &bus_pio_clk.common,
> > +       &bus_ths_clk.common,
> > +       &bus_i2s0_clk.common,
> > +       &bus_i2s1_clk.common,
> > +       &bus_i2s2_clk.common,
> > +       &bus_i2c0_clk.common,
> > +       &bus_i2c1_clk.common,
> > +       &bus_i2c2_clk.common,
> > +       &bus_scr_clk.common,
> > +       &bus_uart0_clk.common,
> > +       &bus_uart1_clk.common,
> > +       &bus_uart2_clk.common,
> > +       &bus_uart3_clk.common,
> > +       &bus_uart4_clk.common,
> > +       &bus_dbg_clk.common,
> > +       &ths_clk.common,
> > +       &nand_clk.common,
> > +       &mmc0_clk.common,
> > +       &mmc1_clk.common,
> > +       &mmc2_clk.common,
> > +       &ts_clk.common,
> > +       &ce_clk.common,
> > +       &spi0_clk.common,
> > +       &spi1_clk.common,
> > +       &i2s0_clk.common,
> > +       &i2s1_clk.common,
> > +       &i2s2_clk.common,
> > +       &spdif_clk.common,
> > +       &usb_phy0_clk.common,
> > +       &usb_phy1_clk.common,
> > +       &usb_hsic_clk.common,
> > +       &usb_hsic_12m_clk.common,
> > +       &usb_ohci0_clk.common,
> > +       &usb_ohci1_clk.common,
> > +       &dram_clk.common,
> > +       &dram_ve_clk.common,
> > +       &dram_csi_clk.common,
> > +       &dram_deinterlace_clk.common,
> > +       &dram_ts_clk.common,
> > +       &de_clk.common,
> > +       &tcon0_clk.common,
> > +       &tcon1_clk.common,
> > +       &deinterlace_clk.common,
> > +       &csi_misc_clk.common,
> > +       &csi_sclk_clk.common,
> > +       &csi_mclk_clk.common,
> > +       &ve_clk.common,
> > +       &ac_dig_clk.common,
> > +       &ac_dig_4x_clk.common,
> > +       &avs_clk.common,
> > +       &hdmi_clk.common,
> > +       &hdmi_ddc_clk.common,
> > +       &mbus_clk.common,
> > +       &dsi_dphy_clk.common,
> > +       &gpu_clk.common,
> > +};
> > +
> > +static struct clk_hw_onecell_data sun50i_a64_hw_clks =3D {
> > +       .hws    =3D {
> > +               [CLK_OSC_12M]           =3D &osc12M_clk.hw,
> > +               [CLK_PLL_CPUX]          =3D &pll_cpux_clk.common.hw,
> > +               [CLK_PLL_AUDIO_BASE]    =3D &pll_audio_base_clk.common.=
hw,
> > +               [CLK_PLL_AUDIO]         =3D &pll_audio_clk.hw,
> > +               [CLK_PLL_AUDIO_2X]      =3D &pll_audio_2x_clk.hw,
> > +               [CLK_PLL_AUDIO_4X]      =3D &pll_audio_4x_clk.hw,
> > +               [CLK_PLL_AUDIO_8X]      =3D &pll_audio_8x_clk.hw,
> > +               [CLK_PLL_VIDEO0]        =3D &pll_video0_clk.common.hw,
> > +               [CLK_PLL_VIDEO0_2X]     =3D &pll_video0_2x_clk.hw,
> > +               [CLK_PLL_VE]            =3D &pll_ve_clk.common.hw,
> > +               [CLK_PLL_DDR0]          =3D &pll_ddr0_clk.common.hw,
> > +               [CLK_PLL_PERIPH0]       =3D &pll_periph0_clk.common.hw,
> > +               [CLK_PLL_PERIPH0_2X]    =3D &pll_periph0_2x_clk.hw,
> > +               [CLK_PLL_PERIPH1]       =3D &pll_periph1_clk.common.hw,
> > +               [CLK_PLL_PERIPH1_2X]    =3D &pll_periph1_2x_clk.hw,
> > +               [CLK_PLL_VIDEO1]        =3D &pll_video1_clk.common.hw,
> > +               [CLK_PLL_GPU]           =3D &pll_gpu_clk.common.hw,
> > +               [CLK_PLL_MIPI]          =3D &pll_mipi_clk.common.hw,
> > +               [CLK_PLL_HSIC]          =3D &pll_hsic_clk.common.hw,
> > +               [CLK_PLL_DE]            =3D &pll_de_clk.common.hw,
> > +               [CLK_PLL_DDR1]          =3D &pll_ddr1_clk.common.hw,
> > +               [CLK_CPUX]              =3D &cpux_clk.common.hw,
> > +               [CLK_AXI]               =3D &axi_clk.common.hw,
> > +               [CLK_AHB1]              =3D &ahb1_clk.common.hw,
> > +               [CLK_APB1]              =3D &apb1_clk.common.hw,
> > +               [CLK_APB2]              =3D &apb2_clk.common.hw,
> > +               [CLK_AHB2]              =3D &ahb2_clk.common.hw,
> > +               [CLK_BUS_MIPI_DSI]      =3D &bus_mipi_dsi_clk.common.hw,
> > +               [CLK_BUS_CE]            =3D &bus_ce_clk.common.hw,
> > +               [CLK_BUS_DMA]           =3D &bus_dma_clk.common.hw,
> > +               [CLK_BUS_MMC0]          =3D &bus_mmc0_clk.common.hw,
> > +               [CLK_BUS_MMC1]          =3D &bus_mmc1_clk.common.hw,
> > +               [CLK_BUS_MMC2]          =3D &bus_mmc2_clk.common.hw,
> > +               [CLK_BUS_NAND]          =3D &bus_nand_clk.common.hw,
> > +               [CLK_BUS_DRAM]          =3D &bus_dram_clk.common.hw,
> > +               [CLK_BUS_EMAC]          =3D &bus_emac_clk.common.hw,
> > +               [CLK_BUS_TS]            =3D &bus_ts_clk.common.hw,
> > +               [CLK_BUS_HSTIMER]       =3D &bus_hstimer_clk.common.hw,
> > +               [CLK_BUS_SPI0]          =3D &bus_spi0_clk.common.hw,
> > +               [CLK_BUS_SPI1]          =3D &bus_spi1_clk.common.hw,
> > +               [CLK_BUS_OTG]           =3D &bus_otg_clk.common.hw,
> > +               [CLK_BUS_EHCI0]         =3D &bus_ehci0_clk.common.hw,
> > +               [CLK_BUS_EHCI1]         =3D &bus_ehci1_clk.common.hw,
> > +               [CLK_BUS_OHCI0]         =3D &bus_ohci0_clk.common.hw,
> > +               [CLK_BUS_OHCI1]         =3D &bus_ohci1_clk.common.hw,
> > +               [CLK_BUS_VE]            =3D &bus_ve_clk.common.hw,
> > +               [CLK_BUS_TCON0]         =3D &bus_tcon0_clk.common.hw,
> > +               [CLK_BUS_TCON1]         =3D &bus_tcon1_clk.common.hw,
> > +               [CLK_BUS_DEINTERLACE]   =3D &bus_deinterlace_clk.common=
=2Ehw,
> > +               [CLK_BUS_CSI]           =3D &bus_csi_clk.common.hw,
> > +               [CLK_BUS_HDMI]          =3D &bus_hdmi_clk.common.hw,
> > +               [CLK_BUS_DE]            =3D &bus_de_clk.common.hw,
> > +               [CLK_BUS_GPU]           =3D &bus_gpu_clk.common.hw,
> > +               [CLK_BUS_MSGBOX]        =3D &bus_msgbox_clk.common.hw,
> > +               [CLK_BUS_SPINLOCK]      =3D &bus_spinlock_clk.common.hw,
> > +               [CLK_BUS_CODEC]         =3D &bus_codec_clk.common.hw,
> > +               [CLK_BUS_SPDIF]         =3D &bus_spdif_clk.common.hw,
> > +               [CLK_BUS_PIO]           =3D &bus_pio_clk.common.hw,
> > +               [CLK_BUS_THS]           =3D &bus_ths_clk.common.hw,
> > +               [CLK_BUS_I2S0]          =3D &bus_i2s0_clk.common.hw,
> > +               [CLK_BUS_I2S1]          =3D &bus_i2s1_clk.common.hw,
> > +               [CLK_BUS_I2S2]          =3D &bus_i2s2_clk.common.hw,
> > +               [CLK_BUS_I2C0]          =3D &bus_i2c0_clk.common.hw,
> > +               [CLK_BUS_I2C1]          =3D &bus_i2c1_clk.common.hw,
> > +               [CLK_BUS_I2C2]          =3D &bus_i2c2_clk.common.hw,
> > +               [CLK_BUS_UART0]         =3D &bus_uart0_clk.common.hw,
> > +               [CLK_BUS_UART1]         =3D &bus_uart1_clk.common.hw,
> > +               [CLK_BUS_UART2]         =3D &bus_uart2_clk.common.hw,
> > +               [CLK_BUS_UART3]         =3D &bus_uart3_clk.common.hw,
> > +               [CLK_BUS_UART4]         =3D &bus_uart4_clk.common.hw,
> > +               [CLK_BUS_SCR]           =3D &bus_scr_clk.common.hw,
> > +               [CLK_BUS_DBG]           =3D &bus_dbg_clk.common.hw,
> > +               [CLK_THS]               =3D &ths_clk.common.hw,
> > +               [CLK_NAND]              =3D &nand_clk.common.hw,
> > +               [CLK_MMC0]              =3D &mmc0_clk.common.hw,
> > +               [CLK_MMC1]              =3D &mmc1_clk.common.hw,
> > +               [CLK_MMC2]              =3D &mmc2_clk.common.hw,
> > +               [CLK_TS]                =3D &ts_clk.common.hw,
> > +               [CLK_CE]                =3D &ce_clk.common.hw,
> > +               [CLK_SPI0]              =3D &spi0_clk.common.hw,
> > +               [CLK_SPI1]              =3D &spi1_clk.common.hw,
> > +               [CLK_I2S0]              =3D &i2s0_clk.common.hw,
> > +               [CLK_I2S1]              =3D &i2s1_clk.common.hw,
> > +               [CLK_I2S2]              =3D &i2s2_clk.common.hw,
> > +               [CLK_SPDIF]             =3D &spdif_clk.common.hw,
> > +               [CLK_USB_PHY0]          =3D &usb_phy0_clk.common.hw,
> > +               [CLK_USB_PHY1]          =3D &usb_phy1_clk.common.hw,
> > +               [CLK_USB_HSIC]          =3D &usb_hsic_clk.common.hw,
> > +               [CLK_USB_HSIC_12M]      =3D &usb_hsic_12m_clk.common.hw,
> > +               [CLK_USB_OHCI0]         =3D &usb_ohci0_clk.common.hw,
> > +               [CLK_USB_OHCI1]         =3D &usb_ohci1_clk.common.hw,
> > +               [CLK_DRAM]              =3D &dram_clk.common.hw,
> > +               [CLK_DRAM_VE]           =3D &dram_ve_clk.common.hw,
> > +               [CLK_DRAM_CSI]          =3D &dram_csi_clk.common.hw,
> > +               [CLK_DRAM_DEINTERLACE]  =3D &dram_deinterlace_clk.commo=
n.hw,
> > +               [CLK_DRAM_TS]           =3D &dram_ts_clk.common.hw,
> > +               [CLK_DE]                =3D &de_clk.common.hw,
> > +               [CLK_TCON0]             =3D &tcon0_clk.common.hw,
> > +               [CLK_TCON1]             =3D &tcon1_clk.common.hw,
> > +               [CLK_DEINTERLACE]       =3D &deinterlace_clk.common.hw,
> > +               [CLK_CSI_MISC]          =3D &csi_misc_clk.common.hw,
> > +               [CLK_CSI_SCLK]          =3D &csi_sclk_clk.common.hw,
> > +               [CLK_CSI_MCLK]          =3D &csi_mclk_clk.common.hw,
> > +               [CLK_VE]                =3D &ve_clk.common.hw,
> > +               [CLK_AC_DIG]            =3D &ac_dig_clk.common.hw,
> > +               [CLK_AC_DIG_4X]         =3D &ac_dig_4x_clk.common.hw,
> > +               [CLK_AVS]               =3D &avs_clk.common.hw,
> > +               [CLK_HDMI]              =3D &hdmi_clk.common.hw,
> > +               [CLK_HDMI_DDC]          =3D &hdmi_ddc_clk.common.hw,
> > +               [CLK_MBUS]              =3D &mbus_clk.common.hw,
> > +               [CLK_DSI_DPHY]          =3D &dsi_dphy_clk.common.hw,
> > +               [CLK_GPU]               =3D &gpu_clk.common.hw,
> > +       },
> > +       .num    =3D CLK_NUMBER,
> > +};
> > +
> > +static struct ccu_reset_map sun50i_a64_ccu_resets[] =3D {
> > +       [RST_USB_PHY0]          =3D  { 0x0cc, BIT(0) },
> > +       [RST_USB_PHY1]          =3D  { 0x0cc, BIT(1) },
> > +       [RST_USB_HSIC]          =3D  { 0x0cc, BIT(2) },
> > +
> > +
> > +       [RST_MBUS]              =3D  { 0x0fc, BIT(31) },
> > +
> > +       [RST_BUS_MIPI_DSI]      =3D  { 0x2c0, BIT(1) },
> > +       [RST_BUS_CE]            =3D  { 0x2c0, BIT(5) },
> > +       [RST_BUS_DMA]           =3D  { 0x2c0, BIT(6) },
> > +       [RST_BUS_MMC0]          =3D  { 0x2c0, BIT(8) },
> > +       [RST_BUS_MMC1]          =3D  { 0x2c0, BIT(9) },
> > +       [RST_BUS_MMC2]          =3D  { 0x2c0, BIT(10) },
> > +       [RST_BUS_NAND]          =3D  { 0x2c0, BIT(13) },
> > +       [RST_BUS_DRAM]          =3D  { 0x2c0, BIT(14) },
> > +       [RST_BUS_EMAC]          =3D  { 0x2c0, BIT(17) },
> > +       [RST_BUS_TS]            =3D  { 0x2c0, BIT(18) },
> > +       [RST_BUS_HSTIMER]       =3D  { 0x2c0, BIT(19) },
> > +       [RST_BUS_SPI0]          =3D  { 0x2c0, BIT(20) },
> > +       [RST_BUS_SPI1]          =3D  { 0x2c0, BIT(21) },
> > +       [RST_BUS_OTG]           =3D  { 0x2c0, BIT(23) },
> > +       [RST_BUS_EHCI0]         =3D  { 0x2c0, BIT(24) },
> > +       [RST_BUS_EHCI1]         =3D  { 0x2c0, BIT(25) },
> > +       [RST_BUS_OHCI0]         =3D  { 0x2c0, BIT(28) },
> > +       [RST_BUS_OHCI1]         =3D  { 0x2c0, BIT(29) },
> > +
> > +       [RST_BUS_VE]            =3D  { 0x2c4, BIT(0) },
> > +       [RST_BUS_TCON0]         =3D  { 0x2c4, BIT(3) },
> > +       [RST_BUS_TCON1]         =3D  { 0x2c4, BIT(4) },
> > +       [RST_BUS_DEINTERLACE]   =3D  { 0x2c4, BIT(5) },
> > +       [RST_BUS_CSI]           =3D  { 0x2c4, BIT(8) },
> > +       [RST_BUS_HDMI0]         =3D  { 0x2c4, BIT(10) },
> > +       [RST_BUS_HDMI1]         =3D  { 0x2c4, BIT(11) },
> > +       [RST_BUS_DE]            =3D  { 0x2c4, BIT(12) },
> > +       [RST_BUS_GPU]           =3D  { 0x2c4, BIT(20) },
> > +       [RST_BUS_MSGBOX]        =3D  { 0x2c4, BIT(21) },
> > +       [RST_BUS_SPINLOCK]      =3D  { 0x2c4, BIT(22) },
> > +       [RST_BUS_DBG]           =3D  { 0x2c4, BIT(31) },
> > +
> > +       [RST_BUS_LVDS]          =3D  { 0x2c8, BIT(0) },
> > +
> > +       [RST_BUS_CODEC]         =3D  { 0x2d0, BIT(0) },
> > +       [RST_BUS_SPDIF]         =3D  { 0x2d0, BIT(1) },
> > +       [RST_BUS_THS]           =3D  { 0x2d0, BIT(8) },
> > +       [RST_BUS_I2S0]          =3D  { 0x2d0, BIT(12) },
> > +       [RST_BUS_I2S1]          =3D  { 0x2d0, BIT(13) },
> > +       [RST_BUS_I2S2]          =3D  { 0x2d0, BIT(14) },
> > +
> > +       [RST_BUS_I2C0]          =3D  { 0x2d8, BIT(0) },
> > +       [RST_BUS_I2C1]          =3D  { 0x2d8, BIT(1) },
> > +       [RST_BUS_I2C2]          =3D  { 0x2d8, BIT(2) },
> > +       [RST_BUS_SCR]           =3D  { 0x2d8, BIT(5) },
> > +       [RST_BUS_UART0]         =3D  { 0x2d8, BIT(16) },
> > +       [RST_BUS_UART1]         =3D  { 0x2d8, BIT(17) },
> > +       [RST_BUS_UART2]         =3D  { 0x2d8, BIT(18) },
> > +       [RST_BUS_UART3]         =3D  { 0x2d8, BIT(19) },
> > +       [RST_BUS_UART4]         =3D  { 0x2d8, BIT(20) },
> > +};
> > +
> > +static const struct sunxi_ccu_desc sun50i_a64_ccu_desc =3D {
> > +       .ccu_clks       =3D sun50i_a64_ccu_clks,
> > +       .num_ccu_clks   =3D ARRAY_SIZE(sun50i_a64_ccu_clks),
> > +
> > +       .hw_clks        =3D &sun50i_a64_hw_clks,
> > +
> > +       .resets         =3D sun50i_a64_ccu_resets,
> > +       .num_resets     =3D ARRAY_SIZE(sun50i_a64_ccu_resets),
> > +};
> > +
> > +static void __init sun50i_a64_ccu_setup(struct device_node *node)
> > +{
> > +       void __iomem *reg;
> > +       u32 val;
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg)) {
> > +               pr_err("%s: Could not map the clock registers\n",
> > +                      of_node_full_name(node));
> > +               return;
> > +       }
> > +
> > +       /* Force the PLL-Audio-1x divider to 4 */
> > +       val =3D readl(reg + SUN50I_A64_PLL_AUDIO_REG);
> > +       val &=3D ~GENMASK(19, 16);
> > +       writel(val | (3 << 16), reg + SUN50I_A64_PLL_AUDIO_REG);
> > +
> > +       writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> > +
> > +       sunxi_ccu_probe(node, reg, &sun50i_a64_ccu_desc);
> > +}
> > +CLK_OF_DECLARE(sun50i_a64_ccu, "allwinner,sun50i-a64-ccu",
> > +              sun50i_a64_ccu_setup);
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.h b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.h
> > new file mode 100644
> > index 000000000000..e3c77d92af1c
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.h
> > @@ -0,0 +1,68 @@
> > +/*
> > + * Copyright 2016 Maxime Ripard
> > + *
> > + * Maxime Ripard <maxime.ripard@free-electrons.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef _CCU_SUN50I_A64_H_
> > +#define _CCU_SUN50I_A64_H_
> > +
> > +#include <dt-bindings/clock/sun50i-a64-ccu.h>
> > +#include <dt-bindings/reset/sun50i-a64-ccu.h>
> > +
> > +#define CLK_OSC_12M                    0
> > +#define CLK_PLL_CPUX                   1
> > +#define CLK_PLL_AUDIO_BASE             2
> > +#define CLK_PLL_AUDIO                  3
> > +#define CLK_PLL_AUDIO_2X               4
> > +#define CLK_PLL_AUDIO_4X               5
> > +#define CLK_PLL_AUDIO_8X               6
> > +#define CLK_PLL_VIDEO0                 7
> > +#define CLK_PLL_VIDEO0_2X              8
> > +#define CLK_PLL_VE                     9
> > +#define CLK_PLL_DDR0                   10
> > +#define CLK_PLL_PERIPH0                        11
> > +#define CLK_PLL_PERIPH0_2X             12
> > +#define CLK_PLL_PERIPH1                        13
> > +#define CLK_PLL_PERIPH1_2X             14
> > +#define CLK_PLL_VIDEO1                 15
> > +#define CLK_PLL_GPU                    16
> > +#define CLK_PLL_MIPI                   17
> > +#define CLK_PLL_HSIC                   18
> > +#define CLK_PLL_DE                     19
> > +#define CLK_PLL_DDR1                   20
> > +#define CLK_CPUX                       21
> > +#define CLK_AXI                                22
> > +#define CLK_APB                                23
>=20
> This is listed but never implemented.

Yes, on purpose. If we ever need to implement it, we won't have an
headache.

> > +#define RST_USB_PHY0           0
> > +#define RST_USB_PHY1           1
> > +#define RST_USB_HSIC           2
>=20
> There's also a DRAM reset in 0xf4 (DRAM configuration)

Ack.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX3U5DAAoJEBx+YmzsjxAgLIQP/1vbYgdkk91qps7iVJm4DAeo
yNYEUfjIlkGGCsx9VOuLdmZmpWlvKNHapb9jvi3w5D6pxlWC9mhXPyiwr5s5jpLh
vuw4h8enqJhFvuUz1nudr5DJD3GQatOSlpfjiF+saoi9Gda3dFYcfN00NQgHm8C/
gJFp1OX9Z7XUSLryKxak27CasaUoxRwltbGxEBoK/8LGGX0yrSZ08BkAJPJCplLk
UITUWI9jj37k+VlSDlH7o+SUSQdkopV/oRsfea7bGJiDi3YiFnazES85TBQXJh+u
770lg5fAK4f+v15nMCkCZdyFvcxuepSdsFsVg09UF7xdirxZkTzT/CAIIzDkIiGo
zwhw8WqIudZr/Afe0YV0m1xEFU9cWNz/f7e6qnG6M0TNeLhJxX7JSLH9nnY1XrKj
cNZr7dw0fs1OuOVtr7lTCuRSgakat6VyEEWD72fIgPtwwlOBuwGquGIAATPNc2R5
ph7z8VmXyRNnPh5T3pUNX/WUVZdrakLV1lKhk1tefymU67UMa/icGBZN5Avkl0rU
cAtgn5EdZ73jqrfTImxnqEt8XQTeDURnhOO1z3QrZLRn3PB5YPhrLrc0ujbzW6PM
bopZmFamiZA0b/bb1iPqjbHlCyIp1vq6Q0DcgJnuMwV0Ft8Qu4M3rCDnbzLyD9Iu
ETB9pa3dSCmx349LzR9P
=x5lH
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
