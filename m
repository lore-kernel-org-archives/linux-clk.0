Return-Path: <p.zabel@pengutronix.de>
Message-ID: <1456475057.3383.9.camel@pengutronix.de>
Subject: Re: [PATCH 0/7] clk: Make reset_control_ops const
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Heiko Stuebner
 <heiko@sntech.de>, Barry Song <baohua@kernel.org>, Emilio
 =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Maxime Ripard
 <maxime.ripard@free-electrons.com>,  Chen-Yu Tsai <wens@csie.org>, Peter De
 Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
 <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry
 Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 kernel@pengutronix.de
Date: Fri, 26 Feb 2016 09:24:17 +0100
In-Reply-To: <20160225210439.GI4847@codeaurora.org>
References: <1456393512-26602-1-git-send-email-p.zabel@pengutronix.de>
	 <20160225210439.GI4847@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, den 25.02.2016, 13:04 -0800 schrieb Stephen Boyd:
> On 02/25, Philipp Zabel wrote:
> > Since commit 203d4f347d86 ("reset: Make reset_control_ops const") marked
> > the ops pointer in struct reset_controller_dev as const, these structs
> > can be made const, too. The commit is currently sitting in the
> > arm-soc/for-next branch.
> > 
> 
> All these patches look fine. I take it we have to wait for a
> cycle to merge them though because the commit you mention is only
> in the arm-soc tree?

Or you could merge commit 203d4f347d86 before applying them, which would
just pull in another minor reset patch on top of v4.5-rc1. Since this is
already merged as part of the reset-for-4.6 tag, these commits are
stable.

>  Or did you want to take them through arm-soc?

Not unless that was your preferred option.

regards
Philipp
