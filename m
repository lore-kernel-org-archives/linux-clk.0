Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716B0C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 12:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233861AbiDHM5j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 08:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbiDHM5f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 08:57:35 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E647F9563
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 05:55:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 550BC32022C6;
        Fri,  8 Apr 2022 08:55:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 08 Apr 2022 08:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=6beO8pQKrzgmzwHSOF3skfhImsmqQd1Vw49znH
        4sdRo=; b=Jl7uCh/q66zLSQe1sWZDQ3oVsPtGYdWsWbUEk3WLbokeXlW4Ntv5A6
        ++UzApAkAnpaKeGFTxAoqbDiRhkH++LzCtF9GSfk04YTB2L+vHN9UJDCuITcXsbB
        F5FZ9+Kk6GNtVzEPlbXvDfvECKt9DgN6z22OeJnWjCVqgc8DHaNESOiwbO+nTl62
        SPqA744AklNnmZPLgsNQp0ZqfK+E+LgoAPJGPG8aWRipIWcz/bZWSc13Id34ZELm
        PvE9u/mo6JHrgDlfnTMXKyfjqk074pj++ZbFMdoVC2totlpNaq8HHGy6bAqPxfai
        49GscFTXsdrzNEXPg4J9BR8i1OBIwC1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6beO8pQKrzgmzwHSO
        F3skfhImsmqQd1Vw49znH4sdRo=; b=UuBrYfxK8E/ESmWbe0eePklsSOMagalgD
        iBByGtKvGsdVs252xg01d3caMBa+BT94LaH3p1yKd6jOcvWozm5YnVOjLjkXGRoz
        dRtPzQEVe/nVzh8nGShZvDihNitB5rbvpuXFP1iDxyhtPj8eAGZo1Y3Qwd6hoOte
        DybnIfmBcpjETlJAs+GVc4I+a/Uw7uHcUppEEhdwzUSXOUxc7SktJe4B/NchbVq9
        BTP4axHjRiAdbSzPfSWDdYGVSLLNsQFy1ZpuwhrGsAKTFwsmEWLhZBtK1ZHNr6MM
        8r85IYH+V0rsG1bo1OCswzub7Os4CFr0lZlUVfYNiVaxeHGyyKt/w==
X-ME-Sender: <xms:wDBQYq8zJG7mhFbffBbkWk-mOF5V6uWmw2fu3BcOMDGIr2Im1cNiMw>
    <xme:wDBQYqtXIxtJQqHBTMENAHXZbnjdhXlS1ItQReso2stfaWdu7n5xqhbJ2NLFJrheM
    _2l85e5WgOeIKknamI>
X-ME-Received: <xmr:wDBQYgBO1GF4K1BDKfD8BjcXIZ7DiqomwoYoCAahd5KTIHU7mwXP4bv7LPhiI2t9djqqYxX4EUZ4q3xW8f1eMniMQ6iZ49z-ka83K2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepudehudegleeggeeiteehkeetgeduffefueduhfeuhfduiefhleehleehfefh
    heelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wTBQYieiXJL8FU-edqNLIxUGOgWbFsTRIDKIjsSvVlZRsCUwKcrwUQ>
    <xmx:wTBQYvPYVxXeRFK4bPC6sNewYhPC5nbGJcbt8iVg8YPF4Ioxtd5TEA>
    <xmx:wTBQYslNPD79FmRD_I_3ppKSA2ra_SFkcRVEkYnnWjLx1fCN8Z7DkA>
    <xmx:wTBQYoi2Mg93mldwl_V4cNa_rZGX2V7wnt30sUeb7Y-QbxR5NMs_dw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 08:55:28 -0400 (EDT)
Date:   Fri, 8 Apr 2022 14:55:26 +0200
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
Message-ID: <20220408125526.ykk5ktix52mnwvh2@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5u66o6fiwjrcv3qj"
Content-Disposition: inline
In-Reply-To: <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--5u66o6fiwjrcv3qj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 01:24:59PM +0200, Jerome Brunet wrote:
> On Fri 08 Apr 2022 at 12:41, Maxime Ripard <maxime@cerno.tech> wrote:
> > [[PGP Signed Part:Undecided]]
> > On Fri, Apr 08, 2022 at 11:18:58AM +0200, Jerome Brunet wrote:
> >> On Fri 08 Apr 2022 at 11:10, Maxime Ripard <maxime@cerno.tech> wrote:
> >> > A rate of 0 for a clock is considered an error, as evidenced by the
> >> > documentation of clk_get_rate() and the code of clk_get_rate() and
> >> > clk_core_get_rate_nolock().
> >> >
> >> > The main source of that error is if the clock is supposed to have a
> >> > parent but is orphan at the moment of the call. This is likely to be
> >> > transient and solved later in the life of the system as more clocks =
are
> >> > registered.
> >> >
> >> > The corollary is thus that if a clock is not an orphan, has a parent=
 that
