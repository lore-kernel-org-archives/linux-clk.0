Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from elvis.franken.de ([193.175.24.41]:56111 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1954540AbdDYUyt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Apr 2017 16:54:49 -0400
Date: Tue, 25 Apr 2017 22:54:35 +0200
From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@linux-mips.org
Subject: Re: [PATCH] Fix returns of some CLK API calls, if !CONFIG_HAVE_CLOCK
Message-ID: <20170425205435.GA13744@alpha.franken.de>
References: <20170425125547.865FB508DA7@solo.franken.de>
 <20170425163137.GR17774@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170425163137.GR17774@n2100.armlinux.org.uk>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 05:31:37PM +0100, Russell King - ARM Linux wrote:
> On Tue, Apr 25, 2017 at 02:30:07PM +0200, Thomas Bogendoerfer wrote:
> > If CONFIG_HAVE_CLOCK is not set, return values of clk_get(),
> > devm_clk_get(), devm_get_clk_from_child(), clk_get_parent()
> > and clk_get_sys() are wrong. According to spec these functions
> > should either return a pointer to a struct clk or a valid IS_ERR
> > condition. NULL is neither, so returning ERR_PTR(-ENODEV) makes
> > more sense.
> 
> That's wrong.  When the clk API is disabled, the expected behaviour is
> that drivers will not fail.  Returning ERR_PTR(-ENODEV) will cause them
> to fail, so will break platforms.
>
> NAK.
> 

then we have to go through all drivers, which could work with and
without HAVE_CLK and replace the IS_ERR() checks with something
like IS_ERR_OR_NULL().  Easy for the part I'm interested in the first place.

> > Without this change serial console on SNI RM400 machines (MIPS arch)
> > is broken, because sccnxp driver doesn't get a valid clock rate.
> 
> So the driver needs to depeond on HAVE_CLOCK.

the driver worked without HAVE_CLOCK before just fine, and while it
got invaded by CLK API it got broken.

No problem to fix that, but just looking at include/linux/clk.h:

/**
 * devm_clk_get - lookup and obtain a managed reference to a clock producer.
 * @dev: device for clock "consumer"
 * @id: clock consumer ID
 *
 * Returns a struct clk corresponding to the clock producer, or
 * valid IS_ERR() condition containing errno.  The implementation

I would expect either no replacement for that, if !HAVE_CLOCK
or simple a sane result code... and NULL isn't sane at least
with the description above...

But still it's your call.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
