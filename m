Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54881EB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 15:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjGFPZP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 11:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbjGFPZO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 11:25:14 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB18C9
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 08:25:13 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so1238626e87.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688657111; x=1691249111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJl/0/9xQ151pA7EQaYuwKcI32jLfszVuHzUMtxXLU8=;
        b=Ki36pJK5EjSVaPCd0DAzXjFEsyqnbeNkokoEcqzxULXzNUhYbGu1lMTKDZ10JelpgM
         Ll9Bs9Y+OngSz/1vEvLF/4xjX3stKSX2JgYaahC4rF/WlUHPxDgZdM9N90nZocnY3RN5
         2wtd45N8QPAmX1r9DjFG3bfJsknd+qk8aSy9Mqg10krizp+kMYfYpPApfRYmdQAtxDAA
         jtX/3qbS9Q7tsAP84Be+1jwtJsKp4qYPj9yugNmAugfkHA6tH9CaLaO7wzqNH0r+wqTJ
         HN9O0SdX6ntvapsksn2yM582JPyZkDO3xCSfxk2u3qOGE88mm1OpH38wMnqBYbTk+Hwi
         rFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657111; x=1691249111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJl/0/9xQ151pA7EQaYuwKcI32jLfszVuHzUMtxXLU8=;
        b=egMSqHSbky6u1OTbX5+texLLi9bU75y7azZhawsAj6qcMWGgXNTsx7w49wabJ48lBr
         qCrCbqn45rb7tFemlGEWDkbFwGc+Guc5tYLhtNmSwdR2tll4wd5323xnv9Pi+ygbTgPP
         z7B0luiax8pCPSwSxowfPKJK7tZncB8aFF76cmP/uMeiwgtPTDwVgnQK9sQejSfyN0sY
         Hjf1Mua1yOa2xq9rdV/D8YmqZdiGqcYeZJpz7hGQaE/ck4uEnWbH0+03HAtETmNzGWfu
         2/Tg7+FwJ4MXFhcZ9ky/QoZWlv5aiKjGgxgJr5IKnZHqXYA8648ycbJLbTEwAbdgSniO
         yaLA==
X-Gm-Message-State: ABy/qLZEY9BQEV4Kj1+Klhh3kEESMf/HHwBPmn/EbEdD8tQiv+VgdQJO
        ShCa6BTAKqUnjU5WBhjHtaXbPA==
X-Google-Smtp-Source: APBJJlEZ/gdnD/GbDm1z4H0H9RL5iikB/8HOlNGQcfeAywLJPtOaBnW32eA6tDEfW2Z49/JsxRYQuA==
X-Received: by 2002:ac2:5b1d:0:b0:4f7:6976:2070 with SMTP id v29-20020ac25b1d000000b004f769762070mr1750493lfn.40.1688657111297;
        Thu, 06 Jul 2023 08:25:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id q27-20020ac2511b000000b004f76684329esm293572lfb.234.2023.07.06.08.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:25:10 -0700 (PDT)
Message-ID: <021ad5b4-772d-f2f6-f9ec-bca06db04dd8@linaro.org>
Date:   Thu, 6 Jul 2023 17:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add SM7125 device tree
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230706124339.134272-1-davidwronek@gmail.com>
 <20230706124339.134272-7-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706124339.134272-7-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6.07.2023 14:40, David Wronek wrote:
> The Snapdragon 720G (sm7125) is software-wise very similar to the
> Snapdragon 7c with minor differences in clock speeds and as added here,
> it uses the Kryo 465 instead of Kryo 468.
> 
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
Can you please paste the output of `dmesg | grep "secondary processor"`?

That would let us determine the unique identifier of the cores.

Konrad
>  arch/arm64/boot/dts/qcom/sm7125.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm7125.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7125.dtsi b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> new file mode 100644
> index 000000000000..12dd72859a43
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include "sc7180.dtsi"
> +
> +/* SM7125 uses Kryo 465 instead of Kryo 468 */
> +&CPU0 { compatible = "qcom,kryo465"; };
> +&CPU1 { compatible = "qcom,kryo465"; };
> +&CPU2 { compatible = "qcom,kryo465"; };
> +&CPU3 { compatible = "qcom,kryo465"; };
> +&CPU4 { compatible = "qcom,kryo465"; };
> +&CPU5 { compatible = "qcom,kryo465"; };
> +&CPU6 { compatible = "qcom,kryo465"; };
> +&CPU7 { compatible = "qcom,kryo465"; };
