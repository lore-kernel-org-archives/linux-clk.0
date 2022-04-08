Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6D4C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 10:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbiDHKnn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 06:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbiDHKnm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 06:43:42 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666CF12108C
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 03:41:33 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id EDBFD5C016A;
        Fri,  8 Apr 2022 06:41:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 06:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=kAPEtZV5jds9Tx55Qf6icMQdzAPB0Zn3o/WXQV
        1X7oE=; b=rjqMQf7PaN8gfp2j3MpTFt+uFfNPJO6YoZZzuuI2VXHVuckVPqMKmz
        40Gfwfuw7Vf0gBYGr+aUF7O9opDLJ4u09hTVgo2IYP5dxLO+uc5IZOzZ8yt8V91V
        niADyK6qq/rl3xXHbkA5FK9gI0VPfw+zVY8nyaLnPckhnDGEblq2PoX7dfe1Hc3r
        n8ZifXcCyawT90p7Oa/B36O5Y92d4stqAuE5Vd02jd2Fe9gwZ9ul9JRs43ae4C9Q
        WQf/MDmwzxzpY+HJkff2K5+5rYfq4ve/Nvdo9zusWqdSvv/TtbOxhMnTYpAZKXci
        kEMNMWWkVAbrH/KA65brPPWVUSYxiF1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kAPEtZV5jds9Tx55Q
        f6icMQdzAPB0Zn3o/WXQV1X7oE=; b=JeCpOVGbx6rgB/KOjlgfRk1HuB3VRbt6K
        tXWDyC3o7Mx72Adi2cPBjnt9fOJ5HUYyKymJZSjBZMrEbThdL5Z4cXzTL2cXTQpx
        +6l8lM3TwXn4wcANpVsrvTtQUp8NoOCvhORqzVh0gbyo8fHm2ivKT/+r7S2+vdR1
        n67min+qTvjVykx5CTQ+J7Lii2otdLOgK86Zs/Ct8OFEhc2UkGjPtaEvZkQdPbN9
        f+9iN7DCoH9QyzBq62/cdjwAxD0H3OQTpjhFOaWFR3d96QTFsqokh/7sSeGdZjrz
        gzCUhO6P6Z1DogkiKM5drIZtUB9nJAwBlGC2eWkyPbDhnUgS8J2yg==
X-ME-Sender: <xms:WRFQYmBogHtkpEHFigTa7aBn6vHxwP9BWKPt1t59QrCTNwsF4BeDIw>
    <xme:WRFQYgjN6LOn8k5bNpVVbtlEeQbGMWbUDpCURDIO_gF0Eb2dy5-yL7_nugBeLWbAK
    R0hm9QcblbBnspDCQg>
X-ME-Received: <xmr:WRFQYpnUFK2PQOvuJLc7jH8mtqnrqHspTshXMjS_aIw8nJMkm3FKNVdeNpmG6Lo6BiEUQMiL82TIST7zXR1U96BIce8vUQN7QpD9AZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepudehudegleeggeeiteehkeetgeduffefueduhfeuhfduiefhleehleehfefh
    heelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WRFQYkxnz1itTTPtbAoTkLP5RB3jp6ZhXOWNUdfvpXyVLI-hpbqxQA>
    <xmx:WRFQYrQHcYWRcmWBCVvDuD2lnCOeWnqVb-CnJahgrGYauvcUQ8XrNA>
    <xmx:WRFQYvab4hAjHiWyBjWLKNZ0jjk77EidjVzw0y_eOQaSWCP-0QjzLA>
    <xmx:WhFQYmEV9ghYhmue7XOSa3GAhmwmC7WumIV_gPJpWhOuo5HqkWUTKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 06:41:29 -0400 (EDT)
