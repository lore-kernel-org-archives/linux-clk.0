Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B511C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 21:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiJDU77 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 16:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiJDU75 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 16:59:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A0225E86
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 13:59:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1A54AB81BC4
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 20:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7287C433C1;
        Tue,  4 Oct 2022 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664917192;
        bh=u57oibYZ0wsBj2Z1L+2tSZzVVOM1JNeorkOuhTEIPks=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W10uiEDZ0nVQ2NRMZ4AEj6nioua5V94ZFkAhvVe+w/OrkQVfsmDSSeX+ON4h1baCu
         QtHpI+okaK158AsdVAtkHTKcsDxjNXltoDiLtj4Wf0qR1vo95Tj/rhIFHOY/wrXROq
         8bAt3eW4Fk6DXnlEdra4GK63Y1nqCKctMJMWkYptht3rqejULQcEQHtw03fvLdoWE0
         SSZICmP9XBIeVZ5XhmfJa46YCwljtC73VmHxFunTRlEm1xB0EzW8iy0DrcXejW4Ubj
         F0JQNQ4mMmBBpjJU8akex8BuZoDcxMr3n4jaoME+Htpf59TZ3AgHw2H+cOvplsGlO0
         ldZVL88Im4PjQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com>
References: <20220816112530.1837489-1-maxime@cerno.tech> <CGME20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324@eucas1p2.samsung.com> <20220816112530.1837489-14-maxime@cerno.tech> <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com>
Subject: Re: [PATCH v9 13/25] clk: Set req_rate on reparenting
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Tue, 04 Oct 2022 13:59:50 -0700
User-Agent: alot/0.10
Message-Id: <20221004205952.C7287C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Szyprowski (2022-10-03 02:59:07)
> On 16.08.2022 13:25, Maxime Ripard wrote:
> > If a non-rate clock started by default with a parent that never
> > registered, core->req_rate will be 0. The expectation is that whenever
> > the parent will be registered, req_rate will be updated with the new
> > value that has just been computed.
> >
> > However, if that clock is a mux, clk_set_parent() can also make that
> > clock no longer orphan. In this case however, we never update req_rate.
> >
> > The natural solution to this would be to update core->rate and
> > core->req_rate in clk_reparent() by calling clk_recalc().
> >
> > However, this doesn't work in all cases. Indeed, clk_recalc() is called
> > by __clk_set_parent_before(), __clk_set_parent() and
> > clk_core_reparent(). Both __clk_set_parent_before() and __clk_set_parent
> > will call clk_recalc() with the enable_lock taken through a call to
> > clk_enable_lock(), the underlying locking primitive being a spinlock.
> >
> > clk_recalc() calls the backing driver .recalc_rate hook, and that
> > implementation might sleep if the underlying device uses a bus with
> > accesses that might sleep, such as i2c.
> >
> > In such a situation, we would end up sleeping while holding a spinlock,
> > and thus in an atomic section.
> >
> > In order to work around this, we can move the core->rate and
> > core->req_rate update to the clk_recalc() calling sites, after the
> > enable_lock has been released if it was taken.
> >
> > The only situation that could still be problematic is the
> > clk_core_reparent() -> clk_reparent() case that doesn't have any
> > locking. clk_core_reparent() is itself called by clk_hw_reparent(),
> > which is then called by 4 drivers:
> >
> >    * clk-stm32mp1.c, stm32/clk-stm32-core.c and tegra/clk-tegra210-emc.c
> >      use it in their set_parent implementation. The set_parent hook is
> >      only called by __clk_set_parent() and clk_change_rate(), both of
> >      them calling it without the enable_lock taken.
> >
> >    * clk/tegra/clk-tegra124-emc.c calls it as part of its set_rate
> >      implementation. set_rate is only called by clk_change_rate(), again
> >      without the enable_lock taken.
> >
> > In both cases we can't end up in a situation where the clk_hw_reparent()
> > caller would hold a spinlock, so it seems like this is a good
> > workaround.
> >
> > Let's also add some unit tests to make sure we cover the original bug.
> >
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, me=
son g12b
>=20
> Well, I don't have good news. This patch has my 'tested-by', but this=20
> version again doesn't work properly on Meson G12B.
>=20
> Linux next-20220929, which contains this patch as commit cb1b1dd96241=20
> ("clk: Set req_rate on reparenting") fails to boot on Odroid-N2. I only=20
> see a freeze once the modules (I see some messages from meson drm and=20
> cpu_freq) are loaded. Could you remind me how to help debugging this=20
> issue? I will try to identify which clock causes the issue. Reverting=20
> $subject on top of linux-next fixes/hides the problem.
>=20
>=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/clk/clk.c      |  22 ++++
> >   drivers/clk/clk_test.c | 239 +++++++++++++++++++++++++++++++++++++++++
> >   2 files changed, 261 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 53b28e63deae..91bb1ea0e147 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(struct=
 clk_core *core, bool is_orphan)
> >               clk_core_update_orphan_status(child, is_orphan);
> >   }
> >  =20
> > +/*
> > + * Update the orphan rate and req_rate of @core and all its children.
> > + */
> > +static void clk_core_update_orphan_child_rates(struct clk_core *core)
> > +{
> > +     struct clk_core *child;
> > +     unsigned long parent_rate =3D 0;
> > +
> > +     if (core->parent)
> > +             parent_rate =3D core->parent->rate;
> > +
> > +     core->rate =3D core->req_rate =3D clk_recalc(core, parent_rate);
> > +
> > +     hlist_for_each_entry(child, &core->children, child_node)
> > +             clk_core_update_orphan_child_rates(child);
> > +}
> > +
> >   static void clk_reparent(struct clk_core *core, struct clk_core *new_=
parent)
> >   {
> >       bool was_orphan =3D core->orphan;
> > @@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core *co=
re,
> >                                 struct clk_core *new_parent)
> >   {
> >       clk_reparent(core, new_parent);
> > +     clk_core_update_orphan_child_rates(core);
> >       __clk_recalc_accuracies(core);
> >       __clk_recalc_rates(core, POST_RATE_CHANGE);

I see a problem. __clk_recalc_rates() uses 'core->rate' as "old rate"
but we'll have already destroyed that by calling
clk_core_update_orphan_child_rates() and assigning 'core->rate' to the
recalc_rate. Are clk notifiers being used? If so, it will probably be
confused because the notifier will see the same rate as what was set
instead of the old rate. cpufreq is probably the biggest user of clk
notifiers.

We should add a test for that so when a clk is reparented the old rate
is still what we expected it to be when the notifier is called.

Also, clk_core_update_orphan_child_rates() is poorly named. It doesn't
care at all that the clk is an orphan. It seems like another
__clk_recalc_rates() without the notifier. I have no idea why we need
another recalc rates. Possibly setting the req_rate in
__clk_recalc_rates() is sufficient. Or maybe we should bail out if the
clk doesn't have the orphan bit set.
