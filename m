Return-Path: <sboyd@codeaurora.org>
Date: Tue, 20 Sep 2016 10:32:50 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <fabio.estevam@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: imx31/of: clk: init clock controller with
 CLK_OF_DECLARE
Message-ID: <20160920173250.GB8319@codeaurora.org>
References: <1474252939-12579-1-git-send-email-vz@mleia.com>
 <20160919055802.dkf2rxcou44kbya5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20160919055802.dkf2rxcou44kbya5@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 09/19, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Sep 19, 2016 at 05:42:17AM +0300, Vladimir Zapolskiy wrote:
> > The change is based on v4.8.0-rc1 and plus it depends on this fixup:
> > 
> >   ARM: dts: imx31: fix clock control module interrupts description
> > 
> > The change is tested on qemu kzm target and mx31lite board, while both
> > targets don't have DTS in upstream, I had to write simple DTS files for
> > them, because the proposed change is for i.MX31 targets with OF support.
> > 
> > The second change in the series compilation time dependent on the first
> > one, while the first change apparently should break runtime execution
> > of i.MX31 boards with OF support, if both changes are applied everything
> > should be fine, regression testing on the same legacy targets does not
> 
> that means this should be done in a single patch.

Yes, please combine the patches. I can ack it then so it can be
routed through arm-soc.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
