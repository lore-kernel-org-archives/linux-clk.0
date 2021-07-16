Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CB0C12002
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jul 2021 23:29:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90C5D6024A
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jul 2021 23:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237401AbhGPXcV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jul 2021 19:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbhGPXcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jul 2021 19:32:20 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA154C061760
        for <linux-clk@vger.kernel.org>; Fri, 16 Jul 2021 16:29:23 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t25so12804991oiw.13
        for <linux-clk@vger.kernel.org>; Fri, 16 Jul 2021 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tzkKGTKuEJ4AO7RuWIP6Ml5V9+aIjYj6bdmBWmeFESc=;
        b=Y8dsdqZTCA+DvHYDjaOshNZuT9NQs40/Dr3GSPWaO08yo1XGdsa7Nm3z1gnzo4qpL8
         7l7W7tSNkPEdEPwkI+DxIZDtbJaYr7n/fRaNqgO9JS45OcQ6fXQvQwppHas/mWJwenro
         ejFqsdIQdpM8lK9p8ApVe7gSjDkUKRqBAgpxPtYd+yyKL4P/YWBKrSfCzqyxFgkEF31A
         Fsl6mHVzxX/tb6E4SoEC+UHlVGutANmOA55l1N6shb8vaR5l6XpIcwayfR0GSmoNjXl8
         H7kJ3g383jNGlF6G0gi+ypgmANuG3Qzzm9LYpg3GEPIJIB+eY11KE1WbU8r4meVHy61f
         W/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tzkKGTKuEJ4AO7RuWIP6Ml5V9+aIjYj6bdmBWmeFESc=;
        b=EHjhxO54wvMQpYdnfCZhX71NhtkJiOf3WeO7m0Q7HgjoEjpYjwBGnR77tHMN+bEfqW
         78j1JOP79PGuUsTQVmRVoLNAINXjbb0dNsuKlLEDB+DV02bmtQlYFHzWlnmBt3GeqMu/
         VPoDBHdxWat4DDpv9Mk5mLHaTJyAAGklKVpfiuLX31uDjMHkmMZQKdV9r9704dGB+/Mz
         PqbcPiHQWJoQD9DLZvb+SqcoGp0AQgscAiybkQJkObjaI8z7AM/j68VgU2K0b3taFGpR
         0uRaCWdRG706oajK+EBq7BDSSbAFOACnUPs38nG4b+N+rXrmn7EsVdTD97+Y6XdJvDSI
         qLbQ==
X-Gm-Message-State: AOAM532dnIHkLCsXMSzPeKieZK04cfyg7SqaioPqQiJUPc6SfNWeq/lJ
        Q7a8UblyUBDpgfb/siRUOqYWmw==
X-Google-Smtp-Source: ABdhPJwx1bstetolth9pd4Gr5LGNCIrmX3IFZD2KF9tUNJMaNvXwlc6J3rKVh+SyO5bqjeRmynJ4og==
X-Received: by 2002:aca:aac9:: with SMTP id t192mr9829715oie.55.1626478162923;
        Fri, 16 Jul 2021 16:29:22 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g1sm2158767ooi.34.2021.07.16.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 16:29:22 -0700 (PDT)
Date:   Fri, 16 Jul 2021 18:29:20 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 1/2] clk: qcom: use common code for qcom_cc_probe_by_index
Message-ID: <YPIWUOw6AyFHP+QZ@yoga>
References: <20210710140130.1176657-1-dmitry.baryshkov@linaro.org>
 <20210710140130.1176657-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710140130.1176657-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 10 Jul 09:01 CDT 2021, Dmitry Baryshkov wrote:

> Rewrite qcom_cc_map and qcom_cc_probe_by_index to use (new)
> qcom_cc_map_by_index, removing code duplication and opening a way to
> have more common code in qcom_cc_map*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/common.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 60d2a78d1395..ed7c516a597a 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -69,20 +69,26 @@ int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
>  }
>  EXPORT_SYMBOL_GPL(qcom_find_src_index);
>  
> -struct regmap *
> -qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> +static struct regmap *
> +qcom_cc_map_by_index(struct platform_device *pdev, const struct qcom_cc_desc *desc, int index)
>  {
>  	void __iomem *base;
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
>  	base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(base))
>  		return ERR_CAST(base);
>  
>  	return devm_regmap_init_mmio(dev, base, desc->config);
>  }
> +
> +struct regmap *
> +qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
> +{
> +	return qcom_cc_map_by_index(pdev, desc, 0);
> +}
>  EXPORT_SYMBOL_GPL(qcom_cc_map);
>  
>  void
> @@ -313,15 +319,8 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  			   const struct qcom_cc_desc *desc)
>  {
>  	struct regmap *regmap;
> -	struct resource *res;
> -	void __iomem *base;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> -	if (IS_ERR(base))
> -		return -ENOMEM;
>  
> -	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +	regmap = qcom_cc_map_by_index(pdev, desc, index);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -- 
> 2.30.2
> 
