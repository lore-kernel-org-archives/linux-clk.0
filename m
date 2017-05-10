Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
 <16216689.278511.1494157914798@email.1und1.de>
 <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
 Michael Krummsdorf <michael.krummsdorf@tq-group.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 Fabio Estevam <fabio.estevam@nxp.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <07a0f0c6-8fb6-6535-f042-122a5257aeb6@i2se.com>
Date: Wed, 10 May 2017 15:39:14 +0200
MIME-Version: 1.0
In-Reply-To: <20170508082456.dx4rthdsidbrkxza@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Am 08.05.2017 um 10:24 schrieb Uwe Kleine-König:
> Hello Stefan,
>
> The patch doesn't make the bit errors go away. The only message being
> generated is:
>
> 	swapper-1     [000] .......     1.134985: clk_div_set_rate: Cannot to set ssp3_div: gated 
>
> When I compare your clk_summary (with my patch) to my working one the
> only differences are some enable/prepare counts, you have the following
> clocks on while I have not:
>
> 	lradc, enet_out, lcdif_sel (also reparented), fec
>
> while I have these clocks on and you have not:
>
> 	ssp1

Sorry, i don't have the time for any further investigations. Out of
curiosity, what is connected to the ssp1 on your board?

Stefan

>
> There are no differences in clk freqs for clocks that we both have on
> which should rule out a problem of competing clock domains.
>
> I'm out of ideas :-(
>
> Best regards
> Uwe
>
