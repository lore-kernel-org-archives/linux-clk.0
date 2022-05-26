Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246DEC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 26 May 2022 16:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235345AbiEZQj5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 May 2022 12:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345983AbiEZQjp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 May 2022 12:39:45 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C1994CD40
        for <linux-clk@vger.kernel.org>; Thu, 26 May 2022 09:39:27 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 0478F32009A7;
        Thu, 26 May 2022 12:39:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 26 May 2022 12:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1653583163; x=1653669563; bh=4TvISfQLNd
        g7DAe3aHO7lfYbcbZQn+m6TmSaT4p1i2Q=; b=ciSFLnK+VmqX/yes6HJxlXFlKd
        e+lxhHlXc+EOpLqec6ur6QNHjNfDO1xPOq67gygt1EzgrzMaBV6fsET9gpblxMJz
        O7IM/iW/oP4LFF2c/3w7RsmKwLQ7Sc724TjYEwa2D6gRpPGCakoweZt2VxRUdyeu
        5q/A5tWo8RRgC7UyymGGCQmdT9rnXZFaZiuIJNIpuy9GDXSONA61GEtUs/2+TBB6
        YthDHF9sIaZCZ4kZ3VXskYbgerbhiECQfl9+8StxUr48157GQw/UvjIexi3rI4/c
        DIzR5Q1/AKzLZ7qwvQB1ZMh+1dB/N0e202oSbrYQ1lQGmaFD0S3gd6PozuGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1653583163; x=1653669563; bh=4TvISfQLNdg7DAe3aHO7lfYbcbZQ
        n+m6TmSaT4p1i2Q=; b=OLDm0K+Mz7puIJ+sd783g8K99o9HUnB8g0WJbMCLNUJd
        fpfv1MytcCa/jisnsw49oeINzy6kWmtL4Lo19iggShP/IzpVp2bhZggMSCBgPAr+
        vPG6ZHY28Qy9A12oq7/Qp8d4JFJWtkdJUOm757KRV4QMIeKJ+FoghqDu7pUzYbeg
        ZY564qdtaaeHLo5+Onxn2pYLgUHcKCaOuYUXOpenQD4Mevio6vxKOIQA0W8qvZMe
        H9iG1rUuOtkHqnwlrgHPh0gCaWOuZ/by5Yw2erJLgSC7CjErKrRpycEc/U/+9U30
        Q+Fxhjsp25UGSx7n4IkM4Nla95lb/Tzl9RtjMn6XQg==
X-ME-Sender: <xms:Oq2PYlqM_EMWaSN_RDQJEf9gbpVN9YZ3ijv73HMOse68B-kFAmuMKQ>
    <xme:Oq2PYnq6jo-h5GtkoRc9Cme4eHaQBu6TfJKov-DNodCzUyxrE93NhXbdwHVr3sshH
    5x4by4I_TZ6CSXdTxM>
X-ME-Received: <xmr:Oq2PYiNaJwfoDakOeRFT9YHvs4cJOrw2Db1MNkO3c7-VWb9AJJmDtKtmEBkScqjj-dNFIkbMSh8CTaZxBbZ3y96z7D8miIPUgiQcEes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeejgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
    geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:Oq2PYg4_5B2D0um561QqtrzSQKDgfaGDHp9YbSYvQ_1HZe1__obd2w>
    <xmx:Oq2PYk4xAUxV03u9PDSCT2R_N5Ajt97JvlcA8w-8Xy149468no6y3Q>
    <xmx:Oq2PYoiunAfySMTV5BlHLLUkkdjQnXiUdfVFPUq3SXm5P0a-SwuPPA>
    <xmx:O62PYkhzW3zmvs-Rj1v6spQ-qJYLtgQebdm8k9wfPAJltxHSiOcHZg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 May 2022 12:39:22 -0400 (EDT)
Date:   Thu, 26 May 2022 18:39:19 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jim Quinlan <jim2101024@gmail.com>
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
Subject: Re: [PATCH v4 13/28] clk: Take into account uncached clocks in
 clk_set_rate_range()
