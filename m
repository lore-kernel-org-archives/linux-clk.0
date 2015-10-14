Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:17:33 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151014221733.65507871@free-electrons.com>
In-Reply-To: <20151014182138.GD26883@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
	<1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
	<20151014170922.3027008a@free-electrons.com>
	<20151014182138.GD26883@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

Thanks for your feedback!

On Wed, 14 Oct 2015 11:21:38 -0700, Stephen Boyd wrote:

> > Stephen, what do you suggest to fix this issue?
> 
> Simplest fix is to revert this hunk.

Indeed, this is the simplest fix. But it's going backward with what you
were trying to do originally, so it isn't really nice either.

> Longer term, we should look into making of_clk_get_parent_name() use
> whatever string has been used when registering the clock,

I am not sure how of_clk_get_parent_name() can know the name of the
clock without clock-output-names in the DT. Without clock-output-names,
the only way to know the name of the parent clock is to actually ask
the driver of the parent clock, no?

> or completely change how we do parent child linkages so that strings
> aren't necessary.

Keep the reference to the DT node + "arguments". Not super simple
either.

> > The easiest solution is to add a clock-output-names property to the
> > coreclk node. This way, of_clk_get_parent_name() will properly
> > resolve the clock name to its correct name (i.e, "cpuclk" in our
> > case) and everything works fine (I've tested). The drawback of this
> > solution is that it breaks backward compatibility with old DTs: a
> > 4.2 DT for Armada XP would no longer work with a >= 4.3 kernel.
> > 
> > Do you have some other suggestions to make ?
> > 
> 
> How about this patch?

I'll give it a try tomorrow, but since it's essentially a revert of
your patch, I believe it should work.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
