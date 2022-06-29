Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4221C43334
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiF2J3N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:29:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiF2J3M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:29:12 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFFC39158
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:29:08 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 65EEB5C0274;
        Wed, 29 Jun 2022 05:29:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 29 Jun 2022 05:29:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656494945; x=1656581345; bh=2iRg0shGQu
        aKmupMPmIz79zQEI1Ru5fLQMUlJLj5mhA=; b=EYrjZ+/0KF5o0KG/7RVyi6u++H
        dD5XvFpBjtaSJsCqzAde6NuNqmQqIvXL2BIBM0eunIwGI3ayYmHcjsrci+UxHnhh
        H18tO47NQV50Xiw7qC4klsIJai/RExIrktTp8qynYwNWWVS81jLVmFUfydUkj1+C
        x57DytZEAYbe0h57K+Frbj7B0uB30HPJeeqfNsuLeSzilVAQQ1ljhtun7ssqH8S4
        YIqbxjtUuEOBgAhSehTo5H83RV5o7X0aGW7YCLYl+PkjSBs1vF6vmoI9PJvrUBXu
        uSoTM4rheCGGzra6MrhfriFmFix+ahUxGxrRTlHMNEXt3x63ZcNmIwHopSsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656494945; x=1656581345; bh=2iRg0shGQuaKmupMPmIz79zQEI1R
        u5fLQMUlJLj5mhA=; b=KWkYwiM9LTvQZoA+Kn4fOJRv+RrXrSM0vM24yXSOSOJl
        IL+/I85TaYfeXQ5sPRMn+FmlyGhmrOqqz4hDTnrTFZ4xlOuh/7gel9209oShLARK
        bLQ5WlH3P/yjvGZqMMuiaSO5F2oklMhLeV8MlGjAk+cVa7Qh8A8QG2ROEiA46O24
        GfHOyuf1noDo9UABUBrozhCB//Heg6ilLSyKYyJMVavNX/P63VzT2RM2ne/Ufmb5
        Ag7BaCHE1tJ7ubhi4KUU2xR7FGIKWD2sEA/LFZJyUYnRSBJ6goCRatnTHDOSzAVF
        4lH7658zt1S3ahjmZY8SXATqRgSUzVq7TO0LvYf8aA==
X-ME-Sender: <xms:YBu8YmYWP5VmHp-Vg3VZYXB9u1RcR63eaEqF9JAxW4rvmq67nnCsEA>
    <xme:YBu8YpZJ-ptwOgSzncslCv3aK9Q1nXnFDx-f4K1hwmGBbiOy0SuU7pR7O7uafXHMJ
    fxIhwBJ8HSaIAZfuXA>
X-ME-Received: <xmr:YBu8Yg9xVimU08f4b4vLxKtRqOYBsbHqivva-DcJycVRlRjcOsy6erw35mbZj_qYOoVxR_-UKpwFKyxjyPEW-xwxMSw9L-xuxyn-2F0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeukeegffeufeehfeeugeduueeigeegheeuieegheejkeeuueegffdvkedv
    ieefffenucffohhmrghinhepsghoohhtlhhinhdrtghomhdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihi
    mhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YBu8YooJGcQfYZqyB7KtAJ4QZOFvknLFeytWR5qJC5MLbEnUu1k9Cg>
    <xmx:YBu8YhrQtrA9GamkI9zcTt-zaXfKLwRDME2Xc3suDuaLbUKRYp0OVg>
    <xmx:YBu8YmSTrGHdNDFJJVViRkOIbPK7YPigdZLBKs1r_VRnT6YN_fQKvA>
    <xmx:YRu8Ys2gCyw3XMLQTXXiZvwqK07LLdxZWqEsBG4g7M1hjyX0FT8UCg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 05:29:03 -0400 (EDT)
Date:   Wed, 29 Jun 2022 11:29:00 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v5 04/28] drm/vc4: hdmi: Rework hdmi_enable_4kp60
 detection
Message-ID: <20220629092900.inpjgl7st33dwcak@houat>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-5-maxime@cerno.tech>
 <20220627233106.646B0C34115@smtp.kernel.org>
 <20220628094753.l6m65dhhj3wzqjtb@houat>
 <20220629084844.E750CC34114@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="to7kquoagqu54kcn"
