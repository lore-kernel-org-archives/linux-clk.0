Return-Path: <aisheng.dong@nxp.com>
From: "A.s. Dong" <aisheng.dong@nxp.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Dong Aisheng <dongas86@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"Anson Huang" <anson.huang@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Subject: RE: [PATCH 4/9] clk: imx: add pllv4 support
Date: Mon, 3 Jul 2017 03:21:16 +0000
Message-ID: <AM3PR04MB306EEF6F5F442465B258E3C80D60@AM3PR04MB306.eurprd04.prod.outlook.com>
References: <1494856763-6543-1-git-send-email-aisheng.dong@nxp.com>
 <1494856763-6543-5-git-send-email-aisheng.dong@nxp.com>
 <20170620015917.GO4493@codeaurora.org>
 <20170620093143.GD6805@b29396-OptiPlex-7040>
 <20170701003642.GS22780@codeaurora.org>
In-Reply-To: <20170701003642.GS22780@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

> -----Original Message-----
> From: Stephen Boyd [mailto:sboyd@codeaurora.org]
> Sent: Saturday, July 01, 2017 8:37 AM
> To: Dong Aisheng
> Cc: A.s. Dong; linux-clk@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; mturquette@baylibre.com;
> shawnguo@kernel.org; Anson Huang; Jacky Bai
> Subject: Re: [PATCH 4/9] clk: imx: add pllv4 support
>=20
> On 06/20, Dong Aisheng wrote:
> > On Mon, Jun 19, 2017 at 06:59:17PM -0700, Stephen Boyd wrote:
> > > On 05/15, Dong Aisheng wrote:
> > > > +
> > > > +	if (clk_pllv4_is_enabled(hw)) {
> > > > +		WARN(1, "clk_pllv4: can't change rate when pll is
> enabled");
> > > > +		return -EINVAL;
> > >
> > > Sad, CLK_SET_RATE_GATE isn't working for you I suppose?
> > >
> >
> > CLK_SET_RATE_GATE can't work in early stage before running
> clk_disable_unused.
> > At that point, the clock tree state is still not consistent with HW.
> > e.g. prepare/enable count is still zero but it's actually enabled due
> > to reset state or bootloader.
> >
> > The code here is adding a double check in case user sets rate in early
> stage.
> >
> > However, probably it could also be moved into clock core as it's not
> > platform dependant behavior?
> >
>=20
> Ok. It would be good to fix the core framework to synchronize the
> prepared/enabled state at registration time so we don't need this check
> in the driver.
>=20

I will prepare a core fix later and remove these checks first.

Regards
Dong Aisheng

> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a
> Linux Foundation Collaborative Project
