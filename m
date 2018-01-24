Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:54033 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752009AbeAXD0t (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Jan 2018 22:26:49 -0500
Subject: Re: [PATCH v6 40/41] ARM: da8xx-dt: switch to device tree clocks
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org
References: <1516468460-4908-1-git-send-email-david@lechnology.com>
 <1516468460-4908-41-git-send-email-david@lechnology.com>
From: David Lechner <david@lechnology.com>
Message-ID: <335d92c8-1af2-da64-e366-95d7513ad69d@lechnology.com>
Date: Tue, 23 Jan 2018 21:26:40 -0600
MIME-Version: 1.0
In-Reply-To: <1516468460-4908-41-git-send-email-david@lechnology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 01/20/2018 11:14 AM, David Lechner wrote:
> This removes all of the clock init code from da8xx-dt.c. This includes
> all of the OF_DEV_AUXDATA that was just used for looking up clocks.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
> 
> v6 changes:
> - removed misleading statement from commit message
> 
>   arch/arm/mach-davinci/da8xx-dt.c | 61 +---------------------------------------
>   1 file changed, 1 insertion(+), 60 deletions(-)
> 
> diff --git a/arch/arm/mach-davinci/da8xx-dt.c b/arch/arm/mach-davinci/da8xx-dt.c

>   static void __init da850_init_machine(void)
>   {
> -	/* All existing boards use 100MHz SATA refclkpn */
> -	static const unsigned long sata_refclkpn = 100 * 1000 * 1000;
> -
> -	int ret;
> -
> -	ret = da8xx_register_usb20_phy_clk(false);
> -	if (ret)
> -		pr_warn("%s: registering USB 2.0 PHY clock failed: %d",
> -			__func__, ret);
> -	ret = da8xx_register_usb11_phy_clk(false);
> -	if (ret)
> -		pr_warn("%s: registering USB 1.1 PHY clock failed: %d",
> -			__func__, ret);
> -
> -	ret = da850_register_sata_refclk(sata_refclkpn);
> -	if (ret)
> -		pr_warn("%s: registering SATA REFCLK failed: %d",
> -			__func__, ret);
> -
> -	of_platform_default_populate(NULL, da850_auxdata_lookup, NULL);
> +	of_platform_default_populate(NULL, NULL, NULL);

of_platform_default_populate() can actually be removed completely.
of_platform_default_populate_init() is called implicitly during
arch_initcall_sync

>   	davinci_pm_init();
>   	pdata_quirks_init();
>   }
