Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D69EE7B608
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 12:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjJDMl4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 08:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbjJDMlz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 08:41:55 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E6FC9
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 05:41:51 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-533edb5ac54so3460645a12.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696423310; x=1697028110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDhaQgPXjq3b5cu7EVRm2WZ4T3jBC6bUKmu7zNMCCx8=;
        b=rw6WeJWpXmGYix0zfK6RAFqXNStXuXxfVG2YcF76dFPRi5cb8ZFTyE9U7+qiHVpJvW
         zI1s3X3CjBsBENP546mTNJuAdT8gEv0SKNWyUSBcAoiR+6qd7ss1VbwJnByzJQWfJYhn
         XfUZxpgzYtIm1dCK9zygS0ZzOsZlWRMVCtJ4XZnAokGmFKWhXrYnEFVL8nBzArWC0oai
         tZK9DFfaPqo8AQV1kqdhybhvxHPjGonloyl5mPUh+Ah3kURgmws4PvVEp9rbvY5iBUSc
         87xwLArBDYCXj9vqNZ3eOA8ti9A59+LYnidG/sN4Ea78tjwonYbGrT3WEQ08N4ud2F1v
         qUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696423310; x=1697028110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDhaQgPXjq3b5cu7EVRm2WZ4T3jBC6bUKmu7zNMCCx8=;
        b=Xx1sWGqF4SjTowSr7ZHpHdcz1X99BK7XKGfOMuwt2hV01UEqGglGs89B6XmEBsM/MZ
         C1sZu6fW9/ascC1uoXWchSOSG6gQ5/WVrSuMlYCOArieZrFbsvZt5lC4XSBijNKkXXfK
         7grdmuOTu+dTvvwjsSKeOsJY0QXAjbQur9hN6lyUpzBq124WjC1ZN/AOFfcDZa+5rDH9
         Gmrwjo5JbCe4aarAM9xXFAWBfNZ5qXmtrcm9ozgxq66KG+Xus0jx91gg59dE1gz5kG5L
         W5BwY8yV+PA/36kHjiDlZwtkOz39y7RouLmW7NdygFq45SBtL4fGMxO464NuTvw7kxB7
         fmjg==
X-Gm-Message-State: AOJu0YzvKrMLsZh4CMByXye+qdIDKIDBswYqBAa2VfKv6OKnhastYyOO
        ccMhsG+GzdVILrwcPDPGqJBPpA==
X-Google-Smtp-Source: AGHT+IGUSjewbg+oyz2vcruD1eShmUAeujLqL60+TMBOMCitcBwDvAQiZBU1TYfRnaDbo6ITIu+Kxw==
X-Received: by 2002:a05:6402:60c:b0:531:35c4:8ca2 with SMTP id n12-20020a056402060c00b0053135c48ca2mr1578047edv.42.1696423309955;
        Wed, 04 Oct 2023 05:41:49 -0700 (PDT)
Received: from linaro.org ([86.123.99.172])
        by smtp.gmail.com with ESMTPSA id c11-20020aa7df0b000000b00533dd4d2947sm2401974edy.74.2023.10.04.05.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 05:41:49 -0700 (PDT)
Date:   Wed, 4 Oct 2023 15:41:48 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH RESEND v4] clk: imx: imx6sx: Allow a different LCDIF1
 clock parent
Message-ID: <ZR1djK5ODzQ9IpD0@linaro.org>
References: <20231004123458.2251635-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004123458.2251635-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-10-04 09:34:58, Fabio Estevam wrote:
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
> Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

I applied already the first v4 you sent.

https://lore.kernel.org/all/169642294508.713950.12324349089481800725.b4-ty@linaro.org/

Thanks.

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
