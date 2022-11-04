Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445D1C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  4 Nov 2022 21:35:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKDVfF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Nov 2022 17:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbiKDVfA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Nov 2022 17:35:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D2445EEC
        for <linux-clk@vger.kernel.org>; Fri,  4 Nov 2022 14:34:58 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id 13so16599220ejn.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Nov 2022 14:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTyGnpJ5YhorBp2JX7wEHP6ModLBzcsJYOX4pjjkkv8=;
        b=IVdVca0e2hX1TpYC1LIQhOWz8CcePRBWKp2mOy65VboXmyuzUCr64/TOKrpSuIjfRT
         fLhZvAFat5fJsMcwnKDJkzMI0RjQn8ZeH6QxSaytJRO/e7GeSiTzDpUsprHsq3MT6COR
         Q2sOcbmuzAlSNCamApFYyysmw9WaGhtdzFMbQ/k2spiy+D2bvixipJAbwaXUdfLSpNNC
         gMowjn9ngtKbS4kHXKRqUKHVtyYFcNj9sh4CLGEQYb2sRCGmyGH1W1/3MX+nzlHO2X8Z
         iveLxBYAD1hRMqQwk4EJWB3QS9uHf8wGKUR8Cx1VtTP9dEVK5IMF545NeMjeJITRdidf
         /r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTyGnpJ5YhorBp2JX7wEHP6ModLBzcsJYOX4pjjkkv8=;
        b=bTB1mxssClB50LS2CIlrIMRhEpfH/phyX3j9HiKWFTJi0LUQAZXSI1IvO7NRAcrUq8
         TMjot9qyl0fyTmYKXKX054VUwPyn/PPwZQ9srIM0UKiA2CJhZp0zXMm69BTHB0UctH7s
         F1TaHneSisM9LLr9OQ5DLJN5sITKu+o6CArwyJBoKjI8+pcOQOGzlEwuWGtIHuvLzaTq
         Y+VIDum3jRVkuUlWrWAs+PlXwO+1p6RqPgIx8+S5pt2/ijq6vSQ3oW+wLEjPo0kAxMIq
         x4znVN0Q9P9/PBP5SUrkvokLjLUt9NeKSfdyGiCCilXg96HJtUjGb3kLo7rMZE5iqYbP
         EZTA==
X-Gm-Message-State: ACrzQf25dnvh/r9MFLe4g/GqIUCJW/7nrvCICfzryAWPoYtu73Y9QAXi
        IqlVY1aUkB8mlUEVjc+KIfBgvsvVOUUVBA==
X-Google-Smtp-Source: AMsMyM4doriTv/f1TyuR0MV5FL/cmZow5KbP8C9hoA9xtXr4uU+EZet3mrduIjH1aHAIK3bsPe+KDA==
X-Received: by 2002:a17:906:ae48:b0:7ae:1723:e8c3 with SMTP id lf8-20020a170906ae4800b007ae1723e8c3mr10391205ejb.603.1667597696723;
        Fri, 04 Nov 2022 14:34:56 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id ev24-20020a056402541800b0046189948481sm273445edb.53.2022.11.04.14.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:34:56 -0700 (PDT)
Date:   Fri, 4 Nov 2022 23:34:55 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 320 MHz and 640 MHz entries for
 PLL146x
Message-ID: <Y2WFf1QOzhHHg0vE@linaro.org>
References: <20221031204838.195292-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031204838.195292-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-31 21:48:38, Marek Vasut wrote:
> The PLL146x is used to implement SYS_PLL3 on i.MX8MP and can be used
> to drive UARTn_ROOT clock. By setting the PLL3 to 320 MHz or 640 MHz,
> the PLL3 output can be divided down to supply UARTn_ROOT clock with
> precise 64 MHz, which divided down further by 16x oversampling factor
> used by the i.MX UART core yields 4 Mbdps baud base for the UART IP.
> This is useful e.g. for BCM bluetooth chips, which can operate up to
> 4 Mbdps.
> 
> Add 320 MHz and 640 MHz entries so the PLL can be configured accordingly.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> To: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-pll14xx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 1d0f79e9c3467..828336873a98f 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -54,7 +54,9 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
>  	PLL_1416X_RATE(800000000U,  200, 3, 1),
>  	PLL_1416X_RATE(750000000U,  250, 2, 2),
>  	PLL_1416X_RATE(700000000U,  350, 3, 2),
> +	PLL_1416X_RATE(640000000U,  320, 3, 2),
>  	PLL_1416X_RATE(600000000U,  300, 3, 2),
> +	PLL_1416X_RATE(320000000U,  160, 3, 2),
>  };
>  
>  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> -- 
> 2.35.1
> 
