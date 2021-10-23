Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F558C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Oct 2021 09:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEC3D6109D
	for <linux-clk@archiver.kernel.org>; Sat, 23 Oct 2021 09:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhJWJV7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Oct 2021 05:21:59 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48266
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230085AbhJWJV7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Oct 2021 05:21:59 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 42429402EE
        for <linux-clk@vger.kernel.org>; Sat, 23 Oct 2021 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634980779;
        bh=y64xiDh6vWon4cWBdDBfcLK61yfVRep3b0Jy8edoaN8=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=g2dReMlOgRw5zIEIFNIIVS8pRI8Aj/+8wOcjajiYXQoox2qurcgd/x1jTxvaq1WXg
         UECcbCo8RcNELruYNadsjzoaLamz44Ji8Xs79s5chH+Y5mV+PDhmWRlEtuc+sUCgSY
         tpHxDMaoummWnfmYvnnko1Vmnwb5qPwVtLp3tuJtB6JE6v1kki3olBFnAQ2kYnqgVY
         phGsl4Cpet8+grDDnx18fLkgnvceTD8NqqtR27Z1PTjs25MUhR41Jz1KyMp+QVKBPg
         +SmM8/43fQbY5nf7bIM5xKdUDZWdjQK5LaWrvsR9tjH1VA8qnQg+7g+PphDoa6oDJZ
         eTfLL7Uog1nbw==
Received: by mail-lf1-f70.google.com with SMTP id k18-20020a05651210d200b003fd86616d39so3017604lfg.2
        for <linux-clk@vger.kernel.org>; Sat, 23 Oct 2021 02:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y64xiDh6vWon4cWBdDBfcLK61yfVRep3b0Jy8edoaN8=;
        b=qTkY8BZ9m6Zdi0L6I2K2ajgX9IDxRRXsz6jhxce/1m8okVgjgn3s8cXLL92YEcVzfm
         mUTa95I6QEfYOFH2AfQS40C2pSki37rIY4argMj/FQRqS9lgkC9JOzZb2lygDZ3txZSF
         2N6Bf0WI2oVhiaeq0wlT1KnOj9dMtjZvQYxJx2RrS9IML1z//QNcbLfI2fyIHI6VsYQ7
         UlZbtdGstdP/10tR3noJcOJFi8dTKBMubmHhRnKphIFlTQszd+xBUd+uiXX8q3DjxtoJ
         mTcyDztJ0wg+GmVa0Duk/qsJkR6sLSlGcmCIOgtfJavjHlpX3o4QOnSBZOrze8ghJWfK
         wO+A==
X-Gm-Message-State: AOAM532puM1iIXUD2PkeKsbyEj32cE6ccUWbL77FLJKV9UbGKiwSkKb+
        JYH+dpDBK74GEoDbieBMEy66BPGBr4nK88Tap7BvVWBck5+Dqwvo4X6YdwpJFS7au2C4aJGfpZd
        jWyywFCqzeDt4G+LYyZju2097b8HaA/wnBAMAxQ==
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr5473313ljp.239.1634980778473;
        Sat, 23 Oct 2021 02:19:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL6bUdYP/vNZocag+kLgsuqN8HkdqCGAQeo+c4eDzv5bJjhAGZA+w9SVfJJijfQ+FXwtHJhg==
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr5473283ljp.239.1634980778202;
        Sat, 23 Oct 2021 02:19:38 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s3sm973085lfp.264.2021.10.23.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Oct 2021 02:19:37 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211022215635.31128-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] clk: samsung: exynos850: Register clocks early
Message-ID: <f8f1121a-f9ba-e231-ece2-646d9de8b22b@canonical.com>
Date:   Sat, 23 Oct 2021 11:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022215635.31128-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/10/2021 23:56, Sam Protsenko wrote:
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register all Exynos850 clocks early, using
> CLK_OF_DECLARE_DRIVER(), and do all stuff relying on "struct dev" object
> (like runtime PM and enabling bus clock) later in platform driver probe.
> Basically CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears
> OF_POPULATED flag, which allows the same device to be matched again
> later.
> 
> Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> drivers/clk/mediatek/clk-mt2712.c.
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Notes:
>   - This patch should be applied on top of CMU_APM series
>     (clk: samsung: exynos850: Implement CMU_APM domain)
>   - I considered introducing some macro to reduce the code duplication
>     (actually created one), but decided to go with plain code: this way
>     it's easier to understand and navigate
>   - Also considered registering only *some* clocks early: won't be
>     possible, as leaf clocks (like MCT) depend on the whole clock tree.
>     Registering early only *some* CMUs (like CMU_PERI) looks possible,
>     but I'm not sure what is the best way to implement this, and that
>     won't be consistent with other CMUs (too much code variation as for
>     my taste)
> 

In the long term it is better for entire kernel and SoC to support
deferred probes and register clocks as devices, not as CLK_OF_DECLARE. I
understand that it's not possible now to get rid of CLK_OF_DECLARE
entirely, but we could meet half-way.

The Exynos5433 has the same problem and it registers few core CMUs
early: the TOP, CPUs, memory bus, peripheral buses including PERIS with
MCT. I prefer this approach than yours. The only domains needing
CLK_OF_DECLARE are TOP and PERIS. Maybe also CORE - one would have to
check if GIC and CCI are needed early.


Best regards,
Krzysztof
