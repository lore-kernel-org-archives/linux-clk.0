Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2026AC4321E
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 11:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiLEL1M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 06:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbiLEL1L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 06:27:11 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60475186C5
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 03:27:10 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id m19so15280161edj.8
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 03:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSF/lCWacwPE86qHR7UQhDcaBGH6va92RTEKsuxJUl4=;
        b=w0SOM41TUirIRChTYHFOpYR2ax1OunWKFB6sab5O59vUgygiRx6kuIXUtwNP8LFfR+
         zI5vaQuaAgQUvh1i7IfJrq0tivseIL8Is7OezVQFMAw2mAHDYsuvKSN/B6NBgE/0si/x
         tbzhFMEQOG+qZJl0STo1u4L+JPIkbGDHTqo3FvQGBnVzdwQHkCpCetwsT8r5DvlAq8cD
         xJLAcGMZAdxG0WczuG7bgfw6FUTtSiA+HwKVakhofjfj4EdtY9X+JuQVcyi2NtlmAUdS
         YarDJlT+ieVY7FP6cd7/zE1NIGBXRmRrVqBBFpWihrNkJw8J42+qtKEbk2b+slTe3uq2
         kj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jSF/lCWacwPE86qHR7UQhDcaBGH6va92RTEKsuxJUl4=;
        b=q5InihfZ1Yqa7kv2mJkS2rErPlo+TrAlBLWixAljnGVSCQUvy4W1kXa7aIDm0uWSmG
         0q1y3Qh9ut60wCvip/Cn26L/k95vNBq6nXim6S2xsGgp72VkbiNP+jSAWGksEqd8pz/1
         LBXmfzdEXJpfRCXsTtNv3tgO535vqYkojexEA1iu6pOA7goAlVnh1fmZXaMxcS73yuUo
         +z8HBo2J5pX+uzV2dIkiRSp+gvBZB31kRHKuyKdcgYaPz4Y6Cs7x5REIyZDOtpL1ehJ/
         lIJcTMIYPGqMgwDcvEwqqxf2H7WTKhU0LI8Qsq3i4fvNuwCRrZghOCNdxzmvQVoud2NX
         Nz5g==
X-Gm-Message-State: ANoB5plcOAzMxPg7yKcRqfdii08BO6DPdHxa5beKVo4CKYvwWWmmOhqI
        Ti9j7gog2EsayncMSs4bcLRtsQ==
X-Google-Smtp-Source: AA0mqf4+j2uBGoEkqaMgd2c9b5JeWdrHIW/YT5RXBueNnt+aRS4nND5URh1dV5mfQMkYV8QLzWX3lA==
X-Received: by 2002:aa7:ca54:0:b0:46b:5f6f:a303 with SMTP id j20-20020aa7ca54000000b0046b5f6fa303mr27515349edt.110.1670239628942;
        Mon, 05 Dec 2022 03:27:08 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id dn11-20020a05640222eb00b00462bd673453sm6186419edb.39.2022.12.05.03.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:27:08 -0800 (PST)
Message-ID: <b10aaa5c-fa3d-f119-c79f-b77327eda5f1@linaro.org>
Date:   Mon, 5 Dec 2022 12:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 11/16] clk: qcom: smd-rpm: simplify XO_BUFFER clocks
 definitions
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-12-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 03/12/2022 18:58, Dmitry Baryshkov wrote:
> Remove the duplication between the names of the normal and active-only
> XO_BUFFER and XO_BUFFER_PINCTRL clocks by using preprocessor logic to
> add _a suffix.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 54 +++++++++++++++++-----------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index cb47d69889fb..9f33dbd60e96 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -112,17 +112,17 @@
>   		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>   		QCOM_RPM_SMD_KEY_STATE)
>   
> -#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
> -		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r)		      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _name##_a,      \
>   		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>   
> -#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name,		      \
>   					     r_id, r)			      \
> -		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active,	      \
> +		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
>   					     r_id, r);			      \
>   		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
> -		_active##_pin,						      \
> +		_name##_a##_pin,					      \
>   		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>   
> @@ -456,28 +456,28 @@ DEFINE_CLK_SMD_RPM(qcs404, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
>   
>   DEFINE_CLK_SMD_RPM(sm6125, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, bb_clk1_a, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, bb_clk2_a, 2, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, rf_clk1_a, 4, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, rf_clk2_a, 5, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, rf_clk3_a, 6, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
> -
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
> -
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, cxo_d0_a, 1, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, cxo_d1_a, 2, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
> -
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk1, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, bb_clk2, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3, 3, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk1, 4, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, 4, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, 5, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, 6, 19200000);
> +
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, 7, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, 11, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, 12, 19200000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, 13, 19200000);
>   
>   static struct clk_smd_rpm *msm8909_clks[] = {
>   	[RPM_SMD_PCNOC_CLK]		= &msm8916_pcnoc_clk,
