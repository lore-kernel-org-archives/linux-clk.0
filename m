Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB0BEB64D9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 13:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjFSNVB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 09:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjFSNVA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 09:21:00 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD073E59
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 06:20:58 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 33EB25C00C6;
        Mon, 19 Jun 2023 09:20:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 19 Jun 2023 09:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687180858; x=1687267258; bh=Lz
        vecA/Pgb0RzES+MAbQ66tw0K+dxmbS/SN9PJ2U5F0=; b=pbWMqxdH2kAthljbDu
        BHDua6P6tmUL0+8Zrh1duTV0DK3K6yyUQ+QNyKcUNoqpO3HfdZF/mwtEoe6/DC/K
        voNr+XBWm348lTQ11F+ntIs2zPjHEonwJIKluqAvPRT3Ucau3buMpeXfeonJYt1H
        4za1a9him3JkCgmNw/MId40uR1mKSmP/XUzCGC3CQeKaqCMiAgX0Q3NIg9fzINx2
        9NUc7iu8nZ2I/GIcuHYZPZS53PQAeBWxVxz6Z5Owp6G4d39+z8PoxOxPNAyDWAbY
        vSGG5BdlAny7vMs2wY1pqFDoCKjYBY1AqYKW7xu5lK7oNtYuxLNEvKAreWOY83aD
        +6LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687180858; x=1687267258; bh=LzvecA/Pgb0Rz
        ES+MAbQ66tw0K+dxmbS/SN9PJ2U5F0=; b=Rrt7YLuChqevJ6/eEan8D9HRyHy0G
        Iy3IM4sVwiFrZJXMgHVyaTjIviB5d2pTwgRIPHCbHn1CH3guj9WWmTD77cemDGJM
        syjxknJuosAXcEDbH4iXiLtRB+K/Owp8stc/ii3StaPiHhgbGeeNdcA43QoYwOow
        uvLiTqSmJ+mFzv+PwCf2w71bfw/elrLI1Ss2R2rp/1pjC6m1xEMQQP5Sbzf6BUrN
        VZuAzw8XtNhaRIVUfEj1J6h/r0xalARkjdYtKNutBALZoQL7CEaaG3kuNSOiHCvD
        4nlzmbAzQdZdaFJFDweeMc0sj/7a+g8eLQ9cqifEbHnDrzSqmxfqKIJIA==
X-ME-Sender: <xms:OVaQZEvCSniVVxu8QMD6kTh3wAgrZMfjdY4kTtjVzjskhFhmAE8Y0A>
    <xme:OVaQZBc4ftFPRdOJSy12Nqc-2dLaZ0mk0S_ReGTKH9U3AAVVQ9astVj8GzRaY7gWU
    pYMtfkD39uCUXuwi2I>
X-ME-Received: <xmr:OVaQZPzjtjdiREzXdvmh76i9A3xuDppNDzsDdvyve6yw7S2HPeXQe9pC4jRfboEijwrP50rpEJ_hR2FFKhpHZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
    gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OVaQZHPm5gK_NfHFJW1mePRLwnLqVN9s0-UkNU6rO8D5uYzlYUAwxA>
    <xmx:OVaQZE81oxfqGZagsJBJbvy1xyTxG5ludgaykP9m_cpMuF3YvotoPA>
    <xmx:OVaQZPVIHdr7ev9qJmKH-FbKoEYsMmjQoXDgCqrBpnFMRr0vF_1IVA>
    <xmx:OlaQZCkt2580MEHh_PzFpJ3c6DWWzv5nF2FaOQAvf-eEtQS3tAwyBg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jun 2023 09:20:57 -0400 (EDT)
Date:   Mon, 19 Jun 2023 15:20:55 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 07/68] clk: test: Add a determine_rate hook
Message-ID: <mlgxmfim3poke2j45vwh2htkn66hrrjd6ozjebtqhbf4wwljwo@hzi4dyplhdqg>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech>
 <e8a1f3244395dc707a1d741e2d166a7b.sboyd@kernel.org>
 <ukjgbguxqxfs6u2igivmxmmidvjvumqfptwvjymk7n6p22isqv@tbubrts5a6wp>
 <e0b1d62767939b22e962648ceab06bed.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nnmofhq4b5p33y5o"
Content-Disposition: inline
In-Reply-To: <e0b1d62767939b22e962648ceab06bed.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--nnmofhq4b5p33y5o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Jun 13, 2023 at 11:39:58AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2023-06-13 01:21:59)
> > On Thu, Jun 08, 2023 at 06:41:56PM -0700, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2023-05-05 04:25:09)
> >=20
> > > > +        * __clk_mux_determine_rate() here, if we use it and call
> > > > +        * clk_round_rate() or clk_set_rate() with a rate lower than
> > > > +        * what all the parents can provide, it will return -EINVAL.
> > > > +        *
> > > > +        * This is due to the fact that it has the undocumented
> > > > +        * behaviour to always pick up the closest rate higher than=
 the
> > > > +        * requested rate. If we get something lower, it thus consi=
ders
> > > > +        * that it's not acceptable and will return an error.
> > > > +        *
> > > > +        * It's somewhat inconsistent and creates a weird threshold
> > > > +        * between rates above the parent rate which would be round=
ed to
> > > > +        * what the parent can provide, but rates below will simply
> > > > +        * return an error.
> > > > +        */
> >=20
> > I guess it's mostly a policy decision: __clk_mux_determine_rate() always
> > has been returning rates that are lower or equal to the target rate.
> >=20
> > If no parent can provide one, then the obvious solution is to error out,
> > which creates the inconsistency mentioned above.
> >=20
> > Another solution would be to pick up a parent by default (the current
> > one maybe?) but then we could return a rate higher than the target rate
> > which breaks what we've been doing so far.
> >=20
> > I'm not sure if one is better than the other.
>=20
> We should pick a rounding policy that we want for the test. The test
> shouldn't be checking the rounding policy. It should be checking that
> the code under test does what is expected when the rounding policy is
> what we choose.
>=20
> If __clk_mux_determine_rate() returns an error when the rate is lower
> than the parent supports then we should test that as well and make sure
> it does return an error in this case. We can directly call
> __clk_mux_determine_rate() after registering the clks so that the
> function is isolated.

I guess my point is that, in general, we don't really expect an error in
clk_round_rate(). Most clocks will clamp the rates between the minimum
and maximum allowed and will select the closest parent or dividers to
match that rate. So we could end up with a rate fairly different from
the argument, but we'll get a rate.

For muxes using __clk_mux_determine_rate*() without CLK_SET_RATE_PARENT,
if the rate is too low (or if the range is loo low) and is right below
what one of the parent can provide, we end up with -EINVAL.

AFAIK, it's pretty much the only situation where that happens. A fixed
clock will always return its fixed rate for example, even if the rate is
very different from what we asked for. But for some reason, on some
muxes, with some rates, boom, EINVAL.

It's very unexpected and inconsistent to me. Hence the FIXME.

Maxime

--nnmofhq4b5p33y5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJBWNwAKCRDj7w1vZxhR
xQ2CAQCEMj0ZbZcH6sPerbFk087Wj2KTsjm0RE1lW2K2vZ1TBQEAz//vcb5UhViI
PhW4SFYcwUYcsY2Y7QO38anw+Y4BUQs=
=3Mzg
-----END PGP SIGNATURE-----

--nnmofhq4b5p33y5o--
