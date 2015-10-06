Return-Path: <linux+mturquette=baylibre.com@arm.linux.org.uk>
Date: Tue, 6 Oct 2015 20:50:42 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: York Sun <yorksun@freescale.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: What's the proper use of con_id in clkdev
Message-ID: <20151006195042.GZ21513@n2100.arm.linux.org.uk>
References: <5612D4D0.30104@freescale.com>
 <20151006194430.GJ12338@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151006194430.GJ12338@codeaurora.org>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Oct 06, 2015 at 12:44:30PM -0700, Stephen Boyd wrote:
> On 10/05, York Sun wrote:
> > Michael and Stephen,
> > 
> > Can you help me to understand "#define MAX_CON_ID 16" in clkdev.c? I am trying
> > to use clk_get() to acquire the clock with its name. This fails when the clock
> > name is more than 15 characters. I traced it to this macro.
> > 
> > The reason of using clk_get() is I don't have device tree for my platform until
> > device tree overlay is officially supported. So I use clkdev_add() in the clock
> > driver.
> > 
> > So my issue is with the MAX_CON_ID. Is there a reason to limit it to 16?
> > Wouldn't it be better to use kstrdup() in vclkdev_alloc()?
> > 
> 
> Mike and I are not the maintainers of clkdev. The maintainer of
> clkdev is Russell King.
> 
> I believe we can't use kstrdup() in vclkdev_alloc() because we
> don't know if vclkdev_alloc() is called before the slab
> allocators are up and running (this is why we have a
> __clkdev_alloc() function). The simplest solution is to use
> shorter names, can you do that?

Why does anyone need a _connection_ _id_ longer than 15 characters
anyway?

It's not a system clock name - it's supposed to be a device _specific_
clock _input_ name.  This statement comes from many years experience,
where people have repeatedly passed clk_get(NULL, "global clock name")
and eventually run into great problems, ending up having to pass clk
connection names through platform data, or clk pointers through
platform data.  Both are abhorrent.

Use the API as it was designed to be used: always use
clk_get(device, "device-input-name") or clk_get_sys("device-name",
"device-input-name") and not clk_get(NULL, "global-clock-name").

-- 
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
