Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB80C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 17:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiLERFO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230236AbiLERFN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 12:05:13 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8B41704C
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 09:05:12 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id g10so5467261qkl.6
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wiy8AwGtDVnMaTHMmE6/7ExRJYwlWTv+B+8rgNgf6jQ=;
        b=kNUurlWAzwfvPT1BqnAiX3YAoc/VVH3ZbWzX3ErjjL1sXrgzC7xwLRjX33c3n5zhTr
         5XZxKZuyu8wPEybEWNW03iBAT/E9zLYilB6coDMFGf/LkHrT0kOEOtfJhAWRZyFURjpR
         UiwrFXGcdxRGdaPtfpmSkzBj/GfPJt9nsawcANjqFSORueYELYXmcKut0k3M3OsO9d0N
         EVqV49yzzH8Bp9VbFM4E3HYTpshTQIMkdXxaAhNPB+GCwEIzWNKXonRV01A/9k/aFLxW
         xkGfuJdppXj1l0ZxwCOi3jdZbkPQOLmGf0QpJIVECAihINkM1zTuOcPQOo9s5PcGAP4p
         ZKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wiy8AwGtDVnMaTHMmE6/7ExRJYwlWTv+B+8rgNgf6jQ=;
        b=hQ7njh7QqCydhNvfnZZrJx0k7s04bCfpc+KURQsWqdqSMPZWaUfGYAAu/9H1tK3luQ
         G2UvlXgRylbxTbdn3BeedF04otSioj574+UuiNkCybkr0o6FUdJi9ukV7XN/50sNEHJv
         O1HBwmgfyqEnK3koqkTt4/qiakbBcEsrU00WgK/oimLUekezZNOLIG2yNLoXXJJgyMpn
         lmIe3JMvtMZwhzf5h9/4uJ8SK1GGcxUb+SWlv2JnCHpNg91Aq7XiDikkHIOQ7HzlRZ+T
         UxKTYCGDITyij7dG4TiQa/Qf2jhQ/ex9G0yRPfIw/zL9oC+y9J0Bg1AjHokFa2AogVmz
         5YCg==
X-Gm-Message-State: ANoB5pkeGi9RJJ5zZOBov0Lrt5KrhYntUot8sByUbdqhZcvrjRoMGI40
        DF8+JlrTe7hgPx6ICopXV9Jo7A==
X-Google-Smtp-Source: AA0mqf4wozmlFe8buh+ABaQ826ddavdZJkWXq9R6HbJyufmLUlG4H8d7OSssT85bKXe8B9LSwx1VHw==
X-Received: by 2002:ae9:c302:0:b0:6fc:9e90:8c9a with SMTP id n2-20020ae9c302000000b006fc9e908c9amr20322852qkg.249.1670259911452;
        Mon, 05 Dec 2022 09:05:11 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g13-20020a05620a40cd00b006fc7c5d456asm9786874qko.136.2022.12.05.09.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:05:10 -0800 (PST)
Message-ID: <2b3d23a2-674f-d3ad-6d4f-1d8f9f08bd46@linaro.org>
Date:   Mon, 5 Dec 2022 11:05:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 10/16] clk: qcom: smd-rpm: rename some msm8974 active-only
 clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-11-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
> Rename msm8974_diff_a_clk, msm8974_div_a_clk1 and msm8974_div_a_clk2 to
> move the _a suffix to the end of the name. This follows the patter used

s/patter/pattern/

> by other active-only clocks and thus makes it possible to simplify clock
> definitions.
> This changes the userspace-visible names for this clocks.

Hmmm, is that OK?  (I think it is, because I don't know of any
tool that explicitly relies on these clock names.)  They should
have been named consistently to begin with.

Aside from that, I think this looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 761a5b0b4b94..cb47d69889fb 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -474,9 +474,9 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
>   
>   static struct clk_smd_rpm *msm8909_clks[] = {
> @@ -607,11 +607,11 @@ static struct clk_smd_rpm *msm8974_clks[] = {
>   	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
>   	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
>   	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
> -	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_a_clk,
> +	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_clk_a,
>   	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
>   	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
>   	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
>   	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
> @@ -653,7 +653,7 @@ static struct clk_smd_rpm *msm8976_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   };
> @@ -687,9 +687,9 @@ static struct clk_smd_rpm *msm8992_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -745,9 +745,9 @@ static struct clk_smd_rpm *msm8994_clks[] = {
>   	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
>   	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -813,9 +813,9 @@ static struct clk_smd_rpm *msm8996_clks[] = {
>   	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
>   	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
> @@ -875,9 +875,9 @@ static struct clk_smd_rpm *msm8998_clks[] = {
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
>   	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
>   	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
> @@ -945,7 +945,7 @@ static struct clk_smd_rpm *sdm660_clks[] = {
>   	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
>   	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
>   	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
> -	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
> +	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
>   	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
>   	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
>   	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> @@ -1013,7 +1013,7 @@ static struct clk_smd_rpm *msm8953_clks[] = {
>   	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
>   	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
>   	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
> -	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
> +	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
>   	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
>   	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
>   	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,

