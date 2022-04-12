Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA505C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 12 Apr 2022 13:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355289AbiDLNPA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 09:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356007AbiDLNN2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 09:13:28 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE55562E3
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 05:56:54 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2F5C23201F01;
        Tue, 12 Apr 2022 08:56:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Apr 2022 08:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1649768210; x=1649854610; bh=pAoLh9nZvx
        PTrw9vEMJDmYMRW9rmSXGXkLbWZcU+hkE=; b=kyXjIczR6+XNTi+uewKj0KdVSa
        zqxGQ5pCBLiMJuf/qPiuulfSjq8LAqwn9v9ER/16UvwErQ1evPYDHJ4YNs028hVy
        SVMZl/9EQHgEk8CSzFwnu4iwaK2w9dJrN2ZTzVT2qE4HSgS4f6G8UiIihQqWmFHN
        b5/JhF/hNlm4CBV8fC74Vura7NwGL4g6Xwqbai93i0xmDfa+AVYXNBCqWGOZ6Yys
        OX7f4W3Ym1iNf/BSgKbVnTnz8kJwHTpkSRRh3wthm0Aic+JXWaYt9nbtIgRIGcpI
        YDqSJEGBvaq1BExYglgMQ3gOgX3egWk0LSx9q17MzbNPxsqZoD/drUkY7KaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649768210; x=
        1649854610; bh=pAoLh9nZvxPTrw9vEMJDmYMRW9rmSXGXkLbWZcU+hkE=; b=k
        jAubypF4OX430tEhYkcal01vK+D2VjsOeleEPJp/UssZ5qwN44ygKsIR9BzABamu
        o4A+lOVGw1X2pUWZFRc+YLVby9XOAXK0cyx23dpBCeKCBb35uEj8xILorysxmPXA
        v/JVojE8nPdQ+q+9MYTqrvNc7bxHygHzOkl0kvn/LfkQ411X9l0KchUaQPILVaie
        XE6uVSN/0OGW4HeOghW1ctAqpKz9y1amSG5xCcfepQU0Bz2a1k5eujTqmqpwhvKk
        lgPhcBEAEcjflGSuG4Vpb9nxJIyvWHhmgeEThxKBRUw7+5rrXMU6qqGrstPjrrhZ
        hyf0H71qhmUZ0vHw+9OzQ==
X-ME-Sender: <xms:EXdVYuDrVIk8uKp0WPmJRQQ8vo5XOZEsnNlisaHFV6QwQMNeTE1_AA>
    <xme:EXdVYojKib-IPHmiZE6asKlqCWTMPuJ2v-rgQfLDuRBOcMCW57qgw0uFQ5HId-US6
    d0LJBVNjMx1rwVnpcU>
X-ME-Received: <xmr:EXdVYhnEYfb1sBCOLH-iXDTCa0DeaL3Ch5zLGm_UhSneh0UMcoHfKHVD5oOsbYhhGNRgzpuGCz_IMUFJ3IIjRoAKmNQ2bh5DIbbz3uA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EXdVYsxgvneAQK_kU4DTnoBVSJkl80DxidNhZsQ7oxsWtOPpZYq3xA>
    <xmx:EXdVYjRDWmfpK7t7NOpF6oFVc9u7v8-j5rUATxsYdMX_VJD8ELuP0A>
    <xmx:EXdVYnbxpaYTIcCluSsFA4IhpE7GjYaw2oUaJSyP0MRLtMe8rAXs8w>
    <xmx:EndVYuHkXcUzbQkuUEfjxPfTglHT9rnbMllhaiMaoFq6zjrRkQezEQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 08:56:49 -0400 (EDT)
Date:   Tue, 12 Apr 2022 14:56:47 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 22/22] clk: Prevent a clock without a rate to register
Message-ID: <20220412125647.pgbpjqmnv4phhfok@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-23-maxime@cerno.tech>
 <1jwnfzlxx1.fsf@starbuckisacylon.baylibre.com>
 <20220408104127.ilmcntbhvktr2fbh@houat>
 <1jpmlrlq0h.fsf@starbuckisacylon.baylibre.com>
 <20220408125526.ykk5ktix52mnwvh2@houat>
 <1jlewflizh.fsf@starbuckisacylon.baylibre.com>
 <20220408153625.ugodcmfwtanr75gu@houat>
 <a30e6471-eb1d-cf41-9ca9-cf33fd570c6a@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s6stoylfdf3ukgw5"
Content-Disposition: inline
In-Reply-To: <a30e6471-eb1d-cf41-9ca9-cf33fd570c6a@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--s6stoylfdf3ukgw5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 09:40:03AM +0200, Neil Armstrong wrote:
> On 08/04/2022 17:36, Maxime Ripard wrote:
> > On Fri, Apr 08, 2022 at 04:48:08PM +0200, Jerome Brunet wrote:
> > > > > > and hdmi_pll_dco because it will always return 0,
> > > > >=20
> > > > > It is a read-only clock - whatever we do in CCF, it is not going =
to
> > > > > change. CCF has always supported RO clocks.
> > > >=20
> > > > Yes, if a clock has a rate of 0Hz it's entirely useless. And if it's
> > > > useful in anyway, it should report its current rate. Read-only or n=
ot.
> > > >=20
> > >=20
> > > It does report its rate, it does not have any.
> > > ... and It would pretty weird to initialize a read-only clock.
> >=20
> > The KMS driver doesn't seem to have a problem with that.
> >=20
> > > > > > unless the display driver comes around and updates it. If it ne=
ver does,
> > > > > > or if it's not compiled in, then you're out of luck.
> > > > >=20
> > > > > I'm all for managing the display clocks from CCF but it has prove=
d tricky
> > > > > so far. Maybe it will someday.
> > > > >=20
> > > > > Being a read-only clock, the value is what it is and CCF should
> > > > > deal with it gracefully. It has so far.
> > > > >=20
> > > > > If the driver actually managing the clock is not compiled in, the=
n the
> > > > > clock will never be set, and it should not be a problem either.
> > > >=20
> > > > Again, it depends on what you expect from clk_get_rate(). If it can=
 only
