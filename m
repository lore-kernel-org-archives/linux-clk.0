Return-Path: <sboyd@codeaurora.org>
Date: Fri, 12 Aug 2016 17:32:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 2/3] clk: versatile/icst: add Integrator core module
 clocks
Message-ID: <20160813003230.GA25111@codeaurora.org>
References: <1470820188-12888-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1470820188-12888-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/10, Linus Walleij wrote:
> @@ -281,18 +422,23 @@ static void __init of_syscon_icst_setup(struct device_node *np)
>  	if (IS_ERR(regclk)) {
>  		pr_err("error setting up syscon ICST clock %s\n", name);
>  		return;
>  	}
>  	of_clk_add_provider(np, of_clk_src_simple_get, regclk);
> -	pr_debug("registered syscon ICST clock %s\n", name);
> +	pr_info("registered syscon ICST clock %s\n", name);

This shouldn't change?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
