Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
 Anson Huang" <b20788@freescale.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Bai Ping" <b51503@freescale.com>,
 "Fabio Estevam" <fabio.estevam@freescale.com>,
 "Frank Li" <Frank.Li@freescale.com>, "Fugang Duan" <B38611@freescale.com>,
 "Ian Campbell" <ijc+devicetree@hellion.org.uk>,
 "Jaroslav Kysela" <perex@perex.cz>, "Kumar Gala" <galak@codeaurora.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>, "Pawel Moll" <pawel.moll@arm.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Russell King" <linux@arm.linux.org.uk>,
 "Sascha Hauer" <kernel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Stephen Boyd" <sboyd@codeaurora.org>, "Takashi Iwai" <tiwai@suse.com>,
 "Timur Tabi" <timur@tabi.org>, "Xiubo Li" <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 =?utf-8?q?=22_Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
References: <1452619759-14474-1-git-send-email-LW@KARO-electronics.de>
 <1452619759-14474-2-git-send-email-LW@KARO-electronics.de>
 <1452619759-14474-3-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1452619759-14474-3-git-send-email-LW@KARO-electronics.de>
Message-ID: <20160113193200.1168.36072@quark.deferred.io>
Subject: Re: [PATCH 2/2] clk: imx: add kpp clock for i.MX6UL
Date: Wed, 13 Jan 2016 11:32:00 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Lothar Wa=C3=9Fmann (2016-01-12 09:29:19)
> Add the necessary clock to use the KPP interface on i.MX6UL.
> =

> Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>

Looks good.

Regards,
Mike

> ---
>  drivers/clk/imx/clk-imx6ul.c             | 1 +
>  include/dt-bindings/clock/imx6ul-clock.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
> index 3e31ec0..1ee28d3 100644
> --- a/drivers/clk/imx/clk-imx6ul.c
> +++ b/drivers/clk/imx/clk-imx6ul.c
> @@ -365,6 +365,7 @@ static void __init imx6ul_clocks_init(struct device_n=
ode *ccm_node)
>         /* CCGR5 */
>         clks[IMX6UL_CLK_ROM]            =3D imx_clk_gate2("rom",         =
 "ahb",          base + 0x7c,    0);
>         clks[IMX6UL_CLK_SDMA]           =3D imx_clk_gate2("sdma",        =
 "ahb",          base + 0x7c,    6);
> +       clks[IMX6UL_CLK_KPP]            =3D imx_clk_gate2("kpp",         =
 "ipg",          base + 0x7c,    8);
>         clks[IMX6UL_CLK_WDOG2]          =3D imx_clk_gate2("wdog2",       =
 "ipg",          base + 0x7c,    10);
>         clks[IMX6UL_CLK_SPBA]           =3D imx_clk_gate2("spba",        =
 "ipg",          base + 0x7c,    12);
>         clks[IMX6UL_CLK_SPDIF]          =3D imx_clk_gate2_shared("spdif",=
         "spdif_podf",   base + 0x7c,    14, &share_count_audio);
> diff --git a/include/dt-bindings/clock/imx6ul-clock.h b/include/dt-bindin=
gs/clock/imx6ul-clock.h
> index 08ce4a7..fd8aee8 100644
> --- a/include/dt-bindings/clock/imx6ul-clock.h
> +++ b/include/dt-bindings/clock/imx6ul-clock.h
> @@ -234,7 +234,8 @@
>  #define IMX6UL_CLK_CSI_SEL             221
>  #define IMX6UL_CLK_CSI_PODF            222
>  #define IMX6UL_CLK_PLL3_120M           223
> +#define IMX6UL_CLK_KPP                 224
>  =

> -#define IMX6UL_CLK_END                 224
> +#define IMX6UL_CLK_END                 225
>  =

>  #endif /* __DT_BINDINGS_CLOCK_IMX6UL_H */
> -- =

> 2.1.4
>=20
