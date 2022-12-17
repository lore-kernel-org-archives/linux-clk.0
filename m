Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4113DC4167B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 15:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiLQPPx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Dec 2022 10:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiLQPPv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 17 Dec 2022 10:15:51 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F6D95AA
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:15:49 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id y25so7724816lfa.9
        for <linux-clk@vger.kernel.org>; Sat, 17 Dec 2022 07:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=knyQqy4QxZq7+yTs3CXGmVoBKXjPq0E4xQ9QkF7zAmo=;
        b=Mdok6UFh4KMjb+BzPDy7zf9ZH99FQdt0etcJWC7YQ1u0FfcRY7e9SOeW4nNMShpvEf
         4DXi71SJq+54LfGoQv3h34N+33E39y9uc4FdFnkciOZlyEnmb4mv3fnqNMf6+SyXdvu6
         t3UiSQWYGG/AlL6YvlLJ6Z9R1OF7+qt6hpb4/ys9Y0XC2FCSFgsh6Rwfrgni5qtbE97a
         /EO6saDYt5468IFNepiic4ScTtiuniZkl8OXYINzC349EnVYpVWNZiLKezL5ZfMMjvOO
         0aK/EDqgiOjwMmom5g2jj/qOE/b18k9fPGYZMl7zxO0ADocQuLOIkfvFpGkrBkarLvX4
         wt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=knyQqy4QxZq7+yTs3CXGmVoBKXjPq0E4xQ9QkF7zAmo=;
        b=Oarw23io0vbdce5VeuXjyR8hP9e8WlepwXz8CubEhVwudKgRRCGWDE85Gr9Dxibp0S
         QoyPf5TLJAYjr/vpXfBRecLw2vP3rLOdw3KToBoO+swdvnPWphC4PflorUN9SMnWf2A7
         xI2MH46uKaCW2PDHbvO29BNL2fZFVpsy+929nv6ZTuhb5zCSu93wXQK8xkg+btEyzzL3
         8zNoZSO7JEs5XWaE1rTuR9iMqnJrjt0EbpRTtX52PiDIlJscIS7ketUO3iPzZYlYx0fI
         bu2jVW6gxCAyxnbkOUobVRbCZEPwgdcpNpNOCrzY289bdLzyOUXw5XvyqdVyU01F8jnV
         7nTw==
X-Gm-Message-State: ANoB5plzkrlvw3bHENjI1qyy8LoYXecHDpHAphFFa7CJutx58bJBWSkS
        oMYuW0ydrQBrsrblZ4LhjoSVNw==
X-Google-Smtp-Source: AA0mqf6Jf2r3Uk3tRMHMvY37pAvfB7xgLKS46NddePEkK6MKhBwFAxIGgxqWUuVJxuMQizUjGpZmrA==
X-Received: by 2002:a05:6512:29b:b0:4b5:6f7b:8cfe with SMTP id j27-20020a056512029b00b004b56f7b8cfemr10899408lfp.41.1671290147932;
        Sat, 17 Dec 2022 07:15:47 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b004b52aea5ff8sm532076lfo.30.2022.12.17.07.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:15:47 -0800 (PST)
Message-ID: <e413ac96-085d-34d5-207a-e06d2a57f6de@linaro.org>
Date:   Sat, 17 Dec 2022 16:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 12/15] clk: qcom: gcc-qcs404: add support for GDSCs
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
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-13-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> Add support for two GDSCs provided by this clock controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 8fb268671f0c..f8dbfffc2b8e 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -19,6 +19,7 @@
>  #include "clk-rcg.h"
>  #include "clk-regmap.h"
>  #include "common.h"
> +#include "gdsc.h"
>  #include "reset.h"
>  
>  enum {
> @@ -2598,6 +2599,22 @@ static struct clk_branch gcc_wdsp_q6ss_axim_clk = {
>  	},
>  };
>  
> +static struct gdsc mdss_gdsc = {
> +	.gdscr = 0x4d078,
> +	.pd = {
> +		.name = "mdss",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc oxili_gdsc = {
> +	.gdscr = 0x5901c,
> +	.pd = {
> +		.name = "oxili",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
>  static struct clk_hw *gcc_qcs404_hws[] = {
>  	&cxo.hw,
>  };
> @@ -2748,6 +2765,11 @@ static struct clk_regmap *gcc_qcs404_clocks[] = {
>  
>  };
>  
> +static struct gdsc *gcc_qcs404_gdscs[] = {
> +	[MDSS_GDSC] = &mdss_gdsc,
> +	[OXILI_GDSC] = &oxili_gdsc,
> +};
> +
>  static const struct qcom_reset_map gcc_qcs404_resets[] = {
>  	[GCC_GENI_IR_BCR] = { 0x0F000 },
>  	[GCC_CDSP_RESTART] = { 0x18000 },
> @@ -2790,6 +2812,8 @@ static const struct qcom_cc_desc gcc_qcs404_desc = {
>  	.num_resets = ARRAY_SIZE(gcc_qcs404_resets),
>  	.clk_hws = gcc_qcs404_hws,
>  	.num_clk_hws = ARRAY_SIZE(gcc_qcs404_hws),
> +	.gdscs = gcc_qcs404_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_qcs404_gdscs),
>  };
>  
>  static const struct of_device_id gcc_qcs404_match_table[] = {