> >> > has a rate (so is not an orphan itself either) but returns a rate of=
 0,
> >> > something is wrong in the driver. Let's return an error in such a ca=
se.
> >> >
> >> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> > ---
> >> >  drivers/clk/clk.c | 10 ++++++++++
> >> >  1 file changed, 10 insertions(+)
> >> >
> >> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> > index 8bbb6adeeead..e8c55678da85 100644
> >> > --- a/drivers/clk/clk.c
> >> > +++ b/drivers/clk/clk.c
> >> > @@ -3773,6 +3773,16 @@ static int __clk_core_init(struct clk_core *c=
ore)
> >> >  		rate =3D 0;
> >> >  	core->rate =3D core->req_rate =3D rate;
> >> > =20
> >> > +	/*
> >> > +	 * If we're not an orphan clock and our parent has a rate, then
> >> > +	 * if our rate is 0, something is badly broken in recalc_rate.
> >> > +	 */
> >> > +	if (!core->orphan && (parent && parent->rate) && !core->rate) {
> >> > +		ret =3D -EINVAL;
> >> > +		pr_warn("%s: recalc_rate returned a null rate\n", core->name);
> >> > +		goto out;
> >> > +	}
> >> > +
> >>=20
> >> As hinted in the cover letter, I don't really agree with that.
> >>=20
> >> There are situations where we can't compute the rate. Getting invalid
> >> value in the register is one reason.
> >>=20
> >> You mentioned the PLLs of the Amlogic SoCs (it is not limited to g12 -=
 all
> >> SoCs would be affected):
> >>=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/clk/meson/clk-pll.c#n82
> >> Yes, PLL that have not been previously used (by the ROMCode or the
> >> bootloader) tend to have the value of the divider set to 0 which in
> >> invalid as it would result in a division by zero.
> >>=20
> >> I don't think this is a bug. It is just what the HW is, an unlocked,
> >> uninitialized PLL. There is no problem here and the PLL can remain like
> >> that until it is needed.
> >
> > I think the larger issue is around the semantics of clk_get_rate(), and
> > especially whether we can call it without a clk_enable(), and whether
> > returning 0 is fine.
> >
> > The (clk.h) documentation of clk_get_rate() mentions that "This is only
> > valid once the clock source has been enabled", and it's fairly
> > ambiguous. I can see how it could be interpreted as "you need to call
> > clk_enable() before calling clk_get_rate()", but it can also be
> > interpreted as "The returned rate will only be valid once clk_enable()
> > is called".
> >
> > I think the latter is the proper interpretation though based on what the
> > drivers are doing, and even the CCF itself will call recalc_rate without
> > making sure that the clock is enabled (in __clk_core_init() for example=
).
> >
> > Then there is the question of whether returning 0 is fine. Again
> > clk_get_rate() (clk.c) documentation states that "If clk is NULL then
> > returns 0.". This is indeed returned in case of an error condition (in
> > clk_get_rate() itself, but also in clk_core_get_rate_nolock()).
> >
> > All the drivers I could find either assume the rate is valid, or test
> > whether it's 0 or not (randomly picked, but across completely different
> > platforms):
> > https://elixir.bootlin.com/linux/latest/source/drivers/clocksource/armv=
7m_systick.c#L50
> > https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/armada-8=
k-cpufreq.c#L74
> > https://elixir.bootlin.com/linux/latest/source/sound/soc/sti/uniperif_p=
layer.c#L194
> > https://elixir.bootlin.com/linux/latest/source/sound/soc/tegra/tegra20_=
i2s.c#L278
> >
> > So my understanding is that the consensus is that clk_get_rate() can be
> > called even if the clock hasn't been enabled, and that returning 0 is
> > only meant to be used for errors in general, a NULL pointer according to
> > the documentation.
> >
> > That would mean that pcie_pll_dco is buggy because it assumes that
> > clk_enable()
>=20
> This one indeed does everything in the enable and I could agree it is
> fishy, but since it supports only a single rate I don't think it is a
> problem. Even if it had a proper set_rate(), it would not change your
> problem since it would still return 0 until some consumer actually needs
> its parameter to change.
>=20
> > is going to be called before clk_get_rate(), gp0_pll_dco
> > and hifi_pll_dco because they expect "someone" to call clk_set_rate()
> > before clk_get_rate(),
>=20
> No, they don't expect anything. They will return 0 until they are set
> with a an actual rate. I don't think returning 0 should be
> problem and it has not been so far.

