Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89744C77B73
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 01:50:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbjDTBu1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 21:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjDTBuZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 21:50:25 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5461D10C
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 18:50:20 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8bca69e8bso1994401fa.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 18:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681955418; x=1684547418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nizPB57M3kviIBPTCEgCjkwcM2uwJN4yH7DbrqfjL/U=;
        b=ijQFQOl0D+QxNYBLRsK03sCXvJSoXgkQ1tUoaxJ05thU2CniCDwmoENBu7lAqIOemt
         9YrZQ1wxTOAqcrtydHSRhMzT9DozrQz9PnEF0lis0N7rI62uSCRqghv+Zwrle9os8HAN
         gulc/qnPAky5h3942ws0EVPI4lF88ABikgUsbx1du9dmIIm1QH463wt9nvl7EOcSUu2y
         pLezI17uxqXEUa5kRlmt+zUyf9BeG2e+E9GifCyK1IU+sl0+vRaD9tuOksNSwpl3oFFQ
         Fp2DLHNRg1fp07/nPoC+prTmzfrdrNI75sUpODnTM2fjIYommNuGaebDkP9f/zInnXja
         VdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681955418; x=1684547418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nizPB57M3kviIBPTCEgCjkwcM2uwJN4yH7DbrqfjL/U=;
        b=f6T+k/x/uXmYucpUagSNd2GL7kj4H5veJYToRbV+dRNMYsZxt0Qv2NUVpeoOby0BMW
         YRfgMmM9/7XcXXXJ4WANoqQC8+mX8R4vRpGVhuq0fkHzwfiCWfVsvXQi7eCXYK80pEBN
         s2/53UxS8imPABKIu7qJrEUXGeHXkRHZLMdjOtoVJJU6s++VwCMx0gVZX9rzmX193jNC
         eI68PdGg2K3cU5poHv5wUSI5ZKElKoRMcwELeIHE/3j3Sk8xiVrRvLYOqia0Msh2Z/rs
         8XAVqxdeIfG69phMWxFLA4M0HbqHETPALmtmbaxPY1dBPHdlnHiO9w80XX3Zgau6oUTj
         +WnQ==
X-Gm-Message-State: AAQBX9fkm8QjzEIgJcVlM7AlTXFYKCEXcJhja3NdUWcYIu+o+5e3xB56
        yGjL7xdVXAbS5IPdvSoqC2bUgQ==
X-Google-Smtp-Source: AKy350ZBHPNjSoDhsEErAWQW3i0ayKz28VoblspqqpkAPk69WKIMkGhhqmI1kaVf9dno1FI7mXTyGA==
X-Received: by 2002:ac2:4c1a:0:b0:4eb:1606:48db with SMTP id t26-20020ac24c1a000000b004eb160648dbmr4418362lfq.22.1681955418544;
        Wed, 19 Apr 2023 18:50:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id v20-20020ac25614000000b004edd4566110sm58915lfd.286.2023.04.19.18.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 18:50:18 -0700 (PDT)
Message-ID: <66c41caf-bf21-61af-c6e4-52b34b69c1ce@linaro.org>
Date:   Thu, 20 Apr 2023 03:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 00/14] SMD RPMCC sleep preparations
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 8.03.2023 22:35, Konrad Dybcio wrote:
> v1 -> v2:
> - Use CLK_IS_CRITICAL instead of leaving a clk enable vote, expand macros
>   to do so
> - Fix the keepalive clocks for 8998 & 660 (CNoC -> PNoC, it was
>   confusingly named cnoc_periph downstream)
> - Introduce .determinte_rate to ensure we don't set keepalive clocks'
>   rates below 19.2 MHz
> - Add a (!conditional!) way to test the ultimate goal of all these changes
>   by essentially enabling unused clk cleanup through a dt property (for
>   legacy reasons)
> 
> v2 was tested on:
> 
> - MSM8996 Sony Kagura (can disable unused)
> - MSM8998 Sony Maple (can disable unused with OOT icc)
> - SM6375 Sony PDX225 (can disable unused with OOT icc)
> 
> v1: https://lore.kernel.org/r/20230303-topic-rpmcc_sleep-v1-0-d9cfaf9b27a7@linaro.org
> 
> This series brings support for a couple of things necessary for the full
> system idle on SMD RPM SoCs, namely unused clk shutdown and keepalive
> votes (permanent active votes that are required on certain clocks for the
> platform to function).
> 
> Tested on MSM8996 and SM6375, does not seem to introduce any additional
> regressions.
> 
> Keepalive clocks for other platforms were gathered by digging in old
> downstream kernels, please give them a test.
I have an implementation of rpmcc-within-icc ready(ish) locally. Turns out
some SoCs need a keepalive (19.2MHz, active-only) vote on clocks that
are NOT governed by interconnect.. So before we can disable clocks,
both will need to be implemented.. ugh... I was hoping we could avoid
having it in rpmcc..

Konrad
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (11):
>       dt-bindings: clock: qcom,rpmcc: Add a way to enable unused clock cleanup
>       clk: qcom: smd-rpm_ Make __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
>       clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
>       clk: qcom: smd-rpm: Make BI_TCXO_AO critical
>       clk: qcom: smd-rpm: Make __DEFINE_CLK_SMD_RPM_PREFIX accept flags
>       clk: qcom: smd-rpm: Separate out a macro for defining an AO clock
>       clk: qcom: smd-rpm: Add support for keepalive votes
>       clk: qcom: smd-rpm: Introduce DEFINE_CLK_SMD_RPM_BUS_KEEPALIVE
>       clk: qcom: smd-rpm: Hook up PCNoC_0 keep_alive
>       clk: qcom: smd-rpm: Hook up CNoC_1 and SNoC_2 keep_alive
>       arm64: dts: qcom: msm8996: Enable rpmcc unused clk disablement
> 
> Shawn Guo (3):
>       clk: qcom: smd-rpm: Add .is_enabled hook
>       clk: qcom: smd-rpm: Add .is_prepared hook
>       clk: qcom: smd-rpm: Mark clock enabled in clk_smd_rpm_handoff()
> 
>  .../devicetree/bindings/clock/qcom,rpmcc.yaml      |   6 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              |   1 +
>  drivers/clk/qcom/clk-smd-rpm.c                     | 133 +++++++++++++++------
>  3 files changed, 106 insertions(+), 34 deletions(-)
> ---
> base-commit: fc31900c948610e7b5c2f15fb7795832c8325327
> change-id: 20230303-topic-rpmcc_sleep-d67aad9f3012
> 
> Best regards,
