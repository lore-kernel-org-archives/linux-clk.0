Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, linux-clk@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] clk: shmobile: Add new CPG/MSSR driver core
Date: Sat, 05 Dec 2015 05:08:25 +0200
Message-ID: <1816814.hXph9CLyDv@avalon>
In-Reply-To: <1447343686-2038-5-git-send-email-geert+renesas@glider.be>
References: <1447343686-2038-1-git-send-email-geert+renesas@glider.be> <1447343686-2038-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Thursday 12 November 2015 16:54:45 Geert Uytterhoeven wrote:
> Add the common core for the new Renesas Clock Pulse Generator / Module
> Standby and Software Reset driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6:
>   - No changes,
> 
> v5:
>   - Convert from CLK_OF_DECLARE() to a real platform_driver, initialized
>     using platform_driver_probe() from subsys_initcall().
>     Note that arch_initcall() would be OK for arm32, but not for arm64:
>       - arm32 calls of_platform_populate() from arch_initcall(),
>       - arm64 calls of_platform_populate() from arch_initcall_sync().
>   - Implement handling of core clocks that are suitable for power
>     management (not needed for R-Car, but useful for SH-Mobile AG5 and
>     R-Mobile APE6),
>   - Add cpg_mssr_info.init(), as initialization is now done from the
>     core driver,
>   - Move conversion from Module Clock numbers to IDs from run time (C
>     code) to compile time (CPP macros for filling in tables),
>   - Unify some code to handle CLK_TYPE_IN and CLK_TYPE_FF,
>   - Rename from clk-cpg-mssr to renesas-cpg-mssr,
>   - Add include guards to clk-cpg-mssr.h,
>   - Improve struct documentation,
>   - Clean up debugging code,
>   - Drop RFC state,
> 
> v4:
>   - New.
> ---
>  drivers/clk/shmobile/renesas-cpg-mssr.c | 587 +++++++++++++++++++++++++++++
>  drivers/clk/shmobile/renesas-cpg-mssr.h | 131 +++++++
>  2 files changed, 718 insertions(+)
>  create mode 100644 drivers/clk/shmobile/renesas-cpg-mssr.c
>  create mode 100644 drivers/clk/shmobile/renesas-cpg-mssr.h
> 
> diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.c
> b/drivers/clk/shmobile/renesas-cpg-mssr.c new file mode 100644
> index 0000000000000000..e4382ba4e1e31aca
> --- /dev/null
> +++ b/drivers/clk/shmobile/renesas-cpg-mssr.c

[snip]

> +static inline int cpg_mssr_add_clk_domain(struct device *dev,
> +					  const unsigned int *core_pm_clks,
> +					  unsigned int num_core_pm_clks) {}

The function is missing a return statement.

> +#endif /* !CONFIG_PM_GENERIC_DOMAINS_OF */

[snip]

-- 
Regards,

Laurent Pinchart
