Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BC1C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 10 Oct 2022 14:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiJJOxD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 10:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiJJOxC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 10:53:02 -0400
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527E040BEB
        for <linux-clk@vger.kernel.org>; Mon, 10 Oct 2022 07:53:01 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 3D0442B06398;
        Mon, 10 Oct 2022 10:52:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 10 Oct 2022 10:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1665413578; x=1665420778; bh=uS6mq60Cfc
        yPRPJCyd22sPx7sezEo5/MT5gXK6+7OCE=; b=eL1DVY/jNo5IhZ6C59qcieOKHb
        PiSPozXrIAkTfuHe8F3NpGdhtS2ZUJ91FPxzBHICTXYtutXao7qENtlBPchbFMPP
        uEhm6gGSw7c3S/7Xel/ib0k8azNorQNou55XJY0428e7/ENV//ql+Q+EEwbOlglf
        mm80E1r3aIxg3Nvo0JMHw1u2RFtw8AYnfBbFQM6ltipxoyL66Vy1IWMSk9vtdOjm
        JOicvQCgc5PKP8kECKaBeebGSSLU9EhZU+7xAM+L+q5ynedXMVvvJSOJCIALrI2d
        B9WfFgj/Rbf0MWvC5GzIn4VGoHHqVzQ6y0i6j09wuUxNx5vo2VtsIFYoRmig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665413578; x=1665420778; bh=uS6mq60CfcyPRPJCyd22sPx7sezE
        o5/MT5gXK6+7OCE=; b=bdL6FYp1Jap1pf3OtRinjQ0szT/yfLWe4lX6ykeXba9R
        ykELxKLKJC4Rie/VdyfzKAVBSz6JJ0J+SOVKOvY7LnQm3WmBGzf1ZdHyQ4LLzSlu
        YAteX7dJlBAsu7wwx6oOWHsUuBvdOltTSN0VcqyCacEc+5F6MToF8sjd4kSKGQ8a
        dFLAIaG9BIblhQeAGJ1OCmJzDJQLDkGDCQyhfkwaKEYAhPoYPt6wroRAzHHlU+zE
        QetlYgSFu7OKoDNWWUgMmjZfUYJSejtXny3GBEWAhlYgxsmX3d8Y0MILPN68HjLG
        8+1fyEqLDVPeutvT0vCwAI7Q+WVGlEqb8Bp5kuyrsQ==
X-ME-Sender: <xms:yjFEY-DoZ5L9g2Ums2kTMHwSNejzbPs17NLbx0BCIVwSowcgfBOn-A>
    <xme:yjFEY4iD7edVClwPtGWT3Y4oTJh_28jm5G5vHI5bjQpqVGzN7a2EgWrpCr9Q8DIEU
    tHN1qDNJfwPR2Bd4cY>
X-ME-Received: <xmr:yjFEYxmJDU15C-aolE0XZW0gm6flxLwLx_wQoRC7OJaby027QhqHU3j2TwMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:yjFEY8xB303M2Sgmbp4MGksAxtaLLPr1XAKQ1DhrAnBlTbOSE_lsFQ>
    <xmx:yjFEYzQQgIl-Bh6U8Qvr4Y7SjzOIZABYsyof0R3LuY1X7x1Gd7cZ1Q>
    <xmx:yjFEY3Y67CJv4OudwFOhrfWbVkPovsSA-Hvn45sJsl8DhJ9vo9PvFQ>
    <xmx:yjFEY0SIgbDs5kOALsfMsYTHYR0Udn29O63SetzPXzAhL2ciqII4vHQzmZE>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Oct 2022 10:52:57 -0400 (EDT)
Date:   Mon, 10 Oct 2022 16:52:56 +0200
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
Message-ID: <20221010145256.7zikxmkhjgor6esx@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech>
 <CGME20220816112640eucas1p271d97cbe81481a8083fa6540c26fb324@eucas1p2.samsung.com>
 <20220816112530.1837489-14-maxime@cerno.tech>
 <0acc7217-762c-7c0d-45a0-55c384824ce4@samsung.com>
 <20221004205952.C7287C433C1@smtp.kernel.org>
 <20221010095608.ak6pnxslmvzhayce@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jpdwpjxlnevxim3n"
