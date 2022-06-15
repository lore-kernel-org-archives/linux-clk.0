Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0502CC43334
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 21:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348112AbiFOVbU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 17:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347897AbiFOVbT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 17:31:19 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EBA4924D
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:31:18 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id z9so6965812wmf.3
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 14:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PWQqPKxOxtv4J9xv4cvobO/vpU+8KrA8C1H4sxLvuhQ=;
        b=FBp6H8DpGdfk4fNbg4lrErCXTZPm8BhHNpDqri17Hlr6q9YFvwQwldWdp/OpiD1cHt
         /QbDDv52ylDyECsQSeVqX8/sw+upz3GZFrX0H6dZNlWPtY1ZmDuosxO49TrwvsSigK3W
         vGByGSc7jEzgNbDDD7vkcxZ6r8svQyrKqogAhSTV9Xh+LUdX6BFWVNgulUCislkxCZ27
         k3Gw2gsHWwMyQQvFHs/3t/Ircm5dH34HL2gIoMvhS9tM6dxVymF4O8/3p7XRYPJ6KMJj
         LeU+5OYEIg+PlM6t/Ww2w1/gbmF91+Kzy5TOEDESRbPeIGqOPvQ0l9+bzwhTZiVKUoy1
         VaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PWQqPKxOxtv4J9xv4cvobO/vpU+8KrA8C1H4sxLvuhQ=;
        b=APONgr6MvC0tSdKc0PrDSH+QMImQwCobekvb9a9SGWgxrUhgr81pRKmfhvuQCN/DBs
         qDp3iyjlPKGQDm0YvfCDERWdAR2/PYl2j8+im/0XrnRzRIeE7Hv+JK7TRt9u3uHRdmc9
         XcFjtWvwcLOEawzmQCLR82iuJthgfC8KZJLuOHgqOc6zm6i4WAYPJDTEBnRee5CRexVc
         M0XP8Hhupdxr1iYYsNKCUvlsqO6KTWyFV0ozbrozgyugjnh3vUuqAd+zMn7PCZj5unGI
         3xxFMSqe7KU9QosMeoCv+LII2+IjDDBohOEltkeU5dZUtOfAZbj0azuqJbvH6dL/WKo+
         21cw==
X-Gm-Message-State: AOAM531L6WTGoqtrfFb5vicUrOW5LncN8DBpSLh8t14mZ6ZrchyBjYSj
        iXGOqentKp6GWa1d8rZe+Lv/Kw==
X-Google-Smtp-Source: ABdhPJzlOWFd61/jYRSMQxybLDRP5lCisELKeYL5JbjqhGfCjHdeN2uo3+wKDFG7Pabuvgusx2qWMA==
X-Received: by 2002:a1c:4682:0:b0:39c:4459:6a84 with SMTP id t124-20020a1c4682000000b0039c44596a84mr11946770wma.167.1655328677206;
        Wed, 15 Jun 2022 14:31:17 -0700 (PDT)
Received: from ryzen ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id i2-20020adff302000000b002183cf9cd69sm74869wro.15.2022.06.15.14.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:31:16 -0700 (PDT)
Date:   Thu, 16 Jun 2022 00:31:15 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Haibo Chen <haibo.chen@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH 1/7] clk: imx93: use adc_root as the parent clock of adc1
Message-ID: <YqpPowp9SZhL9Rww@ryzen>
References: <20220609132902.3504651-1-peng.fan@oss.nxp.com>
 <20220609132902.3504651-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609132902.3504651-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-06-09 21:28:56, Peng Fan (OSS) wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> When debug, find after system boot up, all adc register operation
> will trigger system hang, this is because the internal adc ipg
> clock is gate off. In dts, only reference the IMX93_CLK_ADC1_GATE,
> which is adc1, no one touch the adc_root, so adc_root will be gate
> off automatically after system boot up.
>
> Fixes: 24defbe194b6 ("clk: imx: add i.MX93 clk")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index edcc87661d1f..172cd56c9610 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -150,7 +150,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_A55_GATE,		"a55",		"a55_root",		0x8000, },
>  	/* M33 critical clk for system run */
>  	{ IMX93_CLK_CM33_GATE,		"cm33",		"m33_root",		0x8040, CLK_IS_CRITICAL },
> -	{ IMX93_CLK_ADC1_GATE,		"adc1",		"osc_24m",		0x82c0, },
> +	{ IMX93_CLK_ADC1_GATE,		"adc1",		"adc_root",		0x82c0, },
>  	{ IMX93_CLK_WDOG1_GATE,		"wdog1",	"osc_24m",		0x8300, },
>  	{ IMX93_CLK_WDOG2_GATE,		"wdog2",	"osc_24m",		0x8340, },
>  	{ IMX93_CLK_WDOG3_GATE,		"wdog3",	"osc_24m",		0x8380, },
> --
> 2.25.1
>