So, if I was to rephrase, gp0_pll_dco and hifi_pll_dco expect someone to
call clk_set_rate() before clk_get_rate() to have it return anything
other than 0.

> I understand the ambiguity you mentioned above. If the framework decides
> it is clearly forbidden to return 0, we'll change.
>=20
> Still I don't think it would be wise. What are the alternative if you
> can't compute a rate ? return 1 ? This looks aweful to me. At least 0 is
> a clear indication that the clock is not in a working state.

No, the alternative would be to initialize the clock to something
sensible before registering it (or in init).

> > and hdmi_pll_dco because it will always return 0,
>=20
> It is a read-only clock - whatever we do in CCF, it is not going to
> change. CCF has always supported RO clocks.

Yes, if a clock has a rate of 0Hz it's entirely useless. And if it's
useful in anyway, it should report its current rate. Read-only or not.

> > unless the display driver comes around and updates it. If it never does,
> > or if it's not compiled in, then you're out of luck.
>=20
> I'm all for managing the display clocks from CCF but it has proved tricky
> so far. Maybe it will someday.
>=20
> Being a read-only clock, the value is what it is and CCF should
> deal with it gracefully. It has so far.
>
> If the driver actually managing the clock is not compiled in, then the
> clock will never be set, and it should not be a problem either.

Again, it depends on what you expect from clk_get_rate(). If it can only
report a rate of 0 on error, then it's definitely a problem.

And it's not because it was done before that it wasn't just as
problematic then.

> >> IMO, whenever possible we should not put default values in the clocks
> >> which is why I chose to leave it like that.
> >>
> >> The PLL being unlocked, it has no rate. It is not set to have any rate.
> >> IMO a returning a rate of 0 is valid here.
> >
> > If there's not a sensible default in the hardware already, I don't see
> > what the big issue is to be honest. You already kind of do that for all
> > the other PLL parameters with init_regs
>=20
> Those initial parameters are "magic" analog setting which don't have an
> impact on the rate setting. The initial rate of the clock is never set
> by the clock driver on purpose.

It's still fundamentally the same: whatever is there at boot isn't good
enough, so you change it to have a somewhat sensible default.

> > , and most drivers do that for
> > various stuff:
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/imx/clk-imx6=
q.c#L917
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc3=
2xx.c#L1550
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/rockchip/clk=
-rk3036.c#L448
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu=
-sun8i-h3.c#L1157
> > https://elixir.bootlin.com/linux/latest/source/drivers/clk/tegra/clk-te=
gra20.c#L1013
>=20
> It is done by other drivers or controllers, yes. It does not make it
> right (again, it is just my opinion). Rate should never be set by the
> clock driver or the clock controller - Those should just implement what
> consumer wants. I would agree it sometimes proves tricky to hold onto
> this.
>=20
> Taking one of the example above:
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/nxp/clk-lpc32x=
x.c#L1550
>=20
> I think it would be better to have an "assigned-clock" on the related
> PLL in the USB node of the platform DT. That way the PLL is set when
> needed.

Both are valid. Assigned-clocks is arguably more fragile, but that's not
really the point.

> If we go down the road of "others are doing it, so why not ?", I think Ma=
rek
> initial regression report mentioned Exynos too ;)=20

Yes, he did mention exynos as well, but the issue was entirely
different.

Exynos had the issue that req_rate wasn't updated whenever a clock
wasn't orphan anymore because it changed parent. It's fixed in patch 10.

Out of the drivers I tested this week (sunxi-ng, exynos, omap3, qcom,
imx6, imx8 and g12b), only meson is in this case.

> > If the driver needs that kind of quirks in order to make the clock
> > usable in itself, then it just makes sense to do that, especially if
> > it's to avoid breaking a generic API.
>=20
> As it is the clock are usable and it did not break anything so far.

Anything but the abstraction.

> I have no problem updating the drivers if need be. I do have a problem
> with the framework changing and requiring the clock driver to set an
> initial rate to make it happy.

I mean, the alternative is changing the semantics of clk_get_rate(), and
all the call sites. Fixing one inconsistent driver definitely seems
preferable.

Maxime

--5u66o6fiwjrcv3qj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlAwvgAKCRDj7w1vZxhR
xbSEAPkBMz2TRgJLYtLkQzVsKLbpZyfgxIfqyNgcsXCz5pfLbwD/f5Dpf8RkUJpl
PsOihILiue45n3hhuNRcStHUvCQNfwE=
=9tYH
-----END PGP SIGNATURE-----

--5u66o6fiwjrcv3qj--
