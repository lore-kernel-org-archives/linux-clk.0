Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:42161 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754114AbcHWOQH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Aug 2016 10:16:07 -0400
Date: Tue, 23 Aug 2016 16:16:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marcin Wojtas <mw@semihalf.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, sboyd@codeaurora.org,
        mturquette@baylibre.com, sebastian.hesselbarth@gmail.com,
        jason@lakedaemon.net, thomas.petazzoni@free-electrons.com,
        gregory.clement@free-electrons.com, nadavh@marvell.com,
        alior@marvell.com, tn@semihalf.com, jaz@semihalf.com
Subject: Re: [PATCH 1/2] clk: mvebu: set flags in CP110 gate clock
Message-ID: <20160823141603.GH20029@lunn.ch>
References: <1471933609-8456-1-git-send-email-mw@semihalf.com>
 <1471933609-8456-2-git-send-email-mw@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1471933609-8456-2-git-send-email-mw@semihalf.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 23, 2016 at 08:26:48AM +0200, Marcin Wojtas wrote:
> Armada CP110 system controller comprise its own routine responsble
> for registering gate clocks. Among others 'flags' field in
> struct clk_init_data was not set, using a random values, which
> may cause an unpredicted behavior.
> 
> This patch fixes the problem by setting CLK_IS_BASIC flag for
> all gated clocks of Armada 7k/8k SoCs family.
> 
> Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system ...")
> 
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> ---
>  drivers/clk/mvebu/cp110-system-controller.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
> index 7fa42d6..0835e1d 100644
> --- a/drivers/clk/mvebu/cp110-system-controller.c
> +++ b/drivers/clk/mvebu/cp110-system-controller.c
> @@ -144,6 +144,7 @@ static struct clk *cp110_register_gate(const char *name,
>  
>  	init.name = name;
>  	init.ops = &cp110_gate_ops;
> +	init.flags = CLK_IS_BASIC;
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;

Hi Marcin

How about adding a memset for init? That would also help if new fields
every get added to clk_init_data.

      Andrew
