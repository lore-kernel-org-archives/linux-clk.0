Return-Path: <linux+mturquette=baylibre.com@armlinux.org.uk>
Date: Sat, 28 Jan 2017 19:03:10 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: add more managed APIs
Message-ID: <20170128190309.GN27312@n2100.armlinux.org.uk>
References: <20170128184047.GA24957@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170128184047.GA24957@dtor-ws>
Sender: Russell King - ARM Linux <linux@armlinux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Sat, Jan 28, 2017 at 10:40:47AM -0800, Dmitry Torokhov wrote:
> When converting a driver to managed resources it is desirable to be able to
> manage all resources in the same fashion. This change allows managing
> clocks in the same way we manage many other resources.
> 
> This adds the following managed APIs:
> 
> - devm_clk_prepare()/devm_clk_unprepare();
> - devm_clk_enable()/devm_clk_disable();
> - devm_clk_prepare_enable()/devm_clk_disable_unprepare().

Does it make any sense what so ever to have devm_clk_enable() and
devm_clk_disable()?

Take a moment to think about where you use all of these.  The devm_*
functions are there to be used in probe functions so that cleanup
paths can be streamlined and less erroneous.  They aren't for general
use throughout the driver.

Given that, there are two operations that you may wish to do in the
probe path:

1. prepare a clock (avoiding the enable because you want to perform
   the enable elsewhere in the driver.)
2. prepare and enable a clock

So, does having devm_clk_enable() really make sense?  I don't think
it does, and I suspect they'll get very little if any use.  So, I
think best not add them until someone comes up with a good and
wide-spread use case.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
