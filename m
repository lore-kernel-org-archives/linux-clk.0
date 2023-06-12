Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D10EC7EE2E
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 08:24:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjFLIYP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjFLIX7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:23:59 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2554D114
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:23:49 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f736e0c9b1so42109115e9.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558227; x=1689150227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3syFK18W0x1MXZeXQYRchVrFaPqAMr+pqA7DuRcsYMA=;
        b=ylTAA8QlrBqMuraIbm1w7bKvtYTyva4XcKAYVkJWL9v2NSi6BuH0RwJtMXZllapArk
         C+wTtynfpchd648WB6+TWK7SGU8Vi8o2VJ8rPKTwdwVz/FKg49th3RtCE4YD63n38JUF
         VbE6Fn4AFfviuqGRWiWcTmlfY3bychJtBtcbWxkgMuYscw5daM8ckZgGC3ub9xcLuqUW
         WZ4P1CyYMUQI5DTiRoSe5lYPbkR16yW8VI17lbH4s6V/w012JmV2M/1XOxcK5Cqa17QZ
         rJg3kNeiPf3Ko3hRftQrrS1FwIju8d9sPI0SayMtrcBvXxTaTXvK8Km7MxfHPDIukxmi
         HR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558227; x=1689150227;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3syFK18W0x1MXZeXQYRchVrFaPqAMr+pqA7DuRcsYMA=;
        b=kB0GsztZPGe505xL2UpNEbRKwNkZaaGFaSXPccc/8CN2d1JpqEYWM9sEHDMrrL9UD9
         L1J8Nmj+Al8GtaUwjgPZol5P0ad3+Dy+mR+6h+fWGmQ4w6MY9fwJi+HRDn9GQahRfjNq
         tGmhxF3bP0dtQzUQ8Gz0tnLLXE4DXVBFlwG/HaeFYBEqBJgjeKH+TJDyEXRPhtupYvjD
         i+00OO8SoXFidEcrxf5E0rAyCn3ur3cHp0pBimsPRRpq1VPoY1YQxklv6ihn7dCxUvJA
         Eqjg8oHqXXwDmQcenngw1Rwl0gRxNE3PYWzmUd21DCEeFDEzY/fFVJu5q+NtkCSIwMOk
         r9+A==
X-Gm-Message-State: AC+VfDwWeaZOOQsRgiReLhCtMw6NGWNEGgBp8koI49Lo466fFdoZMHpQ
        BQzHpNwKAKK7rC/tkoHFhq3MaQ==
X-Google-Smtp-Source: ACHHUZ6Ynod2i9gs6NbQKZFbzx3ODJoQ+VZ1ZQXuEQh4aOJesHajKIm1t1uIdfbd6P2o8CDLR1ZEPw==
X-Received: by 2002:a5d:522b:0:b0:30f:c1f5:e91e with SMTP id i11-20020a5d522b000000b0030fc1f5e91emr1390141wra.27.1686558227544;
        Mon, 12 Jun 2023 01:23:47 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm11655199wrr.21.2023.06.12.01.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:23:47 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:23:45 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Zhanhao Hu <zero12113@hust.edu.cn>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        hust-os-kernel-patches@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx93: fix memory leak and missing unwind goto
 in imx93_clocks_probe
Message-ID: <ZIbWEW7MNCaqXq+k@linaro.org>
References: <20230601033825.336558-1-zero12113@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601033825.336558-1-zero12113@hust.edu.cn>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-06-01 03:38:25, Zhanhao Hu wrote:
> In function probe(), it returns directly without unregistered hws
> when error occurs.
> 
> Fix this by adding 'goto unregister_hws;' on line 295 and
> line 310.
> 
> Use devm_kzalloc() instead of kzalloc() to automatically
> free the memory using devm_kfree() when error occurs.
> 
> Replace of_iomap() with devm_of_iomap() to automatically
> handle the unused ioremap region and delete 'iounmap(anatop_base);'
> in unregister_hws.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Signed-off-by: Zhanhao Hu <zero12113@hust.edu.cn>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> V1 -> V2 : Rephrase commit message in imperative mood.
> This issue is found by static analysis and remains untested.
> ---
>  drivers/clk/imx/clk-imx93.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 07b4a043e449..b6c7c2725906 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -264,7 +264,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  	void __iomem *base, *anatop_base;
>  	int i, ret;
>  
> -	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
> +	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
>  					  IMX93_CLK_END), GFP_KERNEL);
>  	if (!clk_hw_data)
>  		return -ENOMEM;
> @@ -288,10 +288,12 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  								    "sys_pll_pfd2", 1, 2);
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx93-anatop");
> -	anatop_base = of_iomap(np, 0);
> +	anatop_base = devm_of_iomap(dev, np, 0, NULL);
>  	of_node_put(np);
> -	if (WARN_ON(!anatop_base))
> -		return -ENOMEM;
> +	if (WARN_ON(IS_ERR(anatop_base))) {
> +		ret = PTR_ERR(base);
> +		goto unregister_hws;
> +	}
>  
>  	clks[IMX93_CLK_ARM_PLL] = imx_clk_fracn_gppll_integer("arm_pll", "osc_24m",
>  							      anatop_base + 0x1000,
> @@ -304,8 +306,8 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (WARN_ON(IS_ERR(base))) {
> -		iounmap(anatop_base);
> -		return PTR_ERR(base);
> +		ret = PTR_ERR(base);
> +		goto unregister_hws;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(root_array); i++) {
> @@ -345,7 +347,6 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  
>  unregister_hws:
>  	imx_unregister_hw_clocks(clks, IMX93_CLK_END);
> -	iounmap(anatop_base);
>  
>  	return ret;
>  }
> -- 
> 2.34.1
> 
