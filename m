Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501ABC00A8F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 19:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344112AbjJXTcv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 15:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234890AbjJXTcu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 15:32:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C7810C9
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 12:32:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c3c8adb27so689936966b.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 12:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698175966; x=1698780766; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz2UiFW5H33iZ4N++uZ6e03nG8WnF5BOmzOOzIXzHlc=;
        b=cUQOFfjDKVe6IhuhoV6DnActivhxQ/6PjMpVm9WjWz+bnxr6u5h7MFwphRTU0fE+HS
         nYiwcUCwSDxJrTZjm/CzxabMeRPEo7O7NXgPKCDnejzecJsfh/AF8fCm5UE+rnebCGib
         RtU+oFGiCcTmlif293Yh0q56VQGY8gZdWNerI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698175966; x=1698780766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz2UiFW5H33iZ4N++uZ6e03nG8WnF5BOmzOOzIXzHlc=;
        b=L46U2q3SxqGZ7hJUwAblZs74IHEYWGqAdNYfxQdWvG+VISuBEoEDRZqzYdL42/KikW
         TDcj/9Qz7GtQ/Ptv2cgOlcbQv7/qdu03coPxEcHLkSUnFULcUtXOPZ1jFzwh0msNIaja
         PhRGpsY4yrma/o9Q/Eae/O7kdYybQbUTRGLlPWLNqq88EEM+DAsAh9JBUJoEztwo9EQp
         PM1IA4vnzy6m+ya3cOnFDpDn1XW9QXSVOyUKDvZiK7T+YLHsGM3pSmk8o6kWb7ddd6P5
         0gJAbJCqwpL7Agn25aNFt+hOGUTTdyT6p/YBHrFTH0hVJBWuvGrUJbAyKKLnlygF/NrX
         9mdw==
X-Gm-Message-State: AOJu0YwMe8xa/lYxW6/hululAXU8+ZbGTu7Vn7iKlaD0KQd7aJ1TMuyI
        jc3F/p2elWsSZOqRieSRdHJXbS7ASWD++w5RWDhyzkKo
X-Google-Smtp-Source: AGHT+IELS/zdp/z0k2vV2GKA+wNVfgV2b76qa2R8mMa1V3tbeb9z2fMk/b6E3JFCY89rq5FKbop1Tw==
X-Received: by 2002:a17:907:25c3:b0:9bf:39f3:f11a with SMTP id ae3-20020a17090725c300b009bf39f3f11amr10006060ejc.74.1698175965815;
        Tue, 24 Oct 2023 12:32:45 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id c22-20020a170906529600b009b285351817sm8643637ejm.116.2023.10.24.12.32.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 12:32:44 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99c3c8adb27so689932366b.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 12:32:44 -0700 (PDT)
X-Received: by 2002:a17:906:7956:b0:9be:e153:3b82 with SMTP id
 l22-20020a170906795600b009bee1533b82mr10308422ejo.17.1698175964167; Tue, 24
 Oct 2023 12:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231024161931.78567-1-sebastian.reichel@collabora.com> <20231024161931.78567-2-sebastian.reichel@collabora.com>
In-Reply-To: <20231024161931.78567-2-sebastian.reichel@collabora.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Oct 2023 09:32:27 -1000
X-Gmail-Original-Message-ID: <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
Message-ID: <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vasily Gorbik <gor@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[ Since you're cc'ing the s390 people, I assume that means that this
all ended up being a follow-up to the s390 issue discussion ]

On Tue, 24 Oct 2023 at 06:19, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Add a new DIV_ROUND_UP helper, which cannot overflow when
> big numbers are being used.

This is really horrendously bad on some architectures (ie it might
require *two* divisions):

> +#define DIV_ROUND_UP_NO_OVERFLOW(n, d) (((n) / (d)) + !!((n) % (d)))

but David Laight at least had a suggestion for that: when allowing
multiple uses, you can just do

   #define DIV_ROUND_UP(n,d) ((n) ? ((n)-1)/(d)+1 : 0)

so now you're back to just one division and no horrible extra expense.

But we can't allow those multiple uses in general, sadly.

I would really prefer to just make our regular DIV_ROUND_UP() DTRT.  But:

 - people do use it with complex first arguments (ie function calls
etc) that we don't want to evaluate twice

 - we can't make it an inline function, because the types aren't fixed

 - we can't even use a statement expression and __auto_type, because
these things are used in type definitions etc and need to be constant
expressions

That last thing means that even the "__builtin_choose_expr()" doesn't
work, because the statement expression still needs to be _parsed_ as
such, and that's not something we can do in those contexts.

Very annoying. Let me think about this.

                     Linus
