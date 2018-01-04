Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1514999361-2723-1-git-send-email-Anson.Huang@nxp.com>
References: <1514999361-2723-1-git-send-email-Anson.Huang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 4 Jan 2018 10:59:58 -0200
Message-ID: <CAOMZO5CYTJvaOi+7yHS+U66nfnYK7RzeUyB_W7MNf44Afkk+ow@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: imx7d: correct video pll clock tree
To: Anson Huang <Anson.Huang@nxp.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jan 3, 2018 at 3:09 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> There is a test divider and post divider in video PLL,
> test divider is placed before post divider, all clocks
> that can select parent from video PLL should be from
> post divider, NOT from pll_video_main, below are
> clock tree dump before and after this patch:
>
> Before:
> pll_video_main
>    pll_video_main_bypass
>       pll_video_main_clk
>          lcdif_pixel_src
>             lcdif_pixel_cg
>                lcdif_pixel_pre_div
>                   lcdif_pixel_post_div
>                      lcdif_pixel_root_clk
> After:
> pll_video_main
>    pll_video_main_bypass
>       pll_video_main_clk
>          pll_video_test_div
>             pll_video_post_div
>                lcdif_pixel_src
>                   lcdif_pixel_cg
>                      lcdif_pixel_pre_div
>                         lcdif_pixel_post_div
>                            lcdif_pixel_root_clk
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
