Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7124E7B604
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbjJDMZX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjJDMZW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:25:22 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C0D93
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:25:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1877358a12.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696422317; x=1697027117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdeDcl2J03oEpZghqPYSF2m/pGOSygOBk8Fkck1NP0s=;
        b=Mxl9c8OGyvcuYECylMaHUZ2EiR4yHM/qgNE5HPMFZBPRv4Y17D17Py7xapC0kZzv7r
         aSdE1lYxXAXrjTIkGhUN4aWfVJC+CZFqO22THnncgruIkjt58XEB9KbZGG4ni0karkFu
         CiyLYMf+XZl/akYwVTShUccBLcY0vqgB5jK5p42/HFqd3Br4lF6LG12mUqozweNJCJaU
         LN7vwFMBq0K8UdSFrEMc/tB3w01ElNBBDzSaWTeycs/Vqv0NjwOwAGQlj98pYRxvwyLd
         iJqGu9SWQy32ToDrTbC7L6XCpWjxpTcG5iVyuGHUopXbCJnHZjYCj1P7B8Cgh6wu4bHg
         pOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696422317; x=1697027117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdeDcl2J03oEpZghqPYSF2m/pGOSygOBk8Fkck1NP0s=;
        b=KQSn08UstGiyd205VChjjFB2/0ktLljPjtY7RFzRWU6e5sQIoc3lrGsoikM+oRUAWu
         udbMAmc2uPTppN+osU6EKztiJDhuJyI2vy3JJHB6wBsTtmLhYPenHFfSLFNN8Dp2TUih
         7GLmHhNy00b6LLzUQHEQDQ25l5ixGDeCmla2j9/j7jTRQM7RZagW8bNcFPQK/PZCCgdy
         lMfOgjlV0sKufkb20Fj7L72U+hA98/j4ct4UJmbbmDiwOvDzx0ZaVo3cpcbyO7qWpp3r
         +aQTImjYzmhM0UfSlYXO0wkZi30doC3OEpyNMOhrZEyRU1tsBz8pczswOm9qSjyp/yT/
         /nhw==
X-Gm-Message-State: AOJu0Yxnx0Jw1D7aq7kZn1rpKxglRNWoumOYEcjGuDho6FPtDwGyKKJJ
        1Dp5iHiQ2MDbcoddqk6x8zvgOQ==
X-Google-Smtp-Source: AGHT+IHH0vHfItneFFPxfPXRjJNbwZz1zWL79XVeFhJoQxZw+3A44RTVk56EgRG9hGqIX0bp3fKT6Q==
X-Received: by 2002:a17:906:191:b0:9b6:3be9:a8f with SMTP id 17-20020a170906019100b009b63be90a8fmr1843236ejb.20.1696422317105;
        Wed, 04 Oct 2023 05:25:17 -0700 (PDT)
Received: from linaro.org ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id a16-20020a1709064a5000b009b27d4153c0sm2787131ejv.178.2023.10.04.05.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:25:16 -0700 (PDT)
Date:   Wed, 4 Oct 2023 15:25:15 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     abelvesa@kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v4] clk: imx: imx6sx: Allow a different LCDIF1 clock
 parent
Message-ID: <ZR1ZqxgUy5VE7zhC@linaro.org>
References: <20230815130923.775117-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815130923.775117-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-08-15 10:09:23, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> It is not a good idea to hardcode the LCDIF1 parent inside the
> clock driver because some users may want to use a different clock
> parent for LCDIF1. One of the reasons could be related to EMI tests.
> 
> Remove the harcoded LCDIF1 parent when the LCDIF1 parent is described
> via devicetree.
> 
> Old dtb's that do not describe the LCDIF1 parent via devicetree will
> use the same PLL5 clock as parent to keep the original behavior.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Sorry, this hasn't made it to my clk-imx inbox due to linux-imx ML not
being CC'ed. My clk-imx inbox filters on my kernel.org email, the linux-clk
ML and the linux-imx ML.

Please use get_maintainer.pl script since that will also point to Peng Fan
who is a reviewer.

Patch looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Changes since v3:
> - Check for the presence of 'assigned-clock-parents'. (Stephen)
> 
>  drivers/clk/imx/clk-imx6sx.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 3f1502933e59..69f8f6f9ca49 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -121,6 +121,7 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  {
>  	struct device_node *np;
>  	void __iomem *base;
> +	bool lcdif1_assigned_clk;
>  
>  	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
>  					  IMX6SX_CLK_CLK_END), GFP_KERNEL);
> @@ -498,9 +499,16 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	clk_set_parent(hws[IMX6SX_CLK_EIM_SLOW_SEL]->clk, hws[IMX6SX_CLK_PLL2_PFD2]->clk);
>  	clk_set_rate(hws[IMX6SX_CLK_EIM_SLOW]->clk, 132000000);
>  
> -	/* set parent clock for LCDIF1 pixel clock */
> -	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk, hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
> -	clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk, hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
> +	np = of_find_node_by_path("/soc/bus@2200000/spba-bus@2240000/lcdif@2220000");
> +	lcdif1_assigned_clk = of_find_property(np, "assigned-clock-parents", NULL);
> +
> +	/* Set parent clock for LCDIF1 pixel clock if not done via devicetree */
> +	if (!lcdif1_assigned_clk) {
> +		clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk,
> +			       hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
> +		clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk,
> +			       hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
> +	}
>  
>  	/* Set the parent clks of PCIe lvds1 and pcie_axi to be pcie ref, axi */
>  	if (clk_set_parent(hws[IMX6SX_CLK_LVDS1_SEL]->clk, hws[IMX6SX_CLK_PCIE_REF_125M]->clk))
> -- 
> 2.34.1
> 
> 
