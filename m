Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83B5C54EE9
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbiI1PY3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbiI1PYD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:24:03 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EAFB5E7E
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:22:48 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso946639wmc.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=lWeGi0gBGrGKUrvIMJh2ce84Y/XoNjjWvMsSIb73vv0=;
        b=F3QqFGhiuBtanG4NhqX19aMF8z8mUPtzQixe48RgjnTcpwS6bv5sjLGjWqxfELD1FP
         gQ+rXEm3uA7tFMDN2HTOUluMJ/1voMiCNgUoZ2p6qBMHMEyAiopDLBMm8BTvz14CzJ1M
         3bqPi78NyRvEodgXb3YmGIR45fHjlCu3zywETU84PQ+ihDAZ2rL4aFGLHqSQe82fe1+A
         eQo/5+sj4zRKKDU2RA9PSmg45Rpvrs+WtVVnQcB14NR/AsydJygNNs0rLOF9Ki0HawD3
         y50rmDFvKTmp2gSCoqsQaAAn/1SHiXhnfzGkXRd5Q/s/R3Q0yucSaLTKu+d9F8LtjEEo
         syIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=lWeGi0gBGrGKUrvIMJh2ce84Y/XoNjjWvMsSIb73vv0=;
        b=WdCiz1bTZRRLTQof1mN32DC4KRHUZzTc87Hfv1y5lS0arggSelMvcpngyKyu8xtGTn
         M+1TilILcDNDXBn+Fnc86qmRKI5mB/Okk/K4EtDFrkpw2lykxaInELgnWC9w3ur/29kh
         DUgXjUeTs3dtRd0LYXyb5IgnqyCz1+peppN3R2SqsqfIpabe4sWwyBA6sKdgxh/va7T+
         qP2QcQ7MyZnKTtTQPl4uZqWW+rk0BqACz/SQ49QX9PlE1oYO4epXvN2L8vC7edSwtWjy
         ATWCHSYSrktZSzI9L/x7/+aDgmp6JB9xqgbyA9GvBCO9U8t30D2Guz5sJBMU+wqP04qC
         r3MA==
X-Gm-Message-State: ACrzQf14IP5SGYjIgn/a295p0UW7THzVHNtyZryi0vYo9BzUoVy3tNps
        cIwazi5qkFz5i1BTzMV//8w3Hw==
X-Google-Smtp-Source: AMsMyM7eApu/zDXm34C5IhYJCj/BGmPCbLgryIq2I36PR8WzGV4eGAS4hQK/Na1Zn5JOm9ZE0HdLsA==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id x17-20020a05600c421100b003b463349940mr7464641wmh.166.1664378566363;
        Wed, 28 Sep 2022 08:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0a4300b003b4fdbb6319sm2529820wmq.21.2022.09.28.08.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:22:45 -0700 (PDT)
Message-ID: <909dacda-c44f-638e-77e2-6f1bb3adda56@linaro.org>
Date:   Wed, 28 Sep 2022 17:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 04/11] clk: qcom: gcc-msm8974: move clock parent tables
 down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-5-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220928145958.376288-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the PLL declrataions, so that we
typo:                                        s/declrataions/declarations/
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
>   1 file changed, 49 insertions(+), 49 deletions(-)

<snip


> +static struct clk_pll gpll4 = {
> +	.l_reg = 0x1dc4,
> +	.m_reg = 0x1dc8,
> +	.n_reg = 0x1dcc,
> +	.config_reg = 0x1dd4,
> +	.mode_reg = 0x1dc0,
> +	.status_reg = 0x1ddc,
> +	.status_bit = 17,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "gpll4",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_ops,
> +	},
> +};
> +
> +static struct clk_regmap gpll4_vote = {
> +	.enable_reg = 0x1480,
> +	.enable_mask = BIT(4),
> +	.hw.init = &(struct clk_init_data){
> +		.name = "gpll4_vote",
> +		.parent_names = (const char *[]){ "gpll4" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_vote_ops,
> +	},
> +};
> +

<snip>

>   
> -static struct clk_pll gpll4 = {
> -	.l_reg = 0x1dc4,
> -	.m_reg = 0x1dc8,
> -	.n_reg = 0x1dcc,
> -	.config_reg = 0x1dd4,
> -	.mode_reg = 0x1dc0,
> -	.status_reg = 0x1ddc,
> -	.status_bit = 17,
> -	.clkr.hw.init = &(struct clk_init_data){
> -		.name = "gpll4",
> -		.parent_names = (const char *[]){ "xo" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_ops,
> -	},
> -};
> -
> -static struct clk_regmap gpll4_vote = {
> -	.enable_reg = 0x1480,
> -	.enable_mask = BIT(4),
> -	.hw.init = &(struct clk_init_data){
> -		.name = "gpll4_vote",
> -		.parent_names = (const char *[]){ "gpll4" },
> -		.num_parents = 1,
> -		.ops = &clk_pll_vote_ops,
> -	},
> -};

<snip>

nitpick: you're also moving pll4 up, it's worth adding it to commit message

Neil
