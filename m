Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Mon, 30 Jan 2017 21:42:28 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: add more managed APIs
Message-ID: <20170130214227.GI27312@n2100.armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170130192214.GC11199@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170130192214.GC11199@roeck-us.net>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 30, 2017 at 11:22:14AM -0800, Guenter Roeck wrote:
> Maybe the additional calls make sense; I can imagine they would.
> However, I personally would be a bit wary of changing the initialization
> order of multi-clock initializations, and I am not sure how a single call
> could address setting the rate ([devm_]clk_get_setrate_prepare_enable()
> seems like a bit too much).
> 
> [ On a side note, why is there no clk_get_prepare_enable() and
>   clk_get_prepare() ? Maybe it would be better to introduce those
>   together with the matching devm_ functions in a separate patch
>   if they are useful. ]

If you take the view that trying to keep clocks disabled is a good way
to save power, then you'd have the clk_prepare() or maybe
clk_prepare_enable() in your runtime PM resume handler, or maybe even
deeper in the driver... the original design goal of the clk API was to
allow power saving and clock control.

With that in mind, getting and enabling the clock together in the
probe function didn't make sense.

I feel that aspect has been somewhat lost, and people now regard much
of the clk API as a bit of a probe-time nusience.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
