Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138CFEB64D9
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 20:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbjGBULM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 16:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjGBULB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 16:11:01 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFA710DC
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 13:09:58 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5149aafef44so4167450a12.0
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688328592; x=1690920592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XEbinDKQmA0sOkZ9j4oK2eVO7lkopAowopk2a9saj8=;
        b=UIXqveSMX+oujydoxpDfsn6bSse4eMBBiZz50mTtAiQkPx1/x9DVAZa3SBO2xUYLf1
         7OTpN9L+07q93d8jxInlx1vzfueoLXVyTLi5jnOPHuPVWF2kgSAp81DQzf7dtA2hApmM
         yA+EJCYdHCoxwUFHPqUdgsVCdI1F8ihJcwvuIADu/yvkv9OWCX1U+fSBZFGz3aXUn2PQ
         TnI4nPcHhgbMOlvzMJnRNHvb9OdIMhcSS107H+fNZo9PlVhK14Th+D/0dKaukGaOrKYk
         hvnCNzv6ko5iFkZBXBixixhIK0NOX2UBYCGwRb/tO6T5NsZOaB9jbIX8Oj8wy0iEebb8
         XxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688328592; x=1690920592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XEbinDKQmA0sOkZ9j4oK2eVO7lkopAowopk2a9saj8=;
        b=iQ41Gf/ENtJU6XSTQfZJyw3tRQ28g8Z2dSPaR8Go/mhVGjSlUcFV3ud6NhJCz2iMnT
         fyvyBxtY/aJ5RqMh8kwR9K4NVKvkepeYHTkrNmcetn0XioVY+aP1wXu+yEyUMcvImwzS
         OC6pFyWFMCBUqeC0U0DgmNmg064GZNns84eeHvvWRvi4bB2k9R8RzXNHlq2K4qHCvO72
         LnzX3R0L+Y8X2IQatBDKqf4qNP9Q4B4vTe9cwSan/KVOTwnWXnG8YdOf9lnIkWl6ihpM
         vMxmwC6FET8v5Pn/ojnw98wKRlf45k9kydmIKdDbkIU/DRgbWyikrV/b72oSjytWWTGa
         jzMg==
X-Gm-Message-State: ABy/qLZle3mYFlWkLukiDeNyB8ZP3gx4d2s2GxJCQC2wYmT+U/Btwhcs
        hIw+IONxW03+jpp8MQ7pWZD5Ag==
X-Google-Smtp-Source: APBJJlG0HOHJON9xOHZ/yU82pUxWEV1BWHwlPLfoIk/EW35/54QSwfzuQdlgV1vXC9abgHES3eep6A==
X-Received: by 2002:aa7:d8d9:0:b0:51d:e498:201 with SMTP id k25-20020aa7d8d9000000b0051de4980201mr5548697eds.27.1688328592128;
        Sun, 02 Jul 2023 13:09:52 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id u21-20020a056402065500b0051de3c6c5e5sm4033677edx.94.2023.07.02.13.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 13:09:51 -0700 (PDT)
Message-ID: <64543b2f-854f-4342-ee6d-d32f616eb55e@linaro.org>
Date:   Sun, 2 Jul 2023 22:09:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 21/28] ARM: dts: qcom: apq8064: add L2 cache scaling
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
 <20230702174246.121656-22-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702174246.121656-22-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/07/2023 19:42, Dmitry Baryshkov wrote:
> Populate L2 cache node with clock, supplies and OPP information to
> facilitate scaling L2 frequency.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


...

>  	qcom,mode = <GSBI_PROT_I2C_UART>;
>  	status = "okay";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index c212215800d0..860f8981e8db 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -2,6 +2,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/clock/qcom,gcc-msm8960.h>
> +#include <dt-bindings/clock/qcom,krait-cc.h>
>  #include <dt-bindings/clock/qcom,lcc-msm8960.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>  #include <dt-bindings/clock/qcom,mmcc-msm8960.h>
> @@ -81,9 +82,106 @@ CPU3: cpu@3 {
>  		};
>  
>  		L2: l2-cache {
> -			compatible = "cache";
> +			compatible = "qcom,krait-l2-cache", "cache";
>  			cache-level = <2>;
>  			cache-unified;
> +			clocks = <&kraitcc KRAIT_L2>;
> +			#interconnect-cells = <1>;
> +			operating-points-v2 = <&l2_opp_table>;
> +
> +			l2_opp_table: opp-table-l2 {

opp-table

Best regards,
Krzysztof

