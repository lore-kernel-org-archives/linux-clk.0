Return-Path: <sboyd@codeaurora.org>
Date: Fri, 4 Mar 2016 10:55:39 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>, Barry Song <baohua@kernel.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Alexandre Courbot <gnurou@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 0/7] clk: Make reset_control_ops const
Message-ID: <20160304185539.GB16665@codeaurora.org>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
 <20160225210439.GI4847@codeaurora.org>
 <1456475057.3383.9.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1456475057.3383.9.camel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

On 02/26, Philipp Zabel wrote:
> Am Donnerstag, den 25.02.2016, 13:04 -0800 schrieb Stephen Boyd:
> > On 02/25, Philipp Zabel wrote:
> > > Since commit 203d4f347d86 ("reset: Make reset_control_ops const") marked
> > > the ops pointer in struct reset_controller_dev as const, these structs
> > > can be made const, too. The commit is currently sitting in the
> > > arm-soc/for-next branch.
> > > 
> > 
> > All these patches look fine. I take it we have to wait for a
> > cycle to merge them though because the commit you mention is only
> > in the arm-soc tree?
> 
> Or you could merge commit 203d4f347d86 before applying them, which would
> just pull in another minor reset patch on top of v4.5-rc1. Since this is
> already merged as part of the reset-for-4.6 tag, these commits are
> stable.
> 
> >  Or did you want to take them through arm-soc?
> 
> Not unless that was your preferred option.
> 

Ok I think we'll apply these after v4.6-rc1 is released. They're
so minor that we can send them in with the first batch of
clk-fixes before -rc2 is released.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
