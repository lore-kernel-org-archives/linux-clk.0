Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41F5C07545
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 17:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjJYRn7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 13:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbjJYRn6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 13:43:58 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31717CC
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:43:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c59a4dcdacso26651141fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698255834; x=1698860634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KvqI5bmHaI6r/r4Bh4STYH/OzlrCkqHPpu4GTwS1+V8=;
        b=OXVx2Du9VeuoBLpGr8hGnI+yHnRo1H15KqUJ3t0u1Ue2uobLcr44mIAhhwOdukrrrg
         LVs3YoANZB2J4V0WXYID/6sxWRXiWImDWi3qU571wz0aHCOc2gDHgUbT8qMt/hwt8eZ9
         8Bj7iWgbk7Icylx7RVQGOYetMVl+Wy3zZV5ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698255834; x=1698860634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvqI5bmHaI6r/r4Bh4STYH/OzlrCkqHPpu4GTwS1+V8=;
        b=isVf9kRplifHbQOpIz2PeFE8voFf+juU0gi4UApUNi1+UZ65UzhAQkfN81ovqqmfFA
         phDgpc7Brg3lBVBAlV0+X5k95ufNY5CNh1VvLzBT2Psd8GRlb/pkKAqEtyACdABNFgHq
         261Cg65Y29Vnf3iWtTyvZrd7yvLXYtZIaMfSwoVP60ckpVq8/yIkdxFFXUE4ZGvZmRQT
         1cihYJ2RnAUEA9qgwo5YodtwtNJfpJUn9QoopwjYVT0DAMnjJXLfYh16/MpDcp4Kb9Fq
         Hp6XNH9wS1pwddcX5MUz+xEu/dZrNVhHMXQjs5HhfUxtw8tBfZjwKCQa7POAeCrpBj6u
         Etcw==
X-Gm-Message-State: AOJu0YzSunMohv/7x6EnAQZOdVmtcanWmTPSC3ZNGnMsJ7L/q1HcZ8+M
        TYeXanvZYC+CxydAsS10LwtLWr5uohYVYwtnsrfNzXbq
X-Google-Smtp-Source: AGHT+IHgmJuJrLf/iUDi75OGTkdSUJthDTJO42qzQoGi+pgzgupZpuVfdhwzYxvBKZvtkJ5RIRN4Vw==
X-Received: by 2002:ac2:58e2:0:b0:507:b8e5:dfd5 with SMTP id v2-20020ac258e2000000b00507b8e5dfd5mr10337302lfo.5.1698255834213;
        Wed, 25 Oct 2023 10:43:54 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id h10-20020a19700a000000b004fe64b0109asm2632364lfc.176.2023.10.25.10.43.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 10:43:52 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507a55302e0so7998665e87.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:43:52 -0700 (PDT)
X-Received: by 2002:ac2:52aa:0:b0:505:6fcd:d7bf with SMTP id
 r10-20020ac252aa000000b005056fcdd7bfmr10111613lfm.19.1698255831687; Wed, 25
 Oct 2023 10:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231024161931.78567-1-sebastian.reichel@collabora.com>
 <20231024161931.78567-2-sebastian.reichel@collabora.com> <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
 <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com> <your-ad-here.call-01698246313-ext-3263@work.hours>
In-Reply-To: <your-ad-here.call-01698246313-ext-3263@work.hours>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 Oct 2023 07:43:34 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgs2DDdckcONG+YbB-GDH2QFCoZJ=Vm+YXxb1moZzuDgQ@mail.gmail.com>
Message-ID: <CAHk-=wgs2DDdckcONG+YbB-GDH2QFCoZJ=Vm+YXxb1moZzuDgQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        David Laight <David.Laight@aculab.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Niklas Schnelle <schnelle@linux.ibm.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 25 Oct 2023 at 05:05, Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> You probably want
>
>  #define __div_round_up(n,d) _Generic((n)+(d),          \
>         unsigned long long: __div_round_up_ull,         \
>         long long: __div_round_up_ll,                   \
>         unsigned long: __div_round_up_ul,               \
>         long: __div_round_up_l,                         \
>         unsigned int: __div_round_up_u,                 \
>         int: __div_round_up_i)(n,d)
>
> to avoid early type-checking for expressions that will be discarded
> and prevent errors like:

Ack. I noticed that later when I tried to do a bigger config build -
the compiler would warn about the implicit truncation of the integer
arguments (for the cases where they weren't used).

> Plus typos fixes below passes allyesconfig for s390, 32-bit x86 and arm.

Lovely.

It would have been even better if somebody told me that I was stupid
and there was some nice trick to it, but at least the _Generic()
approach doesn't seem broken - just a few tweaks needed.

               Linus