Content-Disposition: inline
In-Reply-To: <20220629084844.E750CC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--to7kquoagqu54kcn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 01:48:42AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-06-28 02:47:53)
> > Hi,
> >=20
> > On Mon, Jun 27, 2022 at 04:31:04PM -0700, Stephen Boyd wrote:
> > >=20
> > > Ok, so this driver must want the new API.
> > >=20
> > > What is happening here though? The driver is setting 'disable_4kp60' =
at
> > > bind/probe time based on a clk_round_rate() returning a frequency.
> >=20
> > The main issue that we're trying to address is that whether or not HDMI
> > modes with a rate over 340MHz (so most likely 4k/60Hz but others are
> > affected) need a bootloader parameter to be set. If it isn't set, we
> > can't output those modes.
> >=20
> > Since it's a bootloader parameter though the kernel can't access it. The
> > main hint that we can use to figure out whether it's been enabled is
> > that the maximum clock frequency reported by the firmware will be
> > higher. So this code will try to round a frequency higher than the
> > maximum allowed when that setting isn't there, and thus figure out
> > whether it's enabled or not.
>=20
> So the kernel is at least able to ask for the max frequency during
> rounding and figure out that the frequency can't be larger than that. Is
> that right?

Yes, the firmware has a call that allows to query the boundaries of a
given clock it manages, and we then used whatever value it returns to
set the clk_hw rate range.

See https://elixir.bootlin.com/linux/latest/source/drivers/clk/bcm/clk-rasp=
berrypi.c#L287

> > If it's not, we prevent any of these modes from being exposed to
> > userspace or being used.
> >=20
> > > That returned value could change at runtime though based on rate
> > > constraints, or simply because the clk driver decides that the wind is
> > > blowing differently today and thus calling clk_set_rate() with that
> > > frequency will cause the clk to be wildly different than before.
> >=20
> > Yeah, that's true
> >=20
> > > I don't understand how we can decide to disable 4kp60 at probe time.
> >=20
> > We're trying to infer a bootloader/firmware parameter, so the only way
> > it can change is through a reboot.
>=20
> Got it.
>=20
> >=20
> > > Why doesn't the driver try to set the rate it wants (or the rate range
> > > it wants) and then if that succeeds it knows 4kp60 is achievable and
> > > if not then it rejects the attempt by userspace to set such a
> > > resolution.
> >=20
> > We can't really do that. The clock here drives the HDMI output so it can
> > only change when we change the mode. However, because of the atomic
> > commits in KMS, we can't fail when we actually change the mode, we have
> > to fail beforehand when we check that the new state is sane.
>=20
> Alright. I feel like we've discussed this before.
>=20
> >=20
> > We also can't change the clock rate then, because there's no guarantee
> > that the state being checked is actually going to be committed, and
> > because we still have the hardware running when we check it so we would
> > modify the clock while the hardware is running.
> >=20
> > I had another go in the RaspberryPi downstream kernel for this:
> > https://github.com/raspberrypi/linux/commit/df368502ecbe1de26cf02a9b783=
7da9e967d64ca
> >=20
>=20
> It really looks to me like we're trying to hide the firmware API behind
> the clk API. When the clk API doesn't provide what's needed, we add an
> API to expose internal clk details that the clk consumer should already
> know because it sets them.

That would work for me

> That's my main concern here. The driver is querying an OPP table
> through the clk framework.
>=20
> Why can't we either expose the firmware API directly to this driver or
> have the firmware driver probe and populate/trim an OPP table for this
> display device so that it can query the OPP table at probe time to
> determine the maximum frequency supported. The clk framework isn't in
> the business of exposing OPP tables, that's what the OPP framework is
> for.

Is it really an OPP?

My understanding at least is that an OPP table is a discrete set of
frequencies that a device can operate at, but you still need the
frequency generator somewhere else?

What we're discussing here definitely looks more like a clock to me:
it's is the frequency generator, and can expose a continuous set of
frequencies between a range. It just turns out that depending on a
parameter that range changes a bit, and it then affect our capabilities.

Maxime

--to7kquoagqu54kcn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrwbXAAKCRDj7w1vZxhR
xYRXAP9uSiURs2oe0MeO11H3Fc5FXPN/1wNQpyL/Mq1xwez0PQEA1jhDZvdZ5XU0
ZczHVDeHWvO6S4bXjZSSNyckqVOb1Q4=
=K4Uk
-----END PGP SIGNATURE-----

--to7kquoagqu54kcn--
