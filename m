Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Trimarchi <michael@amarulasolutions.com>,
 Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1524258004-28717-1-git-send-email-michael@amarulasolutions.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-clk@vger.kernel.org
References: <1524258004-28717-1-git-send-email-michael@amarulasolutions.com>
Message-ID: <152642321086.237094.14041773144880119233@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH V2] clk: imx: Add new clo01 and clo2 controlled by CCOSR
Date: Tue, 15 May 2018 15:26:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Michael Trimarchi (2018-04-20 14:00:04)
> osc->cko2_sel->cko2_podf->clk_cko2->clk_cko
> =

> Example of usage to provide clock to the sgtl5000
> =

> codec: sgtl5000@0a {
>         compatible =3D "fsl,sgtl5000";
>         reg =3D <0x0a>;
>         clocks =3D <&clks IMX6UL_CLK_OSC>;
>         #sound-dai-cells =3D <0>;
>         clocks =3D <&clks IMX6UL_CLK_CKO>;
>         assigned-clocks =3D <&clks IMX6UL_CLK_CKO2_SEL>,
>                           <&clks IMX6UL_CLK_CKO2_PODF>,
>                           <&clks IMX6UL_CLK_CKO2>,
>                           <&clks IMX6UL_CLK_CKO>;
>         assigned-clock-parents =3D <&clks IMX6UL_CLK_OSC>,
>                                  <&clks IMX6UL_CLK_CKO2_SEL>,
>                                  <&clks IMX6UL_CLK_CKO2_PODF>,
>                                  <&clks IMX6UL_CLK_CKO2>;
>         clock-names =3D "mclk";
>         wlf,shared-lrclk;
> =

> Signed-off-by: Matteo Lisi <matteo.lisi@engicam.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Tested-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---

Applied to clk-next
