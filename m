Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1509615364.24591.23.camel@baylibre.com>
Subject: Re: [PATCH v4 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, "Jerome Brunet
	<jbrunet@baylibre.com>, linux-clk@vger.kernel.org,	
	""linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,	
	""Linus Walleij <linus.walleij@linaro.org>, Quentin Schulz	
	""<quentin.schulz@free-electrons.com>, Kevin Hilman	
	""<khilman@baylibre.com>, Peter De Schrijver"
	 <pdeschrijver@nvidia.com>, Chen-Yu Tsai <wens@csie.org>
Date: Thu, 02 Nov 2017 10:36:04 +0100
In-Reply-To: <20171102090405.wletgjwzbtkmljc3@flea>
References: <20170924200030.6227-1-jbrunet@baylibre.com>
	 <150899576543.90597.13810909942564444110@resonance>
	 <20171102090405.wletgjwzbtkmljc3@flea>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-11-02 at 10:04 +0100, Maxime Ripard wrote:
> Hi Mike,
> 
> On Thu, Oct 26, 2017 at 07:29:25AM +0200, Michael Turquette wrote:
> > Quoting Jerome Brunet (2017-09-24 22:00:20)
> > > This Patchset is related the RFC [0] and the discussion around
> > > CLK_SET_RATE_GATE available here [1]
> > 
> > + Maxime & ChenYu
> > 
> > Have you tested this latest version? If it works for you as expected,
> > please feel free to add your Tested-by's.
> 
> We were not in Cc on this one (obviously) and I'm not subscribed to
> linux-clk, is there a git branch available somewhere so we can test?

Here it is:
https://github.com/jeromebrunet/linux/commits/amlogic/wip/clk-lock

Happy testing !


> 
> Thanks!
> Maxime
> 
