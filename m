Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CDAC4167B
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbiL1Nkf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiL1Nke (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:40:34 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094AEFD0B
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:40:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id n1so16580909ljg.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kmUSo5fNxWEA7p80koRKGq21y0y9RPluFUv5Q4Bg92g=;
        b=B3RKUr2RNrik+cYf+JD5WFdCI8oIOoTSPbL588cdGoHI/UJ4C2IWpGAZlfvjcW+FlQ
         Zv67vejxNMov8niQNAm3m3peZuK+RvPgNVQ5g02okrMHqV7WJ8IBA2Ie7DgBim7EcDvu
         CVbsHTyyFcYkBa4yYl3Zxl2W9DceVpb3V5ias8SixZXsfLxXhQf+AtkzKYjbnpf3Izxu
         jllJWVM24kZcCytYszTz9xnEID81qWWDbrDRR4L2YnjcU19dvo/mHUbTzeMCvg0lcywj
         LLL6IZcp6w4ASncUnNzUUTYXz1TwsY+cPKDWhe7mZKONFYsl1Fs39AlEWuErKpaPF3or
         sVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kmUSo5fNxWEA7p80koRKGq21y0y9RPluFUv5Q4Bg92g=;
        b=axSlfkhuNQALvBQm5YzX6TUxu3EFBcCB70vQy663oe0A9713tl0JTn3TkBhxh1ECU7
         gVZF/rpaTbCRP5xbv1HtWhYTG3uHh0BTQZ3/+qD0iBJKQppJgZXWgjZRHyGUJxR6jdPd
         w3t5itLX+sfZH3t8HW/ag8Xf7skniZVHNqzRen8tuoMlnYzFDZd6VPVkjBto0MAuMzNr
         PManhC6Wy5cRdwdMjp286N45nhNeCll4FmBltBqRJujU6lP/kgkvX2FHZM0Ytz+URR/u
         uIfjKmH+IUqzclLd2Jf88uL9gyLBsM7v5tvnLdXHoSan7UQVru95WUewctlhH65YxgJj
         zDLg==
X-Gm-Message-State: AFqh2krOqBW2hku4U65H2lLf/UZao0HDLmb8tJ8mkzvP+2vKeqXvJRS4
        9HEzB/LI1tbtsPWxDTBirGyNLg==
X-Google-Smtp-Source: AMrXdXsOPSJGdfRp4iICtOLFTjDNWZx+KvNCXksNYXCxZ5xaV1AeOC7c1BowQ5fln1ejKvGQXd6ixA==
X-Received: by 2002:a05:651c:543:b0:27f:d42e:848c with SMTP id q3-20020a05651c054300b0027fd42e848cmr276993ljp.37.1672234831401;
        Wed, 28 Dec 2022 05:40:31 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id t16-20020a05651c205000b0027fc5937f04sm730186ljo.90.2022.12.28.05.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:40:31 -0800 (PST)
Message-ID: <ec56ac94-7891-b0f0-8eb3-6e023a064262@linaro.org>
Date:   Wed, 28 Dec 2022 14:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 13/16] clk: qcom: gcc-sm8150: get rid of test clock
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
 <20221228133243.3052132-14-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-14-dmitry.baryshkov@linaro.org>
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
>  drivers/clk/qcom/gcc-sm8150.c | 17 -----------------
>  1 file changed, 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8150.c b/drivers/clk/qcom/gcc-sm8150.c
> index 09cf827addab..70b067f3618c 100644
> --- a/drivers/clk/qcom/gcc-sm8150.c
> +++ b/drivers/clk/qcom/gcc-sm8150.c
> @@ -26,7 +26,6 @@
>  enum {
>  	P_BI_TCXO,
>  	P_AUD_REF_CLK,
> -	P_CORE_BI_PLL_TEST_SE,
>  	P_GPLL0_OUT_EVEN,
>  	P_GPLL0_OUT_MAIN,
>  	P_GPLL7_OUT_MAIN,
> @@ -117,14 +116,12 @@ static const struct parent_map gcc_parent_map_0[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_0[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_1[] = {
> @@ -132,7 +129,6 @@ static const struct parent_map gcc_parent_map_1[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_SLEEP_CLK, 5 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_1[] = {
> @@ -140,41 +136,34 @@ static const struct clk_parent_data gcc_parents_1[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_2[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_SLEEP_CLK, 5 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_2[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_3[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_GPLL0_OUT_MAIN, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_3[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>  	{ .hw = &gpll0.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se"},
>  };
>  
>  static const struct parent_map gcc_parent_map_4[] = {
>  	{ P_BI_TCXO, 0 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_4[] = {
>  	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_5[] = {
> @@ -182,7 +171,6 @@ static const struct parent_map gcc_parent_map_5[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL7_OUT_MAIN, 3 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_5[] = {
> @@ -190,7 +178,6 @@ static const struct clk_parent_data gcc_parents_5[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll7.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_6[] = {
> @@ -198,7 +185,6 @@ static const struct parent_map gcc_parent_map_6[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_GPLL9_OUT_MAIN, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_6[] = {
> @@ -206,7 +192,6 @@ static const struct clk_parent_data gcc_parents_6[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .hw = &gpll9.clkr.hw },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map gcc_parent_map_7[] = {
> @@ -214,7 +199,6 @@ static const struct parent_map gcc_parent_map_7[] = {
>  	{ P_GPLL0_OUT_MAIN, 1 },
>  	{ P_AUD_REF_CLK, 2 },
>  	{ P_GPLL0_OUT_EVEN, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 },
>  };
>  
>  static const struct clk_parent_data gcc_parents_7[] = {
> @@ -222,7 +206,6 @@ static const struct clk_parent_data gcc_parents_7[] = {
>  	{ .hw = &gpll0.clkr.hw },
>  	{ .fw_name = "aud_ref_clk", .name = "aud_ref_clk" },
>  	{ .hw = &gpll0_out_even.clkr.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
