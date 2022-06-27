Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F880CCA482
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 11:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbiF0LiQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 07:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236487AbiF0Lhf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 07:37:35 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B344281
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:33:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v14so12615762wra.5
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Z0+42hwPxJRW2NOYXQq1yAA2G18X1kFzaXXIzfIU7Y0=;
        b=cpTd6YGid5AkI7RW5HLEZXAPozOhTexJoEfT0qjthaHUNZ2A7dx76HDr0fGUiRYS8Z
         M5SbnM9f42Wd1vUM59oYKKxvSkMjV4T64Q0rYHxW5eie/SeKVx4fIrJ4ibDwuy1E56rm
         fxmKggepcNq/e0SGI2C4mpDBgPmnyFLUn+JiDBP3lz93qV0Gg8JWPtxLj8MQzHUSm46q
         x1TvNPGKALFy8HMcHmbXJ2lDjbG9+4MR9jgxr+XwCr9Jar/SBKtgJ7KkzjkkMMLADFJ1
         ngPO3IydADk2zWnM4xtDKn/iU7eLgCfM4ASpezgTuLgwecFjzFYCXFAW+kR1Ge3FiKm4
         CFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z0+42hwPxJRW2NOYXQq1yAA2G18X1kFzaXXIzfIU7Y0=;
        b=sVvhyviZDC3g0YSVyomfVVAMB96NWuCE8X8NF8dX9ZIXTOIG/22c2Hi3JscMl7ruMa
         iNbbH6a1Myr0cQKIyoIyTA7B5eLaQzdmzXkUfmRBQdPoDLfgtDkeJuCuK6kHcKAdvY15
         eOdWmKWrAzA8Ly6eZUapAb7uu++AlA3cgvDpKeP9obQFYgNo2NBmtJxA6HACbHJMcEJm
         ZUg2eCk9hkcibnmNN0ukSgHRDTkLIWGlsJuJ9jFMPO0yFUDFrKsz2iNZquj3eurmEdMw
         NbTqhHI660bCJqBZMl8lUbeMk8GEnij4+bXTPzrhJaJrP+Ga6KL/TnGn8lwger6YsTul
         YWeQ==
X-Gm-Message-State: AJIora9MutjPsv2rhJTO4OhohgbhHWdRzgdhIuq5SpLiSzLGwsTerFB4
        o9YkIeD0IHNI/oDBGAWr5h89qw==
X-Google-Smtp-Source: AGRyM1unIBvJ7AV/DYf/ubxQ8SFUyH7+XRvr6orNfWBMDXevMB+2os0CwP6Q1jZ0wFc9tsvR8EsWEA==
X-Received: by 2002:a5d:59ae:0:b0:217:2519:8a0f with SMTP id p14-20020a5d59ae000000b0021725198a0fmr11685479wrr.383.1656329598105;
        Mon, 27 Jun 2022 04:33:18 -0700 (PDT)
Received: from [192.168.0.249] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c228200b003a03be171b1sm11462219wmf.43.2022.06.27.04.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 04:33:17 -0700 (PDT)
Message-ID: <0e9aab63-7ddf-dead-11b2-4ba81235dcb4@linaro.org>
Date:   Mon, 27 Jun 2022 13:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: exynosautov9: correct clock
 numbering of peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220627005210.6473-1-chanho61.park@samsung.com>
 <CGME20220627005413epcas2p39750fb5876366881b8535ee516c1bebe@epcas2p3.samsung.com>
 <20220627005210.6473-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220627005210.6473-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2022 02:52, Chanho Park wrote:
> There are duplicated definitions of peric0 and peric1 cmu blocks. Thus,
> they should be defined correctly as numerical order.
> 
> Fixes: 680e1c8370a2 ("dt-bindings: clock: add clock binding definitions for Exynos Auto v9")
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../dt-bindings/clock/samsung,exynosautov9.h  | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/samsung,exynosautov9.h b/include/dt-bindings/clock/samsung,exynosautov9.h
> index ea9f91b4eb1a..a7db6516593f 100644
> --- a/include/dt-bindings/clock/samsung,exynosautov9.h
> +++ b/include/dt-bindings/clock/samsung,exynosautov9.h
> @@ -226,21 +226,21 @@
>  #define CLK_GOUT_PERIC0_IPCLK_8		28
>  #define CLK_GOUT_PERIC0_IPCLK_9		29
>  #define CLK_GOUT_PERIC0_IPCLK_10	30
> -#define CLK_GOUT_PERIC0_IPCLK_11	30
> -#define CLK_GOUT_PERIC0_PCLK_0		31
> -#define CLK_GOUT_PERIC0_PCLK_1		32
> -#define CLK_GOUT_PERIC0_PCLK_2		33
> -#define CLK_GOUT_PERIC0_PCLK_3		34
> -#define CLK_GOUT_PERIC0_PCLK_4		35
> -#define CLK_GOUT_PERIC0_PCLK_5		36
> -#define CLK_GOUT_PERIC0_PCLK_6		37
> -#define CLK_GOUT_PERIC0_PCLK_7		38
> -#define CLK_GOUT_PERIC0_PCLK_8		39
> -#define CLK_GOUT_PERIC0_PCLK_9		40
> -#define CLK_GOUT_PERIC0_PCLK_10		41
> -#define CLK_GOUT_PERIC0_PCLK_11		42
> +#define CLK_GOUT_PERIC0_IPCLK_11	31
> +#define CLK_GOUT_PERIC0_PCLK_0		32
> +#define CLK_GOUT_PERIC0_PCLK_1		33

Is this a fix for current cycle? If yes, it's ok, otherwise all other
IDs should not be changed, because it's part of ABI.

Best regards,
Krzysztof
