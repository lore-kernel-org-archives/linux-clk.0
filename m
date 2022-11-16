Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1313C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 12:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbiKPMmO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 07:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236982AbiKPMmO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 07:42:14 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E1E2645
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 04:42:12 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id n17so8902979pgh.9
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 04:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvrbc6wf9VTnmEkCtmE919cp0HDqXfEWQsvisSZRlpk=;
        b=rCMrBq8cI4BGc9Q13v7hJDW9lQtgT6gUKkH2l44tEkn8ye7uwsjb1Adl8z9qa2HepV
         pCZ+EIWaLzkAKrJQZJO3+x9HI7KKC8w7kqTZGIMKzUg685CFOMz9qY6hW18f5S/yjfQ/
         9NWFLMshdPJVRbooziZGmrvA1QwUKtNZYOAUHuqmI0EpBIIndYG/devnryrp2kNtuqXy
         WztIwGHqAC+GRezs1dqItPRe2wCIjTS285mayhXb+lYO8UOjZEPtRNC2+a/QJOFvjMJL
         q0v2tbm/ONyXhnyM083iGkWiXe7zdgNj/f8daCqPV9EQP8kMsWijODf94KuQsNrj99rc
         EmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gvrbc6wf9VTnmEkCtmE919cp0HDqXfEWQsvisSZRlpk=;
        b=aBwn9W2XL7z5t2mWB9mRQjURA4Txjdx5HH2Q3xxbwyYrnSXcyeCjXELP2QdLRI4e+Q
         jRIxxD0ij5+dDcqazX63P8EpzqJB/FiDmfnKfDSdVURQp4+A3dimSrupnkxMpwZC4x8B
         9YvrgnmuTBGuIRGIdLDnJtOi0+fsX6MyqHuCg99uoXNhNrCVgbLWDl3ST1sqLWgecsjN
         83lEuoHwLaoyCuhstby8sMZ+RL3Ha/YNR3k7eGGWyLXzeoJ/TyJHLeL1KaLtayTN/4E0
         3LOyCK8nn2ooKx4bysOQtjFVvw34WRNaRPiHorhFfyHqbDWiZb6yqVc6JhRA+oj/F1XP
         foJw==
X-Gm-Message-State: ANoB5pnmD4cG95M+Ui4gjBZh4fT9OxjGNpWLponHZeKK41lrO0zY0Wr+
        qs9PiFXDaB8desHycCroXODB3r0LW0jofwbK/lWkWQ==
X-Google-Smtp-Source: AA0mqf72Qwe9MIMib3FkU7+65Bb6tYoPQzHnOQ18IhhtgHNDiK91R7gcbrYWhvBYsnx4UtN+1CPmGwTeCapRitRF9C4=
X-Received: by 2002:a63:121f:0:b0:442:ee11:4894 with SMTP id
 h31-20020a63121f000000b00442ee114894mr20819442pgl.595.1668602531957; Wed, 16
 Nov 2022 04:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20221108013517.749665-1-marex@denx.de> <CAPDyKFoUdfUjZMgzU-3SS0gVstj-04FbTSjxihdar2wxu5c97w@mail.gmail.com>
 <52578b45-cf4c-e949-b2b1-a0f251815337@denx.de>
In-Reply-To: <52578b45-cf4c-e949-b2b1-a0f251815337@denx.de>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 16 Nov 2022 13:41:35 +0100
Message-ID: <CAPDyKFrQ0Uvhsa2AXwTdzOC1xhQ6qjRP=1TzVXC3StLv5FOoBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] [RFC] PM: domains: Introduce .power_pre/post_on/off callbacks
To:     Marek Vasut <marex@denx.de>
Cc:     linux-pm@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@denx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Kevin Hilman <khilman@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Len Brown <len.brown@intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Pavel Machek <pavel@ucw.cz>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+ Stephen Boyd

