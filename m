Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176E4C47089
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 11:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbiLELNs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 06:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbiLELNo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 06:13:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9459F17437
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 03:13:41 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id d20so15333255edn.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 03:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQ0RqMSAAwdQT6/3KI0lCQiT4MSWF8waW/AXXmzDku0=;
        b=VuHwdj+v0Qcx5Bno3q+cO6yJlNABzctjhRdE0jO4FuHvTrudv5pk80xdrj5OqlHPM5
         gb9Nhx2NMOZqizgCoSjl/P7gSmXKdROgfdp9wNJzOiyiJzoTjLX8vwUHIjP9B9OjzdwO
         FpCDps7WmgjrRR6HihPe+qgDomOhxg+T4mmP4t7Ysh9UFAaFHH4xrQc04AHOseBYgxvy
         +zteVRoQDS1UMLWliV5jCc5UOWChCJI4opSElDQyNQoibhUiAP6KFSb8JBqU0u5YnFMW
         k6W0kuiVEOOWh7Bt1tMqipxnJ5U2yeXkF1xKkf9tTfZhrC8izqEDLdghnvmO+bsT9O/V
         XecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KQ0RqMSAAwdQT6/3KI0lCQiT4MSWF8waW/AXXmzDku0=;
        b=V/H0Fqn0o2Flfl8zaFDkeGEoK/822JcUH8MN8XN9LNhA/0AgSD/6gB2SvHd3SE9Sjh
         6Ke/OgXSVW3ei+D2VjIMCj0mYuMDI8xxws2PTQOHy7AoB+xikq17fBfz3VMy30BfrwNI
         vPaoJY9+vp2HFR+J7/qx2bsuC4vJH8Qd7kjewVQ36QrdJJxKSaKfKrEjNzqpvcmAIepy
         60HMt5PE9reuYZOz49I1u/D5UdV9RQGs5wrKf7Vd/6K+Nm09jUSVfogsUA4gf+00AP00
         /bIYsIzwcVP8DYwZk4I7Flzm8K7YVxFM78bWBiKTRv8EL5wh+E1/9lIaI/EcW6tkFGGD
         nxww==
X-Gm-Message-State: ANoB5pnFTQoNA3EzPR4f/s/CNl5jbZhkp9LytdwYe18JBZVsjLqbajrn
        8VT3u5VZTukKF3sNssOBKJpzyw==
X-Google-Smtp-Source: AA0mqf5hfhdZ627ut0pfp5gM1MER8/lIl5sZuTx9DA5ee9y6CaXQNUBZuW35gOmQrc64Xx1SHl8dtQ==
X-Received: by 2002:aa7:c055:0:b0:45a:1af2:ed6d with SMTP id k21-20020aa7c055000000b0045a1af2ed6dmr57633752edo.364.1670238819858;
        Mon, 05 Dec 2022 03:13:39 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 6-20020a170906310600b00738795e7d9bsm6097475ejx.2.2022.12.05.03.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:13:39 -0800 (PST)
Message-ID: <e75289d7-26b2-dd6c-998c-971d80378f18@linaro.org>
Date:   Mon, 5 Dec 2022 12:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 01/16] clk: qcom: smd-rpm: remove duplication between
 sm6375 and sm6125 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 03/12/2022 18:57, Dmitry Baryshkov wrote:
> Reuse sm6125's MMAXI clocks for sm6375. Also drop QCOM_SMD_RPM_MMXI_CLK,
> which is equal to QCOM_SMD_RPM_MMAXI_CLK.
> 
> Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Nice catch!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c   | 10 ++++------
>   include/linux/soc/qcom/smd-rpm.h |  1 -
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index fea505876855..077875cf0d80 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1120,8 +1120,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
>   };
>   
>   /* SM6375 */
> -DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
> -DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
>   DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
>   DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
>   DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
> @@ -1140,10 +1138,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
>   	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
>   	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
>   	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
> -	[RPM_SMD_MMRT_CLK] = &sm6375_mmrt_clk,
> -	[RPM_SMD_MMRT_A_CLK] = &sm6375_mmrt_a_clk,
> -	[RPM_SMD_MMNRT_CLK] = &sm6375_mmnrt_clk,
> -	[RPM_SMD_MMNRT_A_CLK] = &sm6375_mmnrt_a_clk,
> +	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
> +	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
> +	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
> +	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
>   	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
>   	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
>   	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
> index 3ab8c07f71c0..82c9d489833a 100644
> --- a/include/linux/soc/qcom/smd-rpm.h
> +++ b/include/linux/soc/qcom/smd-rpm.h
> @@ -41,7 +41,6 @@ struct qcom_smd_rpm;
>   #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
>   #define QCOM_SMD_RPM_PKA_CLK	0x616b70
>   #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
> -#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
>   
>   int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
>   		       int state,