Content-Disposition: inline
In-Reply-To: <20221010095608.ak6pnxslmvzhayce@houat>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--jpdwpjxlnevxim3n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replying to my own questions after some time working on this.

On Mon, Oct 10, 2022 at 11:56:08AM +0200, Maxime Ripard wrote:
> > > > +/*
> > > > + * Update the orphan rate and req_rate of @core and all its childr=
en.
> > > > + */
> > > > +static void clk_core_update_orphan_child_rates(struct clk_core *co=
re)
> > > > +{
> > > > +     struct clk_core *child;
> > > > +     unsigned long parent_rate =3D 0;
> > > > +
> > > > +     if (core->parent)
> > > > +             parent_rate =3D core->parent->rate;
> > > > +
> > > > +     core->rate =3D core->req_rate =3D clk_recalc(core, parent_rat=
e);
> > > > +
> > > > +     hlist_for_each_entry(child, &core->children, child_node)
> > > > +             clk_core_update_orphan_child_rates(child);
> > > > +}
> > > > +
> > > >   static void clk_reparent(struct clk_core *core, struct clk_core *=
new_parent)
> > > >   {
> > > >       bool was_orphan =3D core->orphan;
> > > > @@ -2506,6 +2527,7 @@ static void clk_core_reparent(struct clk_core=
 *core,
> > > >                                 struct clk_core *new_parent)
> > > >   {
> > > >       clk_reparent(core, new_parent);
> > > > +     clk_core_update_orphan_child_rates(core);
> > > >       __clk_recalc_accuracies(core);
> > > >       __clk_recalc_rates(core, POST_RATE_CHANGE);
> >=20
> > I see a problem. __clk_recalc_rates() uses 'core->rate' as "old rate"
> > but we'll have already destroyed that by calling
> > clk_core_update_orphan_child_rates() and assigning 'core->rate' to the
> > recalc_rate. Are clk notifiers being used? If so, it will probably be
> > confused because the notifier will see the same rate as what was set
> > instead of the old rate. cpufreq is probably the biggest user of clk
> > notifiers.
>=20
> That's a very good point... Which raises another one. Would it be ok to
> notify users on a reparenting? It would make sense to me, since the rate
> could be affected, but it's not been done so far so I'm not sure what
> the implications might be

Turns out it's already done, and the rates were indeed off like you
pointed out.

> > We should add a test for that so when a clk is reparented the old rate
> > is still what we expected it to be when the notifier is called.
>=20
> I can do it, but I'm not sure what you want to test exactly. Let's
> assume we have a mux with a given rate, we change the parent of that
> mux, the rate is likely to be changed as well and we should put in the
> notifier that the old_rate is the first parent's, and the new rate the
> one of the new parent?

I implemented this, and this catches the issue you pointed out, so it
looks like a decent test :)

> > Also, clk_core_update_orphan_child_rates() is poorly named. It doesn't
> > care at all that the clk is an orphan. It seems like another
> > __clk_recalc_rates() without the notifier. I have no idea why we need
> > another recalc rates.
>=20
> You're right, the only difference between the two (aside from the
> notifiers) is that req_rate is also updated in
> clk_core_update_orphan_child_rates().
>=20
> > Possibly setting the req_rate in __clk_recalc_rates() is sufficient.
> > Or maybe we should bail out if the clk doesn't have the orphan bit
> > set.
>=20
> Either way makes sense to me, the latter is probably less intrusive, but
> the former allows to consolidate __clk_recalc_rates() and
> clk_core_update_orphan_child_rates(). Which one would you prefer?

I ended up removing clk_core_update_orphan_child_rates() entirely,
adding the test, and submitting it here:
https://lore.kernel.org/linux-clk/20221010-rpi-clk-fixes-again-v1-0-d87ba82=
ac404@cerno.tech/

Maxime

--jpdwpjxlnevxim3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0QxyAAKCRDj7w1vZxhR
xc/kAQCacat6XHn5qB5pqg728T7dPx1x+OYkgAxV/NOO5yVcpwEAxLJsLJifqs4H
t9rfzLzhMxeIlOv+uptgGpvsI3mxMwM=
=EQW3
-----END PGP SIGNATURE-----

--jpdwpjxlnevxim3n--
