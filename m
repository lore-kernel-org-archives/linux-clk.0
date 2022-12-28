Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27F6C4708E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 13:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232992AbiL1Nlf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 08:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233026AbiL1NlY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 08:41:24 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA62E7D
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:41:23 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bt23so7010133lfb.5
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 05:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ryV9DaIE1vS7FHdBkvlum80eQvNfYCYu1SzCwiXZ0c=;
        b=rYvFLwknkSWxnOuNIOzZ8X1wsbyvPwhBA7XLasiJQc5a98klG4fl0HKtZlzGW5V6CV
         Na+kWRvJOBMBPP0Vz4zNfaV+TsM94xOb05Zw/U5KPja2rA/RJ93R8aguaz18DLEw5J1P
         rHyNxjyXknnlPfsnWIPCs6EU/Cbjo0hpcpBlcBAz9+bU0bI1HLqe9kRTSbqY9TIhoPOS
         uh6HRUBkc+fGQ2AVuyHDw0kFAuCaoQO8lgN6TOpy+1qqEPIJc83ZrZlPQH4LKtJIYbSG
         AGUQwPEZ+OFQ+/Vyl22C17sj1QKaC4k+UzvZ2gJ4ytsVCiL+iXc+myuSHlwp+k3T5umM
         Jpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ryV9DaIE1vS7FHdBkvlum80eQvNfYCYu1SzCwiXZ0c=;
        b=BF0rPjDC3+uT5iPhCdqkxJWwI7T6sTK4JCDDc2owu+6Pt1qio5KeYVtwky9Pswb6Ei
         pzMYer2MejWpmNrpbXY0hYXdXwFzoYFH/PHpgCfx3Y4rryl+DJAmmmJRguuuyAtHKaRa
         0MDber34NLvRtFqDH3oc6xLJzcysR0AwRpsOsOcHz0uy5mFqoLiXpn/KffT/K39qaAVn
         NQUFoCaAlcuDjb4DH4g4w09DosSU5Eq04bZNlUDw0SMY0QB10sR9LkbpwUqonhNEhZPW
         jVJjcJgGmsWA2PhhqEJvbQSDBHRB0efcYDpRHXzOCWYlY8tAKjlUCI2UUfTI5tLKn5+p
         j0cg==
X-Gm-Message-State: AFqh2koPvIpDTVUB9qXiBBp72k1RxkDweyNrmzx1hzdTqyQIedegHAqC
        swJAczyHLU5jX4lo4HeShzoufw==
X-Google-Smtp-Source: AMrXdXs0nLL+kP6umwa+WKtkqGlJTn1mG2QLuoT22dAZ/Jw+zf/LaWBlbXDJ5tFAt6pUofIQlx1sTQ==
X-Received: by 2002:a05:6512:3d9f:b0:4a4:68b7:f878 with SMTP id k31-20020a0565123d9f00b004a468b7f878mr11245101lfv.28.1672234881480;
        Wed, 28 Dec 2022 05:41:21 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id k7-20020a05651239c700b004b5766f48d8sm2659324lfu.19.2022.12.28.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 05:41:21 -0800 (PST)
Message-ID: <f39d3946-8827-68b5-a10e-1b1c72f651e0@linaro.org>
Date:   Wed, 28 Dec 2022 14:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/16] clk: qcom: mmcc-msm8998: get rid of test clock
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
 <20221228133243.3052132-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221228133243.3052132-16-dmitry.baryshkov@linaro.org>
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
>  drivers/clk/qcom/mmcc-msm8998.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
> index c421b1291651..4490594bde69 100644
> --- a/drivers/clk/qcom/mmcc-msm8998.c
> +++ b/drivers/clk/qcom/mmcc-msm8998.c
> @@ -44,7 +44,6 @@ enum {
>  	P_HDMIPLL,
>  	P_DPVCO,
>  	P_DPLINK,
> -	P_CORE_BI_PLL_TEST_SE,
>  };
>  
>  static struct clk_fixed_factor gpll0_div = {
> @@ -303,69 +302,59 @@ static struct clk_alpha_pll_postdiv mmpll10_out_even = {
>  static const struct parent_map mmss_xo_hdmi_map[] = {
>  	{ P_XO, 0 },
>  	{ P_HDMIPLL, 1 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_hdmi[] = {
>  	{ .fw_name = "xo" },
>  	{ .fw_name = "hdmipll" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0PLL, 1 },
>  	{ P_DSI1PLL, 2 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_dsi0pll_dsi1pll[] = {
>  	{ .fw_name = "xo" },
>  	{ .fw_name = "dsi0dsi" },
>  	{ .fw_name = "dsi1dsi" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_dsibyte_map[] = {
>  	{ P_XO, 0 },
>  	{ P_DSI0PLL_BYTE, 1 },
>  	{ P_DSI1PLL_BYTE, 2 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_dsibyte[] = {
>  	{ .fw_name = "xo" },
>  	{ .fw_name = "dsi0byte" },
>  	{ .fw_name = "dsi1byte" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_dp_map[] = {
>  	{ P_XO, 0 },
>  	{ P_DPLINK, 1 },
>  	{ P_DPVCO, 2 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_dp[] = {
>  	{ .fw_name = "xo" },
>  	{ .fw_name = "dplink" },
>  	{ .fw_name = "dpvco" },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
>  	{ P_XO, 0 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_gpll0_gpll0_div[] = {
>  	{ .fw_name = "xo" },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
> @@ -373,7 +362,6 @@ static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
>  	{ P_MMPLL0_OUT_EVEN, 1 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
> @@ -381,7 +369,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
>  	{ .hw = &mmpll0_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
> @@ -390,7 +377,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
>  	{ P_MMPLL1_OUT_EVEN, 2 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
> @@ -399,7 +385,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
>  	{ .hw = &mmpll1_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
> @@ -408,7 +393,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
>  	{ P_MMPLL5_OUT_EVEN, 2 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
> @@ -417,7 +401,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
>  	{ .hw = &mmpll5_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[] = {
> @@ -427,7 +410,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[
>  	{ P_MMPLL6_OUT_EVEN, 4 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div[] = {
> @@ -437,7 +419,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div
>  	{ .hw = &mmpll6_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
> @@ -447,7 +428,6 @@ static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map
>  	{ P_MMPLL10_OUT_EVEN, 3 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
> @@ -457,7 +437,6 @@ static const struct clk_parent_data mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_di
>  	{ .hw = &mmpll10_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
> @@ -467,7 +446,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map
>  	{ P_MMPLL10_OUT_EVEN, 3 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div[] = {
> @@ -477,7 +455,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_di
>  	{ .hw = &mmpll10_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
> @@ -488,7 +465,6 @@ static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_
>  	{ P_MMPLL10_OUT_EVEN, 4 },
>  	{ P_GPLL0, 5 },
>  	{ P_GPLL0_DIV, 6 },
> -	{ P_CORE_BI_PLL_TEST_SE, 7 }
>  };
>  
>  static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
> @@ -499,7 +475,6 @@ static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_g
>  	{ .hw = &mmpll10_out_even.clkr.hw },
>  	{ .fw_name = "gpll0" },
>  	{ .hw = &gpll0_div.hw },
> -	{ .fw_name = "core_bi_pll_test_se" },
>  };
>  
>  static struct clk_rcg2 byte0_clk_src = {
