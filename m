Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B006C64E8A
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 13:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E65DC20855
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 13:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="REI+paNk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgK3NzK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 08:55:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:34586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgK3NzG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Nov 2020 08:55:06 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43EDD2084C;
        Mon, 30 Nov 2020 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606744465;
        bh=SFo+dD030Rr4VH/OCsfPF3+P8SWL/XdTtRWZSdtzCTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=REI+paNkmZWCiqV3O/EMvRyyN0tUeXBIVNnIIT76V4zrGG2lxAZZiFOASMnXyO1Lb
         nH4igZ7EtWUo08O6rmiSqc9A6q1enbNhXimC8CSMsYLX4K/83eVcTiipvbZGe2SmwK
         PSs3qhj/XJpPIqnw1sdqbNa49KgXTjHFK1c/AXu8=
Date:   Mon, 30 Nov 2020 21:54:19 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH 1/1] clk: imx: scu: remove the calling of device_is_bound
Message-ID: <20201130135419.GI4072@dragon>
References: <20201119114302.26263-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119114302.26263-1-aisheng.dong@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 19, 2020 at 07:43:02PM +0800, Dong Aisheng wrote:
> The device_is_bound() is unvisable to drivers when built as modules.

s/unvisable/invisible?

I fixed it up and applied the patch.

Shawn

> It's also not aimed to be used by drivers according to Greg K.H.
> Let's remove it from clk-scu driver and find another way to do proper
> driver loading sequence.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Fixes: 77d8f3068c63 ("clk: imx: scu: add two cells binding support")
> Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/clk-scu.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index d10f60e48ece..1f5518b7ab39 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -153,7 +153,6 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
>  
>  int imx_clk_scu_init(struct device_node *np)
>  {
> -	struct platform_device *pd_dev;
>  	u32 clk_cells;
>  	int ret, i;
>  
> @@ -166,17 +165,11 @@ int imx_clk_scu_init(struct device_node *np)
>  	if (clk_cells == 2) {
>  		for (i = 0; i < IMX_SC_R_LAST; i++)
>  			INIT_LIST_HEAD(&imx_scu_clks[i]);
> -		/*
> -		 * Note: SCU clock driver depends on SCU power domain to be ready
> -		 * first. As there're no power domains under scu clock node in dts,
> -		 * we can't use PROBE_DEFER automatically.
> -		 */
> +
> +		/* pd_np will be used to attach power domains later */
>  		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
> -		pd_dev = of_find_device_by_node(pd_np);
> -		if (!pd_dev || !device_is_bound(&pd_dev->dev)) {
> -			of_node_put(pd_np);
> -			return -EPROBE_DEFER;
> -		}
> +		if (!pd_np)
> +			return -EINVAL;
>  	}
>  
>  	return platform_driver_register(&imx_clk_scu_driver);
> -- 
> 2.23.0
> 
