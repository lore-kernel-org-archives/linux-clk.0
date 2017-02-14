Return-Path: <sboyd@codeaurora.org>
Date: Tue, 14 Feb 2017 11:44:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: add more managed APIs
Message-ID: <20170214194408.GW25384@codeaurora.org>
References: <20170128184047.GA24957@dtor-ws>
 <20170128190309.GN27312@n2100.armlinux.org.uk>
 <20170128192207.GA38136@dtor-ws>
 <64ed0890-14f6-42ff-66b1-60f7b3d7d02f@roeck-us.net>
 <20170128233911.GO27312@n2100.armlinux.org.uk>
 <20170129180743.GA10917@dtor-ws>
 <20170130185551.GM8801@codeaurora.org>
 <20170131005713.GA35974@dtor-ws>
 <20170207035151.GA18296@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170207035151.GA18296@dtor-ws>
List-ID: <linux-clk.vger.kernel.org>

On 02/06, Dmitry Torokhov wrote:
> On Mon, Jan 30, 2017 at 04:57:13PM -0800, Dmitry Torokhov wrote:
> > When converting a driver to managed resources it is desirable to be able to
> > manage all resources in the same fashion. This change allows managing clock
> > prepared and enabled state in the same way we manage many other resources.
> > 
> > This adds the following managed APIs:
> > 
> > - devm_clk_prepare()/devm_clk_unprepare();
> > - devm_clk_prepare_enable()/devm_clk_disable_unprepare().
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> It would be awesome if we could get it into 4.11...

I'd prefer we didn't do this. Instead, make clk_put() drop any
prepare or enables that were done via that clk pointer. Mike
started to do this before[1], but we have some code that assumes
it can do:

	clk = clk_get(...)
	clk_prepare_enable(clk)
	clk_put(clk)

and have the clk stay on. Those would need to be changed.

We would also need Russell's approval to update the clk_put()
documentation to describe this change in behavior.

[1] http://lkml.kernel.org/r/1438974570-20812-1-git-send-email-mturquette@baylibre.com

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
