Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41E4C636D7
	for <linux-clk@archiver.kernel.org>; Tue, 21 Feb 2023 18:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbjBUSNa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Feb 2023 13:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjBUSN3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Feb 2023 13:13:29 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369432CC5A
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 10:13:11 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id by8so405649ljb.7
        for <linux-clk@vger.kernel.org>; Tue, 21 Feb 2023 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXFB1ToLiLOsDJMDgKAuDm5MOLci1wrrick0YVwQiJc=;
        b=NjUU6gRBlv2TilWVZfYaP5EBPvIcGZSwgW+TBylRo6mmWfx4+T4ezlltBKE4Bqgk4C
         4RsuMouFIsuQCGrpNq+sOeoFVfyuM5c1FMA3rJNjvMY2mBidwcmODpu6T6rMj39JdJM2
         0Juhps+AmCvjqRHVAAgfPq2JwrLN4zlW+Oj+sUqMTcoKIteLtB53nU0xAnTM6Fyv/RuP
         3T+G9vQxxlWCqOOBRaMp6rCUYTym6pTv0kPzm1VQTctbEyy80s4yV4znnPcqdPvvfwHs
         MOWpBNSLzN64ns7ceObRw9i5ziZ6NNZTQupZxDMU/BmzjonDldZLYhdtkIxkAq+sCuU0
         /QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXFB1ToLiLOsDJMDgKAuDm5MOLci1wrrick0YVwQiJc=;
        b=KINrMJhxHVYh9vivWrg4qZMvWOMEHm/0YmGF0tw1dXK3KFsIRNojN95h1Lg8ObnL1x
         F2p7G4Z2OzbCcVSO7QIDs/B0KLWNQoS7jeZQVE+y9dKvkxeIJesqIKhIJVKWjeaPXfY3
         Crma9SBXJv77rO/BwbZkCPFZ4vgWuRtBPQduso5K0qrNBj+jrYCw92iw2pqejMK8z0o3
         LqE5FQQ9MH++b1juIZWjoxAjcdQT8yCjsWTTgB7uyBwljkzAxiOYe5E2OpypBHfAXtC6
         mHMSXKXP63vRJ7VmG9kR+iBklIxQGZvYnJSYms2ZZ0gaqcXLf5VpuYnNDKI7uhgGF4WW
         ZcYw==
X-Gm-Message-State: AO0yUKXY/dPcp5LxJhYSZJpoAXvSmCB4Hl4DxymPYDUjqrJgmF30MIyu
        maVMp/KNs6vFHWNIrIJ5+NgOYA==
X-Google-Smtp-Source: AK7set9yU/LbJ9XKViRJMa7U9bqS5w3dJFuc/kNh33HC4Bqa8++9D8ijVzUljlBoHTL2htF8gQ+9wg==
X-Received: by 2002:a05:651c:11c1:b0:290:5d54:fedb with SMTP id z1-20020a05651c11c100b002905d54fedbmr2126296ljo.31.1677003141226;
        Tue, 21 Feb 2023 10:12:21 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id i15-20020a2e940f000000b00295744b701esm422489ljh.66.2023.02.21.10.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 10:12:20 -0800 (PST)
Message-ID: <aa2643b3-f973-6d15-de61-96d4aa9302fb@linaro.org>
Date:   Tue, 21 Feb 2023 19:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] clk: qcom: smd-rpm: Add clocks for MSM8917
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-5-otto.pflueger@abscue.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230221174909.164029-5-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 21.02.2023 18:49, Otto Pflüger wrote:
> MSM8917 has mostly the same rpm clocks as MSM8953, but lacks RF_CLK3 and
> additionally has the BIMC_GPU clock.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
This is based on an old Linux tree, the names you're referencing
no longer exist.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/clk/qcom/clk-smd-rpm.c?h=next-20230221

Konrad
>  drivers/clk/qcom/clk-smd-rpm.c | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..616f3a1bcad8 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -850,6 +850,40 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
>  	.num_clks = ARRAY_SIZE(qcs404_clks),
>  };
>  
> +static struct clk_smd_rpm *msm8917_clks[] = {
> +	[RPM_SMD_XO_CLK_SRC]		= &sdm660_bi_tcxo,
> +	[RPM_SMD_XO_A_CLK_SRC]		= &sdm660_bi_tcxo_a,
> +	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
> +	[RPM_SMD_PCNOC_A_CLK]		= &msm8916_pcnoc_a_clk,
> +	[RPM_SMD_SNOC_CLK]		= &msm8916_snoc_clk,
> +	[RPM_SMD_SNOC_A_CLK]		= &msm8916_snoc_a_clk,
> +	[RPM_SMD_BIMC_CLK]		= &msm8916_bimc_clk,
> +	[RPM_SMD_BIMC_A_CLK]		= &msm8916_bimc_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK]		= &qcs404_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK]	= &qcs404_bimc_gpu_a_clk,
> +	[RPM_SMD_SYSMMNOC_CLK]		= &msm8936_sysmmnoc_clk,
> +	[RPM_SMD_SYSMMNOC_A_CLK]	= &msm8936_sysmmnoc_a_clk,
> +	[RPM_SMD_QDSS_CLK]		= &msm8916_qdss_clk,
> +	[RPM_SMD_QDSS_A_CLK]		= &msm8916_qdss_a_clk,
> +	[RPM_SMD_BB_CLK1]		= &msm8916_bb_clk1,
> +	[RPM_SMD_BB_CLK1_A]		= &msm8916_bb_clk1_a,
> +	[RPM_SMD_BB_CLK2]		= &msm8916_bb_clk2,
> +	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
> +	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
> +	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
> +	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
> +	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
> +	[RPM_SMD_BB_CLK2_A_PIN]		= &msm8916_bb_clk2_a_pin,
> +};
> +
> +static const struct rpm_smd_clk_desc rpm_clk_msm8917 = {
> +	.clks = msm8917_clks,
> +	.num_clks = ARRAY_SIZE(msm8917_clks),
> +};
> +
>  DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
>  DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
> @@ -1223,6 +1257,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
>  	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
>  	{ .compatible = "qcom,rpmcc-msm8909", .data = &rpm_clk_msm8909 },
>  	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
> +	{ .compatible = "qcom,rpmcc-msm8917", .data = &rpm_clk_msm8917 },
>  	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
>  	{ .compatible = "qcom,rpmcc-msm8953", .data = &rpm_clk_msm8953 },
>  	{ .compatible = "qcom,rpmcc-msm8974", .data = &rpm_clk_msm8974 },
