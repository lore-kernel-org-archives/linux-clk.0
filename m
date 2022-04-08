Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872C3C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 15:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237666AbiDHPii (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 11:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232719AbiDHPii (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 11:38:38 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C3E2E910B
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 08:36:32 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 772BD3201F73;
        Fri,  8 Apr 2022 11:36:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 08 Apr 2022 11:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=tayP8QYKlaqjKwWZPqodLD1uTKbKUz8LMPvXUX
        XD2u0=; b=l2lsDJVBrR4fTIc62lxsMER1Izw8fPkzpK4mMDLC7QXeeVtUB2z7aD
        wQqi+b/AQYZfKqlnS9PHHkwqe6rt9sJ4ciqeYfV0/0Xi/ak/7JSLyTPMLpxPZASN
        eLp3GJAZXopm/ex/Uub6yLqI7xjboUEa2I8cH0y/mDHUx/b1GHkRtXO5K2X+nOaA
        4A2mdI+DWwvP0EeWDFLxIlHgOhjnOSBhstW3Qq8xmWVJE2mF8sHD7fnaBt4zhADn
        +txZADDvxjRlc6UTW1Qx0axNWM4nASEklN6n/+5lrL9phcQ0aSMqMwna1driSQrC
        KHf2/AH0/lCwoH7Kb0Sj9ldSl9v24FhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tayP8QYKlaqjKwWZP
        qodLD1uTKbKUz8LMPvXUXXD2u0=; b=gTH/Hbt+gMZ0lmnDvv6pC/Qm2MiLxYE5I
        8WGaU3r4JCPAyUYSMLvLwc4rmVsG0LF2dUuIdaRB2TpXJZvR5+bwKi/Zuzk3jLrS
        xikmKTCMbHo7t+yokQ/f/VZZAnqwHwcCmqqY9adEolYfvQ+eQww7wesU+C1otP0I
        FqImu98HNQDd7Bm1GFjWcYPYjJZ7rZWsPtpPZOfwFrkky2WYwEhWrgRJnLYckson
        bXITf8nMmYJ+OJ+lmUk52dz6pmtM7ewNoMEFyYzk3/8zYt2x3U/eYkwtiQZGWC99
        3pgedvX8g7SXJV7gPW3LAH2ICQwaNGcr0l5FhwLVedmXh3bYlXUIQ==
X-ME-Sender: <xms:e1ZQYo_mY2ST_DHVYUGuVhwgRi9Q4wZxYRgdKCsa6T6HZrgpawKfog>
    <xme:e1ZQYgvBd1VcRKl8Y-Bf6M3Vw3CIdO69OHuHDg3oG3dDQ6Q7Q7j-SuJ8PinMBTpDw
    UxBparkPnJGzbC87QM>
X-ME-Received: <xmr:e1ZQYuBr8XIMvKMM2nbOfA9Z99bxD7WHFshkH8jVEgzgNsH57x3pH7T8RsaB_PkdV7UnudB1y7Bm1m_ZMjuXnsYBavNW3MOownoXN58>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fFZQYoeaGc8U8uyWRwzqPD9lVLJ3wTXpwZ5yIDWjRJyoxDVKxt7BYw>
    <xmx:fFZQYtPZc_Ec02Cy1Ih6PgninnSxJvcpmP07oy67DGPkDtkFgIBYaA>
    <xmx:fFZQYintcS0pYgXXN7EUffKRNv-aX5A7VgNMfoW3jpcpBxrZ2UWHNg>
    <xmx:fVZQYmgMUyszweQ_39VchdGP15z_4pByWRjzZV4Jjmapiifx4Yi6Zg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 11:36:27 -0400 (EDT)
Date:   Fri, 8 Apr 2022 17:36:25 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Message-ID: <20220408153625.ugodcmfwtanr75gu@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
 <20220408125526.ykk5ktix52mnwvh2@houat>
 <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ixb2nc3hs2outtpn"
Content-Disposition: inline
In-Reply-To: <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ixb2nc3hs2outtpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 04:48:08PM +0200, Jerome Brunet wrote:
> >> > and hdmi_pll_dco because it will always return 0,
> >>=20
> >> It is a read-only clock - whatever we do in CCF, it is not going to
> >> change. CCF has always supported RO clocks.
> >
> > Yes, if a clock has a rate of 0Hz it's entirely useless. And if it's
> > useful in anyway, it should report its current rate. Read-only or not.
> >
>=20
> It does report its rate, it does not have any.
> ... and It would pretty weird to initialize a read-only clock.

The KMS driver doesn't seem to have a problem with that.

> >> > unless the display driver comes around and updates it. If it never d=
oes,
> >> > or if it's not compiled in, then you're out of luck.
> >>=20
> >> I'm all for managing the display clocks from CCF but it has proved tri=
cky
> >> so far. Maybe it will someday.
> >>=20
> >> Being a read-only clock, the value is what it is and CCF should
> >> deal with it gracefully. It has so far.
> >>
> >> If the driver actually managing the clock is not compiled in, then the
> >> clock will never be set, and it should not be a problem either.
> >
> > Again, it depends on what you expect from clk_get_rate(). If it can only
> > report a rate of 0 on error, then it's definitely a problem.
>=20
> Agreed, it depends on what you expect from clk_get_rate().
> Still when something does not oscillate, the rate is 0.
>=20
> If a driver call clk_get_rate() on an uninitialized, unlocked PLL, I
> think returning 0 makes sense.

You're confusing two things: the rate output by the hardware, and what
the CCF needs to return. We're discussing the latter here, a software
construct. It models the hardware, but it doesn't have to be true to the
hardware.

And even the meson driver doesn't follow what you're claiming to the
letter and is inconsistent with what you're saying. Any disabled gate
will also have a hardware rate of 0. Yet, it doesn't return 0 in such a
case. And no one does, because clk_get_rate() isn't supposed to return
the actual rate in hardware at the moment. It's supposed to return what
would be the rate if it was enabled.

> > And it's not because it was done before that it wasn't just as
> > problematic then.
> >
> >> >> IMO, whenever possible we should not put default values in the cloc=
ks
> >> >> which is why I chose to leave it like that.
> >> >>
> >> >> The PLL being unlocked, it has no rate. It is not set to have any r=
ate.
> >> >> IMO a returning a rate of 0 is valid here.
> >> >
> >> > If there's not a sensible default in the hardware already, I don't s=
ee
> >> > what the big issue is to be honest. You already kind of do that for =
all
> >> > the other PLL parameters with init_regs
> >>=20
> >> Those initial parameters are "magic" analog setting which don't have an
> >> impact on the rate setting. The initial rate of the clock is never set
> >> by the clock driver on purpose.
> >
> > It's still fundamentally the same: whatever is there at boot isn't good
> > enough, so you change it to have a somewhat sensible default.
>=20
> If you don't need it, no.

I mean, I provided multiple examples that the meson driver is being
inconsistent with both the CCF documentation and the expected usage of
the CCF consumers. And I suggested solutions to fix this inconsistency
both here and on IRC to Neil and you.

The only argument you provided so far is that you don't like or want it.
I'm sorry you feel this way, but it doesn't change either the consensus
or the documentation that every other driver and consumer is following.
Nor does it provide any solution.

In the grand scheme of things, I don't care, if you want to have your
own conventions a policies, go ahead. Just don't expect me to debug
whatever is going on next time it falls apart.

Maxime

--ixb2nc3hs2outtpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlBWeQAKCRDj7w1vZxhR
xaGWAQDivSZOT6D8CHH02AssyRyJ0uNPQexpy6GRGSfAiLRiSAEAhdrLpZlR/9Eh
BHdtl6SU06bzXoB+YYcKhA+nDVdGEQE=
=Vd/z
-----END PGP SIGNATURE-----

--ixb2nc3hs2outtpn--
