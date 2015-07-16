Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55A76E80.104@ti.com>
Date: Thu, 16 Jul 2015 11:42:40 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/4] clk: ti: clk-3xxx: Remove unused structures
References: <1436990899-13105-1-git-send-email-sboyd@codeaurora.org> <1436990899-13105-4-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436990899-13105-4-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/15/2015 11:08 PM, Stephen Boyd wrote:
> Sparse complains about these structures missing static, but they
> also don't look to be used. Remove them.
>
> drivers/clk/ti/clk-3xxx.c:74:30: warning: symbol 'clkhwops_omap3430es2_ssi_wait' was not declared. Should it be static?
> drivers/clk/ti/clk-3xxx.c:157:30: warning: symbol 'clkhwops_omap3430es2_hsotgusb_wait' was not declared. Should it be static?

Interesting, I wonder if the references to these have accidentally been 
dropped at some point, namely (in 2012?) when we converted the clocks to 
use common clock struct.

Anyway, I guess we can fix the ssi/usb clocks later if we find some 
issues with them, its been at least 3 years since these have been used.

-Tero

>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>   drivers/clk/ti/clk-3xxx.c | 10 ----------
>   1 file changed, 10 deletions(-)
>
> diff --git a/drivers/clk/ti/clk-3xxx.c b/drivers/clk/ti/clk-3xxx.c
> index bd8291b53fd0..676ee8f6d813 100644
> --- a/drivers/clk/ti/clk-3xxx.c
> +++ b/drivers/clk/ti/clk-3xxx.c
> @@ -71,11 +71,6 @@ static void omap3430es2_clk_ssi_find_idlest(struct clk_hw_omap *clk,
>   	*idlest_val = OMAP34XX_CM_IDLEST_VAL;
>   }
>
> -const struct clk_hw_omap_ops clkhwops_omap3430es2_ssi_wait = {
> -	.find_idlest	= omap3430es2_clk_ssi_find_idlest,
> -	.find_companion	= omap2_clk_dflt_find_companion,
> -};
> -
>   const struct clk_hw_omap_ops clkhwops_omap3430es2_iclk_ssi_wait = {
>   	.allow_idle	= omap2_clkt_iclk_allow_idle,
>   	.deny_idle	= omap2_clkt_iclk_deny_idle,
> @@ -154,11 +149,6 @@ const struct clk_hw_omap_ops clkhwops_omap3430es2_iclk_hsotgusb_wait = {
>   	.find_companion	= omap2_clk_dflt_find_companion,
>   };
>
> -const struct clk_hw_omap_ops clkhwops_omap3430es2_hsotgusb_wait = {
> -	.find_idlest	= omap3430es2_clk_hsotgusb_find_idlest,
> -	.find_companion	= omap2_clk_dflt_find_companion,
> -};
> -
>   /**
>    * am35xx_clk_find_idlest - return clock ACK info for AM35XX IPSS
>    * @clk: struct clk * being enabled
>

