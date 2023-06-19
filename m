Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D991BEB64DA
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 10:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231492AbjFSKfN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 06:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjFSKfA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 06:35:00 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73DD1731
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 03:34:49 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-341e400c2b3so20101545ab.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 03:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687170889; x=1689762889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEmM/V4+LRa0kJZh4f+xjV4QTwqbIyjR3fdgLv3MIdE=;
        b=T8Vm4JE0OXW4Wu0I9mdsWjamFF0v8jXcXuBXpSwUROwypdVnojHt5cSd+PDKpy0oRl
         AMVzbT+Zv3pGOwyVlZG2ogCLL9Xqh1urz0ao5gcyPnu++hMwYHsPs3WwwTugWPOV9wYU
         e5CSB6CW4LYRad1YrSyLl+gfg7sR0hDr5pm+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687170889; x=1689762889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEmM/V4+LRa0kJZh4f+xjV4QTwqbIyjR3fdgLv3MIdE=;
        b=AncCjscQcdC/1PSrfruF6vXGtJaB3X340nV3z6ZDOFwuaHEof2aYlIGvL92WaZTeev
         kz/2QT1Dib4dEdctpjZ080CQWPeRQUlr9MghpKRldF8t5PFl1DxsNqLLHzXNklc0ErQF
         N/ziIfMZoRYkuxIPokUqm7MICZKQZ/PAypjhGIt3X8+WCJ5WEwrH0pwk4zvh8aKM/a+K
         uQUfRKbc7jroa8Y0GkXHxZWpzeaskLwt3lKDk+jF9goS/wcNlSl9Odbyjng0NPpZxhtv
         lpuEdURtuPXymNzOsD8YJXFE7sk/yCIA/wk6W5siC9YhxdYTNXGimzS/xohN5bp0gsVt
         AEQg==
X-Gm-Message-State: AC+VfDw7qDJqJkcyxwVfDjZ6iR/2fHaJHuagHbvolL2c2sF1lPhoIeUO
        lv+mW5XnhPmFRz0gdwjvdrkoEd/NihUOWxHo7INrug==
X-Google-Smtp-Source: ACHHUZ4Aa7thYURkYj63/OtJO8tKQXwSs64WWGvcmrimVomXxr6bMkMfeB1UqnUdA3tacmNo/ycQgQ==
X-Received: by 2002:a92:d28d:0:b0:331:a2f5:b50d with SMTP id p13-20020a92d28d000000b00331a2f5b50dmr6740491ilp.30.1687170888750;
        Mon, 19 Jun 2023 03:34:48 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id t2-20020a92c0c2000000b00341f4eeec71sm2443710ilf.80.2023.06.19.03.34.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 03:34:48 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-77e24ace5a8so157942039f.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 03:34:48 -0700 (PDT)
X-Received: by 2002:a5e:8f0a:0:b0:77e:25dd:93be with SMTP id
 c10-20020a5e8f0a000000b0077e25dd93bemr8379722iok.14.1687170887982; Mon, 19
 Jun 2023 03:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
 <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain> <CAC=S1njwxLfw7LcnXkgY7pbiFaqvNQVyAzHVhK9+nYJC63d=Zw@mail.gmail.com>
 <32fa8c0e-26f4-4ee4-889a-4037530c128d@kadam.mountain> <658d32f2-a71b-4dc2-bff9-649fadf41889@kadam.mountain>
In-Reply-To: <658d32f2-a71b-4dc2-bff9-649fadf41889@kadam.mountain>
From:   Fei Shao <fshao@chromium.org>
Date:   Mon, 19 Jun 2023 18:34:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1njbLadG+JP38pOrek8RFHYC+En_YXDPaYEbErn8OxFH7g@mail.gmail.com>
Message-ID: <CAC=S1njbLadG+JP38pOrek8RFHYC+En_YXDPaYEbErn8OxFH7g@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Fix memory leak in devm_clk_notifier_register()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus Elfring <Markus.Elfring@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 5:57=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> The other reason to include stack traces is so that if someone else
> runs into the same bug they can find your patch by googling their stack
> trace.
>
> Normal users aren't going to be running kmemleak.  And people doing
> testing work for companies are hopefully going to pull this fix in via
> the stable tree so they'll get this patch automatically that way so
> they won't see it either.
>
> But if the stack trace is like a NULL dereference bug, then users
> absolutely do notice that kind of thing.  You should always include
> those kind of stack traces.

If that's the case, I can leave a retrospective trace record here:

unreferenced object 0xffffff80c4e34a00 (size 256):
  comm "swapper/0", pid 1, jiffies 4294667967 (age 288.740s)
  hex dump (first 32 bytes):
    00 4a e3 c4 80 ff ff ff 00 4a e3 c4 80 ff ff ff  .J.......J......
    1c 2a 7a ae d8 ff ff ff a0 b0 af af d8 ff ff ff  .*z.............
  backtrace:
    [<000000007d72e65c>] __kmem_cache_alloc_node+0x198/0x240
    [<00000000dfce47ef>] __kmalloc_node_track_caller+0x6c/0x1b8
    [<00000000b6c409fe>] __devres_alloc_node+0x60/0x104
    [<0000000081112baf>] devm_clk_notifier_register+0x44/0xc8
    [<0000000070bfe318>] devm_mtk_clk_mux_notifier_register+0x60/0x74
    [<000000000242235f>] clk_mt8188_reg_mfg_mux_notifier+0x84/0xb4
    [<00000000f67ce424>] clk_mt8188_topck_probe+0x1b8/0x2e4
    [<0000000006eef8cd>] platform_probe+0x12c/0x17c
    [<00000000eacf783c>] really_probe+0x1f0/0x4d8
    [<00000000f321a3f0>] __driver_probe_device+0x160/0x230
    [<00000000bbeed898>] driver_probe_device+0x6c/0x148
    [<000000007d5af62b>] __driver_attach+0x164/0x20c
    [<00000000c5c25e77>] bus_for_each_dev+0xf4/0x144
    [<00000000e2c0100f>] driver_attach+0x50/0x60
    [<00000000cc421ec0>] bus_add_driver+0x2a8/0x458
    [<000000007814168a>] driver_register+0x16c/0x29c

It's up to the maintainers for the next step and I'll follow the call.

Regards,
Fei
