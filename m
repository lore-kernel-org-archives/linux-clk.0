Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:36578 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751246AbbG2OJQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 29 Jul 2015 10:09:16 -0400
Message-ID: <1438178953.2339.47.camel@arm.com>
Subject: Re: [patch] clk: versatile: off by one in
 clk_sp810_timerclken_of_get()
From: Pawel Moll <pawel.moll@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Date: Wed, 29 Jul 2015 15:09:13 +0100
In-Reply-To: <20150729101705.GB12100@mwanda>
References: <20150729101705.GB12100@mwanda>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2015-07-29 at 11:17 +0100, Dan Carpenter wrote:
> The ">" should be ">=" or we end up reading beyond the end of the array.
> 
> Fixes: 6e973d2c4385 ('clk: vexpress: Add separate SP810 driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/clk/versatile/clk-sp810.c b/drivers/clk/versatile/clk-sp810.c
> index 64b0129..7fbe4d4 100644
> --- a/drivers/clk/versatile/clk-sp810.c
> +++ b/drivers/clk/versatile/clk-sp810.c
> @@ -129,8 +129,8 @@ static struct clk *clk_sp810_timerclken_of_get(struct of_phandle_args *clkspec,
>  {
>  	struct clk_sp810 *sp810 = data;
>  
> -	if (WARN_ON(clkspec->args_count != 1 || clkspec->args[0] >
> -			ARRAY_SIZE(sp810->timerclken)))
> +	if (WARN_ON(clkspec->args_count != 1 ||
> +		    clkspec->args[0] >=	ARRAY_SIZE(sp810->timerclken)))
>  		return NULL;
>  
>  	return sp810->timerclken[clkspec->args[0]].clk;

Of course.

Acked-by: Pawel Moll <pawel.moll@arm.com>

Thanks!

Pawel

