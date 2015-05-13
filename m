Return-Path: <linux+multiple=linaro.org@arm.linux.org.uk>
Date: Wed, 13 May 2015 21:12:30 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mike Turquette <mturquette@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Automatic clock disabling on clk_put()
Message-ID: <20150513201230.GT2067@n2100.arm.linux.org.uk>
References: <20150511060129.GG6325@pengutronix.de>
 <55528B84.5050700@codeaurora.org>
 <20150513064550.GE28888@pengutronix.de>
 <5553A9C8.2070701@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <5553A9C8.2070701@codeaurora.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Wed, May 13, 2015 at 12:45:12PM -0700, Stephen Boyd wrote:
> On 05/12/15 23:45, Uwe Kleine-König wrote:
> >
> >> that hard to call clk_disable_unprepare() on a clock at the end of an
> >> error path? Maybe you could add a devm_clk_get_prepare_enable() that
> >> does what you want and then call clk_disable_unprepare on the exit path?
> > You mean clk_disable_unprepare is called in the same function that calls
> > clk_put I assume such that you don't have to do anything in the exit
> > path.
> >
> 
> Yes that's what I mean.

In terms of stopping people doing:

	clk = clk_get(...);
	clk_prepare_enable(clk);
	clk_put(clk);

I think this is a good thing, because it ensures that people can't do
this anymore.

I think you need to audit the code properly first, and fix any instances
of that _before_ posting patches with your idea - let's try to avoid as
much as possible any breakage resulting from this.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
