Return-Path: <stefan.wahren@i2se.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <CAOMZO5CULvGubRcBTLiNn--6FLfTYs+5seRC2phUccB-1PXDxw@mail.gmail.com>
 <ddf5fcd3-cae2-b3c6-c995-e7bf5b65875e@i2se.com>
 <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-ID: <a5bfc04e-15cf-2b24-17f9-c9b60c1052cc@i2se.com>
Date: Fri, 5 May 2017 09:49:10 +0200
MIME-Version: 1.0
In-Reply-To: <20170505072529.a3z4gonsygg3wqfx@pengutronix.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

Hello Uwe,

Am 05.05.2017 um 09:25 schrieb Uwe Kleine-König:
> Hello Stefan,
>
> On Thu, May 04, 2017 at 02:25:07PM +0200, Stefan Wahren wrote:
>>        ref_io1                            1            1  
>> 320000000          0 0
> That means your ref_io1 is running at 320 MHz which my patch should
> prevent. Are you sure it is applied?

sorry for the mess in the dumps.

Your patch works fine regarding to ref_io1. I made 3 dumps:

1. without any patch ( ref_io1 320000000 )
2. with my ref_xtal patch ( ref_io1 288000000 )
3. with your patch ( ref_io1 288000000 )

I assume you looked at the wrong dump.

>  What is the register FRAC0
> (0x800401b0) set to? Given that ref_io1 is reported as running at
> 320000000 I'd expect that IO1FRAC is set to 27 which should be
> impossible with my patch given that clk_misc_init() in
> drivers/clk/mxs/clk-imx28.c initializes IO1FRAC0 to 30 and my patch
> should prevent it being set to something smaller than 30.
>
> Something I just noticed now is that the description of FRAC0 includes:
>
> 	NOTE: This register can only be addressed by byte instructions.
> 	Addressing word or half-word are not allowed.
>
> which is not respected by the clock driver.

I already tried it with no luck. Please follow the discussions [1] and [2].

Maybe the reason why [1] didn't work, was the missing memory barriers?

Please don't get me wrong, i'm very interested in fixing this issue.

Regards Stefan

[1] -
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/318644.html
[2] -
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-February/323720.html

>
> Best regards
> Uwe
>
