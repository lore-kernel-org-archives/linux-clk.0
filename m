Return-Path: <nm@ti.com>
Subject: Re: [RESEND PATCHv2 08/28] ARM: OMAP2+: clockdomain: add usecounting
 support to autoidle APIs
To: Tero Kristo <t-kristo@ti.com>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <sboyd@codeaurora.org>,
        <mturquette@baylibre.com>, <tony@atomide.com>
References: <1465844702-12200-1-git-send-email-t-kristo@ti.com>
 <1465844702-12200-9-git-send-email-t-kristo@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <575F4257.3010108@ti.com>
Date: Mon, 13 Jun 2016 18:31:35 -0500
MIME-Version: 1.0
In-Reply-To: <1465844702-12200-9-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

On 06/13/2016 02:04 PM, Tero Kristo wrote:
[..]
> diff --git a/arch/arm/mach-omap2/omap_hwmod.c
b/arch/arm/mach-omap2/omap_hwmod.c
> index 0c85f91..635a563 100644
> --- a/arch/arm/mach-omap2/omap_hwmod.c
> +++ b/arch/arm/mach-omap2/omap_hwmod.c

[...]

> @@ -2177,14 +2173,10 @@ static int _enable(struct omap_hwmod *oh)
>  
>  	r = (soc_ops.wait_target_ready) ? soc_ops.wait_target_ready(oh) :
>  		-EINVAL;
> -	if (!r) {
> -		/*
> -		 * Set the clockdomain to HW_AUTO only if the target is ready,
> -		 * assuming that the previous state was HW_AUTO
> -		 */
> -		if (oh->clkdm && hwsup)
> -			clkdm_allow_idle(oh->clkdm);
> +	if (oh->clkdm)
> +		clkdm_allow_idle(oh->clkdm);

Should'nt this be under if (!r) ?

>  
> +	if (!r) {

here?


-- 
Regards,
Nishanth Menon
