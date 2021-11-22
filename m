Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82CFCC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 22 Nov 2021 07:57:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbhKVIAb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Nov 2021 03:00:31 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43952
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238827AbhKVIAa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Nov 2021 03:00:30 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 35AE140020
        for <linux-clk@vger.kernel.org>; Mon, 22 Nov 2021 07:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637567841;
        bh=PcxoRBTZGSYTTVWVxfthK4uXynQwbLiAr353aFZB84s=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=C8xJGNPTj8bQYmvPDhEjOfJ2NsSk0z2lKq2duoN/nmV39acSzO7OZJZdDS0HarYrA
         OoQVA98rzqUkkBen165sbq0WcjP9d3spPrBKoZENYhIJfqVupXtzYabko93hwiaJHL
         xkSxdYp8P0MUfZZuRF5SnhuVuj5nRe3i1ZcW6ggv221zbrJ/YjnrUx9T1rodzyaukP
         tO4mtGJmcOnGiUEW6wpi1rnigCHkqsJSKm2MMZ5UbDT49w/dvgLpWSQLGKea30YJiL
         xw6UQI8m1kyJRam5Tg1eUFwz8mkeh979Eoo6k7sH5b+ssUXfJST5pqQkuBP312ogHG
         IZJYtkOU0Xazw==
Received: by mail-lf1-f69.google.com with SMTP id y21-20020a056512045500b004162526955fso3724378lfk.3
        for <linux-clk@vger.kernel.org>; Sun, 21 Nov 2021 23:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PcxoRBTZGSYTTVWVxfthK4uXynQwbLiAr353aFZB84s=;
        b=Qd3hkMdj65yDEfMMvNHJPA+T3IDBNYoNHfHqVwwpMPrWHqKJ+3ialOIIxiefueyK9O
         oYXPDBLTbYllh91jpZAe2mK0rDdq6HkPuCglj+3GHCP6tGWCnVK4EWQP7NFT+0K8alI2
         H0oJsb5QNpg0sqVT8A60Dx/1ELRh3nLasQsAxle+LnybNCYQ5bbk6FZWcb0Po/dQJlkc
         W69na2pZJepsqw0tdyKWBP3/AOWW4QOHy47ycFN5a1DU7hCiZ4dGCW8prQce6qbXZe14
         BWTQlvPCWVLOpPxREggPfSnkkPuXs0iG5/NtlvWArrVQppA4DfS+XUzglQgEdy3OETNH
         7WBQ==
X-Gm-Message-State: AOAM5313nhx/TKiZVXDM7WIMqQfwb9dyBoOY5T4tf+aYATcv9tDw7xyL
        LYw7dNLL9kInTXX8xLGkARO4oqjFPDpCODhF8jdypVsudIQAbMNZGqpXwF6FN6K9PBPgShyqGis
        Xesep3dcmvAi4l7329YIygywzVBuXl/WKCUEUrg==
X-Received: by 2002:a05:6512:1296:: with SMTP id u22mr54114399lfs.296.1637567838143;
        Sun, 21 Nov 2021 23:57:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm5yi0jg4wyKx59FrIXG+M0rioU4VgvmaVZqCRxWzwHhoZyOEN8fz79drw2KNpAE4E/QC5YQ==
X-Received: by 2002:a05:6512:1296:: with SMTP id u22mr54114381lfs.296.1637567837963;
        Sun, 21 Nov 2021 23:57:17 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id o11sm837418ljc.100.2021.11.21.23.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 23:57:17 -0800 (PST)
Message-ID: <706cd9c2-5eeb-fd56-a7de-045796584797@canonical.com>
Date:   Mon, 22 Nov 2021 08:57:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 6/6] clk: samsung: exynos850: Keep some crucial clocks
 running
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
 <20211121232741.6967-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211121232741.6967-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/11/2021 00:27, Sam Protsenko wrote:
> Some clocks shouldn't be automatically disabled in clk_disable_unused(),
> otherwise kernel hangs. Mark those clocks with:
>   - CLK_IS_CRITICAL flag, when there won't be any consumers for that
>     clock, but system can't function when it's gated
>   - CLK_IGNORE_UNUSED flag, when consumer driver will be probably added
>     later
> 
> That makes it possible to run the kernel without passing the
> "clk_ignore_unused" param.
> 
> Next clocks were modified:
>   - "gout_dpu_cmu_dpu_pclk":	CLK_IGNORE_UNUSED
> 
>     Will be enabled later in DSIM driver (Display Serial Interface
>     Master).
> 
>   - "gout_gpio_peri_pclk":	CLK_IGNORE_UNUSED
>     "gout_gpio_cmgp_pclk":	CLK_IGNORE_UNUSED
>     "gout_gpio_hsi_pclk":	CLK_IGNORE_UNUSED
> 
>     Should be probably enabled in corresponding GPIO driver later, or
>     made CLK_IS_CRITICAL. "gout_gpio_peri_clk" is actually used by LEDs
>     on Exynos850-based dev board, so kernel hangs if this clock is not
>     running. Other clocks were marked as "ignore unused" to prevent
>     similar issues for other use cases or boards that might be added
>     later.
> 
>   - "gout_cci_aclk":		CLK_IS_CRITICAL
> 
>     CCI (Cache Coherent Interconnect): obviously is critical.
> 
>   - "gout_gic_clk":		CLK_IS_CRITICAL
> 
>     GIC (Generic Interrupt Controller): obviously is critical.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
