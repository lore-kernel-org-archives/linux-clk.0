Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A970AC05027
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 15:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjBBPPj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 10:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbjBBPPg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 10:15:36 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 161BA442F6
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 07:15:34 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id be12so2333735edb.4
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 07:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukv4NBtRI8MLSY6KEjlzpqBPPrtbUy7c27/VcefhpeY=;
        b=yZxM6CmUqW0LYbmoUE/J4E0WqP0AIm/PxVeclFJbrZIZK9C0avmqCW8ppUfQ1ljgQ4
         I3EguR+002RtKMROPy2x/KNQXT0KbS1RPgR3OWO3+rQePyA7KZmTBnQe1ksjIiIgfRtn
         9GDykdkjgJXFt6ydZZ32qAdDseoTCodJmgVsqFzH/Nv85+fsZpCooYcD2UOvtcKnsLOU
         8vRBRPApZK8YeufBqryHhshXvtvVO9k5WZv7PZbq+lrc+tjmY8RDk/jnI/tPyKevFCUc
         m5e58uk7+pIW1wrrlkdjqB6eL7yv0SVmJy3Ry9cHhBaIO5kbUjw2EW6Gy7zCQXu12lfn
         d+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukv4NBtRI8MLSY6KEjlzpqBPPrtbUy7c27/VcefhpeY=;
        b=LjyY9Lbh6KBR8+DeiFwMjDSSEKJig9hClWaAEQyhgDVSwpQPGLD2qOfxBEKwM7ik9m
         ALODUgOyUN+sO+Z9QsbCWslxw90VIdNx18c5MSn2KcgtYJ22K/NF+ZpKni1pAuYt8n2s
         V1A6B7RILNOm3+he3pbe0BblspFZyuS9QQHa/UqHzjEaZga+NIrxr2UjohJFmarKI7gc
         eMayUthS1C8rEGdOA+Wb9DkJ5d1jzCYxTRyIfePS/ZuiOprp7IL2s4KfjiezFb/kc5E0
         i0BRIx3GUKihNKQVq0oz6FB4zDP39rR0nTPX7HtOYX+PXW/GwUNMazZ57lCKQk66Oa5H
         N7sg==
X-Gm-Message-State: AO0yUKX4TbCi9NdmWZ2GBksh4AsdCrbZ2ZsFMR+hnwJGof3Kak3ZFdAP
        3CgBj2LQDQeSCGnhDCygfyW7GA==
X-Google-Smtp-Source: AK7set9rvgYa+vT4KdCrVhR7NljBs3AEulmAX91ah+LXTRGmZylfhsj9+nHwKPFYtUxk8x0Boafb9w==
X-Received: by 2002:a05:6402:1519:b0:47e:d7ea:d980 with SMTP id f25-20020a056402151900b0047ed7ead980mr6992730edw.14.1675350932636;
        Thu, 02 Feb 2023 07:15:32 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709066d9100b0087856bd9dbbsm11861623ejt.97.2023.02.02.07.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 07:15:32 -0800 (PST)
