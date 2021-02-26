Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281E6C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 16:36:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E679464EEE
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 16:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBZQgK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Feb 2021 11:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhBZQgF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2021 11:36:05 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFA2C061786
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 08:35:22 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id c6so11799490ede.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 08:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cOneb72+9BMDKFMeXHoHtH5MZRyiWygS1afzq3OOa+o=;
        b=E4DbkXF/qcHn1t53N2ZY0ECGTpmXtZVoY6SFeeKj+vTG082gR2f+HYW/wmeBaK7HBp
         4Snk/JOoGLiyEYKKMyvH6jjpQfHqHq2hdqW5M+sUcVlgLtybZXDdfYUr+SZDNtkfkvSb
         JAK9hzKINrmqy5B8aGnMd6jvnlQo1FETWwF6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cOneb72+9BMDKFMeXHoHtH5MZRyiWygS1afzq3OOa+o=;
        b=nSVKaluaJraoFKU6vMZiGiy8WXsrILTj711wfUWz3W3hV8dFxAL7n24pHNQdqonrQL
         85oOQEthPrfGm4L6AqiFQU4TB48SqyH3qrNRaPaX9Uibi5liwvejju4nnxcq7OvEURbq
         snDF6OneBCByd0keu5hIUxksvzH8qnFIlANupydwU0YaOPUBCfZBU36KMhgCL7fSuEwC
         x6rBACfNAFsUommQl1oRUiUfDoE0kAlQEzXsfEDe/CF7zfnullOMxC+mZPFuvfoeqe2S
         zsmhwOhJmvIM0Nu9BOtWp7SmzV3E4lBaP12KyhdqpmtFLrcQ0P7vXiP9AybJnfAUkKoG
         TjKw==
X-Gm-Message-State: AOAM532GBCW8osAVO6qBpUo4uoJdafI+Qn+Db/r1T3j+so1p/uL0bsmr
        uGSbSY2JXJxKgblW/fm0DuqVoA==
X-Google-Smtp-Source: ABdhPJxgWKA9baDmnn7v/NyJDUc1IXanLiIYaaEflz+WN2lJxW3UHkfK6YObK8/eFA/ReW3JQLO+5g==
X-Received: by 2002:aa7:c386:: with SMTP id k6mr1400939edq.224.1614357321498;
        Fri, 26 Feb 2021 08:35:21 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id u18sm5589671ejc.76.2021.02.26.08.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Feb 2021 08:35:21 -0800 (PST)
Subject: Re: [PATCH 0/2] add ripple counter dt binding and driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
 <CAK8P3a2=nZ3bbeguXjbFrhz0nWeUOcLM7mRudhPDrcb+jZ4VvQ@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e5fd7ce3-3ba6-e5de-1cbc-fa31bd46942c@rasmusvillemoes.dk>
Date:   Fri, 26 Feb 2021 17:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2=nZ3bbeguXjbFrhz0nWeUOcLM7mRudhPDrcb+jZ4VvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/02/2021 15.35, Arnd Bergmann wrote:
> On Fri, Feb 26, 2021 at 3:14 PM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> 
>>
>> So I'm thinking that the proper way to handle this is to be able to
>> represent that ripple counter as a clock consumer in DT and have a
>> driver do the clk_prepare_enable(), even if that driver doesn't and
>> can't do anything else. But I'm certainly open to other suggestions.
> 
> How about adding support for the optional clock to the gpio_wdt driver,
> would that work?

I think it would _work_ (all I need is some piece of code doing the
clock_prepare_enable(), and until now we've just stashed that in some
otherwise unrelated out-of-tree driver, but we're trying to get rid of
that one), but the watchdog chip isn't really the consumer of the clock
signal, so in-so-far as DT is supposed to describe the hardware, I don't
think it's appropriate.

OTOH, one could argue that the watchdog chip and the ripple counter
together constitute the watchdog circuit.

Cc += watchdog maintainers. Context: I have a gpio-wdt which can
unfortunately effectively be disabled by disabling a clock output, and
that happens automatically unless the clock has a consumer in DT. But
the actual consumer is not the gpio-wdt.
Please see
https://lore.kernel.org/lkml/20210226141411.2517368-1-linux@rasmusvillemoes.dk/
for the original thread.

Rasmus

