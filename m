Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 10:41:32 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] clk: Make of_clk_get_parent_name() robust with
 #clock-cells = 1
Message-ID: <20151021104132.183626f8@free-electrons.com>
In-Reply-To: <1444951178-18733-1-git-send-email-sboyd@codeaurora.org>
References: <20151015215648.2024f611@free-electrons.com>
	<1444951178-18733-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Stephen,

On Thu, 15 Oct 2015 16:19:38 -0700, Stephen Boyd wrote:
> If a clock provider has #clock-cells = 1 and we call
> of_clk_get_parent_name() on it we may end up returning the name
> of the provider node if the provider doesn't have a
> clock-output-names property. This doesn't make sense, especially
> when you consider that calling of_clk_get_parent_name() on such a
> node with different indices will return the same name each time.
> 
> Let's try getting the clock from the framework via of_clk_get()
> instead, and only fallback to the node name if we have a provider
> with #clock-cells = 0. This way, we can't hand out the same name
> for different clocks when we don't actually know their names.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/clk.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I tested on top of 4.3-rc5 and the Armada XP per-CPU clocks are now
properly parented with their common parent "cpuclk".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
