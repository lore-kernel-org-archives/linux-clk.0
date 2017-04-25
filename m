Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60330 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1429614AbdDYVdQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Apr 2017 17:33:16 -0400
Date: Tue, 25 Apr 2017 22:33:03 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org
Subject: Re: [PATCH] Fix returns of some CLK API calls, if !CONFIG_HAVE_CLOCK
Message-ID: <20170425213303.GU17774@n2100.armlinux.org.uk>
References: <20170425125547.865FB508DA7@solo.franken.de>
 <20170425163137.GR17774@n2100.armlinux.org.uk>
 <20170425205435.GA13744@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170425205435.GA13744@alpha.franken.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 10:54:35PM +0200, Tom Bogendoerfer wrote:
> On Tue, Apr 25, 2017 at 05:31:37PM +0100, Russell King - ARM Linux wrote:
> > On Tue, Apr 25, 2017 at 02:30:07PM +0200, Thomas Bogendoerfer wrote:
> > > If CONFIG_HAVE_CLOCK is not set, return values of clk_get(),
> > > devm_clk_get(), devm_get_clk_from_child(), clk_get_parent()
> > > and clk_get_sys() are wrong. According to spec these functions
> > > should either return a pointer to a struct clk or a valid IS_ERR
> > > condition. NULL is neither, so returning ERR_PTR(-ENODEV) makes
> > > more sense.
> > 
> > That's wrong.  When the clk API is disabled, the expected behaviour is
> > that drivers will not fail.  Returning ERR_PTR(-ENODEV) will cause them
> > to fail, so will break platforms.
> >
> > NAK.
> > 
> 
> then we have to go through all drivers, which could work with and
> without HAVE_CLK and replace the IS_ERR() checks with something
> like IS_ERR_OR_NULL().  Easy for the part I'm interested in the
> first place.

What you describe is exactly what you're proposing to happen if your
patch gets merged - we go from a situation where drivers that do this
today:

	clk = devm_clk_get();
	if (IS_ERR(clk))
		return PTR_ERR(clk);

start failing to probe, whereas the current situation is that they
work.

It's well established that the NULL clk means that there is no clock
available (eg, because the architecture doesn't support the clk API)
and this allows drivers to work across different architectures today.
provided they aren't reliant on obtaining the current clock rate.

> > > Without this change serial console on SNI RM400 machines (MIPS arch)
> > > is broken, because sccnxp driver doesn't get a valid clock rate.
> > 
> > So the driver needs to depeond on HAVE_CLOCK.
> 
> the driver worked without HAVE_CLOCK before just fine, and while it
> got invaded by CLK API it got broken.
> 
> No problem to fix that, but just looking at include/linux/clk.h:
> 
> /**
>  * devm_clk_get - lookup and obtain a managed reference to a clock producer.
>  * @dev: device for clock "consumer"
>  * @id: clock consumer ID
>  *
>  * Returns a struct clk corresponding to the clock producer, or
>  * valid IS_ERR() condition containing errno.  The implementation
> 
> I would expect either no replacement for that, if !HAVE_CLOCK
> or simple a sane result code... and NULL isn't sane at least
> with the description above...

As far as drivers are concerned, any value returned that IS_ERR()
tests false must not be assumed to be a failure.

However, looking at commit 90efa75f7ab0, there's one point that's
definitely wrong, and another that can be improved to avoid your
problem.

1. clk_get_rate() on a disabled clock:

 * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
 *                This is only valid once the clock source has been enabled.

   The clock is expected to be enabled before clk_get_rate() is called,
   and the driver is not doing that.

2. if uartclk is zero after enabling, then there's clearly no clock
   rate available, and the driver really ought to fallback to using
   the old method.

So, I'd suggest that the driver should be coded:

	clk = devm_clk_get(&pdev->dev, NULL);
	if (IS_ERR(clk)) {
		ret = PTR_ERR(clk);
		if (ret == -EPROBE_DEFER)
			goto err_out;
		uartclk = 0;
	} else {
		uartclk = clk_get_rate(clk);
	}

	if (!uartclk) {
		dev_notice(&pdev->dev, "Using default clock frequency\n");
		uartclk = s->freq_std;
	}

	/* Check input frequency */
	...

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
