Return-Path: <sboyd@codeaurora.org>
Date: Fri, 15 Jan 2016 17:26:12 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 04/13] clk: at91: make IRQ optional and register them
 later
Message-ID: <20160116012612.GA20466@codeaurora.org>
References: <1449248628-3486-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1449248628-3486-5-git-send-email-alexandre.belloni@free-electrons.com>
 <20160115020237.GJ22188@codeaurora.org>
 <20160115103901.1b987f53@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160115103901.1b987f53@bbrezillon>
List-ID: <linux-clk.vger.kernel.org>

On 01/15, Boris Brezillon wrote:
> Hi Stephen,
> 
> On Thu, 14 Jan 2016 18:02:37 -0800
> Stephen Boyd <sboyd@codeaurora.org> wrote:
> > 
> > Is there any way to get the irq into this probe function without
> > getting a clk pointer and then unwrapping it to get an irq
> > value out of the clk_hw wrapper structure? That's a pretty
> > convoluted design.
> 
> Not sure I get what you're suggesting, but the only solution I see to
> avoid this "get main clk pointer dance" would be to have a global
> variable storing the clk_main instance (or a list of clk_main
> instances).
> The thing is, I'd like to avoid adding new global variables in this
> clk drivers as much as possible. Moreover, the core is already taking
> care of keeping the list of all registered clks, with their associated
> of_node, so, is there a real point in creating a duplicated association
> list in this driver too?

Ok I have to admit I'm a little confused. I thought we were
getting the irq from the clkmain structure so that we could
request it here in the probe function. But we're really assigning
the irq so that we can enable/disable/free it later on?

So my new question is if we can register the clocks at the same
time as the "platform device" (really a clock) probes. The
correct design was probably to have pmc be a big platform device
and have it register clocks that it knows exist inside it based
on the compatible string. And it would also know which irqs (or
enforce some ordering of irqs) to assign to which clocks.

It looks like we totally missed that though.... so now we have
many DT nodes that are also platform devices. So if we can do it
at the same time as irq requests then we're good and the clk_hw
structure is in the same scope. If not, then we should probably
just let of_clk_hw_get_from_provider() happen (and it needs to
happen for other reasons anyway) and call it a day.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
