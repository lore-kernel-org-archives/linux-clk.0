Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6495FECAAA1
	for <linux-clk@archiver.kernel.org>; Fri, 28 Oct 2022 09:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiJ1JlC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Oct 2022 05:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJ1JlA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Oct 2022 05:41:00 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50CF8F27B
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 02:40:58 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so3315743wmq.4
        for <linux-clk@vger.kernel.org>; Fri, 28 Oct 2022 02:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IoaHbcdd0bO5D9Xx87kiRfWdkfWE879RfQ7p82OtVHw=;
        b=AoMJzWxCKzhcT0z2YpBznHFFhP5FeMEC7I0WlnbN+E8ZzOB3idYzU2pXS6NgQxBhXI
         y9GQw4MSZ6ObhOd+lPjR0voqFY+R+eJnP3mWJptv4H8UuBhnEKa3dNCo/eoxubdFClF0
         OrdeytK2Nlc2r5Q94E6TwY/8bMqOSCEjA8LOdz5N0webcOs50uNPxLay8tIfFIA/YnTZ
         324QRiIaYfDODM6hjTfTFalBhPuw4Bd0pftZPOAC+vCqykwFEBl/HbSWRAuqx42fJ0i8
         ihL9xK/drPhE8bt86GajiXwBbDdJUwgCwL2l49QTwyLapcSKisXoXDdLEUgrkxxyiE99
         Z62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoaHbcdd0bO5D9Xx87kiRfWdkfWE879RfQ7p82OtVHw=;
        b=f/DqTBo5T+TAgo5xLbkrTYPURw3jMipygGGZVHufclXCW98y6RuADP6bgQfxCxeCoD
         XEuaU+7QMcQf0m2IDIaJ03/kq3mJipfF+7pYDIpuEd7dCzHQ4vlklmpzt73nFJ1i2a61
         dffLEJETYdnaXiiVY1SXyFligTfxp9hTcg83utntN8jYp9+fLrN9qZYZ2gmpsn4s1vz/
         Pzgv14EDoKjOtTrSsuRK7vaaX2o/0ffXDJzMxNEXjCP45JSo+TroLEmQv8yLUOAeKbjj
         8QvyVhDbwxaxrdC0QL0ckXl1wPlA7FF7b8eUl0QIx+ZFuV4oJvnl4GgGYD3iN1jMhDQ9
         yfsg==
X-Gm-Message-State: ACrzQf02roZvAb04oI/gYaSOYXjfEmMUQajD55Bj1UEWUAh5yX5sjnpl
        NHzpgrVyHYGR6swBEBTq1z9Oyg==
X-Google-Smtp-Source: AMsMyM5hPAlcmqOiqaMjH75Wyywk7fBgKIvBk5+QXvjrXmxbZSkxgTaQ76u7sDImrpmMc+rwF+jMXg==
X-Received: by 2002:adf:e649:0:b0:236:a9fa:f223 with SMTP id b9-20020adfe649000000b00236a9faf223mr20849wrn.28.1666950057509;
        Fri, 28 Oct 2022 02:40:57 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600001d200b0023647841c5bsm3132804wrx.60.2022.10.28.02.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 02:40:57 -0700 (PDT)
Date:   Fri, 28 Oct 2022 12:40:55 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     haibo.chen@nxp.com
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-clk@vger.kernel.org, linux-imx@nxp.com,
        peng.fan@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH v2] clk: imx93: correct the flexspi1 clock setting
Message-ID: <Y1ujpyt0Iwa1kMQN@linaro.org>
References: <1666589199-1199-1-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1666589199-1199-1-git-send-email-haibo.chen@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-24 13:26:39, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> Correct IMX93_CLK_FLEXSPI1_GATE CCGR setting. Otherwise the flexspi
> always can't be assigned to a parent clock when dump the clock tree.
> 
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 99cff1fd108b..40ecee3b5e78 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -170,7 +170,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
>  	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
>  	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
> -	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
> +	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
>  	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",		0x8880, },
>  	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
>  	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
> -- 
> 2.34.1
> 
