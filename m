Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D9BC54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 16:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbjALQPE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 11:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbjALQNn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 11:13:43 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C7864E2
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 08:11:03 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bu8so29119881lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDMpZ7nYLjTDXnu6f0kwHu0p4dx4SrxPBhqY8dO1Btk=;
        b=eEAdIRC00f4yzhweljUJHVoHGuR3+i/vbhyRM/0aZ0QE6G5eVga7g6ZIr7sQtKW7Bg
         +mRET/egfBvRoTIBpXFFHXX2yOzRXZOFzdCw2Hxtr1cGgr98bqOTs1jnvuqgCu5d6Kkf
         1DeQQKcEO/VCKfIUZUV0NyVomXNEkfv6PQlAcii3SXPmUF4V1FIvy2nW77/UT+JmTldK
         RrijzksnKa7MRGHX8ygObybY7pa4XUsyPdMrZxGi5UsC6SPhRmpwUFwu8/yexmAbbybz
         UvWnnWVqSMSxAcwa92ECXKGYm529Cg/GiXysm5pehCpMjKsJMm9szBztEAX4qBWBxtlG
         W3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDMpZ7nYLjTDXnu6f0kwHu0p4dx4SrxPBhqY8dO1Btk=;
        b=eBNyGGyTxRNz7vh2AO1heoiNwl/6r2DWMTlmKazQl4WGNM9hKnmY5Ryt60oaZItl3D
         w0xW494YHiTzwAyDwscieeZ6U+rc3cpkjCZFfGhqP9xHOyffd8rwDkARba+qV9htv+pD
         x/d6dH3ATDJUR2cnoDPX6WwjS7oaB8HUmr8cHFX/J75YRYNA8d8r1/Y4fL1YZd5oAVbS
         ikZp89iQPkiRvDQnXmr61DpucNRXOWxBEmDAP0APfn7MczE4Y9fjFSwZWF8oBAFVqbmU
         CPFf7X6CBIXriEdld8ZGAIFEk/chmIH9oFwylXsCqRYFFHSNuA3ps/8UrobQSOvEgqyn
         mHhg==
X-Gm-Message-State: AFqh2kojBCk697wB3htobKVK53YGv932M+LghsT0FppGoUtrzHA1MYY6
        iDy57PSpolbgkZCrGwTlMYvEpx9P0Nl6JA22
X-Google-Smtp-Source: AMrXdXsLtkTSb1t3CS955ys+0xELFp8Ekp2MGMg2C9GHUpcgNyq/tciQP/NURO0rOZpruFZ5LWXKvQ==
X-Received: by 2002:a05:6512:1507:b0:4ca:f9e4:4d57 with SMTP id bq7-20020a056512150700b004caf9e44d57mr23417049lfb.11.1673539862000;
        Thu, 12 Jan 2023 08:11:02 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id g12-20020a0565123b8c00b004aa543f3748sm3324807lfv.130.2023.01.12.08.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 08:10:47 -0800 (PST)
Message-ID: <b2798d5a-d637-cc94-501e-0739345f0fed@linaro.org>
Date:   Thu, 12 Jan 2023 17:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/13] clk: qcom: cpu-8996: fix PLL clock ops
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
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.01.2023 20:20, Dmitry Baryshkov wrote:
> Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
> better.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
I *think* SUPPORTS_DYNAMIC_UPDATE should also be kicked from
non-alt PLLs.. Otherwise we might have been kicking ourselves
in the face all along, changing the frequency of a running
PLL that doesn't support it if we were using the main PLL
and not the altPLL/ACD..

Downstream sets it only for clk_ops_alpha_pll_hwfsm which is
used on alt PLLs only

This change seems sound, as Huayra supports dynamic update
even without setting any flags.

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 1c00eb629b61..b53cddc4bca3 100644
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
