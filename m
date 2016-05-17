Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: fix critical clock locking
Date: Tue, 17 May 2016 14:25:52 +0200
Message-ID: <2977333.1NGEvqASGv@phil>
In-Reply-To: <1463126431-29071-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463126431-29071-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 13. Mai 2016, 10:00:31 schrieb Maxime Ripard:
> The critical clock handling in __clk_core_init isn't taking the enable
> lock before calling clk_core_enable, which in turns triggers the warning
> in the lockdep_assert_held call in that function when lockep is enabled.
> 
> Add the calls to clk_enable_lock/unlock to make sure it doesn't happen.
> 
> Fixes: 32b9b1096186 ("clk: Allow clocks to be marked as CRITICAL")
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

ran into this issue today as well and doing the same fix before trying to 
look at the lists, so on a rk3288-veyron

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>


one nit below

> ---
> Changes from v1:
>   - Removed the redundant prepare lock
> 
>  drivers/clk/clk.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ce39add5a258..d584004f7af7 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2404,8 +2404,13 @@ static int __clk_core_init(struct clk_core *core)
>  		core->ops->init(core->hw);
> 
>  	if (core->flags & CLK_IS_CRITICAL) {
> +		unsigned long flags;
> +
>  		clk_core_prepare(core);
> +

nit: all other invocations of both clk_core_prepare/clk_core_enable in clk.c 
(__clk_set_parent_before, __clk_set_parent_after, clk_change_rate) do it 
like 
	clk_core_prepare(core);
	flags = clk_enable_lock();
	clk_core_enable(core);
	clk_enable_unlock(flags);

aka without the blank. Might be nice to standardize on one format.


> +		flags = clk_enable_lock();
>  		clk_core_enable(core);
> +		clk_enable_unlock(flags);
>  	}
> 
>  	kref_init(&core->ref);
