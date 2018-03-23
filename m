Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:44638 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751221AbeCWITa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 23 Mar 2018 04:19:30 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] clk: rockchip: Correct the behaviour of restoring cached phase
Date: Fri, 23 Mar 2018 09:19:28 +0100
Message-ID: <2617278.f7F6Nr675k@phil>
In-Reply-To: <1521599960-34381-3-git-send-email-shawn.lin@rock-chips.com>
References: <1521599960-34381-1-git-send-email-shawn.lin@rock-chips.com> <1521599960-34381-3-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 21. März 2018, 03:39:20 CET schrieb Shawn Lin:
> We can't restore every phase, for instance the invalid phase and
> the phase for coming rate which is out of the scope of boards'
> ability. And this patch also corrects the error path to return
> invalid pointer to clk if clk_notifier_register failed introduced
> by the same offending commit.
> 
> Fixes: 60cf09e45fbc ("clk: rockchip: Restore the clock phase after the rate was changed")
> Reported-by: wlq <wlq@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> Tested-by: wlq <wlq@rock-chips.com>

I've split off the part below [fix for error handling] into a separate
patch and applied both patches for 4.17


Thanks
Heiko

> @@ -211,8 +223,10 @@ struct clk *rockchip_clk_register_mmc(const char *name,
>  	mmc_clock->shift = shift;
>  
>  	clk = clk_register(NULL, &mmc_clock->hw);
> -	if (IS_ERR(clk))
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
>  		goto err_register;
> +	}
>  
>  	mmc_clock->clk_rate_change_nb.notifier_call =
>  				&rockchip_mmc_clk_rate_notify;
> @@ -225,5 +239,5 @@ struct clk *rockchip_clk_register_mmc(const char *name,
>  	clk_unregister(clk);
>  err_register:
>  	kfree(mmc_clock);
> -	return clk;
> +	return ERR_PTR(ret);
>  }
> 


