Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0315C4321E
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 17:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiLEREl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbiLEREi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 12:04:38 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D769918E31
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 09:04:37 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id y15so11852259qtv.5
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 09:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nh9KwaSUxyUVvW9NXvR+G5RIVUSK0RWSQlbrImVIjYw=;
        b=AHurxprRVpLFLHPRz9sBJyWavtPu9/Y4AfzqOuS3Heq9Tw+gQqCNsHhdLBlgUSvIes
         iXxRvKSAzCqVDau4FOh9/2+gfLXfHIIg7q/90GjLRb3qPK0GLHgtZS+jhchxsCp/W+H+
         mfNB7ExCEBEdS8gJtUDJ+GThE9EAq4qkuUMqAIpCCw06xVHW5TuslqR+Gjctr9p61qWK
         +/n7ns52EayCU0uK3tZPbQAGHNwp1BOf/89WMh+OJJXZraQWF30LsUSIJdXskQK9Rhb9
         0NcuvvcoJABcnSo8PDlgLLDVzlnX24J3M7c2gTxDpenIxcFTuhxOcJYbNtijrX5xWN8I
         nl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nh9KwaSUxyUVvW9NXvR+G5RIVUSK0RWSQlbrImVIjYw=;
        b=Sir/hLVsmSHX0Z0ZkrF2gRMT/h174FV+088axO7Lw778laemyEf058dLfxKsAI3OhK
         DRwGa9z4VT9dxXxkLFID7ELSmzPWX2KC7nZqfbkvkWN9wScjKHhkLocGrTXL3kYFKNOA
         3ytdz2qz2cebsvR5YKZhvMVqSgCxn4pRLE66KH5cTUVuXQurXEzo9+presVWB/ymqpgP
         6Ud8IwoaeHglfeKiTqlJBwbCIOrNzlCWdWmRrOUmAeK9VOpcWYn3cVvd7tDEBDMZSLEH
         PGjxK5GCxoeiqAtzaMQemRChH/tZVF7dEXlOdKudg4TMZN0VQUC5NTZdbkEAtAc41SBr
         CYUQ==
X-Gm-Message-State: ANoB5pnaVwliOjWhmjjjo2I2+8HzJ3fwJa0ZcjNV3RJxhRJonECITbeg
        8zwFXF62O8epuLyzp3x3iFo4wQ==
X-Google-Smtp-Source: AA0mqf5cxqN11DjzDiWTK0ulqxQ7rgLxnqNrRukxRvWBg7aSQuZdIfeB+Jc9EfSbFTIwu8Ti6PYjmA==
X-Received: by 2002:ac8:454e:0:b0:3a5:10c2:9eed with SMTP id z14-20020ac8454e000000b003a510c29eedmr63584452qtn.562.1670259876866;
        Mon, 05 Dec 2022 09:04:36 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id cf16-20020a05622a401000b003996aa171b9sm9765824qtb.97.2022.12.05.09.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:36 -0800 (PST)
Message-ID: <2b443583-3d7a-184f-3331-bdd1c9d27a03@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 05/16] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for
 qcm2290 SoC
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
 <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> The qcm2290's ln_bb_clk2 is identical to the freshly added msm8998's
> ln_bb_clk2 one. Use the latter and drop the SoC-specific version.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 42d55bf35a33..6af0753454ea 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1167,7 +1167,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   };
>   
>   /* QCM2290 */
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
> @@ -1184,8 +1183,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
>   	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
> -	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
> -	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
> +	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
> +	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
>   	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
>   	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
>   	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,

