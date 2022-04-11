Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED88C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 11:55:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbiDKL5P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 07:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbiDKL5O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 07:57:14 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A20CE0F6
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 04:55:00 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 1A2E132020D0;
        Mon, 11 Apr 2022 07:54:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Apr 2022 07:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1649678098; x=1649764498; bh=KrcbcQK//h
        Rqh7CrrSWfRpVYHaqBw5f3OPoJTR8+Udg=; b=vj1WMXLQR1Y/Wr6Sbc1hOsgn3j
        4gksB+jVfM6MCxGIZYau9I77SAlZRcBC7vhyJQugiMXOEBh7snc6pAQafg1oW/W1
        oSyTtirONV/TLnMqsCBdXhz/ZBHcXKGWdgql7NGSrUq2hLlb0SbP6FLfMQpoRwq9
        CWmF0JE4jztFjJP/gsxFJZC2dvZuoTohYQ3NwNptzB/8Eh5I4fpJVHR6zPdoGTBg
        2sK3VQJnClNH8cIb5LxUuYhmmMU7xnJTxz2r95bXvk874anRUogdp2waUGmGxWeo
        j74qKAJ5uVfBdPQ6O+eL3n1OuGFPMqisXapNaRK0ZJuzEsO7T4ikqukvtNCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649678098; x=
        1649764498; bh=KrcbcQK//hRqh7CrrSWfRpVYHaqBw5f3OPoJTR8+Udg=; b=d
        TwITPfuCDYdVn79HZ+ys76puc7cxmFSlIX79+j/JZSLDd7SMWfRSO1l2o7EYpwH9
        g5wHmdVnQrhaKnjpU2vnPd7QnFQSl1LhFWa1eYE12bkGPGm0BC3om8BTy72D9+C9
        VTTX+uT87ORkwDBolTklnc9ydRTPvcc8bov2e2rItkz8xPlV1+ilyQZZWQxmwmHV
        86LlMfUAuAbryj9QfS985zSbptYtyWlP23bLXemCZMh5wiXw/tafjaJBAXl3xb66
        pfOS87ttoTabLs4r5+B9SBHwjRHKF2OAv6FJ7J3wK1LDRUcid8ukLcGrxTUSO2P5
        j7NaDCLShoohcHnVRqEVQ==
X-ME-Sender: <xms:ERdUYhA1G0DtTq2bvKw6k9SsU63wyV8w9w-1J_fJo4Jy5NmDxwL1ow>
    <xme:ERdUYvgT-M87CjG-deqiFtgkUO5O5K604t1SN-1eB-Hp9QewZPOFsRUaVSovNpH0y
    iBh1bAWiYK0coXx3II>
X-ME-Received: <xmr:ERdUYsmokd5q_M6N71w8ygcW8rVV2VezxncGyT3-PysBPYmJemzS_lgHsNZnNP3nQSxLvqzBVziqjk8J4EbGx9dQPAG0a0wnLYPP4Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekiedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ERdUYrzf2M2TFpbmh3xB_uZp__cg9D76Fynm4qmwiepk8VlfxDEsOA>
    <xmx:ERdUYmTv7QNSHGVYOthAItwR7anWqS6orc7vShEW4Twx1xgubjUCdg>
    <xmx:ERdUYuZheVrKvBWPE15x2BZVbQp50RV2i7-US2xoFO92q9jh21voPg>
    <xmx:EhdUYpFVELnzX0CpxGyb7dKT00bwzou3mguRuIhY_0CfV5JBJySuOQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 07:54:57 -0400 (EDT)
Date:   Mon, 11 Apr 2022 13:54:55 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: (EXT) [PATCH 00/22] clk: More clock rate fixes and tests
Message-ID: <20220411115455.7vtf6brwvjhg3zvt@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <11958147.O9o76ZdvQC@steina-w>
 <4703993.GXAFRqVoOG@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r45cfhm4ohhguscf"
Content-Disposition: inline
In-Reply-To: <4703993.GXAFRqVoOG@steina-w>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--r45cfhm4ohhguscf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Apr 11, 2022 at 09:24:22AM +0200, Alexander Stein wrote:
> Am Montag, 11. April 2022, 08:25:31 CEST schrieb Alexander Stein:
> > Hello Maxime,
> >=20
> > Am Freitag, 8. April 2022, 11:10:15 CEST schrieb Maxime Ripard:
> > > Hi,
> > >=20
> > > Thanks to the feedback I got on the previous series, I found and fixe=
d a
> > > number of bugs in the clock framework and how it deals with rates,
> > > especially when it comes to orphan clocks.
> > >=20
> > > In order to make sure this doesn't pop up again as a regression, I've
> > > extended the number of tests.
> > >=20
> > > The first patch reintroduces the clk_set_rate_range call on clk_put, =
but
> > > this time will only do so if there was a range set on that clock to
> > > begin with. It should be less intrusive, and reduce the number of
> > > potential side effects considerably.
> > >=20
> > > All the other patches should be probably be flagged as fixes, but
> > > they've never seem to have shown any real-world issues until now, and
> > > they aren't all really trivial to backport either, so I'm not sure it=
's
> > > worth it.
> > >=20
> > > The last patch will probably prove to be controversial, but it can be
> > > left out without affecting the rest of the series. It will affect the
> > > meson clock drivers for the g12b SoC at least. It stems from the
> > > realisation that on the g12b, 4 PLLs (and thus all their children) ha=
ve
> > > a rate of 0, pretty much forever which feels like a bug considering t=
he
> > > rate 0 is used as an error in most places.
> > >=20
> > > Those 4 PLLs have a rate of 0 because meson_clk_pll_recalc_rate will
> > >=20
> > > return 0 if the diviser of the PLL is set to 0 in the register, but:
> > >   - pcie_pll_dco has a few registers to initialize set in
> > >  =20
> > >     g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init
> > >     hook and will instead call it in the enable hook. This looks like=
 a
