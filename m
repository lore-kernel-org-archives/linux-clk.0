Return-Path: <sboyd@codeaurora.org>
Date: Mon, 29 Aug 2016 10:49:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 3/3 v3] clk: versatile/icst: support for AP baseboard
 clocks
Message-ID: <20160829174940.GC19826@codeaurora.org>
References: <1472299279-27560-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1472299279-27560-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/27, Linus Walleij wrote:
> @@ -143,6 +180,16 @@ static int vco_set(struct clk_icst *icst, struct icst_vco vco)
>  		if (vco.r != 22)
>  			pr_err("ICST error: tried to use RDW != 22\n");
>  		break;
> +	case ICST_INTEGRATOR_AP_SYS:
> +		mask = INTEGRATOR_AP_SYS_BITS;
> +		val |= vco.v & 0xFF;

drivers/clk/versatile/clk-icst.c: In function ‘icst_set_rate’:
drivers/clk/versatile/clk-icst.c:185:7: warning: ‘val’ may be used uninitialized in this function [-Wuninitialized]
drivers/clk/versatile/clk-icst.c:168:6: note: ‘val’ was declared here


I assume it should just be val = instead?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