Message-ID: <97e9ae36-6736-0db8-4044-4e874c5af5f4@linaro.org>
Date:   Thu, 2 Feb 2023 16:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/6] clk: qcom: apss-ipq-pll: refactor the driver to
 accommodate different PLL types
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-2-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230202145208.2328032-2-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2.02.2023 15:52, Kathiravan T wrote:
> APSS PLL found on the IPQ8074 and IPQ6018 are of type Huayra PLL. But,
> IPQ5332 APSS PLL is of type Stromer Plus. To accommodate both these PLLs,
> refactor the driver to take the clk_alpha_pll, alpha_pll_config via device
> data.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 55 +++++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index a5aea27eb867..6e815e8b7fe4 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -8,20 +8,22 @@
>  
>  #include "clk-alpha-pll.h"
>  
> -static const u8 ipq_pll_offsets[] = {
> -	[PLL_OFF_L_VAL] = 0x08,
> -	[PLL_OFF_ALPHA_VAL] = 0x10,
> -	[PLL_OFF_USER_CTL] = 0x18,
> -	[PLL_OFF_CONFIG_CTL] = 0x20,
> -	[PLL_OFF_CONFIG_CTL_U] = 0x24,
> -	[PLL_OFF_STATUS] = 0x28,
> -	[PLL_OFF_TEST_CTL] = 0x30,
> -	[PLL_OFF_TEST_CTL_U] = 0x34,
> +static const u8 ipq_pll_offsets[][PLL_OFF_MAX_REGS] = {
> +	[CLK_ALPHA_PLL_TYPE_HUAYRA] =  {
Is it really huayra? The definition in clk-alpha-pll.c is
different..


Konrad
> +		[PLL_OFF_L_VAL] = 0x08,
> +		[PLL_OFF_ALPHA_VAL] = 0x10,
> +		[PLL_OFF_USER_CTL] = 0x18,
> +		[PLL_OFF_CONFIG_CTL] = 0x20,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x24,
> +		[PLL_OFF_STATUS] = 0x28,
> +		[PLL_OFF_TEST_CTL] = 0x30,
> +		[PLL_OFF_TEST_CTL_U] = 0x34,
> +	},
>  };
>  
> -static struct clk_alpha_pll ipq_pll = {
> +static struct clk_alpha_pll ipq_pll_huayra = {
>  	.offset = 0x0,
> -	.regs = ipq_pll_offsets,
> +	.regs = ipq_pll_offsets[CLK_ALPHA_PLL_TYPE_HUAYRA],
>  	.flags = SUPPORTS_DYNAMIC_UPDATE,
>  	.clkr = {
>  		.enable_reg = 0x0,
> @@ -61,6 +63,21 @@ static const struct alpha_pll_config ipq8074_pll_config = {
>  	.test_ctl_hi_val = 0x4000,
>  };
>  
> +struct apss_pll_data {
> +	struct clk_alpha_pll *pll;
> +	const struct alpha_pll_config *pll_config;
> +};
> +
> +static struct apss_pll_data ipq8074_pll_data = {
> +	.pll = &ipq_pll_huayra,
> +	.pll_config = &ipq8074_pll_config,
> +};
> +
> +static struct apss_pll_data ipq6018_pll_data = {
> +	.pll = &ipq_pll_huayra,
> +	.pll_config = &ipq6018_pll_config,
> +};
> +
>  static const struct regmap_config ipq_pll_regmap_config = {
>  	.reg_bits		= 32,
>  	.reg_stride		= 4,
> @@ -71,7 +88,7 @@ static const struct regmap_config ipq_pll_regmap_config = {
>  
>  static int apss_ipq_pll_probe(struct platform_device *pdev)
>  {
> -	const struct alpha_pll_config *ipq_pll_config;
> +	const struct apss_pll_data *data;
>  	struct device *dev = &pdev->dev;
>  	struct regmap *regmap;
>  	void __iomem *base;
> @@ -85,23 +102,23 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	ipq_pll_config = of_device_get_match_data(&pdev->dev);
> -	if (!ipq_pll_config)
> +	data = of_device_get_match_data(&pdev->dev);
> +	if (!data)
>  		return -ENODEV;
>  
> -	clk_alpha_pll_configure(&ipq_pll, regmap, ipq_pll_config);
> +	clk_alpha_pll_configure(data->pll, regmap, data->pll_config);
>  
> -	ret = devm_clk_register_regmap(dev, &ipq_pll.clkr);
> +	ret = devm_clk_register_regmap(dev, &data->pll->clkr);
>  	if (ret)
>  		return ret;
>  
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
> -					   &ipq_pll.clkr.hw);
> +					   &data->pll->clkr.hw);
>  }
>  
>  static const struct of_device_id apss_ipq_pll_match_table[] = {
> -	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_config },
> -	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_config },
> +	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
> +	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, apss_ipq_pll_match_table);
