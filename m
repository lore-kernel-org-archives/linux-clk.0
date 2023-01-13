Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EA9C678D4
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 14:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241270AbjAMOP2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 09:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233352AbjAMOOF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 09:14:05 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17A56E419
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:13:26 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id d30so28391449lfv.8
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnrR8OzIVYDyLEqx3rH0fOCIKMO2kF6JBM70g6qA6vs=;
        b=jgQqNd0Qj/b2iSOLcwr0SkTqhu/wUtrilgpu+Qs/Xdy5a2yTcvSIFmi78Vb3U6StkX
         8CMhA5WlKjnPvNNjsQ5/tYpaNQpy4ALURFnb/3J1eMgQKI4G4/zsBDB3wmDZ8/wo57ce
         8EYGEE+lnnVeV1vkQY9fj5RWn4iLMsfWtV3wVbKmQbO8YkwMGXZu15TiFbuj+37yMalN
         qpnt8H0MQHVMMl8m/rtLBRPLmpt8xy2Piokvdtcxc9V7zgvJRR9vcwVPn0gx/nNVkJEN
         yZLjkgdjeaelSsqQiikTTOo82W3Ustrv1yoKkgLBL2cbEJOpMQMx3xNarJcKsrnO1OSk
         ZR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnrR8OzIVYDyLEqx3rH0fOCIKMO2kF6JBM70g6qA6vs=;
        b=wPEuVBpFNQVzdE3YCJ9rrvfdR0qh8hakP3bOQUdyc9JVUt7zdIByvgeW5id4yx0Oer
         oNQUUTcj0ih7J8mKeGDKjP8VOxvbqkyEvyHJ+1lGa/XJtEm6WWGjpIiaHfVIkpww6QF+
         rGrqk96ySWJlY6zvgh7rQyLXesrkrAFlEsljH3KoUk6N6wfD79hTpOBbHwX+Y8rtSvu8
         QZQ0IR3RnvYhzObuWdABgDuOniptPJ2Ngf+sXAxGGeZd0BEc3ZU5w/z7GaCH9a67rX0R
         P+wxz5aDoFvVfQ9TZHePxZ6qspWLX/EjXFu+Nz7UehaCox3YZxG/bHDtw0i8So6Gx9Fr
         U9Zg==
X-Gm-Message-State: AFqh2kozimX9UI7lETzt9a9PyMZDw7Da6Gidhbu8e9BMMJ0s5WyHZYJZ
        /wAGWXZC6KyLzHHyIy2tq+FAHw==
X-Google-Smtp-Source: AMrXdXuZwMIeYwzmb5nU3F/JruLk5vvCURo5AroRcRxuoYPmyHZ3EtkvKAFCqCN0feUc2Fx52ojdKA==
X-Received: by 2002:ac2:5394:0:b0:4b4:e2c9:9b25 with SMTP id g20-20020ac25394000000b004b4e2c99b25mr20413614lfh.44.1673619205240;
        Fri, 13 Jan 2023 06:13:25 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651238c900b004d023090504sm418741lft.84.2023.01.13.06.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:13:24 -0800 (PST)
Message-ID: <e59b5ca8-1618-6b63-269c-841f4cc4a2dd@linaro.org>
Date:   Fri, 13 Jan 2023 15:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 11/14] clk: qcom: cpu-8996: fix ACD initialization
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
 <20230113120544.59320-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113120544.59320-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 13.01.2023 13:05, Dmitry Baryshkov wrote:
> The vendor kernel applies different order while programming SSSCTL and
> L2ACDCR registers on power and performance clusters. However it was
> demonstrated that doing this upstream results in the board reset. Make
> both clusters use the same sequence, which fixes the reset.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 07d59bca741e..c471c6836c63 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>  	return ret;
>  }
>  
> -#define CPU_AFINITY_MASK 0xFFF
> -#define PWRCL_CPU_REG_MASK 0x3
> -#define PERFCL_CPU_REG_MASK 0x103
> +#define CPU_CLUSTER_AFFINITY_MASK 0xf00
> +#define PWRCL_AFFINITY_MASK 0x000
> +#define PERFCL_AFFINITY_MASK 0x100
>  
>  #define L2ACDCR_REG 0x580ULL
>  #define L2ACDTD_REG 0x581ULL
> @@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
>  	if (val == 0x00006a11)
>  		goto out;
>  
> -	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
> -
>  	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>  	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
>  	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
>  
> -	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
> -		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
> -	}
> +	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>  
> -	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
> +	hwid = read_cpuid_mpidr();
> +	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
> +		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> +	else
>  		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
> -	}
>  
>  out:
>  	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
