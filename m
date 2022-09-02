Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DB9C001B5
	for <linux-clk@archiver.kernel.org>; Fri,  2 Sep 2022 15:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235741AbiIBPVk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Sep 2022 11:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235655AbiIBPVS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Sep 2022 11:21:18 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2783614DCFF
        for <linux-clk@vger.kernel.org>; Fri,  2 Sep 2022 07:54:02 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id F189F320046F;
        Fri,  2 Sep 2022 10:53:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 02 Sep 2022 10:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1662130389; x=1662216789; bh=C5Hb0KB++J
        dkA8G9UgzJnFav4ytTHjncJi2+Rsn4LaU=; b=DVEPs8cpGiMS4azdOwVTpFKoDC
        CibHbfJIVujwrJNqwMTmqLQcFesiZpEkpjJEFZf7rx8rY9Ilzlj3Gzyyrwt1uc/d
        QH3IDwdRNVLG2Mp6IpOOGAh0Px07caXcqhs3wuVACELFyzsjhGgm/26Ty5XPnj1p
        CGPSuI5It4B34+ESV/M7Xpfs//oKzVa4IC7JuKRNe2hahuheuJwaEBbs8gyZSM3A
        L1rCddOrkkdSdlezQrBS+3Ekzvl5zGR2EhaPX6gZIS1upAuBZSoNWJU75VnBxnEF
        v52gXScLCwM4sX+8Z8SK5qbdELKSwaayjcNFD7z6WWoG4m0L76MHQRFEsfYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1662130389; x=1662216789; bh=C5Hb0KB++JdkA8G9UgzJnFav4ytT
        HjncJi2+Rsn4LaU=; b=KUmCadieg8I6Er0HdxtHBSGy8Nd7iSen9Hv4aWE2Jdh7
        yVlFeUFjoaH5znHoNvgfhtbfQMO4Rt9jqiw0eGXtwLhkB0x5uhV+ViO2SXEhRWb6
        teX9Nv/1tLhgS5yQhWKTGtwbpvCAD0PwysmEh/GoLKERf1S4RZOiKgFbZMY5SRo6
        gbhdyPxnrQIcJ1d/G2ngyh0Q6X2E/XEIqMJg0bJk7Zw5moJc+4/TAt4DovdX4Hkk
        wv3nqRnMNLYB+rOetMD5dsdW786JJYav5B2OxMZI59N9F2WBF5iji/y+fMFnvvH5
        kFKmCr06FNwa82ErYWoDWZppyEgTODStVKj9tHb3bg==
X-ME-Sender: <xms:1BgSY_-AIlRPy8dEnpmwcHgdKaYbn7A5AZ0fylFO8y_OglGA0_qQwA>
    <xme:1BgSY7sioCcup-UIFJBzIEPB7CoYwT0FcYXfjn3S_ikSVBiGZAEC5-wUGAW2SBuTv
    6MUs6k1_BT0yKnLl4k>
X-ME-Received: <xmr:1BgSY9AjJ-SfDgXQMRzddssgkmVbg0ZThRxTClTlnElichP_zLs3u96gUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1BgSY7eLevfMW0R1CYbxvzwIPG8FLRpGVpMF-tYIuIfiOKs8Ey14hQ>
    <xmx:1BgSY0OrqzMpRopdk5fLpOWdd3KGQwC6jwhoJG_1F3Ry4aqY08bkSQ>
    <xmx:1BgSY9m5oLji8hnne3hOPakRiLonOUnlKDxpfpDZWRlhOW264NNM0A>
    <xmx:1RgSYzoINtcPztOflA8ieuzI87kdY11kzI5e-ZQdY4-GcEa3sWNAGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Sep 2022 10:53:07 -0400 (EDT)
Date:   Fri, 2 Sep 2022 16:53:05 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v9 00/25] clk: More clock rate fixes and tests
Message-ID: <20220902145305.znvsrcrcjrpr343c@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="od35xf5etvu65nln"
Content-Disposition: inline
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--od35xf5etvu65nln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen, Mike,

On Tue, Aug 16, 2022 at 01:25:05PM +0200, Maxime Ripard wrote:
> Thanks to the feedback I got on the previous series, I found and fixed a
> number of bugs in the clock framework and how it deals with rates,
> especially when it comes to orphan clocks.
>=20
> In order to make sure this doesn't pop up again as a regression, I've
> extended the number of tests.
>=20
> The first patch reintroduces the clk_set_rate_range call on clk_put, but
> this time will only do so if there was a range set on that clock to
> begin with. It should be less intrusive, and reduce the number of
> potential side effects considerably.
>=20
> We then have a fix for the qcom rcg2 issue that has been reported
> recently.
>=20
> All the other patches should be probably be flagged as fixes, but
> they've never seem to have shown any real-world issues until now, and
> they aren't all really trivial to backport either, so I'm not sure it's
> worth it.
>=20
> There's also some documentation improvements for recalc_rate and
> clk_get_rate to hopefully make the documentation less ambiguous and
> acknowledge that recalc_rate() returning 0 on error is fine.

I'm not sure what to do at that point.

Back in July, you felt uncomfortable merging that series so close to the
merge window. I've sent a new series as soon as -rc1 was out, got a
kernelci run to test it and on a number of other platforms. And now
we're close to rc4, which means that you're going to bring the "we're
too late now for 6.1, let's target 6.2".

I believe this series fixes a number of real bugs in the CCF, in
addition to extending quite a lot the unit test coverage of the
framework. But if you just don't care, please just say so. I really
don't want to waste any more time rebasing and sending that series, and
pinging you on a regular basis if it's not going anywhere.

Maxime

--od35xf5etvu65nln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxIY0AAKCRDj7w1vZxhR
xa1PAQCA4XF5b+t8c5oOBQDMpUBTTWKIZClg2QJHV9zXnvyLRQEAsnXg69WCFACn
4pLQkD3qIhj6uUBaIZ0xstifiV2aPQ0=
=eeHf
-----END PGP SIGNATURE-----

--od35xf5etvu65nln--
