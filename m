Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889EDC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiKDVU3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiKDVU0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:20:26 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7971D6157
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:20:24 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z18so9414271edb.9
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QTwUc+0ABT8lOPURWsE/s9ly5zaIlAKdIt/YceCmhQ=;
        b=sEnF3YX4EcoAUBMUyeDyVfLosYH3BYj7B6VqrIOMYXz8EDWozXHKPUwhMkPdBk7sS6
         SOW41dYxcU89gzuun0Th6UTunJkmuKNMiqklptTO/0IPd1jX8WltBawz/ri4/mHtF9+/
         YcA6DjPb0aMLnJCmwSnAcN9MXG81qbBlleSORP70HBCV7NVkmucWkPRO29REZpZqD7s5
         BV0kWzq7zzHTXc8p/qnvwBnhuu+Zn/RQYJf0Kp5tYl2rYn62Lt57qK6R+vXYptvxQ7CF
         jO7+bYD6dnqWBfQZ9zRqlGuoVgt0eWEyhbOTPzwHSNnw7QMD6j64lTwwabJW+FRNoIhY
         A1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QTwUc+0ABT8lOPURWsE/s9ly5zaIlAKdIt/YceCmhQ=;
        b=0JTRAPr5qEtfbAaYndCha7+VOs7vnb/ivC7zbTAIbJdTDxKzPnxPGSf74XR55/n28j
         Qt5EL/THX4Vav3vL7k9vKma03ankwo3diX0EDK6nPGBjIDz1b64NYjpS+TaGm2Q/1LvZ
         5kA/xdZqcF05gQo+DkYzdzi6IV8Oekc9tfMjfA66VhrVjxygiFeaxwpr0gy4a9Ss3rkO
         vHKo79WejQblQeOKKtdQ7GQ22CxmM9dXdVrcEi1vwjYDFlvLtYEw9oghiW9/QbYMQJ2G
         7MrX0cEVE/elmJvIEBpJcJvkaJXxVc+Rnw1XQPMZn5+535eD4G2zE05ICQ9XzaXDiavI
         pUQQ==
X-Gm-Message-State: ACrzQf19zIdlrEuDQWYiipshUE3FTKIHXXxjAEw5Y0Es1W+HxLiZ+T+e
        hawe0Rj1SY8oZr1hHSqS5uW0xg==
X-Google-Smtp-Source: AMsMyM6knLELqNXPYiiLeFeRLblm3n6bNbMnYtHpkrvKA7sqvcELgfpIB6jE4Ca3nqc0lS90XIW87A==
X-Received: by 2002:a05:6402:4505:b0:451:1551:7b14 with SMTP id ez5-20020a056402450500b0045115517b14mr16529382edb.300.1667596823030;
        Fri, 04 Nov 2022 14:20:23 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id ca12-20020a170906a3cc00b0079800b81709sm11533ejb.219.2022.11.04.14.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:20:22 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:20:21 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/6] clk: imx93: unmap anatop base in error handling path
Message-ID: <Y2WCFSGLNN1Rt9UZ@linaro.org>
References: <20221028095211.2598312-1-peng.fan@oss.nxp.com>
 <20221028095211.2598312-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028095211.2598312-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-28 17:52:06, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The anatop base is not unmapped during error handling path, fix it.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 99cff1fd108b..9ef3fcbdd951 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -258,7 +258,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const struct imx93_clk_root *root;
>  	const struct imx93_clk_ccgr *ccgr;
> -	void __iomem *base = NULL;
> +	void __iomem *base, *anatop_base;
>  	int i, ret;
>  
>  	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
> @@ -285,20 +285,22 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  								    "sys_pll_pfd2", 1, 2);
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx93-anatop");
> -	base = of_iomap(np, 0);
> +	anatop_base = of_iomap(np, 0);
>  	of_node_put(np);
> -	if (WARN_ON(!base))
> +	if (WARN_ON(!anatop_base))
>  		return -ENOMEM;
>  
> -	clks[IMX93_CLK_AUDIO_PLL] = imx_clk_fracn_gppll("audio_pll", "osc_24m", base + 0x1200,
> +	clks[IMX93_CLK_AUDIO_PLL] = imx_clk_fracn_gppll("audio_pll", "osc_24m", anatop_base + 0x1200,
>  							&imx_fracn_gppll);
> -	clks[IMX93_CLK_VIDEO_PLL] = imx_clk_fracn_gppll("video_pll", "osc_24m", base + 0x1400,
> +	clks[IMX93_CLK_VIDEO_PLL] = imx_clk_fracn_gppll("video_pll", "osc_24m", anatop_base + 0x1400,
>  							&imx_fracn_gppll);
>  
>  	np = dev->of_node;
>  	base = devm_platform_ioremap_resource(pdev, 0);
> -	if (WARN_ON(IS_ERR(base)))
> +	if (WARN_ON(IS_ERR(base))) {
> +		iounmap(anatop_base);
>  		return PTR_ERR(base);
> +	}
>  
>  	for (i = 0; i < ARRAY_SIZE(root_array); i++) {
>  		root = &root_array[i];
> @@ -327,6 +329,7 @@ static int imx93_clocks_probe(struct platform_device *pdev)
>  
>  unregister_hws:
>  	imx_unregister_hw_clocks(clks, IMX93_CLK_END);
> +	iounmap(anatop_base);
>  
>  	return ret;
>  }
> -- 
> 2.37.1
> 
