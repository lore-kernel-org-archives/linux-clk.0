Return-Path: <ukl@pengutronix.de>
Date: Fri, 5 May 2017 09:25:29 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	Sascha Hauer <kernel@pengutronix.de>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
List-ID: <linux-clk.vger.kernel.org>

Hello Stefan,

On Thu, May 04, 2017 at 02:25:07PM +0200, Stefan Wahren wrote:
>        ref_io1                            1            1  
> 320000000          0 0

That means your ref_io1 is running at 320 MHz which my patch should
prevent. Are you sure it is applied? What is the register FRAC0
(0x800401b0) set to? Given that ref_io1 is reported as running at
320000000 I'd expect that IO1FRAC is set to 27 which should be
impossible with my patch given that clk_misc_init() in
drivers/clk/mxs/clk-imx28.c initializes IO1FRAC0 to 30 and my patch
should prevent it being set to something smaller than 30.

Something I just noticed now is that the description of FRAC0 includes:

	NOTE: This register can only be addressed by byte instructions.
	Addressing word or half-word are not allowed.

which is not respected by the clock driver.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
