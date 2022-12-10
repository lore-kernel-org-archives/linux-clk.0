Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83022C4332F
	for <linux-clk@archiver.kernel.org>; Sat, 10 Dec 2022 19:31:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiLJTbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Dec 2022 14:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiLJTbK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Dec 2022 14:31:10 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD34167CD
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:31:08 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id b3so12187096lfv.2
        for <linux-clk@vger.kernel.org>; Sat, 10 Dec 2022 11:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBUPWMXH8iRSCcgzepxUdF/j8g+GS5ukyojVVIhhu3M=;
        b=y6lHw1KuKVu+NoL28vrwtbDpXL/YfiIsba5gF3JYqR/bUkh+OLhZI2PqOBG/L0uZCt
         UdiRueuVuPK86V6PtPpsBGVFxMcSubJAd4zfgXCQi1Ym1h+oXmAX8T2sACAFc/gJ3I6e
         ZNq6fxxGEtTQwaYT/UI+HbHe9AgZ1HuCj42Rvn8/oK9a0ddXCZl92dOxoURWFlfputYY
         3nZsW/mSYMlFrA4NNcOxJPia7PPSp6ntQeu36fSF2uSxZqSpvbrpbIl61uk/uUCHzCMS
         hygVdT192mUqj1WtD+iCkxfEcnJOrDt/OEXlnRcOVxut/93hRpHCzA9ohwHNpcWJRmy4
         Hx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBUPWMXH8iRSCcgzepxUdF/j8g+GS5ukyojVVIhhu3M=;
        b=SXQup0n9e4+Oxw27iqiuM3XpOyF+Vmg7QnwZqchnmAidY9QkbDDINDOKornr9Mm7uH
         qVoAZP8hNcpjX8wjrFyQZk12Gj3TMaQ2MmOcVHth2DkoTDE1jFzfZujzoAC9BAZMO+n7
         HeAcUdmiYBVOAaudxQOduPF1I03dtEqJ0R4GOfgy/0pNlZnZafxfDPyACVbdYG5Mgccq
         MHhHD+vN5YnfhCmvZ+rZ62NPTNg+7VDH7wmiO7JKN+cEliDy09bUzFsu4/oDKUwVqcDa
         2LfujO462xewmhJlM0mZgiPp9FwwxPeN3TNxFw0vhSfTjI5N9AGcLHAl5Lm3hZTbc6VR
         xEow==
X-Gm-Message-State: ANoB5pk4uhidG+GAm4EzkI/mJnYqrB8Z76tT1PzxEqXHBRFhpgfrTsPT
        H4y0NQNYi5ElNbmtyEb1YEoX55gSsKunPrO2
X-Google-Smtp-Source: AA0mqf6GN2UJFrbfak4FnxglDKqQ9HfQGGSCUQAmkyDnNV7X0m021Yotir7hcHUvP8t8sO/5GBuDjA==
X-Received: by 2002:ac2:43d8:0:b0:4ab:7f8d:472 with SMTP id u24-20020ac243d8000000b004ab7f8d0472mr2418846lfl.65.1670700667302;
        Sat, 10 Dec 2022 11:31:07 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id f17-20020a056512361100b004b373f61a60sm828189lfs.96.2022.12.10.11.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Dec 2022 11:31:06 -0800 (PST)
Message-ID: <f9eb2503-9d84-ad73-09e0-3ffeef1e674c@linaro.org>
Date:   Sat, 10 Dec 2022 20:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/3] clk: qcom: gcc-sm6375: use parent_hws for
 gcc_disp_gpll0_div_clk_src
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
 <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10.12.2022 20:07, Dmitry Baryshkov wrote:
> Change gpll0 to use parent_hws instead of parent_names for
> gcc_disp_gpll0_div_clk_src clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sm6375.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
> index 89a1cc90b145..6d75f735a7a6 100644
> --- a/drivers/clk/qcom/gcc-sm6375.c
> +++ b/drivers/clk/qcom/gcc-sm6375.c
> @@ -2330,8 +2330,9 @@ static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
>  	.width = 2,
>  	.clkr.hw.init = &(struct clk_init_data) {
>  		.name = "gcc_disp_gpll0_clk_src",
> -		.parent_names =
> -			(const char *[]){ "gpll0" },
> +		.parent_hws = (const struct clk_hw*[]){
> +			&gpll0.clkr.hw,
> +		},
>  		.num_parents = 1,
>  		.ops = &clk_regmap_div_ops,
>  	},