On Mon, 14 Nov 2022 at 21:32, Marek Vasut <marex@denx.de> wrote:
>
> On 11/14/22 20:40, Ulf Hansson wrote:
> > On Tue, 8 Nov 2022 at 02:35, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Currently it is possible that a power domain power on or off would claim
> >> the genpd lock first and clock core prepare_lock second, while another
> >> thread could do the reverse, and this would trigger lockdep warning.
> >
> > I am not quite sure I fully understand. In this case is the lockdep
> > warning relevant or just something that we want to silence?
>
> This is a valid problem, see patches 2/3 and 3/3 for details too.
>
> >> Introduce new callbacks, .power_pre/post_on() and .power_off_pre/post(), which
> >> are triggered before the genpd_lock() and after genpd_unlock() respectively in
> >> case the domain is powered on and off. Those are meant to let drivers claim
> >> clock core prepare_lock via clk_*prepare() call and release the lock via
> >> clk_*unprepare() call to always assure that the clock and genpd lock ordering
> >> is correct.
> >
> > To me, this sounds like a problem that may be better fixed by trying
> > to model the parent/child-domains in a more strict way, through genpd.
> >
> > There is a comment in the code in imx8mp_blk_ctrl_probe() that seems
> > to be pointing in this direction too.
> >
> > "* We use runtime PM to trigger power on/off of the upstream GPC
> >    * domain, as a strict hierarchical parent/child power domain
> >    * setup doesn't allow us to meet the sequencing requirements......"
> >
> > I am wondering about what those "sequencing requirements" are - and
> > whether it could make better sense to fix these issues instead?
>
> Here is the lockdep splat:
>
> https://lore.kernel.org/all/Y1cs++TV2GCuh4tS@pendragon.ideasonboard.com/

Yes, that certainly helped!

>
> It really is a problem between the clock and genpd subsystem locks, they
> can be claimed in arbitrary order, see patch 2/3 and 3/3.
>
> I think that might clarify what I am attempting to solve here.

Let me try to put some more words behind this, to make sure I have
understood correctly, but also to easier allow more people to chim in.

Note that, in your commit messages in patch2 and patch3, you are
mentioning clk_disable_unused(), but that's not what the lockdep splat
above is pointing at. Although, it seems the clk_disable_unused()
thingy, would trigger a similar problem for this configuration for the
imx8mp platform.

Case #1:
Triggered from the workqueue, the genpd_power_off_work_fn() ends up
calling clk_bulk_unprepare(), from a genpd's ->power_off() callback(),
which has been assigned to imx8mp_blk_ctrl_power_off(). Before genpd's
->power_off() is called, the genpd-lock(s) have been acquired, thus we
are trying to acquire the global clk-prepare lock via
clk_bulk_unprepare() while holding the genpd-lock(s).

Case #0:
The "drm driver" calls clk_set_rate(), thus we start by acquiring the
global clk-prepare lock. Internally in the clock frameworks, the
clk_set_rate() path continues to call clk_pm_runtime_get(). In this
case, the corresponding clock provider's struct *device, seems to be
attached to a genpd too. This means the call to clk_pm_runtime_get()
ends up in genpd_runtime_resume(), which needs to acquire the
genpd-lock(s) before it continues to call genpd_power_on() to power-on
the PM domain. In other words, we try to acquire genpd-lock(s) while
holding the global clk-prepare lock.

The solution to fix these problems that you suggest in the $subject
patch, isn't the direction I want this to take. The new callbacks are
prone to be abused and it would also require genpd provider specific
code to fix the problems. Of course, we need things to work, but let's
look at a couple of options first. See below.

1)
In a way, it looks like we have a circular description in DT of the
hierarchy of the clock- and genpd providers, which is a bit awkward in
my opinion. I was browsing the imx8mp DTS files to find this, but I
couldn't. Can you perhaps point me to the DTS file(s) you are using? I
can try to have a look so see if this could be arranged differently.

2)
What we have seen from other use cases [1], is that calling
pm_runtime_get|put*(), while holding subsystem specific locks (like
the genpd-lock(s) and clk-prepare lock), isn't working very well. So,
I am thinking that we could have a look at the runtime PM deployment
in the clock framework, to see if we can avoid holding the global
clk-prepare lock, while calling into runtime PM. I believe that should
fix these problems too.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20221103183030.3594899-1-swboyd@chromium.org/
https://lore.kernel.org/all/CAE-0n52xbZeJ66RaKwggeRB57fUAwjvxGxfFMKOKJMKVyFTe+w@mail.gmail.com/
