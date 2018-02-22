Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753054AbeBVJmi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Feb 2018 04:42:38 -0500
Date: Thu, 22 Feb 2018 17:42:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Bai Ping <ping.bai@nxp.com>
Cc: sboyd@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de,
        aisheng.dong@nxp.com, linux-imx@nxp.com, jacky.baip@gmail.com,
        fabio.estevam@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] driver: clk: imx: Add CLK_IS_CRITICAL flag for
 busy diviver and busy mux
Message-ID: <20180222094228.GK3217@dragon>
References: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1517968819-12869-1-git-send-email-ping.bai@nxp.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 07, 2018 at 10:00:16AM +0800, Bai Ping wrote:
> The busy divider and busy mux is actually used by the system critical clocks,
> so add 'CLK_IS_CRITICAL' to clocks registered with these two type.

Are there any real world issues you have seen with this CLK_IS_CRITICAL
missing from these busy clocks?

> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>

s/diviver/divider in the patch subject.

Shawn

> ---
>  drivers/clk/imx/clk-busy.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
> index 6df3389..9903652 100644
> --- a/drivers/clk/imx/clk-busy.c
> +++ b/drivers/clk/imx/clk-busy.c
> @@ -101,7 +101,7 @@ struct clk *imx_clk_busy_divider(const char *name, const char *parent_name,
>  
>  	init.name = name;
>  	init.ops = &clk_busy_divider_ops;
> -	init.flags = CLK_SET_RATE_PARENT;
> +	init.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL;
>  	init.parent_names = &parent_name;
>  	init.num_parents = 1;
>  
> @@ -175,7 +175,7 @@ struct clk *imx_clk_busy_mux(const char *name, void __iomem *reg, u8 shift,
>  
>  	init.name = name;
>  	init.ops = &clk_busy_mux_ops;
> -	init.flags = 0;
> +	init.flags = CLK_IS_CRITICAL;
>  	init.parent_names = parent_names;
>  	init.num_parents = num_parents;
>  
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
