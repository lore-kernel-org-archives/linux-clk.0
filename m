Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D307EC77B61
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 14:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjDIOJe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 10:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjDIOJd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 10:09:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F1410A
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 07:09:29 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sb12so6916693ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681049369; x=1683641369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QC/+02Fx1bZjSkOiyg9i0tDZlYd8mwmfGVMqDc10Bc=;
        b=x1SBAshYQNO02+4XIJDsBjHGqiSqxyggmv5imncBX+Z4oyhCo3o3rRlKy6ckIu84q6
         g9jlrQ/gHSBMkT+JdPr72SuIe0BhooUH6n2xDGyLtGjcaHz1S3mDZWYaldiQttLTyJKv
         V4K7rTAA6DHfiH+sOZnQCb12epmR9QchOFeFnvgMAXYXn8x2KLT1jVZBrULc74yk/mFd
         9fd54KV6jdJz7Q0iwJi6b0t1ZQpl97jtwRNtJ9hRDTULsVOvWtHIdbYGbImR1eqwJHMZ
         ZsRHl7LXa0yHkaWV5O9og7Q63daSaYx0HIFo+4iqbcI3iHpx4N+sSw2Kk9g2r8JSJSeN
         QnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681049369; x=1683641369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QC/+02Fx1bZjSkOiyg9i0tDZlYd8mwmfGVMqDc10Bc=;
        b=sTzmu0R9Hy/9pqCEmwfEaXKsD3Ln1FFun6BaAQcgUMNVUVyZ8B7WEBmru99/jQvLhl
         hx4o4ccwqMf8ZMVee2RdLaC6UFONfz37oTkjH1+LVYdlKFyr/1ZYsa+kqNzwZK27YoR9
         JUTDgltYxT9H6Jkl+JIgNOzkj7cMgcIfxn0tKILCQ3it8RVAB35VUvujZfsPJCdRkHes
         7cvml6FinzI0sOt9bUhGOqUrrqpoHBwxGQeh6xGf+EHVZmeLlEpybiVzmRtXOghU+b0c
         CZNUEsmbtIiqkICuaJJcHqOxAtF4PLKnBHrHXoy+8savU8DC0lZ3X7i33P+GIpzlssfV
         ePJg==
X-Gm-Message-State: AAQBX9eM+fNV9kccb9cX8hOHdpQs2DzddRaJQ0tgRB6+T9tknrIkrRe+
        eIBdmm1CXWHcY75gxQNhiHxqQw==
X-Google-Smtp-Source: AKy350aJoM9h5ui0mcPGw4CFuh/uYp1HEIXFFDYRxxO+bcpHzaMMsaRTVvl3HF7xMdWdl6S44Q76Bw==
X-Received: by 2002:a17:907:8814:b0:94a:87d6:d39e with SMTP id ro20-20020a170907881400b0094a87d6d39emr430353ejc.58.1681049369395;
        Sun, 09 Apr 2023 07:09:29 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id d24-20020a50f698000000b0050299cebf6esm3923724edn.54.2023.04.09.07.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 07:09:28 -0700 (PDT)
Date:   Sun, 9 Apr 2023 17:09:27 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
        Ye Li <ye.li@nxp.com>
Subject: Re: [PATCH 1/5] clk: imx: imx8ulp: Fix XBAR_DIVBUS and AD_SLOW clock
 parents
Message-ID: <ZDLHF6VP232yKsCx@linaro.org>
References: <20230331063814.2462059-1-peng.fan@oss.nxp.com>
 <20230331063814.2462059-2-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331063814.2462059-2-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-31 14:38:10, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> XBAR_DIVBUS and AD_SLOW should set parent to XBAR_AD_DIVPLAT and
> XBAR_DIVBUS respectively, not the NIC_AD. otherwise we will get
> wrong clock rate.
> 
> Fixes: c43a801a5789 ("clk: imx: Add clock driver for imx8ulp")
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8ulp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
> index a07df3b44703..89121037a8f0 100644
> --- a/drivers/clk/imx/clk-imx8ulp.c
> +++ b/drivers/clk/imx/clk-imx8ulp.c
> @@ -200,8 +200,8 @@ static int imx8ulp_clk_cgc1_init(struct platform_device *pdev)
>  	clks[IMX8ULP_CLK_NIC_AD_DIVPLAT] = imx_clk_hw_divider_flags("nic_ad_divplat", "nic_sel", base + 0x34, 21, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
>  	clks[IMX8ULP_CLK_NIC_PER_DIVPLAT] = imx_clk_hw_divider_flags("nic_per_divplat", "nic_ad_divplat", base + 0x34, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
>  	clks[IMX8ULP_CLK_XBAR_AD_DIVPLAT] = imx_clk_hw_divider_flags("xbar_ad_divplat", "nic_ad_divplat", base + 0x38, 14, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> -	clks[IMX8ULP_CLK_XBAR_DIVBUS] = imx_clk_hw_divider_flags("xbar_divbus", "nic_ad_divplat", base + 0x38, 7, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> -	clks[IMX8ULP_CLK_XBAR_AD_SLOW] = imx_clk_hw_divider_flags("xbar_ad_slow", "nic_ad_divplat", base + 0x38, 0, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> +	clks[IMX8ULP_CLK_XBAR_DIVBUS] = imx_clk_hw_divider_flags("xbar_divbus", "xbar_ad_divplat", base + 0x38, 7, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> +	clks[IMX8ULP_CLK_XBAR_AD_SLOW] = imx_clk_hw_divider_flags("xbar_ad_slow", "xbar_divbus", base + 0x38, 0, 6, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
>  
>  	clks[IMX8ULP_CLK_SOSC_DIV1_GATE] = imx_clk_hw_gate_dis("sosc_div1_gate", "sosc", base + 0x108, 7);
>  	clks[IMX8ULP_CLK_SOSC_DIV2_GATE] = imx_clk_hw_gate_dis("sosc_div2_gate", "sosc", base + 0x108, 15);
> -- 
> 2.37.1
> 
