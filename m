Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.134]:56668 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933740AbeCTAxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Mar 2018 20:53:18 -0400
Cc: shawn.lin@rock-chips.com, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: Don't restore invalid cached phase
To: Heiko Stuebner <heiko@sntech.de>
References: <1521450902-32142-1-git-send-email-shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <b8891a77-2c43-bf0b-f3a0-abc85ffafc37@rock-chips.com>
Date: Tue, 20 Mar 2018 08:53:13 +0800
MIME-Version: 1.0
In-Reply-To: <1521450902-32142-1-git-send-email-shawn.lin@rock-chips.com>
Content-Type: text/plain; charset=gbk; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Sorry, It turns out still some corner case need to address, please
drop this.

On 2018/3/19 17:15, Shawn Lin wrote:
> We inevitably cache the invalid phase when the clock provider
> be reparented from orphan to its real parent in the first place,
> thus we may mess up the initialization of MMC cards since we
> only set the default sample phase and drive phase later on.
> So we should skip to restore the invalid phase. And this patch
> also corrects the error path to return invalid pointer to clk if
> clk_notifier_register failed introduced by the same offending
> commit.
> 
> Fixes: 60cf09e45fbc ("clk: rockchip: Restore the clock phase after the rate was changed")
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
> 
>   drivers/clk/rockchip/clk-mmc-phase.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-mmc-phase.c b/drivers/clk/rockchip/clk-mmc-phase.c
> index dc4c227..c8c6119 100644
> --- a/drivers/clk/rockchip/clk-mmc-phase.c
> +++ b/drivers/clk/rockchip/clk-mmc-phase.c
> @@ -181,7 +181,8 @@ static int rockchip_mmc_clk_rate_notify(struct notifier_block *nb,
>   	if (event == PRE_RATE_CHANGE)
>   		mmc_clock->cached_phase =
>   			rockchip_mmc_get_phase(&mmc_clock->hw);
> -	else if (event == POST_RATE_CHANGE)
> +	else if (mmc_clock->cached_phase != -EINVAL &&
> +		 event == POST_RATE_CHANGE)
>   		rockchip_mmc_set_phase(&mmc_clock->hw, mmc_clock->cached_phase);
>   
>   	return NOTIFY_DONE;
> @@ -211,8 +212,10 @@ struct clk *rockchip_clk_register_mmc(const char *name,
>   	mmc_clock->shift = shift;
>   
>   	clk = clk_register(NULL, &mmc_clock->hw);
> -	if (IS_ERR(clk))
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>   		goto err_register;
> +	}
>   
>   	mmc_clock->clk_rate_change_nb.notifier_call =
>   				&rockchip_mmc_clk_rate_notify;
> @@ -225,5 +228,5 @@ struct clk *rockchip_clk_register_mmc(const char *name,
>   	clk_unregister(clk);
>   err_register:
>   	kfree(mmc_clock);
> -	return clk;
> +	return ERR_PTR(ret);
>   }
> 

