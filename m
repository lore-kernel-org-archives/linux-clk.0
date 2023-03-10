Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA778C74A4B
	for <linux-clk@archiver.kernel.org>; Fri, 10 Mar 2023 15:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233232AbjCJPPR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Mar 2023 10:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234023AbjCJPOa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Mar 2023 10:14:30 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A677129700
        for <linux-clk@vger.kernel.org>; Fri, 10 Mar 2023 07:05:50 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id g3so5332546wri.6
        for <linux-clk@vger.kernel.org>; Fri, 10 Mar 2023 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678460694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdcQY2YGeyPPQy3gaq0qhGRWAP9H29xtuBXq8C1jl6M=;
        b=c78Z0Z4nVEUM5ovmKStejCY4zuYv4UjhkFhuH97bktj7Wqr0iVP9MSXsS4djyWiWge
         NY/sjHtmVM3sYk/q5T7UTdgmVTrQOJldvyyNVKsXLuu5SMFkcuGHEvQRJ811ZNi/FFjy
         D8arARgu4Fn0S11np02J19d25G5g82955/gTNVozUUhqFhyaUI/8ZswPD/YCSv+RN9YR
         bfRc7C0bSXJwc9+dFVVWnRCNwfT/AMN9NVY90CsTby9P9aC8VSnYR5/ASZjWZK6cKSsV
         WbNssalQiOQZBvfjFc9x5seX4MZalkDKSq42QM7XllVjzrXV533t9ZmA0qdXoJbpX/NI
         H3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678460694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdcQY2YGeyPPQy3gaq0qhGRWAP9H29xtuBXq8C1jl6M=;
        b=sV4CTs/U5mJX3IKP02sYAquBCtALv4YIMSlSPkqpUozk590MRY9G27Ni4CrRcgxMFl
         fGp4LW8Lm5TO1sOcdKkp7IEVbEVw5GeDiJTLL7USCMQ7PzoFhDzB6TcVSRzVM59IhQnB
         X+QzptW/sjJmx4AClKfX57cw3/U1QWh7Ode5WKpgL/OellwiMZCdG9gKZkcp2wNd5S1k
         ZTlOtn6qTT/Pnc7257kSIXuo9xorSrc1sFJwyRebScUjxvTFjDIA3w/V6svz/AbI4+rA
         VZc8HDhkrOMenmSes7SEb3A4VqBiAmHE042JBcuMPYDydQYOqugP8NALiEDekC2A+6Sf
         rMDg==
X-Gm-Message-State: AO0yUKWDjOzN/JeHUk79VwfVf/4Rq2XgKMDT3Ki1GWQCN8a22+GKdVs+
        NinVFGtc15cK74ETc4G8e4afLG+4TRCRwm5Hg9A=
X-Google-Smtp-Source: AK7set9N3trIQyBm2KMQV9Jy+uSYSg+mAaFAV8EfXjLeyi5NBrpk5ACECqHayrpTCwDFHZu1AoPRFw==
X-Received: by 2002:aa7:dcd7:0:b0:4ab:49eb:a8ec with SMTP id w23-20020aa7dcd7000000b004ab49eba8ecmr22958818edu.26.1678459882763;
        Fri, 10 Mar 2023 06:51:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:45c4:46be:ec71:4a51? ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id y59-20020a50bb41000000b004f0de6d52fcsm102483ede.74.2023.03.10.06.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 06:51:22 -0800 (PST)
Message-ID: <6b6b5dc2-43ab-5672-099f-505ab4543438@linaro.org>
Date:   Fri, 10 Mar 2023 15:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: exynos850: Add tzpc property
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
 <20230308233822.31180-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308233822.31180-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/03/2023 00:38, Sam Protsenko wrote:
> Exynos850 requires extra TZPC handling to keep CMU registers non-secure
> (accessible from the kernel) after PM resume. It's done using a specific
> SMC call to the EL3 monitor.
> 
> Describe "samsung,tzpc" property for Exynos850 clock controller which
> allows one to specify the SMC call address for PD capable CMUs.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/clock/samsung,exynos850-clock.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> index cc1e9173b272..5098dce5caf6 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> @@ -60,6 +60,16 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  samsung,tzpc:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The register address in corresponding Trust Zone Protection Control block
> +      for setting the CMU registers access to non-secure. If provided, it'll be
> +      used for issuing SMC calls to EL3 monitor during CMU's PM suspend and
> +      resume operations, ensuring CMU registers are unprotected after waking up.

Do not store register addresses of MMIO in some fields. If this is part
of clock MMIO, then it could be address space in reg. If it is not, you
cannot store someone's else address space here. If this is someone's
else address space, then you either need syscon or phandle to dedicated
device (something like qcom,scm or other secure monitor channel).

> +
> +      This property is optional.

Drop, It's already optional if not required.

Best regards,
Krzysztof

