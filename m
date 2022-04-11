Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2538CC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 11:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345922AbiDKLld (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 07:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345698AbiDKLlb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 07:41:31 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C45DFA0
        for <linux-clk@vger.kernel.org>; Mon, 11 Apr 2022 04:39:10 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id AA9193202091;
        Mon, 11 Apr 2022 07:39:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Apr 2022 07:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1649677147; x=1649763547; bh=tB46c0l9Ao
        aVbVvc5g1kxKnuAb1ReNjOH3JW6gBAZ9M=; b=f5S/R9dFRu6rjRLDuaFckJrnTo
        uop/rse+ywQJw5tB3NxEaBBecd5aQy2bXzD7oSCFnhmbWYwDDnX8KxCGqWPrQCBc
        wx0JyeydcWqiNcIYh0RZrKKRqYGRFDM1kBPYpS2ZfnTEGxpBT3h3djJCG+DrX7b7
        bz+/Jv5ljTU3s90Jx4RAx9/AhHn/Tzc+qa9LPew6qNto/x315zeXfEmqXhTj2/gV
        dnJL5gxfvN3qZaekYyXVpBsWWBeK+Czs4TfxYYR2JJEL1T5C1GObNI80OPKkJWsY
        fCCgYnXzVd/Z8nAN3MM6JSUsUY7GgwWdiJaLzxRFzsmfLzeHgBauIhVCTxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1649677147; x=
        1649763547; bh=tB46c0l9AoaVbVvc5g1kxKnuAb1ReNjOH3JW6gBAZ9M=; b=M
        m7uK4SWh56tj3K+pJOAMe3iEvH+DaaT18wgRk4apDXMRFdrVlaugTYseJIzu5LWf
        5Yc7v5TZKUGW2ERy1wneAt04WmeIMnJQKK685/lLh6OoRarIF36CD+m2vdSVbll2
        364xZYz/uYlja+4ndafY96HXNs9CcvD0q4lu/DfJoKKyEubV59PyZyfctraSTW/v
        WzbY3g4gcut8pTGskxSMG7F2vbw3QJr9wZHxGYJ9jlEWrIk803BWbP/qmU9MC4vk
        sIgloi0VKC9D3a+a3rCoOEaPRXg70d3AMvnSN2Q1lP3S3Z6QfmGCE8O4i//t2OXA
        LvUeODioRz2XAKV+HYSoA==
X-ME-Sender: <xms:WRNUYokeS3MPu8eJi-KRNNnMbGErdNjAHRnSjNvD1b_PZkIBp7J2-A>
    <xme:WRNUYn0yrdAaQWgBuiViT3raXc6L3ZvBqsYOJX62xnn151TxNEPewk8ddp1KoA6y1
    vwDF8ipWAJYFuHsUsM>
X-ME-Received: <xmr:WRNUYmolt133PXxpakbgQNW4q9nSU7X84LD918AoIuEKEFgwTo3Nm4xruDN7Kvi8fPEv_mcwCiZ1Y6vNaXoeFWdsufVOYFal1frLHB4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekiedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WRNUYkmWMyFnJwKi8S55XhsR7iKa3FgL4MBofeYyhA4r-GYo2WY30Q>
    <xmx:WRNUYm1XjJEMZc11rXb8dzfLLWG9JV5C5-oPxhbPrljsCFjJx7zSNg>
    <xmx:WRNUYrvDr65dXH-_tnPHHbEBVxpFiYmeTxo27-UODdBRMKXhrFSa2A>
    <xmx:WxNUYnI8giX7Uwewc5u2Z7mFkg7v3FQJwc2Q1MQft8dcWv7EL8EnMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Apr 2022 07:39:05 -0400 (EDT)
Date:   Mon, 11 Apr 2022 13:39:03 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/22] clk: More clock rate fixes and tests
Message-ID: <20220411113903.34naepgw23zrnbdx@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <72HmVB9N_Hm0q8rTTo4Pg9uzlcm_ZYIrKuNEGp3SKbNAMcCo_E9UDLemXOEYYIW4fz9EE-AhP0qxjLh1Kmcjxu9SO1UBLFi5EldKRMZV54U=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rmgckxstwtijpoel"
Content-Disposition: inline
In-Reply-To: <72HmVB9N_Hm0q8rTTo4Pg9uzlcm_ZYIrKuNEGp3SKbNAMcCo_E9UDLemXOEYYIW4fz9EE-AhP0qxjLh1Kmcjxu9SO1UBLFi5EldKRMZV54U=@protonmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--rmgckxstwtijpoel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yassine,

