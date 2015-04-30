Return-Path: <sboyd@codeaurora.org>
Message-ID: <55427D25.3040904@codeaurora.org>
Date: Thu, 30 Apr 2015 12:06:13 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Dong Aisheng <aisheng.dong@freescale.com>, linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org, mturquette@linaro.org,
 shawn.guo@linaro.org, b29396@freescale.com,
 linux-arm-kernel@lists.infradead.org,
 Ranjani.Vaidyanathan@freescale.com, b20596@freescale.com,
 r64343@freescale.com, b20788@freescale.com
Subject: Re: [PATCH RFC v1 1/5] clk: change clk_core name of __clk_set_parent_after
References: <1429107999-24413-1-git-send-email-aisheng.dong@freescale.com> <1429107999-24413-2-git-send-email-aisheng.dong@freescale.com>
In-Reply-To: <1429107999-24413-2-git-send-email-aisheng.dong@freescale.com>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 04/15/15 07:26, Dong Aisheng wrote:
> To align with __clk_set_parent_before and some others functions,
> change the host clk name to 'clk' instead of 'core'.
>
> Cc: Mike Turquette <mturquette@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Dong Aisheng <aisheng.dong@freescale.com>
> ---

No thanks. We should go and rename all clk_core pointers in this file
from clk to core now that we're done splitting the two. I'll go do that now.

>  drivers/clk/clk.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 459ce9d..cc56ba2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1487,7 +1487,7 @@ static struct clk_core *__clk_set_parent_before(struct clk_core *clk,
>  	return old_parent;
>  }
>  
> -static void __clk_set_parent_after(struct clk_core *core,
> +static void __clk_set_parent_after(struct clk_core *clk,
>  				   struct clk_core *parent,
>  				   struct clk_core *old_parent)
>  {
> @@ -1495,8 +1495,8 @@ static void __clk_set_parent_after(struct clk_core *core,
>  	 * Finish the migration of prepare state and undo the changes done
>  	 * for preventing a race with clk_enable().
>  	 */
> -	if (core->prepare_count) {
> -		clk_core_disable(core);
> +	if (clk->prepare_count) {
> +		clk_core_disable(clk);
>  		clk_core_disable(old_parent);
>  		clk_core_unprepare(old_parent);
>  	}


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
