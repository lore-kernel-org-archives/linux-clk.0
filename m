Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3899C4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbiL1Nji (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233064AbiL1NjL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:39:11 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B0A11832
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:39:10 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id p2so972926ljn.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcKen0J7JLXc8AJssAYDPcyCoxuXJNE686k3Qe7FeVM=;
        b=slQkbgGGpcjdGUEeMWBdjPKKWnNHoUqsdo0/qAqeQtPiHRaOykPcudohMddes3KwAS
         aJ0rc0b+NtyFN4wxnpfF239wMlC2S9Sg+i900cbwdtoQl1FE7DwiAefpX3YW4/ff8O3F
         VnZ/QHsRxLhZ0z+xWb2YaGsIqrC4Cdw/bm7tzIolDT6sSnVaa4tdxqOGzrrETv4/8YFd
         WH0AIYQrgDzoQNVcXJbND/93dgbBD2ku5hP/NI668hMqeKf5lipkuU0NOW7LZ0StLDi5
         J6fsmSsehkaedFuy7NqIV9Au0+T0o+rOWzZjZlTzn3nRVdjRqkxyfICkQWGvk+O1yqUH
         C4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcKen0J7JLXc8AJssAYDPcyCoxuXJNE686k3Qe7FeVM=;
        b=ADOFWl8yziGMBXTkhY4x0EuYl6/ukVa5tDyCP20OsqPWZLkyhtjuvyNqpzXbs7HpKK
         3n7B0Q38sjYZ6lqCzQsMSi67DgJeqhJIs4nsWo/v3eRLm2RO3miQh0IqDwrIG2NJy1HO
         JNKkqHS+Zycc5skfUbmpRNk337CaNLh5S5dc/htQsnJq+sZq4RhoPpF17O1ZFBgK1uFq
         5G/Ul+EarCVTiclBrJkcyc/oFXoS5t9yOPi1GgX9Z+mbAEkKpJ3R26Zvd7Tg2ITF6RNO
         8a6jc6ytTeT6wlu9QZtZ8ymM4gkK7xZ/cYW9T73fyaTY8WDTdvQ+2LmKSenSOsYw3Ddn
         TbDQ==
X-Gm-Message-State: AFqh2kpv+pEoSVMy4fn0IMULgc090ZwrGWO5ATDTlioPsNjbUm9LnYKb
        0riUgOxowkcYkim172DabmNRGWAi7YMRvyC1
X-Google-Smtp-Source: AMrXdXu5eH1aTciuLX4InQBydZvwF7QKqLvdZ5VmOc5AbW085q0to0JxhXzlQ7xFwMlPPTnURu1/1g==
X-Received: by 2002:a2e:a583:0:b0:27f:b941:53ba with SMTP id m3-20020a2ea583000000b0027fb94153bamr4969680ljp.23.1672234748870;
        Wed, 28 Dec 2022 05:39:08 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id bd8-20020a05651c168800b0027781448499sm1976368ljb.85.2022.12.28.05.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:39:08 -0800 (PST)
Message-ID: <d61e8bc5-89a6-a8b1-167a-aff865b88172@linaro.org>
Date:   Wed, 28 Dec 2022 14:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 10/16] clk: qcom: gcc-sc7180: get rid of test clock
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221228133243.3052132-1-dmitry.baryshkov@linaro.org>
 <20221228133243.3052132-11-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 28.12.2022 14:32, Dmitry Baryshkov wrote:
> The test clock apparently it's not used by anyone upstream. Remove it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sc7180.c | 16 ----------------
>  1 file changed, 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
> index 2d3980251e78..105c4762ca84 100644
> --- a/drivers/clk/qcom/gcc-sc7180.c
> +++ b/drivers/clk/qcom/gcc-sc7180.c
> @@ -23,7 +23,6 @@
>  
>  enum {
>  	P_BI_TCXO,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_EVEN,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL1_OUT_MAIN,
> @@ -162,21 +161,18 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_0_ao[] = {
>  	{ .fw_name = "bi_tcxo_ao", .name = "bi_tcxo_ao" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -184,7 +180,6 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL6_OUT_MAIN, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_1[] = {
> @@ -192,7 +187,6 @@ static const struct clk_parent_data gcc_parent_data_1[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll6.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
> @@ -201,7 +195,6 @@ static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_GPLL1_OUT_MAIN, 4 },
>  	{ P_GPLL4_OUT_MAIN, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_2[] = {
> @@ -210,19 +203,16 @@ static const struct clk_parent_data gcc_parent_data_2[] = {
>  	{ .hw = &gpll1.clkr.hw },
>  	{ .hw = &gpll4.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
> @@ -230,7 +220,6 @@ static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_4[] = {
> @@ -238,7 +227,6 @@ static const struct clk_parent_data gcc_parent_data_4[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_5[] = {
> @@ -246,7 +234,6 @@ static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL7_OUT_MAIN, 3 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_5[] = {
> @@ -254,21 +241,18 @@ static const struct clk_parent_data gcc_parent_data_5[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll7.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parent_data_6[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
