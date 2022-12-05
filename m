Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EB5C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 17:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbiLEREc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 12:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbiLEREa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 12:04:30 -0500
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD991704C
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 09:04:29 -0800 (PST)
Received: by mail-qv1-xf2c.google.com with SMTP id q10so8601445qvt.10
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 09:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwz+OuQk6tKEubcp6tuFQ1urW6/FJci4fX/UqNYTLyU=;
        b=pgn1zsEBlxSqk9bBNvO/O+GXH9x+nUAT12YcfyMTcW9ds8OvD5H8bUajG82nOrjckw
         xQe6a2AsGYQZ32gE1NTQ/LiFTBPAzm/YuGg/IqHJT/XYx8Q6J/ocFXqrwcNdgjBfhvHh
         vTdUIoB0i4rzPpQ8NH59zOL0PK/rHjmpmnXbAw5SS1yBJen2Hn1ehHJ50xafatBrQfqA
         D5qn1qWMt10Lz9zE8pxBhgbKS0e/hIHto7z9hVZDeFrBEDuBsWHYjQr9XxENnB15wQZJ
         FjtQvDtvWb8mwi/PqMH9ot6ALSpJa94Nn14dkTbvMVCwCN4fG1RdFo8xx/clRiwabaMV
         WE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwz+OuQk6tKEubcp6tuFQ1urW6/FJci4fX/UqNYTLyU=;
        b=hEg3mJ3SQy6WAAiSzRS/kWNbGodLjQc2b3Ui4xgxIcDCUhOxe1mTldww7dn576X5HV
         sNrIA10hYVJUQ8i8CqKE7buQ8uO1y/l+Vyvgg7utQ3FSGLaK59MXgqCSkwA1AQb2rBXs
         pGgntvikI4BvHJ62LNOPQN08hj+5W9NYXrGAagV9xrE+iIRL2jSAuQoddTBAN8bAerOU
         VY5d7JIvbX5yfUFNC4fGCrxtVgcYobWeQBjE5NOOhdmgocE2bpkdWFGfHoqexvhA/Eq9
         JC3wpgWPPt6tOHYG0NsZldjBDLzob90CE3dalgdnRV0tlCZf1o1NSJ3o9rKJ+J5D9Lz9
         0zxQ==
X-Gm-Message-State: ANoB5plJ7T+lc9lHCaHhWSZ53aK6ZTXS5v1N7I3VoVrA3ukhM3bPAOup
        qIDN9gfpRMYDsVLQFHPLkiyh1A==
X-Google-Smtp-Source: AA0mqf43A1swtx3vY8uR6kCV5Kd3A/u4ObASnQcKg+sFUbXpCWNXcvICHMlgbIx3bngvTN7uB2xDig==
X-Received: by 2002:a0c:ee27:0:b0:4c6:70c5:fd1d with SMTP id l7-20020a0cee27000000b004c670c5fd1dmr64099883qvs.46.1670259868669;
        Mon, 05 Dec 2022 09:04:28 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l25-20020ac848d9000000b003a7ea0f797asm317124qtr.90.2022.12.05.09.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 09:04:28 -0800 (PST)
Message-ID: <e18ef65c-c134-305f-4b47-8004bee12fb0@linaro.org>
Date:   Mon, 5 Dec 2022 11:04:27 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
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
 <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/3/22 11:57 AM, Dmitry Baryshkov wrote:
> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
> 
> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm not going to comment on the "Fixes" tag on this or any of the
later patches in this series.

Shouldn't this line be removed too?

DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
                    QCOM_SMD_RPM_MEM_CLK, 2);

					-Alex

> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 877ffda42ee9..26c4738eaacf 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1166,7 +1166,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
>   
> -DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
>   		   QCOM_SMD_RPM_MEM_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
> @@ -1201,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
>   	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
>   	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
> -	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
> -	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
> +	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
> +	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
>   	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
>   	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
>   	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
>   	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
> -	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
> -	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
> +	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
> +	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
>   	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
>   	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
>   };

