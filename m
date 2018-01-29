Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1517217778.3153.1.camel@baylibre.com>
Subject: Re: [PATCH v5 00/10] clk: implement clock rate protection mechanism
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Quentin
 Schulz <quentin.schulz@free-electrons.com>, Kevin Hilman
 <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 29 Jan 2018 10:22:58 +0100
In-Reply-To: <20171222021520.GO7997@codeaurora.org>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
	 <151373031022.33554.13905466641279532222@resonance>
	 <20171222021520.GO7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2017-12-21 at 18:15 -0800, Stephen Boyd wrote:
> On 12/19, Michael Turquette wrote:
> > Quoting Jerome Brunet (2017-12-01 13:51:50)
> > > This Patchset is related the RFC [0] and the discussion around
> > > CLK_SET_RATE_GATE available here [1]
> > > 
> > > This patchset introduce clock protection to the CCF core. This can then
> > > be used for:
> > > 
> > > * Provide a way for a consumer to claim exclusivity over the rate control
> > >   of a provider. Some clock consumers require that a clock rate must not
> > >   deviate from its selected frequency. There can be several reasons for
> > >   this, not least of which is that some hardware may not be able to
> > >   handle or recover from a glitch caused by changing the clock rate while
> > >   the hardware is in operation. For such HW, The ability to get exclusive
> > >   control of a clock's rate, and release that exclusivity, could be seen
> > >   as a fundamental clock rate control primitive. The exclusivity is not
> > >   preemptible, so when claimed more than once, is rate is effectively
> > >   locked.
> > > 
> > > * Provide a similar functionality to providers themselves, fixing
> > >   CLK_SET_RATE_GATE flag (enforce clock gating along the tree). While
> > >   there might still be a few platforms relying the broken implementation,
> > >   tests done has shown this change to be pretty safe.
> > 
> > Applied to clk-protect-rate, with the exception that I did not apply
> > "clk: fix CLK_SET_RATE_GATE with clock rate protection" as it breaks
> > qcom clk code.
> > 
> > Stephen, do you plan to fix up the qcom clock code so that the
> > SET_RATE_GATE improvement can go in?
> > 
> 
> I started working on it a while back. Let's see if I can finish
> it off this weekend.
> 

Hi Stephen,

Have you been able find something to fix the qcom code regarding this issue ?

Cheers
Jerome
