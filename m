Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA0DC7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 10:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbjERKAG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 06:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjERKAF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 06:00:05 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EA0E54
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:00:02 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30636edb493so695738f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684404001; x=1686996001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lV65uYDNQ5TvvWuRiVgzk+2JrT6t7043/Z81uTK4Qgw=;
        b=S4tS8G0e8AYQZqd60BQHBTw5RH3TNQuqfN0rgaezi4S/A2jen5dchewfpQI5CKO5SN
         cFfDiOcTZJ3jm8j7SJd5DHrMSPw/RlTw35hRtsNT5T1EbLJgy9IcErc8XGrUj86P022B
         2BWQx3XvN1sMMqf3NxtqSihyuKs7xp/ZPzxkqgiw7YnVwKjLvMl9U43g1wH6q0/tU15b
         +glkx6S0/FQissy0rMe4NUgDS332uenr5JXZ0ThNAZcRtnOQrgzDJGVAhkdzWhzkg+NK
         Sz5Mwf1okQqMRycUfN4UHLIO34Vh0YneXsOf81oGQf8VW5UeqFc7L8zMVu256trDZjnR
         OMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684404001; x=1686996001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV65uYDNQ5TvvWuRiVgzk+2JrT6t7043/Z81uTK4Qgw=;
        b=XOIGfOpUhauM7K7tG+aWy2Ymf8+4THjUsehn8I/hv+uTJ/RwLz7PyEt9K8nyKe+Idl
         S0ifULv29ZP1As9qKjehHz11NcOaYMQM9n8j2UV3t66qq0+V3y3dOKXcYb/l0NX6/yHM
         QtnGSfpz0jk4DKrH+wS5Qp+F7PJq5XG7IHM22yJMdOTlaw6CWbXxyUDQRJB/IxvYbXju
         fSc3q7/LRojdHvrdu9YKqR3mskOhsdaEY7ABFKjjfHkwQWckl58X1obnxt6YH2fF9wwZ
         1ciBJZeRllbrmHxxg8cayjiA/sA+5kfCzInZYOV1gIHddOhhf6aBLvPiZ9ho8YrZa3YY
         nT9w==
X-Gm-Message-State: AC+VfDznB5o+0MPaPmoqIueA/1Pngo0br6+QvWbi+ZX0CsyuyR885ng6
        10EiqO3AUvpIdRn7cXVrUxZ+0g==
X-Google-Smtp-Source: ACHHUZ44D3lPYnhh32GvMyacH177ZLl1QoNRmF54oFzPZX4K0iCQBGnVV8OgelQRrE+L+kMlgevhIA==
X-Received: by 2002:a5d:61c7:0:b0:306:3163:2b76 with SMTP id q7-20020a5d61c7000000b0030631632b76mr1090301wrv.15.1684404001294;
        Thu, 18 May 2023 03:00:01 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id k14-20020adff5ce000000b003062c0ef959sm1629961wrp.69.2023.05.18.03.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 03:00:00 -0700 (PDT)
Date:   Thu, 18 May 2023 12:59:59 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     abelvesa@kernel.org, sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] clk: imx: imx6sx: Remove CLK_SET_RATE_PARENT from the
 LDB clocks
Message-ID: <ZGX3Hw29uJTRDBcI@linaro.org>
References: <20230416150004.16834-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416150004.16834-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-16 12:00:04, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX6SX, it is common to use the LDB and LCDIF with the same
> parent clock, such as the IMX6SX_CLK_PLL5_VIDEO_DIV, for example.
> 
> Due to the CLK_SET_RATE_PARENT flag, the LDB clock would try to set the
> clock parent rate, which can mess with the required clock rate calculated
> from the eLCDIF driver.
> 
> To prevent this problem, remove the CLK_SET_RATE_PARENT flag from the
> LDB clocks, so that a correct clock relationship can be achieved.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Looks good to me.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

This has missed my inbox as I filter on linux-imx email, which you
forgot to CC. Please do that next time.

> ---
>  drivers/clk/imx/clk-imx6sx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 7cf86707bc39..3f1502933e59 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -302,10 +302,10 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6SX_CLK_CKO2_SEL]           = imx_clk_hw_mux("cko2_sel",         base + 0x60,  16,     5,      cko2_sels,         ARRAY_SIZE(cko2_sels));
>  	hws[IMX6SX_CLK_CKO]                = imx_clk_hw_mux("cko",              base + 0x60,  8,      1,      cko_sels,          ARRAY_SIZE(cko_sels));
>  
> -	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels), CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux_flags("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels), CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux_flags("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels),    CLK_SET_RATE_PARENT);
> -	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux_flags("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels),    CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_LDB_DI1_DIV_SEL]    = imx_clk_hw_mux("ldb_di1_div_sel", base + 0x20, 11, 1, ldb_di1_div_sels, ARRAY_SIZE(ldb_di1_div_sels));
> +	hws[IMX6SX_CLK_LDB_DI0_DIV_SEL]    = imx_clk_hw_mux("ldb_di0_div_sel", base + 0x20, 10, 1, ldb_di0_div_sels, ARRAY_SIZE(ldb_di0_div_sels));
> +	hws[IMX6SX_CLK_LDB_DI1_SEL]        = imx_clk_hw_mux("ldb_di1_sel",     base + 0x2c, 12, 3, ldb_di1_sels,      ARRAY_SIZE(ldb_di1_sels));
> +	hws[IMX6SX_CLK_LDB_DI0_SEL]        = imx_clk_hw_mux("ldb_di0_sel",     base + 0x2c, 9,  3, ldb_di0_sels,      ARRAY_SIZE(ldb_di0_sels));
>  	hws[IMX6SX_CLK_LCDIF1_PRE_SEL]     = imx_clk_hw_mux_flags("lcdif1_pre_sel",  base + 0x38, 15, 3, lcdif1_pre_sels,   ARRAY_SIZE(lcdif1_pre_sels), CLK_SET_RATE_PARENT);
>  	hws[IMX6SX_CLK_LCDIF1_SEL]         = imx_clk_hw_mux_flags("lcdif1_sel",      base + 0x38, 9,  3, lcdif1_sels,       ARRAY_SIZE(lcdif1_sels),     CLK_SET_RATE_PARENT);
>  
> -- 
> 2.34.1
> 
