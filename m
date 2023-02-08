Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C2BC636D3
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 08:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbjBHIpn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 03:45:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjBHIph (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 03:45:37 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCB818A8D
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 00:45:35 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id l12so10521756edb.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gs3GgGMZTJyyxuo+4Ac8ucQP1Pg1frgIt/OFGMgdXc=;
        b=DcbACFZO/EctntieNvqUKkpny876ivcbAKH+MtMqLNrg89h6ZLj2ljdNK5/aUV86SM
         Ci5Sp6faZZZkh2mUm1TfU2sj9pelYeBqUJiwBCss98v49ZtXV+5MfQTb3Zc1lFd6H3Uf
         ukBoqvUauKlBhi3RDi/7cYheJWZvW1pygZ1jGzKlue8uooeb7YS7qFYCk6+VrhabzWLB
         NzJJ0ToZZ2sTI8k0gtNVZ2q38AyCi/k3+rKphDwzb8c33j8kHHiEl0/DRsFUuHHw8xz9
         4ktZ6h+QrBhQOfDQABHl+UENb2Vp37R2MYCulabZcOFKRrTATLZRouWcOkEBQsMcFdNC
         l7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gs3GgGMZTJyyxuo+4Ac8ucQP1Pg1frgIt/OFGMgdXc=;
        b=RJdpNnhlnPk6S6gE9wMceJu1bjeDjxLX/eT6h+75M0d/VkiopdOIQPt0+6b7jJxWlF
         Fl9iL6CZ8xBa5DGlLgys5hkJGA4beNzzp7BMnFDuD9VNdcfnNy03CNTP1K/DfOYWhtxj
         iVfB7V06wyka1nmEWyN6R3pDdyuMBVVdSO3O9O1jrYeWcLC9rvRb/NAcyyyKSUI+DVVs
         cbkFI5nQb7HGhzD7yXCO1nejbsg2WM3IM6chKVj30Z6Y5WcCMEr90ZBz+zfJCxaiHkgM
         K0NKcFmz0Ds17z8SCauTMLcgnMWeAM9WmJQ4B1Bue3qAQX7DlfoXcGsc9wZSmkL95Gkv
         HdDQ==
X-Gm-Message-State: AO0yUKWds42NzcTwV0s8QW2IEIcGWf90ZOQ2DeinTCpEtFlnrPg2n47h
        RnbNFrdZdevCtG6ytQzBWuEoEA==
X-Google-Smtp-Source: AK7set/JKTVsJjSUHnW5SZkOz/UIr5168UhKvVPibgLrn4Ddi7s2HQcBWuNNC7kfPtn4YXNYcIUCjA==
X-Received: by 2002:a50:d658:0:b0:4aa:b391:d2a5 with SMTP id c24-20020a50d658000000b004aab391d2a5mr6797723edj.11.1675845933649;
        Wed, 08 Feb 2023 00:45:33 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id fd8-20020a056402388800b004a245350e0fsm7539245edb.36.2023.02.08.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:45:33 -0800 (PST)
Message-ID: <2e798273-96ea-92ed-6860-01545caff705@linaro.org>
Date:   Wed, 8 Feb 2023 09:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2 3/5] clk: qcom: apss-ipq-pll: add support for IPQ5332
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230208042850.1687-1-quic_kathirav@quicinc.com>
 <20230208042850.1687-4-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230208042850.1687-4-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8.02.2023 05:28, Kathiravan T wrote:
