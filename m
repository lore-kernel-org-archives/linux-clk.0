Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A811C04FDE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 16:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiLIQQE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 11:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiLIQP5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 11:15:57 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C9C80A11
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 08:15:56 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id cf42so7822655lfb.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 08:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gkB3jWikV382tDMdk/lKwQHvi005PhmtU+XtsFNSOc=;
        b=fXLQCdm2bwtxQGfCagSdGKK8arDQPPnboy468ZyLFKwYujCghll8jDRSGnYXd8mgWs
         DsUH2ENUbqr4imGDatrB8vOXixSGev2LZNmNyvlsvWHpGdzStASWJMTUKfo6P1z3FXXv
         VFV6nvF8hdidVoS/q2Mli8arH87DLGrjoq4KbQPQO2wS2guhbKIoMf6oYXhRCfazyvHy
         DwT0S11dXidsfY7s7bL/BxvNpsAttxcfanpAHcKCBrJo2LerDtjDOJh/M7Wm5hOErR+F
         rwEvqOt6gjERR51xOr6q7CpskrG/Wbh1rJhElhDzEkuj8Y4UprlcbtjEEgcKScIGHCkb
         2G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gkB3jWikV382tDMdk/lKwQHvi005PhmtU+XtsFNSOc=;
        b=QEbYyQF2BpGQITcCDStG8Eayc9XKCQ0k+qHhPCQmaGAZNZaS+k/ycuKB8zO3put//4
         /K+qcCOw7FoUXct0yoNddnAEkgLpZKOcQ1CC6O1jfwjma97I2r8WIhrak7Rw+K3Z7HqF
         Z2o8hFGlS3yFeXAuz2L2zVijxBsGL565QS6TjgW/GIHPe7nKcjRKw/s5kxe2AHIhKBTk
         0DAheAS/53BsH1im+1Hjn3rfFCmBxU0XUMIM5v7InhWhZhL6O5VrZfdBbGg2q3aRVP7h
         Tb0ffGSjuTqJlVZv8fMFExtwNu+XFUnqugI/B/c3c/MCEeXwKDFmuIrB89IYYW8u20hf
         NW4Q==
X-Gm-Message-State: ANoB5pmPBTbcRKCQ6bJyBtQBP06rtZeK4/trFk5YTz6mJGoQeN/NTisE
        Gt/1RhTmXTor9yYarYW9DEAKrQ==
X-Google-Smtp-Source: AA0mqf4f9gutjPMCsHe520cRiGNJeLQhcmUr3JtOa3bAOvxTZ/0i4O8NkvBpedq2Qo3EkG4xVaQDLQ==
X-Received: by 2002:a05:6512:2512:b0:4b1:f16b:6d53 with SMTP id be18-20020a056512251200b004b1f16b6d53mr2215380lfb.52.1670602555152;
        Fri, 09 Dec 2022 08:15:55 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004b4f1ea713csm317239lfp.73.2022.12.09.08.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 08:15:54 -0800 (PST)
Message-ID: <a79a2f16-3471-4fb9-be09-cb4a7f15ca2d@linaro.org>
Date:   Fri, 9 Dec 2022 17:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 00/18] clk: qcom: smd-rpm: drop platform names
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/12/2022 01:14, Dmitry Baryshkov wrote:
> This series concludes the previous work on Qualcomm RPM and RPMH clock
> drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
> clock symbol name, as the clock definitions are shared between different
> SoCs (platforms). Having an SoC name in the clock definition can lead to
> all sources of confusion and/or errors.
> 
> Changes since v1:
>  - Split the MMXI/MMAXI and sm6375 vs sm6125 changes into two different
>    patches
>  - Reworked macro definitions and usage to remove empty arguments
>  - Dropped qcm2290_bimc_gpu_clk definition in the corresponding patch
>  - Alignment fixes
> 
> Dmitry Baryshkov (18):
>   clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
>   clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
>   clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290
>     clocks
>   clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
>   clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
>   clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
>   clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125
>     clocks
>   clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL
>     clock
>   clk: qcom: smd-rpm: drop the rpm_status_id field
>   clk: qcom: smd-rpm: fix alignment of line breaking backslashes
>   clk: qcom: smd-rpm: move clock definitions together
>   clk: qcom: smd-rpm: rename some msm8974 active-only clocks
>   clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
>   clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
>   clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
>   clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
>   clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
>   clk: qcom: smd-rpm: remove usage of platform name
> 
>  drivers/clk/qcom/clk-smd-rpm.c         | 1441 ++++++++++++------------
>  include/dt-bindings/clock/qcom,rpmcc.h |    2 +

Please automate getting email addresses for sending emails.

Best regards,
Krzysztof

