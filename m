Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2564FC4321E
	for <linux-clk@archiver.kernel.org>; Mon,  5 Dec 2022 11:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiLELcB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Dec 2022 06:32:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiLELcA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Dec 2022 06:32:00 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3761F10569
        for <linux-clk@vger.kernel.org>; Mon,  5 Dec 2022 03:31:59 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id fc4so20064253ejc.12
        for <linux-clk@vger.kernel.org>; Mon, 05 Dec 2022 03:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHxeuaeRmPNxC4ut49YNujOZoHdlmfUWeBcYanXmwxE=;
        b=g5cJIXOSMY1fW257g25mCVQlNwWNrBykKMGqr7U/6k2E32L8aHUpqKPyJrg3XaekAf
         VChxufpYmVbTZeUyctkzYgI4UJv/KW0LeSctItzGLMiKfzj8zGo3xXd413XYY+Abdmf1
         Fj929RrJEf/ME1yrD+d4ff6PIANtrPFFgfv2rnLwzbZXWl5Nlr6ePHcsfo6AQtjj5DDy
         rKGKxHBarm+5dCRNbOAScl6kW6MFToto4DeDsFklfDKm1RmLE0a5/60bXlRDjDrwDOtS
         Z3VlUpGWztLirw0L9UYrLgcZfkUuiVk098oSbyv/162nhd4q3rD0wLptQfQNowRF5jxe
         hqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHxeuaeRmPNxC4ut49YNujOZoHdlmfUWeBcYanXmwxE=;
        b=WzT04gyo+TcldN+y7d0MO6nYhRE+M82W0Mn1FUeeH5JaMVQ48Sb8GIBPnSXBEaGn9Q
         aMJ0Qc41ohKro2cKsM6HI+/XWsRynoTokkr46XNHObb+rqzyKnjBIJBLPwz2ppgBqoHU
         oFkzlxs+Jui6AKed8emP+cGfayKiLr0h8SB1zKfuoEB5NcIjzzX98XD11rbICq5mWU8O
         RkbGjd3vE/5wtxj7Nm6slTFekSEsTaN911BXqz3rWSVGdSp3ZugNLjEDGYfm7kitRb+7
         3m5es6senFJ0e7nGvUkJxhjP0tkGjxOCBNOIHDDVIbapTQRe3Dlr5W5bhnSxRzQZCHTH
         K2VQ==
X-Gm-Message-State: ANoB5pn4mt2Mw6PnDtxttdYW9gBEfYbfg0R2YxtCM+M56YMy2ue8H+DX
        TPsFekcB52POqfKmDmn2gKLjUg==
X-Google-Smtp-Source: AA0mqf69Hg8VLjgMEtCh6BxUqsHkeJMKrrtkosTosrk1lThm3Y487Bms2kUvmNw9N6PxSAGD0hiUuA==
X-Received: by 2002:a17:906:9f09:b0:7bc:db1b:206f with SMTP id fy9-20020a1709069f0900b007bcdb1b206fmr5352274ejc.719.1670239917716;
        Mon, 05 Dec 2022 03:31:57 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906300700b007812ba2a360sm6173707ejz.149.2022.12.05.03.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 03:31:57 -0800 (PST)
Message-ID: <c5ae8308-be39-8e02-4dae-5bd2bf8cda4d@linaro.org>
Date:   Mon, 5 Dec 2022 12:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 14/16] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3
 clocks
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221203175808.859067-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 03/12/2022 18:58, Dmitry Baryshkov wrote:
> Rename the qcm2290_rf_clk3 clocks adding 38m4 prefix to distinguish it
> form the common (19.2 MHz) rf_clk3. The system (and userspace) name of
> these clocks remains intact.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 8dcaa63b0623..f407acb3c6d3 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -125,6 +125,11 @@
>   		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>   		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>   
> +#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r)	      \
> +		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _prefix, _name, _name##_a,    \
> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
> +		QCOM_RPM_KEY_SOFTWARE_ENABLE)
> +
>   #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name,		      \
>   					     r_id, r)			      \
>   		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
> @@ -474,7 +479,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
>   
> -DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
>   
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
>   DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
> @@ -1164,8 +1169,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>   	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
>   	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
>   	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
> -	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
> -	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
> +	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
> +	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
>   	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
>   	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
>   	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
