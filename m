Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8A7EB64D7
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jun 2023 11:08:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjF1LI0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jun 2023 07:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbjF1LIP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Jun 2023 07:08:15 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826D01FF0
        for <linux-clk@vger.kernel.org>; Wed, 28 Jun 2023 04:08:13 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so3581625e87.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jun 2023 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687950492; x=1690542492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3YaZvbpJE8KoJXh11DvcBsWD9TPOvwIkWVnCG4LCf0=;
        b=ch7fQbLermAchx7Mi8EyjaqLGBoKnbc7EL5EXpbysoCxwRsN0w9bX8xKUkRY1C+i3i
         97UhHB3jjLd+/oSv0pRiqXo+iWiyUZhshDFYFdnoGXuUMowtnt0yQoqoTeiQh2jh0dB1
         ybx6IrqGG5q15bVjHlffYUFiGYwpfmD3YCXtm+SaofSTyckDJ3foj52IuoysjKIifHKt
         aqMQLLLAKS2cxRLIKtkE9Amn9RCaA5KcfgRu/oxzku8US1fNfEe3ibjxjmI5ubC2hgec
         CdTTwL/auaovmcKtGIkffybMaMi4g8ctsXDMQj6cfZTAabbfrk2BONmsTbVkAoe0l+cM
         tsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687950492; x=1690542492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3YaZvbpJE8KoJXh11DvcBsWD9TPOvwIkWVnCG4LCf0=;
        b=MZb/iTZc0e8+VjQ+AYGjJgMYyLrds6oxj0IP4DytGpL8WL2y3epG2NGRk3UMCi1Hxr
         GR5DFikwQJHyPr1ZNVvJxpjRQCqmuUHOBpDv4EvmVVtrWyqNsQ7V3FmNcm7dKP23G7aD
         tcIzGnjiVtFCBYTZe9xRUnx+6f1+vMY8jfc4ikYqjPp1+trtgudliwK/ic0bdP57glFz
         mw4ohvbl0LQn5Q/KhR8wgG/ltV9+owP7gHXWnyAq6ZT2zC2y2aR5JQyFcQSEPIpu40Gx
         2GhUMt1gX/yupwr/bqYRv+35jmLSlEhM5opS/7Z5ynSwHY9DBtGBHSz9Ux0cJTIX4o1X
         l1QA==
X-Gm-Message-State: AC+VfDx9c/hNXOuEFqzVa88fZgySQhQnp7aPvw5g8SfflBTBHrnSndF4
        ImEw7Tsjc9aLSaCNVX8RTJwHFQ==
X-Google-Smtp-Source: ACHHUZ4Ilxa5z63KMu1RIRHU6/OOp4kqAz1DkwDgWU487TutTN22a2ZOf5gbU7ZHmIylRj5pOe9J/g==
X-Received: by 2002:a19:6713:0:b0:4f9:5933:8eea with SMTP id b19-20020a196713000000b004f959338eeamr11411822lfc.3.1687950491725;
        Wed, 28 Jun 2023 04:08:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj233.neoplus.adsl.tpnet.pl. [83.9.29.233])
        by smtp.gmail.com with ESMTPSA id t3-20020a19ad03000000b004fa52552c82sm1733406lfc.155.2023.06.28.04.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 04:08:11 -0700 (PDT)
Message-ID: <82ed84aa-6335-c0fd-9c3e-1a6ef6924336@linaro.org>
Date:   Wed, 28 Jun 2023 13:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V2 4/5] clk: qcom: gcc-qdu1000: Add support for GDSCs
Content-Language: en-US
To:     Imran Shaik <quic_imrashai@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230628092837.3090801-1-quic_imrashai@quicinc.com>
 <20230628092837.3090801-5-quic_imrashai@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230628092837.3090801-5-quic_imrashai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28.06.2023 11:28, Imran Shaik wrote:
> Add the GDSCs support for QDU1000 and QRU1000 SoCs.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes since v1:
>  - Newly added
> 
>  drivers/clk/qcom/gcc-qdu1000.c | 42 ++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
> index 991fb2bc97e9..718c34dca6e8 100644
> --- a/drivers/clk/qcom/gcc-qdu1000.c
> +++ b/drivers/clk/qcom/gcc-qdu1000.c
> @@ -17,6 +17,7 @@
>  #include "clk-regmap-divider.h"
>  #include "clk-regmap-mux.h"
>  #include "clk-regmap-phy-mux.h"
> +#include "gdsc.h"
>  #include "reset.h"
>  
>  enum {
> @@ -2409,6 +2410,39 @@ static struct clk_branch gcc_usb3_prim_phy_pipe_clk = {
>  	},
>  };
>  
> +static struct gdsc pcie_0_gdsc = {
> +	.gdscr = 0x9d004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "gcc_pcie_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc pcie_0_phy_gdsc = {
> +	.gdscr = 0x7c004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x2,
> +	.pd = {
> +		.name = "gcc_pcie_0_phy_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
> +static struct gdsc usb30_prim_gdsc = {
> +	.gdscr = 0x49004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "gcc_usb30_prim_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +};
> +
>  static struct clk_regmap *gcc_qdu1000_clocks[] = {
>  	[GCC_AGGRE_NOC_ECPRI_DMA_CLK] = &gcc_aggre_noc_ecpri_dma_clk.clkr,
>  	[GCC_AGGRE_NOC_ECPRI_DMA_CLK_SRC] = &gcc_aggre_noc_ecpri_dma_clk_src.clkr,
> @@ -2545,6 +2579,12 @@ static struct clk_regmap *gcc_qdu1000_clocks[] = {
>  	[GCC_DDRSS_ECPRI_GSI_CLK] = &gcc_ddrss_ecpri_gsi_clk.clkr,
>  };
>  
> +static struct gdsc *gcc_qdu1000_gdscs[] = {
> +	[PCIE_0_GDSC] = &pcie_0_gdsc,
> +	[PCIE_0_PHY_GDSC] = &pcie_0_phy_gdsc,
> +	[USB30_PRIM_GDSC] = &usb30_prim_gdsc,
> +};
> +
>  static const struct qcom_reset_map gcc_qdu1000_resets[] = {
>  	[GCC_ECPRI_CC_BCR] = { 0x3e000 },
>  	[GCC_ECPRI_SS_BCR] = { 0x3a000 },
> @@ -2606,6 +2646,8 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
>  	.num_clks = ARRAY_SIZE(gcc_qdu1000_clocks),
>  	.resets = gcc_qdu1000_resets,
>  	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
> +	.gdscs = gcc_qdu1000_gdscs,
> +	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
>  };
>  
>  static const struct of_device_id gcc_qdu1000_match_table[] = {
