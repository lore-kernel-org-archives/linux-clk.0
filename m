Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 15:12:43 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: renesas: mstp: Make INTC-SYS a critical clock
Message-ID: <20170120231243.GE8009@codeaurora.org>
References: <1484657190-12838-1-git-send-email-geert+renesas@glider.be>
 <1484657190-12838-3-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1484657190-12838-3-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/17, Geert Uytterhoeven wrote:
> INTC-SYS is the module clock for the GIC.  Accessing the GIC while it is
> disabled causes:
> 
>     Unhandled fault: asynchronous external abort (0x1211) at 0x00000000
> 
> Currently, the GIC-400 driver cannot enable its module clock for several
> reasons:
>   - It does not use a platform device, so Runtime PM is not an option,
>   - gic_of_init() runs before any clocks are registered, so it cannot
>     enable the clock explicitly,
>   - gic_of_init() cannot return -EPROBE_DEFER, as IRQCHIP_DECLARE()
>     doesn't support deferred probing.
> 
> Hence we have to keep on relying on the boot loader for enabling the
> module clock.
> 
> To prevent the module clock from being disabled when the CCF core thinks
> it is unused, and thus causing a system lock-up, add a check to the MSTP
> clock driver and enable CLK_IS_CRITICAL. This will make sure the module
> clock is never disabled.
> 
> This is a hard dependency for describing the INTC-SYS clock in DT on
> R-Mobile APE6 and R-Car Gen2.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index 9375777776d99407..c0319b8acf3521a2 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -144,6 +144,11 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)

Sad that git gets confused about which function this is in.

>  	init.name = name;
>  	init.ops = &cpg_mstp_clock_ops;
>  	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
> +	/* INTC-SYS is the module clock of the GIC, and must not be disabled */
> +	if (!strcmp(name, "intc-sys")) {
> +		pr_debug("MSTP %s setting CLK_IS_CRITICAL\n", name);
> +		init.flags |= CLK_IS_CRITICAL;
> +	}
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
