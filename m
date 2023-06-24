Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36116EB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 01:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231770AbjFXBrf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 21:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjFXBre (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 21:47:34 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9E21739
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:47:32 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f766777605so1714298e87.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jun 2023 18:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687571250; x=1690163250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLyq1govL4X/90zKJLoIMNa/BGaWgW+3vaqmIWfU4ws=;
        b=oYALc2Z2vECKR4qY9s7IvL3LbpkApryhX7Gjc3XxgqghyJbFwa/jw1sfoOcP9qu8v6
         PlWf0aA5BK+1F6jMh0VCaLJDQ5N40yFvYo6Xp3cOSaf7CusIL0V8d6hl1K5+EFn5koaz
         31yMawA9MNexkffCiFW1FKDgO++q9V7qztcgCzd8NiPTgVdbXKvYNCiAWHU9Ne1qH0B4
         7xm0PfSfhvWHrEACGGq1AOMRlUG3PezONnHeNhzWzntG/FJNDXXDF0pFgwlI16FRQonw
         caNE0VGgDxAoY2GPa4yd0qMvKbckAQjb3Z67DGuHdUOS9HIQFxA5njs6e145a1/zGuu3
         CogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687571250; x=1690163250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLyq1govL4X/90zKJLoIMNa/BGaWgW+3vaqmIWfU4ws=;
        b=V75Y17GCjLjl/0/7TT1yTQcyZbCAjnLaT1h4Jc2SJ5B9P8Ismc/MC2QworSl8YHOQ0
         8L/uuO210BFV4LjTGnpF36QpUq0/EHX8jFjFlar5OCp+9EyVjbHwRldbbZ/AGHADOFtd
         fc4t4E7w/KC2wbJB0njx1ffx51DDlhOqZDaiZAOMJbOzdBmKoDouG1rteZSHsGn1JB2T
         Lq9Tr9ttLFJ5BfE7QPSdr6XIdL6M2BBDjOpmoYH8g2p6A/A+y26y6s2jkK8LgT51FXUO
         0DqJMQWGM1m2jOXUWlVUZE8iot/OKaUAOm34lkZ2A+ZepNrfgGPHrMG/OZygnXb6Yxp3
         kEfQ==
X-Gm-Message-State: AC+VfDwPilzBbtwO7bcSDkyobyR6O3trJwNa7U0Uv99S+BMNaMhYlrE9
        mmLoFrcQoi/DNCuT3xWPNxtwng==
X-Google-Smtp-Source: ACHHUZ5I9Q73hhY/utmeralS38g8pR6UNU4wxQsTqbRwgLVbPLdNXOk/FtomN67t7kS1otM2OV5mHQ==
X-Received: by 2002:ac2:5bda:0:b0:4f8:64f5:f595 with SMTP id u26-20020ac25bda000000b004f864f5f595mr11549099lfn.60.1687571250235;
        Fri, 23 Jun 2023 18:47:30 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id v4-20020ac25924000000b004f842def818sm90228lfi.246.2023.06.23.18.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 18:47:29 -0700 (PDT)
Message-ID: <d836cdaa-7d67-82b1-baa6-6d2f8c761b1a@linaro.org>
Date:   Sat, 24 Jun 2023 03:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/15] drm/msm/dpu: Add SM6125 support
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-8-1d5a638cebf2@somainline.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-8-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24.06.2023 02:41, Marijn Suijten wrote:
> Add definitions for the display hardware used on the Qualcomm SM6125
> platform.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
[...]

> +static const struct dpu_perf_cfg sm6125_perf_data = {
> +	.max_bw_low = 4100000,
> +	.max_bw_high = 4100000,
> +	.min_core_ib = 2400000,
> +	.min_llcc_ib = 800000,
While Dmitry will likely validate other values, I can tell you already
that this SoC has no LLCC.

Konrad
> +	.min_dram_ib = 800000,
> +	.min_prefill_lines = 24,
> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
> +	.qos_lut_tbl = {
> +		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
> +		.entries = sm8150_qos_linear
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
> +		.entries = sc7180_qos_macrotile
> +		},
> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
> +		.entries = sc7180_qos_nrt
> +		},
> +		/* TODO: macrotile-qseed is different from macrotile */
> +	},
> +	.cdp_cfg = {
> +		{.rd_enable = 1, .wr_enable = 1},
> +		{.rd_enable = 1, .wr_enable = 0}
> +	},
> +	.clk_inefficiency_factor = 105,
> +	.bw_inefficiency_factor = 120,
> +};
> +
> +const struct dpu_mdss_cfg dpu_sm6125_cfg = {
> +	.caps = &sm6125_dpu_caps,
> +	.ubwc = &sm6125_ubwc_cfg,
> +	.mdp_count = ARRAY_SIZE(sm6125_mdp),
> +	.mdp = sm6125_mdp,
> +	.ctl_count = ARRAY_SIZE(sm6125_ctl),
> +	.ctl = sm6125_ctl,
> +	.sspp_count = ARRAY_SIZE(sm6125_sspp),
> +	.sspp = sm6125_sspp,
> +	.mixer_count = ARRAY_SIZE(sm6125_lm),
> +	.mixer = sm6125_lm,
> +	.dspp_count = ARRAY_SIZE(sm6125_dspp),
> +	.dspp = sm6125_dspp,
> +	.pingpong_count = ARRAY_SIZE(sm6125_pp),
> +	.pingpong = sm6125_pp,
> +	.intf_count = ARRAY_SIZE(sm6125_intf),
> +	.intf = sm6125_intf,
> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> +	.vbif = sdm845_vbif,
> +	.perf = &sm6125_perf_data,
> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +		     BIT(MDP_INTF0_INTR) | \
> +		     BIT(MDP_INTF1_INTR) | \
> +		     BIT(MDP_INTF1_TEAR_INTR),
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0de507d4d7b7..8a02bbdaae8a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -33,6 +33,9 @@
>  #define VIG_SC7180_MASK \
>  	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>  
> +#define VIG_SM6125_MASK \
> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
> +
>  #define VIG_SC7180_MASK_SDMA \
>  	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>  
> @@ -348,6 +351,8 @@ static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>  
>  static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>  				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
> +static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
> +				_VIG_SBLK("0", 3, DPU_SSPP_SCALER_QSEED3LITE);
>  
>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> @@ -762,6 +767,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>  
>  #include "catalog/dpu_5_0_sm8150.h"
>  #include "catalog/dpu_5_1_sc8180x.h"
> +#include "catalog/dpu_5_4_sm6125.h"
>  
>  #include "catalog/dpu_6_0_sm8250.h"
>  #include "catalog/dpu_6_2_sc7180.h"
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b860784ade72..4314235cb2b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -861,6 +861,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>  extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
> +extern const struct dpu_mdss_cfg dpu_sm6125_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>  extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..a1c7ffb6dffb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1305,6 +1305,7 @@ static const struct of_device_id dpu_dt_match[] = {
>  	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
> +	{ .compatible = "qcom,sm6125-dpu", .data = &dpu_sm6125_cfg, },
>  	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>  	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
> 