> > >     bug and could be easily fixed by adding that init hook.
> > >  =20
> > >   - gp0_pll_dco and hifi_pll_dco both don't set any of there n field =
in
> > >  =20
> > >     the initialisation of their register (g12a_gp0_init_regs and
> > >     g12a_hifi_init_regs). So if the bootloader doesn't set it, and as
> > >     long as set_rate isn't called, that field is going to remain at 0=
=2E And
> > >     since all but one users don't have CLK_SET_RATE_PARENT, this is
> > >     still fairly unlikely.
> > >  =20
> > >   - hdmi_pll_dco doesn't set the n field in the initialisation either,
> > >  =20
> > >     but also doesn't have a set_rate implementation. Thus, if the
> > >     bootloader doesn't set it, this clock and all its children will
> > >     always report a rate of 0, even if the clock is functional.
> > >=20
> > > During the discussion with amlogic clock maintainers, we kind of ended
> > > up on a disagreement of whether returning 0 was ok or not, hence the
> > > expected controversy :)
> > >=20
> > > Let me know what you think,
> > > Maxime
> > >=20
> > > Maxime Ripard (22):
> > >   clk: Drop the rate range on clk_put()
> > >   clk: tests: Add test suites description
> > >   clk: tests: Add reference to the orphan mux bug report
> > >   clk: tests: Add tests for uncached clock
> > >   clk: tests: Add tests for single parent mux
> > >   clk: tests: Add tests for mux with multiple parents
> > >   clk: tests: Add some tests for orphan with multiple parents
> > >   clk: Take into account uncached clocks in clk_set_rate_range()
> > >   clk: Fix clk_get_parent() documentation
> > >   clk: Set req_rate on reparenting
> > >   clk: Skip set_rate_range if our clock is orphan
> > >   clk: Add our request boundaries in clk_core_init_rate_req
> > >   clk: Change clk_core_init_rate_req prototype
> > >   clk: Introduce clk_hw_init_rate_request()
> > >   clk: Add missing clk_core_init_rate_req calls
> > >   clk: Remove redundant clk_core_init_rate_req() call
> > >   clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
> > >   clk: Introduce clk_core_has_parent()
> > >   clk: Stop forwarding clk_rate_requests to the parent
> > >   clk: Zero the clk_rate_request structure
> > >   clk: Test the clock pointer in clk_hw_get_name()
> > >   clk: Prevent a clock without a rate to register
> > > =20
> > >  drivers/clk/clk.c            |  239 +++++--
> > >  drivers/clk/clk_test.c       | 1256 ++++++++++++++++++++++++++++++++=
+-
> > >  include/linux/clk-provider.h |    6 +
> > >  include/linux/clk.h          |    5 +-
> > >  4 files changed, 1439 insertions(+), 67 deletions(-)
> >=20
> > Thanks for another round of patches.
> > On top my patchset this one does *not* break my imx8mp based setup. Boo=
ting
> > is as usual without any changes in dmesg.
> > Given this patch set I suspect the other one on github you sent me on
> > Thursday is obsolete now.
>=20
> I have to correct myself here a bit. While using my current board .dts fp=
r=20
> imx8mp works with this patchset,

Awesome, thanks for testing :)

> things change if I apply Lucas' HDMI patchset
> [1] and enable HDMI devices. In this case I get the following errors:
> > hdmi_pclk: recalc_rate returned a null rate
> > fsl-samsung-hdmi-phy 32fdff00.phy: error -EINVAL: failed to register cl=
ock
> > fsl-samsung-hdmi-phy 32fdff00.phy: register clk failed
> > fsl-samsung-hdmi-phy: probe of 32fdff00.phy failed with error -22
>=20
> The offending patch is the last one 'clk: Prevent a clock without a rate =
to=20
> register'.

Yeah, I'll comment on that series, thanks!
Maxime

--r45cfhm4ohhguscf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlQXDwAKCRDj7w1vZxhR
xZHoAQDuFAON6G02i/5P0Ow0GI+VTnfTZ+HtMRtzlX80jmr7GQD7BZd4gA4o/coX
VCxsJzVQIuTGUGT1bPl9huPCZbqCDQw=
=MAmT
-----END PGP SIGNATURE-----

--r45cfhm4ohhguscf--