Date:   Fri, 8 Apr 2022 12:41:27 +0200
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
Message-ID: <20220408104127.ilmcntbhvktr2fbh@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7k7yuyi7hw7qevfa"
Content-Disposition: inline
In-Reply-To: <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--7k7yuyi7hw7qevfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 11:18:58AM +0200, Jerome Brunet wrote:
> On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
> > A rate of 0 for a clock is considered an error, as evidenced by the
> > documentation of clk_get_rate() and the code of clk_get_rate() and
> > clk_core_get_rate_nolock().
> >
> > The main source of that error is if the clock is supposed to have a
> > parent but is orphan at the moment of the call. This is likely to be
> > transient and solved later in the life of the system as more clocks are
> > registered.
> >
> > The corollary is thus that if a clock is not an orphan, has a parent th=
at
> > has a rate (so is not an orphan itself either) but returns a rate of 0,
> > something is wrong in the driver. Let's return an error in such a case.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 8bbb6adeeead..e8c55678da85 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *core)
> >  		rate =3D 0;
> >  	core->rate =3D core->req_rate =3D rate;
> > =20
> > +	/*
> > +	 * If we're not an orphan clock and our parent has a rate, then
> > +	 * if our rate is 0, something is badly broken in recalc_rate.
> > +	 */
> > +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
> > +		ret =3D -EINVAL;
> > +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
> > +		goto out;
> > +	}
> > +
>=20
> As hinted in the cover letter, I don't really agree with that.
>=20
> There are situations where we can't compute the rate. Getting invalid
> value in the register is one reason.
>=20
> You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 - all
> SoCs would be affected):
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/clk/meson/clk-pll.c#n82
> Yes, PLL that have not been previously used (by the ROMCode or the
> bootloader) tend to have the value of the divider set to 0 which in
> invalid as it would result in a division by zero.
>=20
> I don't think this is a bug. It is just what the HW is, an unlocked,
> uninitialized PLL. There is no problem here and the PLL can remain like
> that until it is needed.

I think the larger issue is around the semantics of clk_get_rate(), and
especially whether we can call it without a clk_enable(), and whether
returning 0 is fine.

The (clk.h) documentation of clk_get_rate() mentions that "This is only
valid once the clock source has been enabled", and it's fairly
ambiguous. I can see how it could be interpreted as "you need to call
clk_enable() before calling clk_get_rate()", but it can also be
interpreted as "The returned rate will only be valid once clk_enable()
is called".

I think the latter is the proper interpretation though based on what the
drivers are doing, and even the CCF itself will call recalc_rate without
making sure that the clock is enabled (in __clk_core_init() for example).

Then there is the question of whether returning 0 is fine. Again
clk_get_rate() (clk.c) documentation states that "If clk is NULL then
returns 0.". This is indeed returned in case of an error condition (in
clk_get_rate() itself, but also in clk_core_get_rate_nolock()).

All the drivers I could find either assume the rate is valid, or test
whether it's 0 or not (randomly picked, but across completely different
platforms):
https://elixir.bootlin.com/linux/latest/source/drivers/clocksource/armv7m_s=
ystick.c#L50
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/armada-8k-cp=
ufreq.c#L74
https://elixir.bootlin.com/linux/latest/source/sound/soc/sti/uniperif_playe=
r.c#L194
https://elixir.bootlin.com/linux/latest/source/sound/soc/tegra/tegra20_i2s.=
c#L278

So my understanding is that the consensus is that clk_get_rate() can be
called even if the clock hasn't been enabled, and that returning 0 is
only meant to be used for errors in general, a NULL pointer according to
the documentation.

That would mean that pcie_pll_dco is buggy because it assumes that
clk_enable() is going to be called before clk_get_rate(), gp0_pll_dco
and hifi_pll_dco because they expect "someone" to call clk_set_rate()
before clk_get_rate(), and hdmi_pll_dco because it will always return 0,
unless the display driver comes around and updates it. If it never does,
or if it's not compiled in, then you're out of luck.

> IMO, whenever possible we should not put default values in the clocks
> which is why I chose to leave it like that.
>
> The PLL being unlocked, it has no rate. It is not set to have any rate.
> IMO a returning a rate of 0 is valid here.

If there's not a sensible default in the hardware already, I don't see
what the big issue is to be honest. You already kind of do that for all
the other PLL parameters with init_regs, and most drivers do that for
various stuff:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/imx/clk-imx6q.c#=
L917
https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32xx.=
c#L1550
https://elixir.bootlin.com/linux/latest/source/drivers/clk/rockchip/clk-rk3=
036.c#L448
https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu-sun=
8i-h3.c#L1157
https://elixir.bootlin.com/linux/latest/source/drivers/clk/tegra/clk-tegra2=
0.c#L1013

If the driver needs that kind of quirks in order to make the clock
usable in itself, then it just makes sense to do that, especially if
it's to avoid breaking a generic API.

Maxime

--7k7yuyi7hw7qevfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlARVwAKCRDj7w1vZxhR
xTTIAQCtf6KXkN7lQeNQJ/06RPBqXgMH0EFxNiM+ybW0dHCMCwEA2UxsI+ELH5Ce
P9WrIK8hpI5/Kpy+ePKb3w+FjkmljA8=
=0JxX
-----END PGP SIGNATURE-----

--7k7yuyi7hw7qevfa--