> > > > report a rate of 0 on error, then it's definitely a problem.
> > >=20
> > > Agreed, it depends on what you expect from clk_get_rate().
> > > Still when something does not oscillate, the rate is 0.
> > >=20
> > > If a driver call clk_get_rate() on an uninitialized, unlocked PLL, I
> > > think returning 0 makes sense.
> >=20
> > You're confusing two things: the rate output by the hardware, and what
> > the CCF needs to return. We're discussing the latter here, a software
> > construct. It models the hardware, but it doesn't have to be true to the
> > hardware.
> >=20
> > And even the meson driver doesn't follow what you're claiming to the
> > letter and is inconsistent with what you're saying. Any disabled gate
> > will also have a hardware rate of 0. Yet, it doesn't return 0 in such a
> > case. And no one does, because clk_get_rate() isn't supposed to return
> > the actual rate in hardware at the moment. It's supposed to return what
> > would be the rate if it was enabled.
>=20
> You're pointing a real issue, what should we return as a rate then ?
>=20
> The rate is not only the rate output by the HW but is also used by the
> whole subtree of the PLL to calculate the rates.
>=20
> If we return a fake or dummy rate instead of 0 (which is the physical
> reality), the clock subtree will be populated from a fake rate and if
> we did set a clock rate using assigned-clock, eventually this fake
> rate would match and no set_rate() would be called on the PLL.
>=20
> This is why we return the true physical rate, it's the software to
> adapt in order to handle the possible HW states.

I'm not sure why you insist so much on the "true physical rate" tbh.
That was never really a thing. It's not for a gate, it's not for a
spread-spectrum clock (which would be even more interesting to report
properly following your criteria). And then you have the clock
accuracies that are throwing it off entirely too.

It just isn't practical, and that's why no-one relies on it.

Or let's turn it the other way around. When you'll have called
clk_enable() on those clocks (but only that), what do you expect the
rate to be? 0? Yet, the "true physical rate" probably changed by then.

If that was a thing, we would also have to:

  * make sure clk_set_rate can't be called on a disabled clock, because
    the true physical rate would never match what is required

  * rate ranges just wouldn't be usable either, because we would have no
    way to check that the true physical rate is actually within that
    range at any given time.

  * All clocks rate wouldn't be cacheable to account for the jitter in
    the system clock source.

  * We would need to use some hardware engine that reads the clock rate
    being output at any given time, to account for spread-spectrum and
    the clock source accuracy.

  * We wouldn't be able to report phases properly, because you can't
    really measure the clock skew either.

I understand that it's convenient for you, but it isn't practical if we
look at it from the framework's PoV.

You could very well initialize the PLLs to have a 1/1 ratio to their
parent, that would probably be sensible and would make the framework
happy.

> > > > And it's not because it was done before that it wasn't just as
> > > > problematic then.
> > > >=20
> > > > > > > IMO, whenever possible we should not put default values in th=
e clocks
> > > > > > > which is why I chose to leave it like that.
> > > > > > >=20
> > > > > > > The PLL being unlocked, it has no rate. It is not set to have=
 any rate.
> > > > > > > IMO a returning a rate of 0 is valid here.
> > > > > >=20
> > > > > > If there's not a sensible default in the hardware already, I do=
n't see
> > > > > > what the big issue is to be honest. You already kind of do that=
 for all
> > > > > > the other PLL parameters with init_regs
> > > > >=20
> > > > > Those initial parameters are "magic" analog setting which don't h=
ave an
> > > > > impact on the rate setting. The initial rate of the clock is neve=
r set
> > > > > by the clock driver on purpose.
> > > >=20
> > > > It's still fundamentally the same: whatever is there at boot isn't =
good
> > > > enough, so you change it to have a somewhat sensible default.
> > >=20
> > > If you don't need it, no.
> >=20
> > I mean, I provided multiple examples that the meson driver is being
> > inconsistent with both the CCF documentation and the expected usage of
> > the CCF consumers. And I suggested solutions to fix this inconsistency
> > both here and on IRC to Neil and you.
>=20
> It's not that we don't like it, we only care the actual HW state is
> correctly reported in the clock tree, nothing else.
>
> If a new flag like CLK_INVALID_RATE existed then we would use it.
>=20
> But so far a zero rate never was problematic, and iMX8mp HDMI PLL

That patch isn't upstream.

> and MSM mmpll2 also return a 0 rate as init because it's probably the
> default PLL state at HW startup.

And two wrongs never made a right.

--s6stoylfdf3ukgw5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlV3DwAKCRDj7w1vZxhR
xReCAP0SjlgfwSFNG0Ctbb/kWqeaGlzrOM9IdC0Cn/b01oFkxwEAqoyOlgy7aaiC
bvPY/arcg0dSPgfAuEM1/er31wlhpAQ=
=KpqP
-----END PGP SIGNATURE-----

--s6stoylfdf3ukgw5--
