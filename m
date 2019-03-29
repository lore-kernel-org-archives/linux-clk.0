Return-Path: <SRS0=ZsbM=SA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8EEC10F05
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 08:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE3202184D
	for <linux-clk@archiver.kernel.org>; Fri, 29 Mar 2019 08:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729145AbfC2I6i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Mar 2019 04:58:38 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:33064 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbfC2I6i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Mar 2019 04:58:38 -0400
Received: by mail-ua1-f66.google.com with SMTP id g8so424618uaj.0;
        Fri, 29 Mar 2019 01:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XyhdKlg2JnBxHvl/eC8OFjSvuyAuSPOucSCQZXqL/0=;
        b=hNN0URr0Gyazy4XhGJQUxaMFlNN+5cUbySWu8wByPPwBWIQWs55S6H7fAf095hagc/
         LxD+XDxDtVR47+LbA53GR+LxuTDpcVN4aZBRtOuXjTUCPwS3NVHYjityVVIC+HV42Ws6
         HlcJdT8AlUtDoTOXedojsMXAzM3iuHRWH9lLt27ZmVzJPRTaXAzxrU8hkmHE6JxF1xEo
         EfO7ACUigPg9dGvSKnO4c37ZsdMccpLlaEXp9t18SniWO8Vi2ctbz8pXqnWBFFDmrWTa
         hT095hXkgf7kyJFs/9ZFKJzOTv2ph6iFGDcs+fiLNG6F0NQRUewrgi/lsobnjqCxLJ2q
         9q/g==
X-Gm-Message-State: APjAAAWONXfD9Ty/V2Ag+ZAbT4yzdmm7041a2ZAdAK0Eop3D62ydJtSW
        d++BlFI+k997uJdxI0Id+DGWRGggml4dGe9vBs0=
X-Google-Smtp-Source: APXvYqz5NCjVnphxsVjtgBYt12n9T8CCcOc2LdotWATiNMYhq25PZsRhLbQ2aMEuUPMXOGhIzEqKpQU80DUmXUavYtQ=
X-Received: by 2002:ab0:7797:: with SMTP id x23mr15743086uar.28.1553849916643;
 Fri, 29 Mar 2019 01:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190327123133.7949-1-geert+renesas@glider.be> <20190329084501.mbtss6szqpvbv5ce@verge.net.au>
In-Reply-To: <20190329084501.mbtss6szqpvbv5ce@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Mar 2019 09:58:24 +0100
Message-ID: <CAMuHMdXL1s3ZyaZnB2JJM=Dx23uAN_6Pz5_FmLP+WSSywH9FNg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate()
 return value
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Simon,

On Fri, Mar 29, 2019 at 9:45 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Mar 27, 2019 at 01:31:33PM +0100, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > cpg_sd_clock_round_rate() may return an unsupported clock rate for the
> > requested clock rate. Therefore, when cpg_sd_clock_set_rate() sets the
> > clock rate acquired by cpg_sd_clock_round_rate(), an error may occur.
> >
> > This is not conform the clk API design.
> >
> > This patch fixes that by making sure cpg_sd_clock_calc_div() considers
> > only the division values defined in cpg_sd_div_table[].
> > With this fix, the cpg_sd_clock_round_rate() always return a support
> > clock rate.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: 90c073e53909da85 ("clk: shmobile: r8a7795: Add SD divider support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be queued in clk-renesas-for-v5.2.
> >
> >  drivers/clk/renesas/rcar-gen3-cpg.c | 28 +++++++++++++---------------
> >  1 file changed, 13 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> > index d5fb768b089ff1c1..d2745c57207efc01 100644
> > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > @@ -3,6 +3,7 @@
> >   * R-Car Gen3 Clock Pulse Generator
> >   *
> >   * Copyright (C) 2015-2018 Glider bvba
> > + * Copyright (C) 2019 Renesas Electronics Corp.
> >   *
> >   * Based on clk-rcar-gen3.c
> >   *
> > @@ -236,8 +237,6 @@ struct sd_clock {
> >       const struct sd_div_table *div_table;
> >       struct cpg_simple_notifier csn;
> >       unsigned int div_num;
> > -     unsigned int div_min;
> > -     unsigned int div_max;
> >       unsigned int cur_div_idx;
> >  };
> >
> > @@ -314,14 +313,20 @@ static unsigned int cpg_sd_clock_calc_div(struct sd_clock *clock,
> >                                         unsigned long rate,
> >                                         unsigned long parent_rate)
> >  {
> > -     unsigned int div;
> > -
> > -     if (!rate)
> > -             rate = 1;
> > +     unsigned long calc_rate, best_rate = 0, diff, diff_min = ULONG_MAX;
> > +     unsigned int i;
> >
> > -     div = DIV_ROUND_CLOSEST(parent_rate, rate);
> > +     for (i = 0; i < clock->div_num; i++) {
> > +             calc_rate = DIV_ROUND_CLOSEST(parent_rate,
> > +                                           clock->div_table[i].div);
> > +             diff = calc_rate > rate ? calc_rate - rate : rate - calc_rate;
> > +             if (diff <= diff_min) {
> > +                     best_rate = calc_rate;
> > +                     diff_min = diff;
> > +             }
> > +     }
>
> My reading is that.
> a) this algorithm picks a clock based on the div field of the
>    members of cpg_sd_div_table. and
> b) in the case of duplicate values of that field the first one is chosen; and
> c) such duplicates (of sd_div values) do exist in cpg_sd_div_table
>
> Is this the intended behaviour?

Actually cpg_sd_clock_calc_div() picks the last one, due to the "<=" :-)
But that doesn't matter here, as both dividers are equal.

cpg_sd_clock_set_rate() will pick the first entry from the table with matching
div value later.

> > -     return clamp_t(unsigned int, div, clock->div_min, clock->div_max);
> > +     return DIV_ROUND_CLOSEST(parent_rate, best_rate);
>
> Would it be better to return the value of clock->div_table[i].div
> that yielded best_rate?

True. The DIV_ROUND_CLOSEST() is not needed, as we could have
saved best_div instead of best_rate. Will fix.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
