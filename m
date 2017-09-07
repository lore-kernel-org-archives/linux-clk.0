Return-Path: <carlo.caione@gmail.com>
MIME-Version: 1.0
Sender: carlo.caione@gmail.com
In-Reply-To: <20170714082356.28117-1-carlo@caione.org>
References: <20170714082356.28117-1-carlo@caione.org>
From: Carlo Caione <carlo@caione.org>
Date: Thu, 7 Sep 2017 11:22:21 +0200
Message-ID: <CAOQ7t2beu8CyHM1qR+DDt-BQXmFHoyJe8q_56qhkkYLM_o1upQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
To: alan@linux.intel.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Darren Hart <dvhart@infradead.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Linux Upstreaming Team <linux@endlessm.com>, Enric Balletbo Serra <eballetbo@gmail.com>,
	andriy.shevchenko@linux.intel.com, Carlo Caione <carlo@endlessm.com>,
	Carlo Caione <carlo@caione.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 14, 2017 at 10:23 AM, Carlo Caione <carlo@caione.org> wrote:
> From: Carlo Caione <carlo@endlessm.com>
>
> Read the enable register to determine if the clock is already in use by
> the firmware. In this case avoid gating the clock.
>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> ---
>  drivers/clk/x86/clk-pmc-atom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
> index 2b60577703ef..be8d821ce625 100644
> --- a/drivers/clk/x86/clk-pmc-atom.c
> +++ b/drivers/clk/x86/clk-pmc-atom.c
> @@ -185,6 +185,13 @@ static struct clk_plt *plt_clk_register(struct platform_device *pdev, int id,
>         pclk->reg = base + PMC_CLK_CTL_OFFSET + id * PMC_CLK_CTL_SIZE;
>         spin_lock_init(&pclk->lock);
>
> +       /*
> +        * If the clock was already enabled by the firmware mark it as critical
> +        * to avoid it being gated by the clock framework if no driver owns it.
> +        */
> +       if (plt_clk_is_enabled(&pclk->hw))
> +               init.flags |= CLK_IS_CRITICAL;
> +
>         ret = devm_clk_hw_register(&pdev->dev, &pclk->hw);
>         if (ret) {
>                 pclk = ERR_PTR(ret);

Hi,

I just discovered that this fix is not working anymore on my platform
(with a baytrail processor).
This fix was needed on my setup because the clock pmc_plt_clk_4 used
by the Ethernet and enabled by the firmware, was being gated by the
clock framework since the r8169 driver was failing to claim it. You
can read the whole discussion about this in [0]. This fix was also
needed for some other audio machine drivers.

I bisected the problem down to commit 49d25364df ("staging/atomisp:
Add support for the Intel IPU v2"). The clock driver is basically
shutting down all the clocks (see [1]) at probe time, so the
clk-pmc-atom driver is seeing all the clocks already disabled when
going to check.

Any idea how to proper fix this?

Cheers,

[0] https://www.spinics.net/lists/platform-driver-x86/msg12092.html
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/media/atomisp/platform/clock/vlv2_plat_clock.c?h=v4.13#n200

-- 
Carlo Caione
