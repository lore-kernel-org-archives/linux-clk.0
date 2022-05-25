Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EE2C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 25 May 2022 17:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238150AbiEYR7m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 May 2022 13:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbiEYR7l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 May 2022 13:59:41 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219C7674FA
        for <linux-clk@vger.kernel.org>; Wed, 25 May 2022 10:59:41 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id r12-20020a056830448c00b0060aec7b7a54so10978666otv.5
        for <linux-clk@vger.kernel.org>; Wed, 25 May 2022 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+1/sc+J/OF8Q1lllA6hXQ8Raw6UZcYxdIQbXLiOAgLg=;
        b=lAedNohwb7/ltTZX2qmt8Hjy84p2ZKgxhPWj39yMx/iSdBnhJDqlubTbCxJNQP1qT/
         qo4XoNNO3cy5ejUoosUmLLXrUtx7I38vapuGPU2fyKyOfATNpMiwqAkF5grTVWYT8qUU
         b5ePSqL0aiPsy+A/t9gRXMUB+mlK3xuA8bq2MTuIgPxysPnJqSJ2sPO5RQYDCuNd4zAZ
         h2FSUp/coan92MP7E6EUnPfmez88s2PESvv+SlhgPgor7ljvoUBKFPasEpPdHd2e2uVd
         DrbwCDuzUF3mYhP/qmMstXsz4erlP+Lg+q+7WJWG3OFdsLg+O1KGosIZsZEaiTw6R+Dd
         XkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+1/sc+J/OF8Q1lllA6hXQ8Raw6UZcYxdIQbXLiOAgLg=;
        b=I1Q9T+Xy9L85FIDKiTQAcRThJVqxSKr0qVMtd3yORkG1ByVie6yt5B6Lkvm4JYEL84
         wu//EXY8BB5wnOZOh9UxPuBTsD1t7SPidaEtxxcN/D9bRNL7wm7Y/3xWBDqxlo7cwiFq
         hzu5y2326pOWeVj3UOJXTOvmHfO9LZsY0t81v2oHej/sI1dn7DO2BjwrBbG+ndwejvfW
         /isEBKerDt0aCoCG9C1ixT+HcH3rKBc0GYI3OuU67XAbSw++wk1NXgL4twoxV+TK6Ys0
         UICoO/3HNTN127DCKFXnHiD1AqyVg3n1kkht+jQMM6b6zQRaczLjbp3TPFlipYHN7aTV
         cntA==
X-Gm-Message-State: AOAM532+A9oF91iN3znBLUgUu730J7odV7CkJ9Fpd/sX/swmA98ZoEhW
        QecuOAfiUFfmvslHE4HHAkDdw37YzUZh1Vbt7mmMCL2xOj4h7A==
X-Google-Smtp-Source: ABdhPJzfsuTkBM/W1QMIJSygr0EvHOfVQUGa1fbhm73BP3QDnXknX4xkKk4bR8tB7Ez+iU9o6lxNFdHRJ+Wqg+jMHlw=
X-Received: by 2002:a9d:4c11:0:b0:60b:2d85:d232 with SMTP id
 l17-20020a9d4c11000000b0060b2d85d232mr2534790otf.245.1653501580502; Wed, 25
 May 2022 10:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220512160412.1317123-1-maxime@cerno.tech> <20220512160412.1317123-14-maxime@cerno.tech>
 <CANCKTBuWkkXNdK5eLJr=KzykDt+dbjfOiNGhxga4oEU5COyiUg@mail.gmail.com> <20220525083017.eo3oxfduajrqoac4@houat>
In-Reply-To: <20220525083017.eo3oxfduajrqoac4@houat>
From:   Jim Quinlan <jim2101024@gmail.com>
Date:   Wed, 25 May 2022 13:59:28 -0400
Message-ID: <CANCKTBsspDYR388yrMtnVdeeRop+GpNv811Y6s31R-RfhQZXnA@mail.gmail.com>
Subject: Re: [PATCH v4 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 25, 2022 at 4:30 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Tue, May 24, 2022 at 02:32:29PM -0400, Jim Quinlan wrote:
> > On Fri, May 13, 2022 at 3:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > clk_set_rate_range() will use the last requested rate for the clock when
> > > it calls into the driver set_rate hook.
> > >
> > > However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
> > > requested rate might not be matching the current rate of the clock. In
> > > such a case, let's read out the rate from the hardware and use that in
> > > our set_rate instead.
> >
> > I'm probably out of the loop on this but I am wondering why we don't
> > also apply this same reasoning to
> >
> >         clk_core_set_rate_nolock()
> >
> > which may usea stale clock rate and skip the actual setting of the rate:
> >
> > static int clk_core_set_rate_nolock(core, req_rate)
> > {
> >         /* ... */
> >         rate = clk_core_req_round_rate_nolock(core, req_rate);
> >
> >         /* bail early if nothing to do */
> >         if (rate == clk_core_get_rate_nolock(core))    /* [JQ] Does
> > not check for CLK_GET_RATE_NOCACHE */
> >                 return 0;
> >
> > I can see that 9-10 years ago someone submitted a pullreq to fix above
> > but I cannot locate the response and it obviously never made it
> > upstream.
>
> Yeah, that change would make sense to me.
>
> Stephen was hinting at a different solution here though:
> https://lore.kernel.org/linux-clk/20220423044228.2AA7AC385A0@smtp.kernel.org/
>
> > Just thinking out loud, the simpler solution is to probably drop all
> > rate caching in the CCF and get the frequency on a clk_get_rate()
> > call. It complicates some of the core though when we check to see if
> > we need to update clk rates. We could have some middle ground where
> > drivers indicate that they want to update their cached rate because
> > it's valid now (either from their enable path or from somewhere else).
> > This may be nice actually because we could have clk providers call
> > this to force a recalc down the tree from where they've updated. I
> > think the qcom DisplayPort phy would want this.
Hi,
Anything that works would be fine for me.  Right now we ask that the caller do
this as a workaround:

        /*
         * Workaround to refresh CCF "clk->core->rate" as even though
         *  !!(clk->core->flags & CLK_GET_RATE_NOCACHE) == 1,
         *  clk_set_rate() makes decisions based on the cached  (stale) rate.
         */
        clk_get_rate(clk)

        /* Restore to the rate we had set to previously */
        clk_set_rate(clk, new_rate);


FWIW, in our situation the calling driver has a fairly good idea that
the cached rate
might be incorrect.

Regards,
Jim Quinlan
Broadcom STB



>
> Maxime