On Sun, Apr 10, 2022 at 12:06:55PM +0000, Yassine Oudjana wrote:
> On Friday, April 8th, 2022 at 1:10 PM, Maxime Ripard <maxime@cerno.tech> =
wrote:
> > Hi,
> >
> > Thanks to the feedback I got on the previous series, I found and fixed a
> > number of bugs in the clock framework and how it deals with rates,
> > especially when it comes to orphan clocks.
> >
> > In order to make sure this doesn't pop up again as a regression, I've
> > extended the number of tests.
> >
> > The first patch reintroduces the clk_set_rate_range call on clk_put, but
> > this time will only do so if there was a range set on that clock to
> > begin with. It should be less intrusive, and reduce the number of
> > potential side effects considerably.
> >
> > All the other patches should be probably be flagged as fixes, but
> > they've never seem to have shown any real-world issues until now, and
> > they aren't all really trivial to backport either, so I'm not sure it's
> > worth it.
> >
> > The last patch will probably prove to be controversial, but it can be
> > left out without affecting the rest of the series. It will affect the
> > meson clock drivers for the g12b SoC at least. It stems from the
> > realisation that on the g12b, 4 PLLs (and thus all their children) have
> > a rate of 0, pretty much forever which feels like a bug considering the
> > rate 0 is used as an error in most places.
> >
> > Those 4 PLLs have a rate of 0 because meson_clk_pll_recalc_rate will
> > return 0 if the diviser of the PLL is set to 0 in the register, but:
> >
> > - pcie_pll_dco has a few registers to initialize set in
> > g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init
> > hook and will instead call it in the enable hook. This looks like a
> > bug and could be easily fixed by adding that init hook.
> >
> > - gp0_pll_dco and hifi_pll_dco both don't set any of there n field in
> > the initialisation of their register (g12a_gp0_init_regs and
> > g12a_hifi_init_regs). So if the bootloader doesn't set it, and as
> > long as set_rate isn't called, that field is going to remain at 0. And
> > since all but one users don't have CLK_SET_RATE_PARENT, this is
> > still fairly unlikely.
> >
> > - hdmi_pll_dco doesn't set the n field in the initialisation either,
> > but also doesn't have a set_rate implementation. Thus, if the
> > bootloader doesn't set it, this clock and all its children will
> > always report a rate of 0, even if the clock is functional.
> >
> > During the discussion with amlogic clock maintainers, we kind of ended
> > up on a disagreement of whether returning 0 was ok or not, hence the
> > expected controversy :)
> >
> > Let me know what you think,
> > Maxime
> >
> > Maxime Ripard (22):
> > clk: Drop the rate range on clk_put()
> > clk: tests: Add test suites description
> > clk: tests: Add reference to the orphan mux bug report
> > clk: tests: Add tests for uncached clock
> > clk: tests: Add tests for single parent mux
> > clk: tests: Add tests for mux with multiple parents
> > clk: tests: Add some tests for orphan with multiple parents
> > clk: Take into account uncached clocks in clk_set_rate_range()
> > clk: Fix clk_get_parent() documentation
> > clk: Set req_rate on reparenting
> > clk: Skip set_rate_range if our clock is orphan
> > clk: Add our request boundaries in clk_core_init_rate_req
> > clk: Change clk_core_init_rate_req prototype
> > clk: Introduce clk_hw_init_rate_request()
> > clk: Add missing clk_core_init_rate_req calls
> > clk: Remove redundant clk_core_init_rate_req() call
> > clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
> > clk: Introduce clk_core_has_parent()
> > clk: Stop forwarding clk_rate_requests to the parent
> > clk: Zero the clk_rate_request structure
> > clk: Test the clock pointer in clk_hw_get_name()
> > clk: Prevent a clock without a rate to register
> >
> > drivers/clk/clk.c | 239 +++++--
> > drivers/clk/clk_test.c | 1256 +++++++++++++++++++++++++++++++++-
> > include/linux/clk-provider.h | 6 +
> > include/linux/clk.h | 5 +-
> > 4 files changed, 1439 insertions(+), 67 deletions(-)
> >
> > --
> > 2.35.1
>=20
> It appears that this series breaks mmcc-msm8996:
>=20
> [    8.713810] mmpll2_early: recalc_rate returned a null rate
> [    8.713864] mmcc-msm8996: probe of 8c0000.clock-controller failed with=
 error -22
>=20
> I haven't yet tried to figure out the exact patch that causes
> this or how it does. I just wanted to report it as soon as possible.

Could you test without the last patch?

Thanks,
Maxime

--rmgckxstwtijpoel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlQTVwAKCRDj7w1vZxhR
xXYhAQCISWL3pwrHzpqXe0ppl6zNTxLW7NdcrUlzvRHyCfOjnwD+OHrRtOatXG7V
LNvfap98eJcBdiEmVAAsoX6IEikjagg=
=c1B+
-----END PGP SIGNATURE-----

--rmgckxstwtijpoel--
