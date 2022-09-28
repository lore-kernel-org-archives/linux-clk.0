Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3A4C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbiI1PCG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiI1PCF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:02:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3514A88A1A
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:02:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v28so7408943wrd.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=UMwaiHo1eLQK8IfkiAfCU0lkKLmszBUs//Hb1jAlWoY=;
        b=enbOhPsr6zIPkBsmx40qOuouUrPan0+01WARY8T73AICUgpKOA6dEbIUNaSEO5MUTU
         p2+hCJztXY9lEySCO9QuW5pFkIycqcz2Cmde3ZCUgUPwpkmdFaHn5dVl4gjHo54gg4QE
         7Ar9im1vCB9d6BsOs0r3APyf23A2xbY0fyG4wbSb2VO5x/rthaJNwG1p3Nc8HuEXDwB3
         MXVF5O0e1cZxnKLOw76xhxUQ1qkVP0uLawoIIdzDlvFyf2Yqvo/OmxbYAp//SgVHSq/w
         ybkXgYTKqrsdG4mZiyZemMpp6LUhZy0l4LMerVubMyufYovZby+mRNUbuJJgYW1L5FvI
         DlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=UMwaiHo1eLQK8IfkiAfCU0lkKLmszBUs//Hb1jAlWoY=;
        b=itz9j8ztrMmW47Np3hCbtw9QOiAawLKOVlgEBPf12cZ3/redM3O372Wapv8fNyb7G9
         JvWOcsufH7KEOSC98AdpSRxgg9ExxKsWwTNCMlCROox16c+00xxxlt8ToR5pNejZwucc
         pBDwe0DHu5QuiUatCKzswKG7flWbw3WBsBjDu4zMVNCoK5/Ocgb8m339J/l29ZqohoBC
         bFBBKdBFZr+9gTomr8qYn9Hk3XNDwXVyDqLQuWs3gsMJxX6sQXV7Of9HydTH3SbahleZ
         /C4/+1iR0AE13MJPTgpqs7b580tUnnvPVkL16i9cRftNg566f7kDFan00OHF/DGCztdG
         yx9Q==
X-Gm-Message-State: ACrzQf1PEs3kHFAnDwnr0HyxJTnw1TG/V+quYzKCg41PsnEdJK64tsMg
        OEWygSfQC8FiR/4+0OMtnUj8Ag==
X-Google-Smtp-Source: AMsMyM42uI+yVH19PPnULaoaWHiL4YsvauLxANPEcxM5bMgKTHG0BrNhtSEP2dzZ5ETDA2rVtU/4zw==
X-Received: by 2002:adf:a41e:0:b0:22c:c70e:5202 with SMTP id d30-20020adfa41e000000b0022cc70e5202mr3211113wra.412.1664377321759;
        Wed, 28 Sep 2022 08:02:01 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z8-20020a1cf408000000b003b56be51313sm1449795wma.44.2022.09.28.08.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:02:01 -0700 (PDT)
Message-ID: <edbe66fd-1956-6e1f-b7a0-228e1b6ba2fa@linaro.org>
Date:   Wed, 28 Sep 2022 16:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 3/3] clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of
 specifying num_parents
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
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-4-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20220928145609.375860-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 15:56, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-msm8939.c | 120 ++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 9d4f35716990..af608f165896 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -614,7 +614,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
>   	.clkr.hw.init = &(struct clk_init_data){
>   		.name = "pcnoc_bfdcd_clk_src",
>   		.parent_data = gcc_xo_gpll0_parent_data,
> -		.num_parents = 2,
> +		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_parent_data),
>   		.ops = &clk_rcg2_ops,
>   	},
>   };

Nice

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
