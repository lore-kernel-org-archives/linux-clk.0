Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBABDC54EBE
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 14:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241411AbjAMOOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241973AbjAMONk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:13:40 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DEE65EC3F
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so33306991lfv.2
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmVCGE1tKLftZsOP61jEhuxWLcIpwarx5xis4uY5iM8=;
        b=q75rohoF5reGmdgS4Dx+nJ6bPP8PK2iIxn70zQYLBmq4CToQVpJDU1I3Q2hZUtCfE+
         GYKQ51z3H7wxooH61waoQxitR8DQXQauJ0KFSd/vw+xvkUgIc5h+s6g+PJcbIMcSIqyE
         L2J7p1Zd+XOsa70fC/B05rksPGZdngjmUj3C5o1Imho+xIgF2FJJKiMIavgKxg+/v6iu
         vwRQhW6OpX75UnlhEGup/GLqkL5S6fTgzkoUeUSEVUphCrRoqhzNPaTB0vqUR3YQl/fS
         QvemjUDdXwWEsxMCP+P7w4JohTBRb8JHzm7RstsGlp1tpBxR+G9pGivmNStxSWEee+6Z
         PVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmVCGE1tKLftZsOP61jEhuxWLcIpwarx5xis4uY5iM8=;
        b=r6JiufClL9q5i9VYTsAMtPs9arveqnMJAzRZFHOCmEBbmg2ZKyck+VgYdWm5kIElu1
         bOcNA5WCPbWcR6ZMHrdGF2p7ZytQFWL0G3hErdjJHLlHiQ31jTp//cItFpQ15aDNrqCz
         alYRHPC7rAFfMr0Nt0Iyibr/Y192TNwAz+BO/RogFXr4yRWXx2z2F0IL6W+juepO46Uj
         UU6hq9mZ4LY1EFBt3McpDNrshTPJhpNMc70doRM9r1aWJLiWg6Ct0nTW5D1RlKIHV808
         2bc2AjqKQIPOMYxY9DTIiJj60Doocbjtp3acZBMKQuir6FZGCu9mUAqHk8UnOFrNFD9/
         O72A==
X-Gm-Message-State: AFqh2kr6mnD9EHAWXbWuF+ax/ywlxpzdqV/QEv3zQv1kBA95eLH8ehGH
        9onWszu9V7u3lYo1Co+sv/06MA==
X-Google-Smtp-Source: AMrXdXvirc+w/7gNZGxPeG/Zp+UuUfdNfgq2ii1n23Ya9cXgO9etGE9u+6wb1an3zlrHT6cS3uA9Tg==
X-Received: by 2002:a05:6512:1115:b0:4aa:e120:b431 with SMTP id l21-20020a056512111500b004aae120b431mr27335485lfg.38.1673619106753;
        Fri, 13 Jan 2023 06:11:46 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id cf37-20020a056512282500b004d254939bebsm99737lfb.305.2023.01.13.06.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:11:45 -0800 (PST)
Message-ID: <5f8faea9-fca6-004f-563c-6a88e6f70943@linaro.org>
Date:   Fri, 13 Jan 2023 15:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 02/14] clk: qcom: clk-alpha-pll: program
 PLL_TEST/PLL_TEST_U if required
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
 <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 13:05, Dmitry Baryshkov wrote:
> Program PLL_TEST and PLL_TEST_U registers if required by the pll
> configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index f9e4cfd7261c..e266379427f2 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -358,6 +358,11 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  
>  	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
>  
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
> +						config->test_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
> +						config->test_ctl_hi_val);
> +
>  	if (pll->flags & SUPPORTS_FSM_MODE)
>  		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
>  }
