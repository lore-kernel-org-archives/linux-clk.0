Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4782CC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 12 Dec 2022 17:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbiLLRjB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Dec 2022 12:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbiLLRiz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Dec 2022 12:38:55 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E7099581
        for <linux-clk@vger.kernel.org>; Mon, 12 Dec 2022 09:38:54 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id z18so3724539ils.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Dec 2022 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdFQHyfvuXS3dWpzBzfA/eYiqNVFYmQe6KA46+wVeF0=;
        b=QEUYd8iH6ivq5ZndIww6CcGISu4oucIkeoSemO7r9vMYAu+Q8mnZXaSgmDhjoBkvXr
         ZmQvKd7z/z+J38FahVjYhTtbw6ZA24XkymAFddvUXruuaCaLueXXaNGQKGnem7YHkPsI
         tp2xzFQ9Mb4s4aR3KtrjTL5x07sHsjXG94xqetN2nXbrHX4rcv1QU+KgJ4HZks++7nMw
         2qI8+gO2794L2vOVkPaLPR9wHn40Y9pBY9Z8nqiLjydipzjZUCCyGUwroc0HWt8fXEb/
         L3c6r5IuLk96Xdh58s8uPbQfzItPqf/RQCYSc7glqZzslQ8fhjpMlpnaf7XE131XKpGy
         X9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdFQHyfvuXS3dWpzBzfA/eYiqNVFYmQe6KA46+wVeF0=;
        b=NNuLiujx/IC6/GMC2l9EfKBYC3/XXHTDXVQ+s5SrPRtVcabk9e7BhM6sNN2TLA0qjV
         bSsYlLx8u0WdjuG+ktp5IQc/kutDxE2sSOneP89V1dlkgDAx4vdCWSI5so77oZjv5K4L
         4UY0bXhcEvs5OtJjpaaWPsqWn4CsudEFFPJhZBNq1TQN1KNFRqTpW17KYkhoaJFcuYeE
         jxDtpVatpcZu4+Ce4lHApcH7SeiWgLYrzlmdDIYNoOuhPc3jQeREygCI7MMPM/PTd3Ny
         13hKPem2L9ZSsOOuSDo9YqOApYVT5OLjCZ6pQksGMAJUTdyww3aBiklXUFbNHrsRzi5C
         VJOg==
X-Gm-Message-State: ANoB5pmA48AXyk5fy6txwXV/5niqtO/b85TgLBLpOWqOwU8g2qiLnIm5
        EGY17VngZPWQRfrIMuYzn9SOOA==
X-Google-Smtp-Source: AA0mqf54ndLJTVC/YJbPgo1fKqSt16oCLfOSQJH2SjHAru1Yh2YZyonlGUjdFeXJRIJc6J23nUkhJA==
X-Received: by 2002:a92:612:0:b0:303:2965:9617 with SMTP id x18-20020a920612000000b0030329659617mr9759515ilg.9.1670866733899;
        Mon, 12 Dec 2022 09:38:53 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id k13-20020a02334d000000b00389def938dbsm112672jak.71.2022.12.12.09.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 09:38:53 -0800 (PST)
Message-ID: <1ab39358-b3b1-e93f-ea65-32b53a5b6334@linaro.org>
Date:   Mon, 12 Dec 2022 11:38:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 01/19] dt-bindings: clocks: qcom: rpmcc: add
 LN_BB_CLK_PIN clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
 <20221209164855.128798-2-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221209164855.128798-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/9/22 10:48 AM, Dmitry Baryshkov wrote:
> Add pin-controlled Low-Noise BB clock definition.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good to me.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   include/dt-bindings/clock/qcom,rpmcc.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
> index c0ad624e930e..46309c9953b2 100644
> --- a/include/dt-bindings/clock/qcom,rpmcc.h
> +++ b/include/dt-bindings/clock/qcom,rpmcc.h
> @@ -168,5 +168,7 @@
>   #define RPM_SMD_MSS_CFG_AHB_CLK		122
>   #define RPM_SMD_MSS_CFG_AHB_A_CLK		123
>   #define RPM_SMD_BIMC_FREQ_LOG			124
> +#define RPM_SMD_LN_BB_CLK_PIN			125
> +#define RPM_SMD_LN_BB_A_CLK_PIN			126
>   
>   #endif

