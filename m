Return-Path: <ukl@pengutronix.de>
Date: Wed, 10 May 2017 20:05:02 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Michael Krummsdorf <michael.krummsdorf@tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, kernel@pengutronix.de,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170510180502.beo4kjgzhe3x2zoo@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
 <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
 <185bc71b-f986-9dd1-3a56-a525f2f09fc7@i2se.com>
 <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170505201039.uyk2ie6zyfrdafgo@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Hello,

I found something strange while playing around with the
HW_CLKCTRL_FRAC0 register:

	# memtool md 0x800401b0+4
	800401b0: 0e1d5513                                           .U..
	# memtool mw 0x800401b0 0x0e1d5513
	# memtool md 0x800401b0+4
	800401b0: 4e5d5513                                           .U]N

Huh, why did IO0_STABLE and IO1_STABLE toggle? OK, after all we should access
this register using 8-bit accesses:

	# memtool md -b 0x800401b0+4
	800401b0: 13 55 5d 4e                                        .U]N
	# memtool mw -b 0x800401b2 0x5d
	# memtool md -b 0x800401b0+4
	800401b0: 13 55 5d 4e                                        .U]N

hmm, now IO1_STABLE didn't invert.

	# memtool mw -b 0x800401b2 0x5c
	# memtool md -b 0x800401b0+4
	800401b0: 13 55 5c 4e                                        .U\N

not even now even though IO1FRAC changed!

	# memtool md  0x800401b0+4
	800401b0: 4e5c5513                                           .U\N
	# memtool mw -b 0x800401b2 0x5b
	# memtool md 0x800401b0+4
	800401b0: 4e5b5513                                           .U[N

again IO1_STABLE doesn't toggle (this time with 32-bit access)

	# memtool mw  0x800401b0 0x4e5b5513
	# memtool md  0x800401b0+4
	800401b0: 0e1b5513                                           .U..

Just rewriting the reported value makes both IO0_STABLE and IO1_STABLE toggle.

Definitely strange.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
