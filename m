Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA3C63797
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 21:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240292AbjALVcg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 16:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232276AbjALVbx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 16:31:53 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC7C6951C
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 13:15:59 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bu8so30237571lfb.4
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 13:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56soK6K0krN65AET3rRrvp2BkgnO67NHW0oHOx8OHO4=;
        b=cDFkJZr6TQdfhVc2p8MIKdV7zJCEn23hmp6BfKN4mS+ojYDMf+W4PqsraXo12XB6Dm
         vSGynlhophdz2ahLCXzfW3jmrT5GXblO8iDDCu1F61wY8hKtcZXH97q/tuLxGikyHstm
         yQA6vKmEKlmpynGTD8o2puzEP6YIrJRlIwplWp4xYPro46u/TNlTi9OG+lo1lOnxsQ6u
         7M/EfjvBmamm/1ai5GRS9M0FORdmEZ8QXZg4oLSwVmUbydyjkDWjld+MdARhcXSdKiEt
         45fzL+hZNfE84IhDiaMrhCGHi0l9R3xCcbLQEcx5kPrpMl1cVqeWYD6b8dnb1HQGo56G
         hKxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56soK6K0krN65AET3rRrvp2BkgnO67NHW0oHOx8OHO4=;
        b=KS0BolyMn6YkoMLFNLiWXJyItaEqs25E22yXCPQ1uceb8/DNEJzmMgIHz8aY22ASTa
         y2+Z+UfKBPj88PELaIyHItBf5PGuan7t71QBSGnDFfCIHIAZcWJF5g6Ee6eu/gO+JsMn
         2osT3r9lr0aSpKPQlbvufTzmV2OKEFONETTahfO4JMPgFhUI+q9Lx9COdWIBaF/mI1f1
         zJPs9Jhw7TwyXXTi9v12ODs7/EPPgECZrNyj/EIaHi76aVbM3HX2aKwBZRdzM0vQYr9K
         EaZG2hJWG2FWERXPETt5QeHYRm0sm5hsXL3PCQ+xMA2ACyHT7T+F/FuOmRHIEB4Bpnx+
         q2bQ==
X-Gm-Message-State: AFqh2krd8JvqNliRKvu5ZqWkHbrCRcw33mPWx67WLUycmPsYyLlAcmLF
        XjVczgJy3iD8XbCsuw55/AJPkw==
X-Google-Smtp-Source: AMrXdXsl/JZ37kboCC5ncEPj6/plr1CtH6yyuEbA0xppCah8rNB6FRCgLMLSGzTY+abaL4DE4j/szA==
X-Received: by 2002:a05:6512:6d0:b0:4ad:6f9b:d683 with SMTP id u16-20020a05651206d000b004ad6f9bd683mr24466325lff.1.1673558158201;
        Thu, 12 Jan 2023 13:15:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w1-20020a19c501000000b004cf6c56fdb5sm110641lfe.232.2023.01.12.13.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 13:15:57 -0800 (PST)
Message-ID: <8ecb84b5-93a5-691d-4a7d-5daed0e432e4@linaro.org>
Date:   Thu, 12 Jan 2023 23:15:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 2/2] clk: qcom: Add QDU1000 and QRU1000 GCC support
Content-Language: en-GB
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230112204446.30236-1-quic_molvera@quicinc.com>
 <20230112204446.30236-3-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112204446.30236-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 22:44, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add Global Clock Controller (GCC) support for QDU1000 and QRU1000 SoCs.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig       |    8 +
>   drivers/clk/qcom/Makefile      |    1 +
>   drivers/clk/qcom/gcc-qdu1000.c | 2653 ++++++++++++++++++++++++++++++++
>   3 files changed, 2662 insertions(+)
>   create mode 100644 drivers/clk/qcom/gcc-qdu1000.c
> 

[skipped the rest]

> +};
> +
> +static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
> +	.reg = 0x9d064,
> +	.shift = 0,
> +	.width = 2,
> +	.parent_map = gcc_parent_map_7,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "gcc_pcie_0_pipe_clk_src",
> +			.parent_data = gcc_parent_data_7,
> +			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
> +			.ops = &clk_regmap_mux_closest_ops,

I think this should use clk_regmap_phy_mux_ops.

> +		},
> +	},
> +};
> +-- 
With best wishes
Dmitry

