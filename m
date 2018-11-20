Return-Path: <SRS0=sCFe=N7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA65C41537
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 12:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F2782087E
	for <linux-clk@archiver.kernel.org>; Tue, 20 Nov 2018 12:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YT5/H7dJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2782087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbeKTWgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 17:36:13 -0500
Received: from mail-it1-f194.google.com ([209.85.166.194]:38283 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729385AbeKTWgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 17:36:13 -0500
Received: by mail-it1-f194.google.com with SMTP id h65so3097821ith.3
        for <linux-clk@vger.kernel.org>; Tue, 20 Nov 2018 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+oqhYJ+WjLifnUyJ3ft2kTzX1u4UUihC6oUhdtKyRY=;
        b=YT5/H7dJuhiULLUl1CQBXfWufpW9KT4Q4qWp0Bcqeu47cHuHiUP/yOWHGEHr1HIdI8
         maG2SiNROzzz/8OHGtrg48aHqexMseCYNgr1CuQD5Q0fM7Vw92UBP9FyBUOLgoU40mst
         l3k4WdAtGJidbnKPu4QZ7n7vqhL6pp+rXIZdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+oqhYJ+WjLifnUyJ3ft2kTzX1u4UUihC6oUhdtKyRY=;
        b=i1JIDHfeb+gtxXBQ3WteaQyVIMXpB1vwsETISCgipAJDdTYCy+9HGYwHgsQNGa3EBX
         5H9uZ2FPX3T7NRbd7fXhKSr0Fj/a3uShjJAFD3UczEwuqPdD0Y7+Vpv5ofgAHeH+kfXS
         5dv79Gj9zzXbMdZFLWfNxt3j84qXq+JO6HXpO5sUuIu01kmr3DRHQG43cDP1QHREtNbS
         T5aB22R3GwHaeG32TPDSfn+Y3le1FZiu8hdQ3os+32lMTcmJZ2N9at5wuVKRiKfo24vD
         Xluph6nICIaodtyWXh+CwhEFeJmT1oovMpYwDZ0BQmT2YtfdaGhfGBaVC0sBTCpYlWfS
         ugHA==
X-Gm-Message-State: AGRZ1gLqT+nH+FdYlP73qPpatSaN1uptCY7d9JmQE/dPnwMvJvy/uQGK
        ZmXVhIUR3qAxiLEefHbGS9cwrm6xgNakJC3BNgDcRA==
X-Google-Smtp-Source: AJdET5cLqA6MlwAqkitC7ii3wAfw4YoaB8PO6E10qjr4OXZoLKzvcSDfsQ98CYU152g/zwt76hp/Z+seO+LYcGsydmE=
X-Received: by 2002:a02:94d:: with SMTP id f74-v6mr1538521jad.85.1542715643416;
 Tue, 20 Nov 2018 04:07:23 -0800 (PST)
MIME-Version: 1.0
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
 <20181113111633.20189-4-jagan@amarulasolutions.com> <20181113132658.niwy6bqdqzaeqpv2@flea>
 <CAMty3ZBTaeMBFYwyJ+8HqHBDAfEOPEYBt01jho1H4c3SBKbvEw@mail.gmail.com> <20181120105557.3mysirc3ga2h2334@flea>
In-Reply-To: <20181120105557.3mysirc3ga2h2334@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 20 Nov 2018 17:37:11 +0530
Message-ID: <CAMty3ZAbF8rPsmvXdLPQJfHL7bzeQyL0Psii9gyDiHaZW-UaMg@mail.gmail.com>
Subject: Re: [PATCH v4 03/26] clk: sunxi-ng: Add check for maximum rate to NKM PLLs
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 20, 2018 at 4:26 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Nov 15, 2018 at 08:51:04PM +0530, Jagan Teki wrote:
> > > >  drivers/clk/sunxi-ng/ccu_nkm.c | 3 +++
> > > >  drivers/clk/sunxi-ng/ccu_nkm.h | 1 +
> > > >  2 files changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > index 6b5ad990f802..b8b66cdd30bf 100644
> > > > --- a/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
> > > > @@ -128,6 +128,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
> > > >       if (rate < nkm->min_rate)
> > > >               return nkm->min_rate;
> > > >
> > > > +     if (nkm->max_rate && rate > nkm->max_rate)
> > > > +             return nkm->max_rate;
> > > > +
> > >
> > > I would expect the test to be the same for the minimum and maximum cases.
> >
> > I don't have proper use-case for max rate test, I do verify by using
> > higher the rate on dclock, but nor sure.  May be I can skip the
> > max_rate patch?
>
> So you're sending more patches that you haven't really tested?

I didn't understand this question.

> Why are you sending them then?

I think I've mentioned in the first version patch itself, since it's
common code and many other callers might have used for rate
alternative I did it how other ccu dividers does. I have not added
just as simple.
>
> > Apart from this, any idea about this issue where SUN4I_TCON0_DCLK_REG
> > will only work with div upto 6 on A64 DSI panels[1], did you find the
> > same issue on A33?
>
> IIRC my panel was falling into the case where the divider was 4, so
> I've not fallen into that case.

OK, thanks.
