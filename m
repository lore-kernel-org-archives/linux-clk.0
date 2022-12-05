Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D989C4321E
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 11:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbiLELPz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 06:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiLELPy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 06:15:54 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A20017589
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 03:15:53 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id t17so1580173eju.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 03:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EfVbf1HnBjRJeSc49fBim3XOYpwf1tSZHQixBJZFBWw=;
        b=fVq/nBrwM2cf+JJQAbH+Rv2uBeYHbwOcz+DdyP9xQLwqJrap+OhR2wp2eIIFZxCkde
         dqocq9G17+El7ect090M6o5Q00U+ALUO6byGQc4vw9SnB0XALpIchIe7e9kSVqSv/+Vd
         JYxAwL1tMY5sPeMGlxgTGRZtNUrweUYTlMdhqRJ2HyQR4D8gu7fgnKmMaXNwDgSiRtDz
         /xFr5townOvGd9Y4w5hecdQrhOkHl1q8TE4DjECO6nUdQvqJyFEFSZWKKiaJPujFVUyz
         Mzzb3DHCqnqBqJIL9xjlTpFYy/aaEZJm+EsJOWQIn170L4bamiE+If07wdDO91Nb99TF
         YmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EfVbf1HnBjRJeSc49fBim3XOYpwf1tSZHQixBJZFBWw=;
        b=6qXuiR5IXyUiZvQ0tEA2ioaTzsV/KNwvO9gCLkI26j7MeN6Lot3KdLbm0oK1AOi7e8
         hdC5l1uqHoj5TLiYIxgNhA6FC724eRqyqfilAto79FyURs+e9auHkK1P1Dl+DPqpuUTY
         PFN117Uw8MGhC4fHJI7cEqwyVUzL3bvN6YKLAgMSs90cLVJfP7BnJ13C4Z48zwaEvw7n
         J36Fr75qYkoxDnHJg8QhpMKtsOoRWozzQgOeK2+ayzwJ9ZJxQl7NA05JXV1fwG8kLLVv
         dW9at6TTz/nHGa7fGowe4VbIOpwo+Or1kpO8HiCyJsVvmIn8/BmvMZgcQjNAWBkwCslq
         AMLA==
X-Gm-Message-State: ANoB5pkStpNJmIQe5x3Eu+MybMjcomAbRouwFZAU7LO8/3WUwj8+bH6U
        piNB4P1gDg5RbkoqosMoBFJJL0D87SNlSw9Un9s=
X-Google-Smtp-Source: AA0mqf5PNWKRF2vdUdMz6ZbvCckIelXy7YbS0og6UYGuiL5Lo5MpIqxiY0cSB+QIacjPm8JivlQSuw==
X-Received: by 2002:a17:906:745:b0:7bd:f50f:a51c with SMTP id z5-20020a170906074500b007bdf50fa51cmr35600590ejb.285.1670238951777;
        Mon, 05 Dec 2022 03:15:51 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 24-20020a170906309800b0078c1e174e11sm6125598ejv.136.2022.12.05.03.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:15:50 -0800 (PST)
Message-ID: <2374071d-b2e3-e77d-4d06-70b78bcb6300@linaro.org>
Date:   Mon, 5 Dec 2022 12:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 03/16] clk: qcom: smd-rpm: remove duplication between
 qcs404 and qcm2290 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.
> 
> Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
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
