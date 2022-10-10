Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BD5C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 09:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiJJJ4U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 05:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiJJJ4T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 05:56:19 -0400
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8282C46229
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 02:56:16 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id C448F2B06733;
        Mon, 10 Oct 2022 05:56:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 10 Oct 2022 05:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1665395771; x=
        1665402971; bh=674jS2EHveDQx+shE6Z/Clg32TTv5M/rq5hx46ULRuA=; b=k
        v7cBi6wgejBnM5ldbIszmFecT7Xi8XicjTnS6FVssaDu/oWxVzZnXFCFsih5qYQf
        JzLLG7ahsMkm+lBXCIspZzy8SXWCeCi9JQUlAKdneHRR8A+/+x1yARfU2micqXFM
        Vww8uVUGRL3IpaqgiejG5yTi7H153ptWacPoAFDIHNYQ+6nA9cIWlGAyE/uwP0g/
        coO36In3Cr1Xdsp4Uk18KsazF2+6JLySf8Ns5Gm+vdhaDrnJojGn9dCV2ci4wbNk
        rC6iEgb0CuC5nlwUMnaqfdvr9kP/zugYpiWrqAWoOURx9Ki+oxjP5LDch2DWOm/B
        YUQQHmv6Vm72krDrZeSxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665395771; x=
        1665402971; bh=674jS2EHveDQx+shE6Z/Clg32TTv5M/rq5hx46ULRuA=; b=k
        B6eJqvgxI5fllyJrO1E2jd3prtMQ3bZe4o7mQ536F9xQPC/kMnK28JQN8CcDEdZG
        n58o/le6u1tRWyAPJFSpwA6CKWWxRQfa7CYPDoBt2VUCyCBJKEj9zYoU7QPdL8rK
        TjW/sCrDF5CA2XaxVOrx5jRwBz1HYqtRFr2rDV8NqGMskX9VTXpGDVZKafsFjeE6
        vJAsOP4nT6xZ+iVQoZFy2bkbKdWXQeFZSw2OLD1muiw5eu1UN3YDJeWJHU5Okwtf
        wWJdfTYqprXOcJ7nv6JUNoA0E49B15PkEts7TAVNEus4S0+7r/pBrhHZyVl4Syw6
        ivmox93Ppb/g52Y5A1H0A==
X-ME-Sender: <xms:OuxDY74TDeJ47DC2rVdvbxxlr9FjLwxeixFXQeoBVA4Xc_QLBGUz_A>
    <xme:OuxDYw44bD5PRkc9lz40HknY6SuZU05OX5QidAOqbaMt3lfaeBO-ptskifPyO0dCG
    GkWRNIvB6o-H1Ft3cA>
X-ME-Received: <xmr:OuxDYyfKuJZ0xU4SfN1OVMyrPvuhjUBbUMUg6bLUlUAonYfKiaZHH14-halD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
    feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OuxDY8KIJKXACKV9QIlv9Bz3zLe2xXIO_ZLstDhC8WNlo8ySLPU0AA>
    <xmx:OuxDY_JKiK533RTQpfjjaiIP4EUQsVDzhmnRewPSPPgyVnXbQPyO6A>
    <xmx:OuxDY1zxWzcV3Utez0cEmi4epTFqz2cK8nWt6vFZSSN0GsvFCZvIVw>
    <xmx:O-xDY3KjaDfksv4KqsPwKpxl0u9IhPwRdYSj4QfRymlk6kiWmyAISaUgcng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 05:56:09 -0400 (EDT)
Date:   Mon, 10 Oct 2022 11:56:08 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v9 13/25] clk: Set req_rate on reparenting
Message-ID: <20221010095608.ak6pnxslmvzhayce@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech>
 <CGME20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324@eucas1p2.samsung.com>
 <20220816112530.1837489-14-maxime@cerno.tech>
 <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com>
 <20221004205952.C7287C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221004205952.C7287C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 04, 2022 at 01:59:50PM -0700, Stephen Boyd wrote:
