Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45338C636CD
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 09:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjAaJZJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 04:25:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbjAaJZH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 04:25:07 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7C33C27
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:25:05 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id ml19so16172655ejb.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 01:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1K2AmG/1xX3o9jCz/cl3faZV0axMHqEfr6qkYyw8x1E=;
        b=xmHbt15Y4ncVikPF/chHw9oChq8DXTeP13OhwTyPj3XaNakiYAoXuYo/HBQ2NbVwDm
         6TWtHSnFAHsVpOOm0Jo1SXWeRjyXU+W6wINfFalCPAZms6ygia9CxlriC1eQukeP6QwV
         heGiBNjXiJLGW5rIfjQ3cwpFAFxxfP89bqAZTbmvsTrQ/hYYhLAvFzSPKN0bgdPWZUAK
         Oa4JuWNcFLmtZSkSmYkh1O6Gko7ZnO3Ogdbc8evf+7VCaGbHGiweoOciny4CfAzs0jIR
         1F4l1d0g1ubjcy6qilbuG3M4wFA4GTWxXHslN9/PDp0GTljFfwwLvYR2fa01qaGfxlvG
         6FrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1K2AmG/1xX3o9jCz/cl3faZV0axMHqEfr6qkYyw8x1E=;
        b=lGP0Ejjn/SKSmJJ4RvJB8okEAOOetGCwCyRaHXt5ETOAqTtYL9l0FDSirT3MWiIvJH
         egTSdPM2fYIH6sE52EVlOpFBHTfOvqwosYZX4iFKyU45YAXhVklrFXRO8DiL4MunHvm1
         SnsFQO2bnqrIJCdlfz6sH61leDixbOIJfmErv7omI6AniT7LtY3gkRcRBxbNIg/OcOWC
         s5YZizjwTitUiZwvd09d1DV4SdbJQcjAVPIyeM2Ya0JtOvZ0x/YVDlYzhO1QS2DPROlJ
         eDrOljxtzUXXBnRvjav6OtNuQb66IcY9S5EW1+YqT9Z+nDs6FJmXo22Wge0o1caUHApI
         6C4w==
X-Gm-Message-State: AO0yUKXjW+FowmJYUv/ka5AkZIp0OnBWlk3nf4iunY31GZqlYUIqgLyV
        xJ+s23s6v7MUZalIgx7i5squgA==
X-Google-Smtp-Source: AK7set94dNTag513N+HVbc8H2Eto182JDIc4bF2a/NxnmxZekm32ph4O+BBPLXKQxiOSTqtC5VeMhQ==
X-Received: by 2002:a17:907:a80d:b0:879:ab3:93d1 with SMTP id vo13-20020a170907a80d00b008790ab393d1mr20204678ejc.4.1675157104240;
        Tue, 31 Jan 2023 01:25:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b00770812e2394sm8132758ejc.160.2023.01.31.01.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 01:25:03 -0800 (PST)
Message-ID: <550dd5e8-6238-0e48-bac7-7c9b6e67cb00@linaro.org>
Date:   Tue, 31 Jan 2023 11:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 8/8] clk: qcom: Add GPU clock controller driver for
 SM6115
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-9-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230130235926.2419776-9-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/01/2023 01:59, Konrad Dybcio wrote:
> Add support for the GPU clock controller found on SM6115.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig        |   9 +
>   drivers/clk/qcom/Makefile       |   1 +
>   drivers/clk/qcom/gpucc-sm6115.c | 512 ++++++++++++++++++++++++++++++++
>   3 files changed, 522 insertions(+)
>   create mode 100644 drivers/clk/qcom/gpucc-sm6115.c

[skipped]

> +static int gpu_cc_sm6115_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	unsigned int value, mask;
> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
> +	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
> +	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
> +	value = 0xf << CX_GMU_CBCR_WAKE_SHIFT | 0xf << CX_GMU_CBCR_SLEEP_SHIFT;
> +	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, mask, value);
> +
> +	/* Set up PERIPH/MEM retain on the GPU core clock */
> +	regmap_update_bits(regmap, gpu_cc_gx_gfx3d_clk.halt_reg,
> +			   (BIT(14) | BIT(13)), (BIT(14) | BIT(13)));

But you have your new helpers to set these values, don't you?

> +
> +	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
> +}
> +
> +static struct platform_driver gpu_cc_sm6115_driver = {
> +	.probe = gpu_cc_sm6115_probe,
> +	.driver = {
> +		.name = "sm6115-gpucc",
> +		.of_match_table = gpu_cc_sm6115_match_table,
> +	},
> +};
> +module_platform_driver(gpu_cc_sm6115_driver);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC SM6115 Driver");
> +MODULE_LICENSE("GPL");

-- 
With best wishes
Dmitry

