Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D90C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C965261214
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhIOIZ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:25:56 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52746
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231689AbhIOIZ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 04:25:56 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F0A7C4017C
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694276;
        bh=jH5yqZdy0poBMayuZGGYMX7sqt3HTnu/3+K0ZeEsCPk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=NXg5sRQqtkxawT8VFTJgkhZEkArkV7Q58m9LDz3uudZg3LDYpn0W3N6DQNMAQ5PGY
         piPPCl8ikbmSqBZZ2lPv4d0IjRf81vy3YJEhsVZtU41l+qbIorceCbBr7K2RI3PCHj
         Ut6ifBat0rrcHegfXWRKbR0NYtawCk0LlXRV/1wsCL7pbnty68J0njuPLf2DwMAW+B
         8TOUY5cCizW/FaTK44bXbNlQg75tbAS1XM51kvRJ+Vz4z9J/G4bMBPHlJKyra4ny4C
         znjI5ftH6Nca12UL/ojeBiAKN6Q3s8NPN6DHYMbsKcwyMV8PQz+2o0WRQgHHBnU6jD
         fawbTkbBm0zAg==
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923so286298edn.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 01:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jH5yqZdy0poBMayuZGGYMX7sqt3HTnu/3+K0ZeEsCPk=;
        b=cfM3SPL+tjrdWHkiN+RczA7AUDuz2eQGh3jteIzGouaCpDhR0abqPhNlEx9pKqoo7R
         5OV28mDFcy6KC4hiCTtuWHqDXXy3nDDs7Z7bLHdQF79iyErApjctY4TklRQo3stKjz7j
         tRQGR/EbHJ4YZEGDLO1ySvmvKM4gXs6URmjkkHYGYYOjU6Qn4ZsjbxNT7oESygwh2Cur
         0lLrDf2WyiCIZl5sYmrP9ovit46lkJ2G5bYfnylUcEmWhHiQllyCvu7PtI7gHLrPjeRE
         /CQmoqygQ5zYHAhe5QESMh/hqjTznGd0mPFQ+02mrVEi8c+qvQBR5qqfZnHCyjxUKR54
         5NYQ==
X-Gm-Message-State: AOAM532AP58FY+PD6Csg980AVcPnWOmizwsVPLpwrWBDhEWQnxbgw9MU
        GDAmcfdqUg4v5L9VtkDxkKuLlrJxn3qJR54CrzUFDpImNcgzGN0np1wEDXDIuTUuh5Af4uNSS3p
        EHzncJEs0KsnQpjQqhPC1bK2ik8B7Be91jaAlFA==
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr24610926ejc.556.1631694276567;
        Wed, 15 Sep 2021 01:24:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsVkw4c2rpKq/jC9r7maHh5NKfix2SH8toBQTvS0RrkMXOk3q+BW0FeTzs/ZNQvvCu8pb6OQ==
X-Received: by 2002:a17:907:d23:: with SMTP id gn35mr24610904ejc.556.1631694276399;
        Wed, 15 Sep 2021 01:24:36 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d3sm6658015edv.87.2021.09.15.01.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:24:35 -0700 (PDT)
Subject: Re: [PATCH 2/6] clk: samsung: clk-pll: Implement pll0822x PLL type
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <47e5b93a-27b4-2188-7b1e-fd2c1b2379d3@canonical.com>
Date:   Wed, 15 Sep 2021 10:24:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> pll0822x PLL is used in Exynos850 SoC for top-level integer PLLs. The
> code was derived from very similar pll35xx type, with next differences:
> 
> 1. Lock time for pll0822x is 150*P_DIV, when for pll35xx it's 270*P_DIV
> 2. It's not suggested in Exynos850 TRM that S_DIV change doesn't require
>    performing PLL lock procedure (which is done in pll35xx
>    implementation)
> 
> When defining pll0822x type, CON3 register offset should be provided as
> a "con" parameter of PLL() macro, like this:
> 
>     PLL(pll_0822x, 0, "fout_shared0_pll", "oscclk",
>         PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>         exynos850_shared0_pll_rates),
> 
> To define PLL rates table, one can use PLL_35XX_RATE() macro, e.g.:
> 
>     PLL_35XX_RATE(26 * MHZ, 1600 * MHZ, 800, 13, 0)
> 
> as it's completely appropriate for pl0822x type and there is no sense in
> duplicating that.
> 
> If bit #1 (MANUAL_PLL_CTRL) is not set in CON1 register, it won't be
> possible to set new rate, with next error showing in kernel log:
> 
>     Could not lock PLL fout_shared1_pll
> 
> That can happen for example if bootloader clears that bit beforehand.
> PLL driver doesn't account for that, so if MANUAL_PLL_CTRL bit was
> cleared, it's assumed it was done for a reason and it shouldn't be
> possible to change that PLL's rate at all.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 91 +++++++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h |  1 +
>  2 files changed, 92 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
