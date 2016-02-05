Return-Path: <andriy.shevchenko@linux.intel.com>
Message-ID: <1454688729.31169.87.camel@linux.intel.com>
Subject: Re: Common/typical fractional divider HW API
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mason <slash.tmp@free.fr>, linux-clk <linux-clk@vger.kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
 <mturquette@baylibre.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Sebastian Frias
 <sf84@laposte.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Date: Fri, 05 Feb 2016 18:12:09 +0200
In-Reply-To: <56B4C775.50808@free.fr>
References: <56B4B67D.2080707@free.fr>
	 <1454684758.31169.77.camel@linux.intel.com> <56B4C775.50808@free.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2016-02-05 at 17:01 +0100, Mason wrote:

> So, do you agree that
> 
>   DIV = 2^I * (1 + F/256)
> 
> gives a more useful DIV distribution than
> 
>   DIV = I + F/16

If you can change hardware why not to use any existing approach which
suits better to your device?

I don't remember any existing, though I didn't check much, divider
register which takes something like that.

> > Also it's possible to convert clock providers for, e.g., UARTs to
> > use
> > this kind of divider.
> 
> I'm not sure how to parse that. I'm using the divider driver
> for a CPU clock, to do D(V)FS in cpufreq.

If you are using custom stuff for custom hardware, I hope it's okay.
But if we are talking about generic solutions (like clk-fractional-
divider), I would suggest to consider existing users / hardware.

What I saw is mostly about

I [0 .. 2^n - 1]
F [0 .. 2^k - 1]
n + k < 32

And I + 1 / (2^k - F) as a formula.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
