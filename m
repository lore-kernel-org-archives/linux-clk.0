Return-Path: <SRS0=E6RW=QT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F41C282C4
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 18:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF20F222C0
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 18:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YZ/xQS8c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730404AbfBLS5X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Feb 2019 13:57:23 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:37669 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730444AbfBLS5X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Feb 2019 13:57:23 -0500
Received: by mail-vs1-f68.google.com with SMTP id s16so2266717vsk.4
        for <linux-clk@vger.kernel.org>; Tue, 12 Feb 2019 10:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IUNHmrobcIG4oQzAePQtOJCStl1TB5+6T++n6rptimE=;
        b=YZ/xQS8cjOe6q/iuleVhRh0H4H8n53DKDBqLuDCCoxatodAYzBqq1D8ATipqwRI68y
         AJlpOEioy8+mU7ZK8IwGhbauz4zAqw8nV5FhyMBIv/vgoc2TUvHBwFovDZYw2I7IYX5E
         +UMbveXkGwJLvA7jKW1pAFyaHUoOROSndT9qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IUNHmrobcIG4oQzAePQtOJCStl1TB5+6T++n6rptimE=;
        b=VlPRCIFGcN2sTQj4e+Czgwn4Gn2FNvM58RjLYguGZ792oC2dp7X7rrhIn/o0PPfWs0
         kKjlIFNM6FsCpv1VJhdOpVO/SlUj2zM3UdEISX7wh5qnjUU8G/ff0InDMcd6lr/LWnCU
         0hnNHdvqV91c5bb4+MNfEbTQyPDUlywcofYgq6N0HtzZAicVEKL39rf0e5ZWgok1ZYA5
         Qn9oHNVAoMs0SsKzib65npVIVRI1HvDn8IIswcq5AczgFr0f2JtZlDO3XrqM4tzCpBhc
         nEUmPEz/v1jYmqLv+H4LNchFLYTMoPlvQwPQdL0BDxVu0rKW5pCG31li9VnrCohmcvHB
         lmmA==
X-Gm-Message-State: AHQUAuadJVf47wvVyuENuWqBXYbF9RgzLIL74DkJb8Uz7X/xu38mRhJU
        vCpeOCPtTWoPZRWn7zB8WRYy52x1Z3s=
X-Google-Smtp-Source: AHgI3IaKk3n1VQMws9IJ/GzsEueWeFj7lzurAT627voGKaEfBaMNvV3lflFgYD091wY+0VW6LxqBBA==
X-Received: by 2002:a67:541:: with SMTP id 62mr2105516vsf.11.1549997840453;
        Tue, 12 Feb 2019 10:57:20 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 190sm1466184vkf.21.2019.02.12.10.57.18
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 10:57:19 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id r201so2250815vsc.11
        for <linux-clk@vger.kernel.org>; Tue, 12 Feb 2019 10:57:18 -0800 (PST)
X-Received: by 2002:a67:848a:: with SMTP id g132mr2127227vsd.222.1549997838512;
 Tue, 12 Feb 2019 10:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20190211181531.GA3238@embeddedor> <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
In-Reply-To: <CAJKOXPeHp7sKkZ+jXmTXk5GEF_7G5ujfm3Lw==G3T4thfD+F7Q@mail.gmail.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Tue, 12 Feb 2019 10:57:05 -0800
X-Gmail-Original-Message-ID: <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
Message-ID: <CAGXu5jLMWrb4Dszv5YSyoGt5Lb3S1oE8EnKsTou7=7Nq1rEEVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch fall-through
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 11, 2019 at 11:41 PM Krzysztof Kozlowski <krzk@kernel.org> wrot=
e:
>
> On Mon, 11 Feb 2019 at 19:40, Gustavo A. R. Silva
> <gustavo@embeddedor.com> wrote:
> >
> > In preparation to enabling -Wimplicit-fallthrough, mark switch
> > cases where we are expecting to fall through.
> >
> > This patch fixes the following warnings:
> >
> > drivers/clk/samsung/clk-s3c2443.c: In function =E2=80=98s3c2443_common_=
clk_init=E2=80=99:
> > drivers/clk/samsung/clk-s3c2443.c:390:3: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
> >    samsung_clk_register_alias(ctx, s3c2450_aliases,
> >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      ARRAY_SIZE(s3c2450_aliases));
> >      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/clk/samsung/clk-s3c2443.c:393:2: note: here
> >   case S3C2416:
> >   ^~~~
> >
> > Warning level 3 was used: -Wimplicit-fallthrough=3D3
> >
> > Notice that, in this particular case,  the code comment is modified
> > in accordance with what GCC is expecting to find.
> >
> > This patch is part of the ongoing efforts to enable
> > -Wimplicit-fallthrough.
>
> I saw this in multiple places already and I think fix is wrong. The
> point is that the code is correct - the fall through is marked
> properly.
>
> It is just the GCC which has to be fixed not the code. You want to
> adjust the code for specific version of GCC and what if GCC changes
> its warning? For example GCC might require "fall through: "... or any
> other syntax. Another point - what about clang's syntax?

-Wimplicit-fallthrough=3D3 is stricter and maps to -Wextra, hence its
choice. GCC's levels were chosen based on the existing linters, static
analyzers, etc. The patterns are unlikely to change (see the gcc
man-page).

Clang doesn't recognize anything in C mode (hopefully this will be
fixed in the future[1]).

As long as one of the compilers is able to check this, we'll avoid the
bugs associated with this mis-pattern. Gustavo's efforts here have
found kind of a lot of bugs, so I think it's worth a little churn to
add these (and make minor adjustments to existing comments).

[1] https://bugs.llvm.org/show_bug.cgi?id=3D37135

--=20
Kees Cook
