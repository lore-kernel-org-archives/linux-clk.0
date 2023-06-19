Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E94AEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 09:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjFSJjj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjFSJji (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 05:39:38 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08CCDB
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:39:36 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-341c72be673so19028805ab.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687167576; x=1689759576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3S6m5Y25scP8HALvcaSJM0xoSq4jCZByGKuGX9HF7A=;
        b=KRkQvchEaHx7LjXdDpW1swRZL0xqaaDLftZP+oQISiionJSeUbYNZ25mz3Px95iPuO
         T20m2xjJ5LdVHwc2LPzcke58vEZ608yNog2/N8Jv+81VPbWdepdrkc8y4VsGxJSV7EUj
         K+vLDaIU552Oldvm84aYGlJY8XNu2gIFkEObY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687167576; x=1689759576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3S6m5Y25scP8HALvcaSJM0xoSq4jCZByGKuGX9HF7A=;
        b=Yk9aO/ZRZW2bnCixEszFvFfSoUzjxsKDGoEwh4IkdaxVJhPyEk7glQrerQ3JWQcnyT
         PTBjWcT3adg2aEAISMpYG12UhmKbHhhZwu5VRWynSrAUKkLv1gvYgORkuBfIK+6jSf/s
         YwSz4TDo1WgJlkssprf+P3h5b209z53IDed1R3bxlARNueMMCMtX3mCYg0VqgQJ4yON+
         Or8mRqJYHkS134a1yZKhMXo4LRE2wEaKxqTi3qxaCSLLBFe3PYTqKOO3jQf6P6krXm8u
         SPfuUFH+hqjzWq/bQDqLIdJ+tFg/ASieQR2KBBAmXdOL9J3+pNcP7p6OX6ZU9myUTBZT
         dIdA==
X-Gm-Message-State: AC+VfDz0QqYHzqP+cvX4d+xa4MiGpinPF3VVV/J4nMkiN2Bai7s/wu06
        oGNo8gR5n0/sYmM0CFpJOUqj8yFqufLYQrtzIJ4lqg==
X-Google-Smtp-Source: ACHHUZ7tWwZwUcTIU4tyAPEl/cVbxEpHPaSP5CH5jS1nVl1mrerr12XGWdiv0zQSQ1ncj3YhMa2PJA==
X-Received: by 2002:a6b:ed09:0:b0:77d:ef55:7fc7 with SMTP id n9-20020a6bed09000000b0077def557fc7mr7100606iog.5.1687167576113;
        Mon, 19 Jun 2023 02:39:36 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id f23-20020a02b797000000b0042310795bb6sm1105143jam.73.2023.06.19.02.39.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:39:35 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-77e2a18ae50so141952439f.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:39:35 -0700 (PDT)
X-Received: by 2002:a5e:d915:0:b0:74c:c6ed:6de with SMTP id
 n21-20020a5ed915000000b0074cc6ed06demr7033957iop.12.1687167574993; Mon, 19
 Jun 2023 02:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
 <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain> <CAC=S1njwxLfw7LcnXkgY7pbiFaqvNQVyAzHVhK9+nYJC63d=Zw@mail.gmail.com>
 <32fa8c0e-26f4-4ee4-889a-4037530c128d@kadam.mountain>
In-Reply-To: <32fa8c0e-26f4-4ee4-889a-4037530c128d@kadam.mountain>
From:   Fei Shao <fshao@chromium.org>
Date:   Mon, 19 Jun 2023 17:38:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhVZtmc=gz9umg2k83P3GiJWa1A4K-hUhJN7LM8qjTo6Q@mail.gmail.com>
Message-ID: <CAC=S1nhVZtmc=gz9umg2k83P3GiJWa1A4K-hUhJN7LM8qjTo6Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Fix memory leak in devm_clk_notifier_register()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 5:24=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, Jun 19, 2023 at 05:05:47PM +0800, Fei Shao wrote:
> > On Mon, Jun 19, 2023 at 4:48=E2=80=AFPM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Mon, Jun 19, 2023 at 11:22:53AM +0800, Fei Shao wrote:
> > > > devm_clk_notifier_register() allocates a devres resource for clk
> > > > notifier but didn't register that to the device, so the notifier di=
dn't
> > > > get unregistered on device detach and the allocated resource was le=
aked.
> > > >
> > > > Fix the issue by registering the resource through devres_add().
> > > >
> > > > Fixes: 6d30d50d037d ("clk: add devm variant of clk_notifier_registe=
r")
> > > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > > ---
> > > >
> > >
> > > Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> > >
> > > How did you find this bug?
> > >
> > > I can think of some ways to find this bug with static analysis.
> > >
> >
> > It was actually detected by kmemleak on an unreleased Chromebook device=
.
> > I added the trace snippet in the message at first but removed that
> > before sending this. Maybe I shouldn't have.
> >
> > I can resend a v3 to add that back if that's preferable. What do you th=
ink?
>
> I'm not a clk maintainer, but let's not go overboard resending patches,
> especially when they're as straight forward as this one.
>
> This is good information though so I would include that kind of stuff in
> future patches.  I don't really need to see the kmemleak warning itself
> because I know what those look like already.  But to me it says a lot
> that actually this was detected at runtime.  It says good things about
> your test infrastructure and makes me feel more confident that your
> patch is correct.  So maybe just a comment that "This leak was detected
> by kmemleak".

That makes sense. Acknowledged and noted.

Thanks,
Fei

>
> regards,
> dan carpenter
>
