Return-Path: <sha@pengutronix.de>
Date: Wed, 26 Sep 2018 08:47:52 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Anson Huang <anson.huang@nxp.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	Abel Vesa <abelvesa@linux.com>, NXP Linux Team <linux-imx@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 4/5] clk: imx: add imx composite clock
Message-ID: <20180926064752.GM4097@pengutronix.de>
References: <1537785597-26499-1-git-send-email-abel.vesa@nxp.com>
 <1537785597-26499-5-git-send-email-abel.vesa@nxp.com>
 <CAOMZO5D7yLUzriOub4RWsq1K8_fTj6c0LFOnSZwHyjqMPYu=0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAOMZO5D7yLUzriOub4RWsq1K8_fTj6c0LFOnSZwHyjqMPYu=0A@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Sep 25, 2018 at 01:42:12PM -0300, Fabio Estevam wrote:
> Hi Abel,
> 
> On Mon, Sep 24, 2018 at 7:39 AM, Abel Vesa <abel.vesa@nxp.com> wrote:
> 
> > +static long imx_clk_composite_divider_round_rate(struct clk_hw *hw,
> > +                                               unsigned long rate,
> > +                                               unsigned long *prate)
> > +{
> > +       int prediv_value;
> > +       int div_value;
> > +
> > +       imx_clk_composite_compute_dividers(rate, *prate,
> > +                                               &prediv_value, &div_value);
> > +
> > +       rate = DIV_ROUND_UP_ULL((u64)*prate, prediv_value);
> 
> You assing a value to 'rate' here.
> 
> > +       rate = DIV_ROUND_UP_ULL((u64)rate, div_value);
> 
> And then overwrite it immediately after.

It's:
	rate = *prate / prediv_value;
	rate = rate / div_value;

To me this looks correct. However, For an unsigned long type we have
DIV_ROUND_UP() with which we do not need any casting. For 64bit code
unsigned long is 64bit anyway which makes the cast a no-op and for 32bit
code there's also no point in exanding the initial 32bit value to 64bit.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