> Quoting Marek Szyprowski (2022-10-03 02:59:07)
> > On 16.08.2022 13:25, Maxime Ripard wrote:
> > > If a non-rate clock started by default with a parent that never
> > > registered, core->req_rate will be 0. The expectation is that whenever
> > > the parent will be registered, req_rate will be updated with the new
> > > value that has just been computed.
> > >
> > > However, if that clock is a mux, clk_set_parent() can also make that
> > > clock no longer orphan. In this case however, we never update req_rat=
e.
> > >
> > > The natural solution to this would be to update core->rate and
> > > core->req_rate in clk_reparent() by calling clk_recalc().
> > >
> > > However, this doesn't work in all cases. Indeed, clk_recalc() is call=
ed
> > > by __clk_set_parent_before(), __clk_set_parent() and
> > > clk_core_reparent(). Both __clk_set_parent_before() and __clk_set_par=
ent
> > > will call clk_recalc() with the enable_lock taken through a call to
> > > clk_enable_lock(), the underlying locking primitive being a spinlock.
> > >
> > > clk_recalc() calls the backing driver .recalc_rate hook, and that
> > > implementation might sleep if the underlying device uses a bus with
> > > accesses that might sleep, such as i2c.
> > >
> > > In such a situation, we would end up sleeping while holding a spinloc=
k,
> > > and thus in an atomic section.
> > >
> > > In order to work around this, we can move the core->rate and
> > > core->req_rate update to the clk_recalc() calling sites, after the
> > > enable_lock has been released if it was taken.
> > >
> > > The only situation that could still be problematic is the
> > > clk_core_reparent() -> clk_reparent() case that doesn't have any
> > > locking. clk_core_reparent() is itself called by clk_hw_reparent(),
> > > which is then called by 4 drivers:
> > >
> > >    * clk-stm32mp1.c, stm32/clk-stm32-core.c and tegra/clk-tegra210-em=
c.c
> > >      use it in their set_parent implementation. The set_parent hook is
> > >      only called by __clk_set_parent() and clk_change_rate(), both of
> > >      them calling it without the enable_lock taken.
> > >
> > >    * clk/tegra/clk-tegra124-emc.c calls it as part of its set_rate
> > >      implementation. set_rate is only called by clk_change_rate(), ag=
ain
> > >      without the enable_lock taken.
> > >
> > > In both cases we can't end up in a situation where the clk_hw_reparen=
t()
> > > caller would hold a spinlock, so it seems like this is a good
> > > workaround.
> > >
> > > Let's also add some unit tests to make sure we cover the original bug.
> > >
> > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> > > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, =
meson g12b
> >=20
> > Well, I don't have good news. This patch has my 'tested-by', but this=
=20
> > version again doesn't work properly on Meson G12B.
> >=20
> > Linux next-20220929, which contains this patch as commit cb1b1dd96241=
=20
> > ("clk: Set req_rate on reparenting") fails to boot on Odroid-N2. I only=
=20
> > see a freeze once the modules (I see some messages from meson drm and=
=20
> > cpu_freq) are loaded. Could you remind me how to help debugging this=20
> > issue? I will try to identify which clock causes the issue. Reverting=
=20
> > $subject on top of linux-next fixes/hides the problem.
> >=20
> >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >   drivers/clk/clk.c      |  22 ++++
> > >   drivers/clk/clk_test.c | 239 ++++++++++++++++++++++++++++++++++++++=
+++
> > >   2 files changed, 261 insertions(+)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 53b28e63deae..91bb1ea0e147 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1765,6 +1765,23 @@ static void clk_core_update_orphan_status(stru=
ct clk_core *core, bool is_orphan)
> > >               clk_core_update_orphan_status(child, is_orphan);
> > >   }
> > >  =20
> > > +/*
> > > + * Update the orphan rate and req_rate of @core and all its children.
> > > + */
> > > +static void clk_core_update_orphan_child_rates(struct clk_core *core)
> > > +{
> > > +     struct clk_core *child;
> > > +     unsigned long parent_rate =3D 0;
> > > +
> > > +     if (core->parent)
> > > +             parent_rate =3D core->parent->rate;
> > > +
> > > +     core->rate =3D core->req_rate =3D clk_recalc(core, parent_rate);
> > > +
> > > +     hlist_for_each_entry(child, &core->children, child_node)
> > > +             clk_core_update_orphan_child_rates(child);
> > > +}
> > > +
> > >   static void clk_reparent(struct clk_core *core, struct clk_core *ne=
w_parent)
> > >   {
> > >       bool was_orphan =3D core->orphan;
> > > @@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core *=
core,
> > >                                 struct clk_core *new_parent)
> > >   {
> > >       clk_reparent(core, new_parent);
> > > +     clk_core_update_orphan_child_rates(core);
> > >       __clk_recalc_accuracies(core);
> > >       __clk_recalc_rates(core, POST_RATE_CHANGE);
>=20
> I see a problem. __clk_recalc_rates() uses 'core->rate' as "old rate"
> but we'll have already destroyed that by calling
> clk_core_update_orphan_child_rates() and assigning 'core->rate' to the
> recalc_rate. Are clk notifiers being used? If so, it will probably be
> confused because the notifier will see the same rate as what was set
> instead of the old rate. cpufreq is probably the biggest user of clk
> notifiers.

That's a very good point... Which raises another one. Would it be ok to
notify users on a reparenting? It would make sense to me, since the rate
could be affected, but it's not been done so far so I'm not sure what
the implications might be

> We should add a test for that so when a clk is reparented the old rate
> is still what we expected it to be when the notifier is called.

I can do it, but I'm not sure what you want to test exactly. Let's
assume we have a mux with a given rate, we change the parent of that
mux, the rate is likely to be changed as well and we should put in the
notifier that the old_rate is the first parent's, and the new rate the
one of the new parent?

> Also, clk_core_update_orphan_child_rates() is poorly named. It doesn't
> care at all that the clk is an orphan. It seems like another
> __clk_recalc_rates() without the notifier. I have no idea why we need
> another recalc rates.

You're right, the only difference between the two (aside from the
notifiers) is that req_rate is also updated in
clk_core_update_orphan_child_rates().

> Possibly setting the req_rate in __clk_recalc_rates() is sufficient.
> Or maybe we should bail out if the clk doesn't have the orphan bit
> set.

Either way makes sense to me, the latter is probably less intrusive, but
the former allows to consolidate __clk_recalc_rates() and
clk_core_update_orphan_child_rates(). Which one would you prefer?

Maxime
