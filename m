Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F74EC61DB3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 14:16:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240927AbjAMOQI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:16:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241328AbjAMOOJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:14:09 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB2B655F
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:13:45 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so33314885lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2wb4QzlfSFMGgz56I7id9+tIGfaOAlRVUGG8w11u8o=;
        b=ZWQNSfyOd39xTZ3DRL56NNpdR56QqBXBinp+KZVXMAygER4G/XUuQfUmeV12Dc6D4F
         Uzqa/4cwcvjzu2lUDvNlXrGItuNETCby03gW2vLDxI4qDf5Qfi3UKoCtpDISlcJ6QNE9
         l1X7lLg3JgNKlSz2jlLHzMmAQ1aPHFb8/piCGBhI4k/i2lU9TufSiM7LdybFO+662S3n
         Qc/gmd5B3BhJM0gtTYS6sx3hXdMIZ2K+N+2rSVeCueFL+bKmAIY1t+BAIzHr7gQabIYJ
         d8MwHrb/DqfzRiiFtGNAxs8xwu9UdL0IG2Q85H1oZl1pWnCo7oW4eBXlFwUlcJfmFdvh
         AR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2wb4QzlfSFMGgz56I7id9+tIGfaOAlRVUGG8w11u8o=;
        b=0mVILeWKnNjGuyuqdIzLG5eY8G/SwIhKG7zCQFjtRR0R9NQHVYtXmJAGLEWBRUwT+6
         k5yCqR2YTfXeWBIslb9PanhMiHpLGswoHIRxT82EwcWz7LPcHPCIjz8AF5AqvPbcl08m
         SU31ZjiXVi1WAVGOJ7awqrtku6kcJLTGDSxCRvvmsY58hSP26Ktag8sCKef6HHbMdIop
         WUqyiDVQ32t+D2VXi1BvMKTKQiqiXrHK0uZxWH1vmV9DHNtMHfCDRj0WW06EyThv+R2Z
         3PB5v04JnrCRBTCJAHq8h8G8fxGr0FhJwBs38FxHt+OrUP5n19zJTft1alYx1Pq/IApJ
         Q0bw==
X-Gm-Message-State: AFqh2kpVFalBJ6rBAecvC5xUxr8EJ4VNdOKUeiiGI6+ZDJg3zvDLLe7G
        Xi/H/Zzn8kibtZ8NB5iXO8f4hQ==
X-Google-Smtp-Source: AMrXdXsaVwUWjQciY3aaXpukAVwX0uZxWa/SibAxvjD8ggD7osAzON+ONUEySVL9kUu6+RWd+UPd1w==
X-Received: by 2002:a05:6512:23a3:b0:4cb:6bcb:de4e with SMTP id c35-20020a05651223a300b004cb6bcbde4emr11066117lfv.24.1673619223899;
        Fri, 13 Jan 2023 06:13:43 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id r16-20020ac252b0000000b004cc716da978sm3769961lfm.209.2023.01.13.06.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:13:42 -0800 (PST)
Message-ID: <498801bc-64c4-df76-8683-999f3a14afa5@linaro.org>
Date:   Fri, 13 Jan 2023 15:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/14] clk: qcom: cpu-8996: fix PLL clock ops
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
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
 <20230113120544.59320-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 13:05, Dmitry Baryshkov wrote:
> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
> better.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index c471c6836c63..b99a47aca478 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
>  		.name = "pwrcl_pll",
>  		.parent_data = pll_parent,
>  		.num_parents = ARRAY_SIZE(pll_parent),
> -		.ops = &clk_alpha_pll_huayra_ops,
> +		.ops = &clk_alpha_pll_hwfsm_ops,
>  	},
>  };
>  
> @@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
>  		.name = "perfcl_pll",
>  		.parent_data = pll_parent,
>  		.num_parents = ARRAY_SIZE(pll_parent),
> -		.ops = &clk_alpha_pll_huayra_ops,
> +		.ops = &clk_alpha_pll_hwfsm_ops,
>  	},
>  };
>  
