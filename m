Return-Path: <sboyd@codeaurora.org>
Date: Thu, 25 Aug 2016 13:06:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/3 v2] clk: versatile/icst: support for AP baseboard
 clocks
Message-ID: <20160825200632.GQ19826@codeaurora.org>
References: <1471857574-13125-1-git-send-email-linus.walleij@linaro.org>
 <1471857574-13125-3-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1471857574-13125-3-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/22, Linus Walleij wrote:
> @@ -143,6 +180,17 @@ static int vco_set(struct clk_icst *icst, struct icst_vco vco)
>  		if (vco.r != 22)
>  			pr_err("ICST error: tried to use RDW != 22\n");
>  		break;
> +	case ICST_INTEGRATOR_AP_SYS:
> +		mask = INTEGRATOR_AP_SYS_BITS;
> +		val &= ~0xFF; /* Uses 8 bits */

drivers/clk/versatile/clk-icst.c: In function ‘icst_set_rate’:
drivers/clk/versatile/clk-icst.c:185:7: warning: ‘val’ may be used uninitialized in this function [-Wuninitialized]

> +		val |= vco.v & 0xFF;
> +		if (vco.v & 0x100)
> +			pr_err("ICST error: tried to set bit 8 of VDW\n");
> +		if (vco.s != 3)
> +			pr_err("ICST error: tried to use VOD != 1\n");
> +		if (vco.r != 46)
> +			pr_err("ICST error: tried to use RDW != 22\n");
> +		break;
>  	case ICST_INTEGRATOR_CP_CM_CORE:
>  		mask = INTEGRATOR_CP_CM_CORE_BITS; /* Uses 12 bits */
>  		val = (vco.v & 0xFF) | vco.s << 8;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
