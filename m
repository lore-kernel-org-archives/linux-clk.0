Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AA3C47088
	for <linux-clk@archiver.kernel.org>; Fri,  2 Dec 2022 19:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbiLBT3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Dec 2022 14:29:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234462AbiLBT3t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Dec 2022 14:29:49 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A467EF0EA
        for <linux-clk@vger.kernel.org>; Fri,  2 Dec 2022 11:29:48 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id e18so4089243qvs.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Dec 2022 11:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WXI3neVS8CRBAiuDUMYV81QwYWr0/b5PYjiiXMlU4kU=;
        b=FO30Qxh3KLAiKXTKhRYwKxx+RBz1RSuLMwFmiRJgfsVO6z1u1IJpi94Gw4CPcANN44
         uQSz5/sUkX7dq/J9mwJ5jIUIXxdTT7FC9/uSiv4Ke9WvJ5x+y0GMJvSedKkyQ9Mnj2L9
         zeWoqeVAtK1gskVt0iu5lDnVi+L3qFugCqpbDLMnronaIZ3JAdET8uItwqW60PyViQ/r
         LttWWUCiH5jt7Pbuo8OSOrwtkiJ+AQVtQvDRTJ1WLMdjzOgEn/bM/mDesLnRrztMrIQY
         8NeAUqMJbNUm7LqPm3c40aklgk2siIjtmn7m7ksb5Wz33svhQABflBkrHLc+LMM9I4Tt
         k4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WXI3neVS8CRBAiuDUMYV81QwYWr0/b5PYjiiXMlU4kU=;
        b=3nXAvUXWRwNC0Lfe762fbpEQ3zuNFIki6ZOhXn0YojS91HAFTr0/F5BcFTu6v/xsfi
         WKPH/3SGuZye1Ky/nTTOXDT7SL7XYImfbnBOsG5CDuLyOMLm1bLH/x94QNdQ7cnxAStT
         +zwesWxHfd3b6nQ8uJ5hCxY6Bgd7gLX4Q2guTkMjw615Bx86r7w3Uu9OFyZ73R92D5Pe
         bpUR3cncsy74R2yWM10XvpWAtM83xoBGTMxQzkQXCC5XHvOhHNH8hnCV7FAD65plWcyl
         1n6gXLZp+zUW6AClfy8fzcJp28CEvLeCp+hEp8+zvMBPlULHvWHdgWn+nnrLBeFJy8Ho
         kfVA==
X-Gm-Message-State: ANoB5pl58rZrGeDBl3PbaSApHfMcWw64RrgtPEIR1JzNLAP+8MCKHUjw
        u3gL3uxEl3CIZNqSk+1ZKYZjEA==
X-Google-Smtp-Source: AA0mqf7SXRirUSsiSoROkPjwapnWetlpUM/fK8jb1IPYHT+lYpcM/g6sOcVhIl+rLjjqdpydXD2SMw==
X-Received: by 2002:ad4:4b63:0:b0:4c7:19e5:8953 with SMTP id m3-20020ad44b63000000b004c719e58953mr14646242qvx.116.1670009387211;
        Fri, 02 Dec 2022 11:29:47 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id j25-20020ac874d9000000b003a623e5b9ecsm4665050qtr.78.2022.12.02.11.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 11:29:46 -0800 (PST)
Message-ID: <85869242-b228-8171-de58-791f67ffd547@linaro.org>
Date:   Fri, 2 Dec 2022 13:29:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/8] clk: qcom: rpmh: rename ARC clock data
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
 <20221202185843.721673-7-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221202185843.721673-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/2/22 12:58 PM, Dmitry Baryshkov wrote:
> RPMH ARC clocks are frequently shared between several platfoms. It makes

s/platfoms/platforms/

> little sense to encode the SoC name into the clock name, if the same
> clock is used for other SoCs.
> 
> Rework the ARC clock defintions to remove the SoC name. Keep the

s/defintions/definitions/

> userspace-visible clock name, but encode the divider into the variable
> name. This also makes it obvious which divider is used by the platform,
> making the code less error-prone.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 34099bb6b899..439cace44bd1 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -112,7 +112,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   	}
>   
>   #define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
> -	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
> +	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
>   #define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> @@ -375,8 +375,8 @@ DEFINE_CLK_RPMH_BCM(pka, "PKA0");
>   DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
>   
>   static struct clk_hw *sdm845_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> @@ -397,8 +397,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
>   };
>   
>   static struct clk_hw *sdm670_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> @@ -417,8 +417,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
>   };
>   
>   static struct clk_hw *sdx55_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
>   	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
>   	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
> @@ -433,8 +433,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
>   };
>   
>   static struct clk_hw *sm8150_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> @@ -453,8 +453,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
>   };
>   
>   static struct clk_hw *sc7180_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> @@ -472,8 +472,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
>   };
>   
>   static struct clk_hw *sc8180x_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
> @@ -492,8 +492,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
>   };
>   
>   static struct clk_hw *sm8250_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
>   	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
> @@ -512,8 +512,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>   };
>   
>   static struct clk_hw *sm8350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
>   	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
>   	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
> @@ -539,8 +539,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
>   };
>   
>   static struct clk_hw *sc8280xp_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
>   	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
>   	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
>   	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
> @@ -554,8 +554,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
>   };
>   
>   static struct clk_hw *sm8450_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
>   	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
>   	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
> @@ -577,8 +577,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
>   };
>   
>   static struct clk_hw *sc7280_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
>   	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
>   	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
> @@ -598,14 +598,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
>   };
>   
>   static struct clk_hw *sm6350_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
>   	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
>   	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
>   	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
>   	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
> -	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
> -	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
> +	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
> +	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
> @@ -614,8 +614,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
>   };
>   
>   static struct clk_hw *sdx65_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
> +	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
>   	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
>   	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
>   	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
> @@ -636,8 +636,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
>   };
>   
>   static struct clk_hw *qdu1000_rpmh_clocks[] = {
> -	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
> -	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
> +	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo_div1.hw,
> +	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_div1_ao.hw,
>   };
>   
>   static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {

