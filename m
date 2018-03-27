Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1522160607-7104-1-git-send-email-abel.vesa@nxp.com>
References: <1522160607-7104-1-git-send-email-abel.vesa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 27 Mar 2018 12:08:39 -0300
Message-ID: <CAOMZO5C23Va4Frrpqgw8LxEJbfj+cE6xeS3362QzyRn=_wi7JQ@mail.gmail.com>
Subject: Re: [PATCH] clk: imx7d: Move clks_init_on before any clock operations
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@freescale.com>,
	Irina Tirdea <irina.tirdea@nxp.com>, Anson Huang <anson.huang@nxp.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
	Dong Aisheng <b29396@freescale.com>, linux-clk <linux-clk@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Abel,

On Tue, Mar 27, 2018 at 11:23 AM, Abel Vesa <abel.vesa@nxp.com> wrote:
> From: Dong Aisheng <b29396@freescale.com>
>
> For init on clocks we should move it at the first place in imx7d_clocks_init()
> before any clock operations, else the clock operation may fail in case the clock
> is still not on.
>
> Acked-by: Ranjani Vaidyanathan <Ranjani.Vaidyanathan@freescale.com>
> Signed-off-by: Dong Aisheng <b29396@freescale.com>
> Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Thanks for your patches.

You sent 4 patches today touching the same file.

Please annotate the sequence of the patches (1/4, 2/4, etc) so that
the maintainer can clearly know the order the patches should be
applied.