Message-ID: <20220526163919.z5uvqs62d6sbarw7@houat>
References: <20220512160412.1317123-1-maxime@cerno.tech>
 <20220512160412.1317123-14-maxime@cerno.tech>
 <CANCKTBuWkkXNdK5eLJr=KzykDt+dbjfOiNGhxga4oEU5COyiUg@mail.gmail.com>
 <20220525083017.eo3oxfduajrqoac4@houat>
 <CANCKTBsspDYR388yrMtnVdeeRop+GpNv811Y6s31R-RfhQZXnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="upljzs357iphimba"
Content-Disposition: inline
In-Reply-To: <CANCKTBsspDYR388yrMtnVdeeRop+GpNv811Y6s31R-RfhQZXnA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--upljzs357iphimba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 01:59:28PM -0400, Jim Quinlan wrote:
> On Wed, May 25, 2022 at 4:30 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi,
> >
> > On Tue, May 24, 2022 at 02:32:29PM -0400, Jim Quinlan wrote:
> > > On Fri, May 13, 2022 at 3:56 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > clk_set_rate_range() will use the last requested rate for the clock=
 when
> > > > it calls into the driver set_rate hook.
> > > >
> > > > However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
> > > > requested rate might not be matching the current rate of the clock.=
 In
> > > > such a case, let's read out the rate from the hardware and use that=
 in
> > > > our set_rate instead.
> > >
> > > I'm probably out of the loop on this but I am wondering why we don't
> > > also apply this same reasoning to
> > >
> > >         clk_core_set_rate_nolock()
> > >
> > > which may usea stale clock rate and skip the actual setting of the ra=
te:
> > >
> > > static int clk_core_set_rate_nolock(core, req_rate)
> > > {
> > >         /* ... */
> > >         rate =3D clk_core_req_round_rate_nolock(core, req_rate);
> > >
> > >         /* bail early if nothing to do */
> > >         if (rate =3D=3D clk_core_get_rate_nolock(core))    /* [JQ] Do=
es
> > > not check for CLK_GET_RATE_NOCACHE */
> > >                 return 0;
> > >
> > > I can see that 9-10 years ago someone submitted a pullreq to fix above
> > > but I cannot locate the response and it obviously never made it
> > > upstream.
> >
> > Yeah, that change would make sense to me.
> >
> > Stephen was hinting at a different solution here though:
> > https://lore.kernel.org/linux-clk/20220423044228.2AA7AC385A0@smtp.kerne=
l.org/
> >
> > > Just thinking out loud, the simpler solution is to probably drop all
> > > rate caching in the CCF and get the frequency on a clk_get_rate()
> > > call. It complicates some of the core though when we check to see if
> > > we need to update clk rates. We could have some middle ground where
> > > drivers indicate that they want to update their cached rate because
> > > it's valid now (either from their enable path or from somewhere else).
> > > This may be nice actually because we could have clk providers call
> > > this to force a recalc down the tree from where they've updated. I
> > > think the qcom DisplayPort phy would want this.
> Hi,
> Anything that works would be fine for me.  Right now we ask that the call=
er do
> this as a workaround:
>=20
>         /*
>          * Workaround to refresh CCF "clk->core->rate" as even though
>          *  !!(clk->core->flags & CLK_GET_RATE_NOCACHE) =3D=3D 1,
>          *  clk_set_rate() makes decisions based on the cached  (stale) r=
ate.
>          */
>         clk_get_rate(clk)
>=20
>         /* Restore to the rate we had set to previously */
>         clk_set_rate(clk, new_rate);
>=20
> FWIW, in our situation the calling driver has a fairly good idea that
> the cached rate
> might be incorrect.

Yeah, it should work just fine, but we should really fix this

Maxime

--upljzs357iphimba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYo+tNwAKCRDj7w1vZxhR
xW+aAQCiLrSb5HHtH3R/uWKsYkgxchFKgjX5BUUjHUK0d1kZ+QEAheQ7m9kmQlVP
dXkzJBn9oEAStztCz0kJxMD8XH3Giw8=
=AnLp
-----END PGP SIGNATURE-----

--upljzs357iphimba--