> IPQ5332 APSS PLL is of type Stromer Plus. Add support for the same.
> 
> To configure the stromer plus PLL separate API
> (clock_stromer_pll_configure) to be used. To achieve this, introduce the
> new member pll_type in device data structure and call the appropriate
> function based on this.
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in V2:
> 	- No changes
> 
>  drivers/clk/qcom/apss-ipq-pll.c | 58 ++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index 4f2a147e9fb2..cf4f0d340cbf 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -24,6 +24,17 @@ static const u8 ipq_pll_offsets[][PLL_OFF_MAX_REGS] = {
>  		[PLL_OFF_TEST_CTL] = 0x30,
>  		[PLL_OFF_TEST_CTL_U] = 0x34,
>  	},
> +	[CLK_ALPHA_PLL_TYPE_STROMER_PLUS] = {
> +		[PLL_OFF_L_VAL] = 0x08,
> +		[PLL_OFF_ALPHA_VAL] = 0x10,
> +		[PLL_OFF_ALPHA_VAL_U] = 0x14,
> +		[PLL_OFF_USER_CTL] = 0x18,
> +		[PLL_OFF_USER_CTL_U] = 0x1c,
> +		[PLL_OFF_CONFIG_CTL] = 0x20,
> +		[PLL_OFF_STATUS] = 0x28,
> +		[PLL_OFF_TEST_CTL] = 0x30,
> +		[PLL_OFF_TEST_CTL_U] = 0x34,
> +	},
>  };
>  
>  static struct clk_alpha_pll ipq_pll_huayra = {
> @@ -44,6 +55,38 @@ static struct clk_alpha_pll ipq_pll_huayra = {
>  	},
>  };
>  
> +static struct clk_alpha_pll ipq_pll_stromer_plus = {
> +	.offset = 0x0,
> +	.regs = ipq_pll_offsets[CLK_ALPHA_PLL_TYPE_STROMER_PLUS],
> +	.flags = SUPPORTS_DYNAMIC_UPDATE,
> +	.clkr = {
> +		.enable_reg = 0x0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "a53pll",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.fw_name = "xo",
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_stromer_ops,
> +		},
> +	},
> +};
> +
> +static const struct alpha_pll_config ipq5332_pll_config = {
> +	.l = 0x3e,
> +	.config_ctl_val = 0x4001075b,
> +	.config_ctl_hi_val = 0x304,
> +	.main_output_mask = BIT(0),
> +	.aux_output_mask = BIT(1),
> +	.early_output_mask = BIT(3),
> +	.alpha_en_mask = BIT(24),
> +	.status_val = 0x3,
> +	.status_mask = GENMASK(10, 8),
> +	.lock_det = BIT(2),
> +	.test_ctl_hi_val = 0x00400003,
> +};
> +
>  static const struct alpha_pll_config ipq6018_pll_config = {
>  	.l = 0x37,
>  	.config_ctl_val = 0x240d4828,
> @@ -69,16 +112,25 @@ static const struct alpha_pll_config ipq8074_pll_config = {
>  };
>  
>  struct apss_pll_data {
> +	int pll_type;
>  	struct clk_alpha_pll *pll;
>  	const struct alpha_pll_config *pll_config;
>  };
>  
> +static struct apss_pll_data ipq5332_pll_data = {
> +	.pll_type = CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
> +	.pll = &ipq_pll_stromer_plus,
> +	.pll_config = &ipq5332_pll_config,
> +};
> +
>  static struct apss_pll_data ipq8074_pll_data = {
> +	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
>  	.pll = &ipq_pll_huayra,
>  	.pll_config = &ipq8074_pll_config,
>  };
>  
>  static struct apss_pll_data ipq6018_pll_data = {
> +	.pll_type = CLK_ALPHA_PLL_TYPE_HUAYRA,
>  	.pll = &ipq_pll_huayra,
>  	.pll_config = &ipq6018_pll_config,
>  };
> @@ -111,7 +163,10 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -ENODEV;
>  
> -	clk_alpha_pll_configure(data->pll, regmap, data->pll_config);
> +	if (data->pll_type == CLK_ALPHA_PLL_TYPE_HUAYRA)
> +		clk_alpha_pll_configure(data->pll, regmap, data->pll_config);
> +	else if (data->pll_type == CLK_ALPHA_PLL_TYPE_STROMER_PLUS)
> +		clk_stromer_pll_configure(data->pll, regmap, data->pll_config);
>  
>  	ret = devm_clk_register_regmap(dev, &data->pll->clkr);
>  	if (ret)
> @@ -122,6 +177,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id apss_ipq_pll_match_table[] = {
> +	{ .compatible = "qcom,ipq5332-a53pll", .data = &ipq5332_pll_data },
>  	{ .compatible = "qcom,ipq6018-a53pll", .data = &ipq6018_pll_data },
>  	{ .compatible = "qcom,ipq8074-a53pll", .data = &ipq8074_pll_data },
>  	{ }
