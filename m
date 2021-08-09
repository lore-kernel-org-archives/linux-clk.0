Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7D6C4338F
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 10:47:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA67060C40
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 10:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbhHIKrY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 06:47:24 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:40416
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234832AbhHIKqy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 06:46:54 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 506B33F34E
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628505993;
        bh=yt7czbeHRo3zFzMadQuUQl5b/q3O9yrC7ug3tMqy3VU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=aX+rH/MBYj2zkZ5IX1yHNl/KB19LJABLSGvrkyKFDOEBCxgmGnacd4IeetPXPvaHT
         njjKe2enEQHJImJX1B4m0S0xcnz4d7spWn40zEiFq1v52uEVIdaMvwq2ddXw8NAj97
         devgS6F8Nj0i0uf1yM6/vOhFyvnwP0GYngfwBFN0Z1QmvU4kpuAjv/LFHllPT656OF
         41O3RmGc5Gf7LQuqODR1+E+5OuuUZvGl7ATYPaN1lt1DvaPSQ9jCrbh+8SEm/kjaoL
         jomDTg3zS41wJmnLmdiV1KLUVPE8paPD2l+pKZYdbZJU+5WxsPbXxHauQYWelvuiMj
         HH9OvEQCTtV/w==
Received: by mail-ed1-f71.google.com with SMTP id s8-20020a0564025208b02903bd8539e1caso8678423edd.22
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 03:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yt7czbeHRo3zFzMadQuUQl5b/q3O9yrC7ug3tMqy3VU=;
        b=e7f9LLzq93SVl+bkthNXhZRnpusKnbaryVj/vgGNtrkvQU4fycUJmACoOwBAqbgLUz
         2rClRyk9C3cT6baW6Cy/Bkh5OiPBd1JpyXBcq0g3A7a6wr3o0J9Tai5O2Bncmv5e/5j4
         ZnWIk3VGG/eU5I1I+xqE24dQJE16Qino+nYSSA9hsXRF/KSikYm/xbLbc9fiG6ntLU+u
         tcWLpBCMe3AfmeRqr94WTSFmsFoseREKgmM3vtfvUfCaowIBkreUQuEE5YG+bneF43Cw
         PBy3amRsX9pgbaZeE8Q1RjGBWOJGam9j8kafxsCmPVshGXRkbzuQsh4+MOsq8rCQRlgG
         2JTw==
X-Gm-Message-State: AOAM530xw/3gbCu1AIFipfXYuMbfy0y32rUYPopo2Y0fn9VGngGncQwe
        eJxewsNUtFYJvzHK0lKEwjJE6MrbnCWSNuXoLr1vKh50m2eHMHwrJfr3cM8/hBOFEL1chsO5gJQ
        jhvyaVrbc/b3hHiHX/Wfi2TsqXdHd3Qw+t9mqFQ==
X-Received: by 2002:a17:906:4346:: with SMTP id z6mr2946659ejm.403.1628505982425;
        Mon, 09 Aug 2021 03:46:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwilRElb69ECVZp5XBCmIh/rGOdeWiuwyHyABm9gfRG9GvWksDs334T+DetejTgQ1+PQ9rACw==
X-Received: by 2002:a17:906:4346:: with SMTP id z6mr2946634ejm.403.1628505982295;
        Mon, 09 Aug 2021 03:46:22 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id f5sm5733019ejj.45.2021.08.09.03.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 03:46:21 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] tty: serial: samsung: Add Exynos850 SoC data
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6169e25b-2829-628a-f910-348ddd4b3030@canonical.com>
Date:   Mon, 9 Aug 2021 12:46:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806152146.16107-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/08/2021 17:21, Sam Protsenko wrote:
> Add serial driver data for Exynos850 SoC. This driver data is basically
> reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
> chips, but also enables USI init, which was added in previous commit:
> "tty: serial: samsung: Init USI to keep clocks running".
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Fixed default fifo sizes
> 
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
