Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1537785597-26499-5-git-send-email-abel.vesa@nxp.com>
References: <1537785597-26499-1-git-send-email-abel.vesa@nxp.com> <1537785597-26499-5-git-send-email-abel.vesa@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Sep 2018 13:42:12 -0300
Message-ID: <CAOMZO5D7yLUzriOub4RWsq1K8_fTj6c0LFOnSZwHyjqMPYu=0A@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] clk: imx: add imx composite clock
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>,
	Anson Huang <anson.huang@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Abel Vesa <abelvesa@linux.com>,
	NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Abel,

On Mon, Sep 24, 2018 at 7:39 AM, Abel Vesa <abel.vesa@nxp.com> wrote:

> +static long imx_clk_composite_divider_round_rate(struct clk_hw *hw,
> +                                               unsigned long rate,
> +                                               unsigned long *prate)
> +{
> +       int prediv_value;
> +       int div_value;
> +
> +       imx_clk_composite_compute_dividers(rate, *prate,
> +                                               &prediv_value, &div_value);
> +
> +       rate = DIV_ROUND_UP_ULL((u64)*prate, prediv_value);

You assing a value to 'rate' here.

> +       rate = DIV_ROUND_UP_ULL((u64)rate, div_value);

And then overwrite it immediately after.

Is this really the intended behavior?
