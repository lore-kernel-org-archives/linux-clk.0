Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAD8C4742C
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 04:10:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5867D2225E
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 04:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="JyYjn17G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgKCEKl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 23:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCEKk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2020 23:10:40 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BD5C061A47
        for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2020 20:10:40 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id o205so6848975qke.10
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2020 20:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JF9Aehl00ZiapjopI2Yn6tGmxxDnNlkOydHAyPM5j24=;
        b=JyYjn17GucunDpq0XfY4GKSScud1WhsZwWGwHjLoVQBHTTEYqYL8ecNCB9sroID+3v
         wroj6LYuLjmcdbj0MiVFXJ3ojQinitgXkT5bZWyPzIvEQTRHGwCG3TpmejmMqVQc66jh
         9zIi0BwVxe0QATA23cbTW0rFIOgFtnmZmiHhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JF9Aehl00ZiapjopI2Yn6tGmxxDnNlkOydHAyPM5j24=;
        b=jj1CHle51YaM493Ys/9G+8d2ESpX6B9FFl0XMQvOIX+umRJ3F0WeYDz3DYEKkZ2uZN
         E+8l9zz1tSUVpXJi3KXJlbJHhdziYdggtZJBmifKK84yLbz3fcD5cC9mjtfNe3tUSK2o
         SvjWZ/Q3slnBKvWpSD/2LCdIULV6JAF0zjQZuBxQLlpqkoBBnTrWtj2d9w7oNAZdL7pe
         0xm6h/Y6nTrHplm6Sx+4Kt2ExJqD8oS+ept6FPO5nNDPAHLFFX1qMg3x7xg2xnMKt+z5
         LDNF+34mT+myXPsfFIchh2qftRnYopLp2pbulcKWm32iFVCpnvbpp4JTr6G0BCjcTDD3
         8ysA==
X-Gm-Message-State: AOAM530Y7VspmwAlahDt8bnkg8LcRx3j2KsWLmMQFYY5MU3NqadgvU9W
        ccvj0ch5rcuAqxrZfrYWx4Kgvzsroubs1kYU/HPcWQ==
X-Google-Smtp-Source: ABdhPJzmHQ8Uh6qtG/QQ8eL6TIJtPTSKgVbQsB8/wAo/lphDhlaV2CxCQIAvrluxzOuRnsvvS++8Q1xv09QxvYkH7EE=
X-Received: by 2002:a05:620a:15b1:: with SMTP id f17mr17454464qkk.54.1604376639646;
 Mon, 02 Nov 2020 20:10:39 -0800 (PST)
MIME-Version: 1.0
References: <CAFr9PX=Ac6yzR31uzK=6WmnbznUm_FzVRs+v2D3ONfX4UCY_QQ@mail.gmail.com>
 <160435352432.884498.6877160797327752107@swboyd.mtv.corp.google.com>
In-Reply-To: <160435352432.884498.6877160797327752107@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 3 Nov 2020 13:10:28 +0900
Message-ID: <CAFr9PXkgShCcQ2n7CMdQFqkwMwbSgxdqK47fwX8Tpbb=O=0qkg@mail.gmail.com>
Subject: Re: Acceptable format for clock cells.
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Tue, 3 Nov 2020 at 06:45, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Palmer (2020-10-30 04:52:31)
> > As there is no documentation for this thing and I'm not sure what the
> > logical output numbers are or even if I know all of them I was
> > considering making the number of clock cells 2 and having the first be
> > the first divider (i.e. the divide by 2 output would be 2) and the
> > second cell the chained divider or 0 for no divider.
>
> Does the PLL need to be expressed anywhere in the binding?

The PLL frequency doesn't seem to need to be exposed to the outside.
It's configured to generate 864MHz from the 24MHz input clock but
nothing else has 864MHz as an input clock.
At the moment I register a clk for the PLL but only the dividers are
accessible from OF.
The only thing that runs with a clock anywhere near 864MHz is the CPU
and it has its own PLL that's fed from the divide by 2 output from
this PLL.
So basically output 0 from the PLL block will be the first divider.

Here's a condensed version of clk_summary:

 xtal24                               2        2        0    24000000
        0     0  50000
   mpll                              4        4        0   864000000
       0     0  50000
      mpll_div_5                     1        1        0   172800000
       0     0  50000
         mpll_172_gate               2        2        0   172800000
       0     0  50000
            uart0                    1        1        0   172800000
       0     0  50000

xtal24 is the external input clk. mpll is this PLL, mpll_div_5 is an
output from this PLL, mpll_172_gate (old naming from before I knew how
to calculate the mpll frequency) is a clock gate in a block that
coalesces various PLL outputs before they go into more dividers and
muxes to peripherals.

I did think about making just the PLL frequency an output and then
having the dividers expressed in the DT but the PLL block does have
enable bits for each of the outputs so they should logically be
handled by this driver I think.

> >
> > If I should just decide the order of the outputs and come up with
> > indexes for them would it still be ok to nest them like the first cell
> > is the index of the divider and then the second cell is the index of
> > the chained divider?
> >
>
> Generally we try to encourage one-cell or zero-cell bindings because
> they're simple. A two cell binding is possible if you really want but
> I'd say do a one-cell binding and make up some numbering scheme for the
> different clks. A one cell binding also makes it easy to populate an
> array of clk_hw pointers that the DT xlate function can pick from. When
> it gets to two cells or more it gets complicated, but still doable.

Ok. I've done that now. I decided that the second divider doesn't need
to be handled in the PLL driver itself as the divider is actually on
the other side of the gate described above.
There only needs to be one cell now. I have the primary dividers
ordered from smallest to largest and those indexes become the output
numbers.

> It would be great if clk hardware started numbering the clks instead of
> naming them specific names but this almost never happens. It would
> certainly make life easier if the datasheet said "Use clk #25 for the
> uart" but usually SoC hardware engineers give them names and don't
> consider a pinout scheme. I'd say this is mostly because the engineers
> control the connections between their clk controller and the consumers.

The PLL seems to have enable bits for each of the dividers going from
smallest to highest so going in that order for the indexes made sense
to me.
What I didn't want to happen is to find out there is actually another
divider somewhere in the middle of the ones I know about and then have
to work out how to add that in.
So having the first cell being the divisor instead of an index seem to
make some sense.

> Finally, if you don't have a datasheet then think about the person who
> has to write the DT. Are they going to know the details of the clk tree
> inside the PLL unit to know that they need the third divider underneath
> the second divider? Or are they going to know they need the "uart clk"
> and that can be some friendly #define that hides this detail from them?

I'm thinking of listing the divisors in the DT so that which divider
is on which output is clear just from looking at the DT.
Something like mstar,mpll-divisors = <2>, <3>,... This would also help
with the issue above as the driver would just create clks for whatever
dividers are listed in the DT it was given.
For this PLL there is only one consumer of the outputs as all of the
outputs from this PLL and some others are feed into a set of gates
before going to the muxes so the wiring in the
DT isn't very complicated.

For some background my very rough notes about the clocks in the chip
I'm working on are here:
http://linux-chenxing.org/ip/clks.html

Thanks for your comments.

Cheers,

Daniel
