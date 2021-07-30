Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29373C4338F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 16:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0585360EE6
	for <linux-clk@archiver.kernel.org>; Fri, 30 Jul 2021 16:34:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhG3Qe7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Jul 2021 12:34:59 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:52808
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhG3Qe6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Jul 2021 12:34:58 -0400
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E8DB93F237
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627662892;
        bh=LOZkX2Gn1AlaUpgTb3/KKeIofvF4AshHz3LJwLGMhDk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JD1ZfK8pFVkvqaRDgdGpfCk4kRfcHvJQHV4EDZ+7HFrcoOJuysVUz0uno45kNj/KT
         heLXZu9M8FYd/ehc2t7b3nUpMrP3zRQSUrVx1SNmksADwNVh2LVJ4hNWGm8KwHnSB6
         flrq99BOGH+AB76P0OQ5pSdjb8BhR9vdn5dZoyO7H33GXywHilNl4IvZstmqBC6k/J
         ChfqpgC6TawPTCQdJXj5FLa0GZrz2zwjjct0o9RBNrShPX1fIqYtZ+3tn2bkSN5x81
         mzc+fFei5bQBEsrwVG2habPRQGBoA53JpxuaFoVA2Emzq4x6jrLKV/fth4kjPu8qQ/
         i6lKZ4J8kKTAw==
Received: by mail-ej1-f69.google.com with SMTP id ci25-20020a1709072679b029058e79f6c38aso2974332ejc.13
        for <linux-clk@vger.kernel.org>; Fri, 30 Jul 2021 09:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOZkX2Gn1AlaUpgTb3/KKeIofvF4AshHz3LJwLGMhDk=;
        b=D6vCJK7IV3VlwLVSTFvlSufl+vFXLuvMfI75W5w0I4IcsPEG4yLCdskal3gNjXpEyy
         nxsa/x0DpiF8ax6vSAmK89faPSJIjgJiT9UyJ0nvpqrq9CB/jHhZHJRzMZ/0DNP3HbG0
         tF/di+IikgkQmTktCzMLdiTLSBkAcDk+qS8M1/ysEP9JxcS+v4ZjGsV7p/Oq2WhxdJNq
         /ucdsmvM8KZidWKnBlXQOJ7hlKK6XxY9VC8nsS2RiZcLr1fk7QXNab5jCC9dp8MnhxOr
         3WxahIkSWnj2U16TVohohe0DbPzowok8fxhQWq+Ro8gfmj7cIr5G3U9v9HylL9kJ4Gn4
         D0Vg==
X-Gm-Message-State: AOAM531oA33kB26lB4+p0hPLFMOWGxCxta6T+J+7y93z0Gvufl3kKkMi
        8kVrfuyOq2eAsrgovaGzcQUhTsD5ex/SvGnVEVa1ooFcprs5YGOSrF6KrOYcB6SgHNEX/JC5oL4
        eQYBdlUwLGqK7W4w4t0MYMGLwrE7NUCa8nk8RIA==
X-Received: by 2002:a17:906:c0d1:: with SMTP id bn17mr3262433ejb.511.1627662892674;
        Fri, 30 Jul 2021 09:34:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAQ3oDEvssRhYOquKsKs0awtj++lTiixkq4+khiYVFew5afUiOqz586WxPl24Q2+jJCRUS5Q==
X-Received: by 2002:a17:906:c0d1:: with SMTP id bn17mr3262411ejb.511.1627662892551;
        Fri, 30 Jul 2021 09:34:52 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id b25sm928440edv.9.2021.07.30.09.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 09:34:51 -0700 (PDT)
Subject: Re: [PATCH 05/12] tty: serial: samsung: Fix driver data macros style
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <e11d0e60-9bbc-16d2-c8ea-42d3d93e97d1@canonical.com>
Date:   Fri, 30 Jul 2021 18:34:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Make checkpatch happy by fixing this error:
> 
>     ERROR: Macros with complex values should be enclosed in parentheses
> 
> Although this change is made to keep macros consistent with consequent
> patches (adding driver data for new SoC), it's intentionally added as a
> separate patch to ease possible porting efforts in future.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
