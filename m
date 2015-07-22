Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45366 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934075AbbGVAl0 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 21 Jul 2015 20:41:26 -0400
Date: Tue, 21 Jul 2015 17:41:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, heikki.krogerus@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/6] clk: fractional-divider: keep mwidth and nwidth
 internally
Message-ID: <20150722004124.GE15042@codeaurora.org>
References: <1436886723-111895-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1436886723-111895-4-git-send-email-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436886723-111895-4-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 07/14, Andy Shevchenko wrote:
> diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
> index 7cfcc56..16f42ae 100644
> --- a/drivers/clk/clk-fractional-divider.c
> +++ b/drivers/clk/clk-fractional-divider.c
> @@ -128,9 +128,11 @@ struct clk *clk_register_fractional_divider(struct device *dev,
>  
>  	fd->reg = reg;
>  	fd->mshift = mshift;
> -	fd->mmask = (BIT(mwidth) - 1) << mshift;
> +	fd->mwidth = mwidth;
> +	fd->mmask = GENMASK(mwidth - 1, 0) << mshift;
>  	fd->nshift = nshift;
> -	fd->nmask = (BIT(nwidth) - 1) << nshift;
> +	fd->nwidth = nwidth;
> +	fd->nmask = GENMASK(nwidth - 1, 0) << nshift;

Please do the shifts in the GENMASK.
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
