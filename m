Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41AFC43334
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 12:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbiF2MmZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 08:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiF2MmW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 08:42:22 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5050A35DD0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 05:42:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 110733200564;
        Wed, 29 Jun 2022 08:42:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:42:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1656506536; x=1656592936; bh=6ZNi1qE1Rv
        4Yx1c13tcwOHL6CBF0F1dypVzWbX0avLM=; b=fpaja//WcD0crMT7oONgzi90ch
        RnU+NRvRD2cMqH1PJZItGrHeI8yKqxL4MrtiTAsc8Avlkq+TodGvrSKJ1InhnJvg
        mTVeijOwCe3CW6hcKuto0dEm7RnA+c6qsrLmTYPl9PTxypF3FEXoAAJu7uRiSAMb
        /L+qIN/perlXNlTnb6WMvmue5jQvohPxxr/h5JIrUjmxaJtj14Q+qrpN80nYk/sK
        px0EawwVTnFYPuswCv7m+6nMn4chHMpr1P2B7UtJdtiSep/Uq11/J4y9rZJNwFs/
        qTa0W43DfcT2IiLNWWru1z29RrUory+EYqRI4mHbq9V2jbGugbeiiuTI9NFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1656506536; x=1656592936; bh=6ZNi1qE1Rv4Yx1c13tcwOHL6CBF0
        F1dypVzWbX0avLM=; b=KBM2vmXj2BLHnE+wd8xJE+Ev4mc6wK4j3Kl9V+HlppI0
        mg/jT4dkPpQcMmmVp7sC65eNO6jwLZZcajjGj26zv1j7SMk04dvAXe975Z7Bew5Y
        1xc3+5koYGf2znJd4aUTgSu/5+6JbPuMNFl+UvKVlG5o9aW7HqJFAv0+EhJ9dZTk
        2KSJatGa6qtSX1XcC2Cwf0apAsQDVVqFCYaamkdx0yH1xxrhT5Q5kChp34RolIpN
        0DOYg8irumEtfIovsyoESq15TaCas7JaMtLAtJJIDDS52H1ev63cjfiRUfpORsao
        L5EsxNHfpVGPy/U+qwhOQXpBIDXYdfqu9ql6uXRkfQ==
X-ME-Sender: <xms:p0i8YuggIg-YroYixk92hlT4wo5AiwQstHs85tY54CK2yL7FiPeEew>
    <xme:p0i8YvCO7uhF7wOzzwPsKIjHPs3XTkK6Zo5Mj5_9tjNcIQQaFOZdjD7DyNU-bkqVf
    TT72XMcDsFveqJsNpQ>
X-ME-Received: <xmr:p0i8YmHUnl6H-wY6WK3KLDIyjLGWGJrP7Y4lJHI53CcjynKysG4jRW0NHZJ8y56181yCYn1TpXpjHn2pIIX6ZISkw_kr3EUmPRZxjPY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:p0i8YnT_vigU_8BLCltnugNwqxfVOg_g0JyUZnvLmqxUTTwgjp2sCw>
    <xmx:p0i8YrzACEbLCwz68gHCaFP8lKeVPB_molZVAJ1RXIKde4H3RBftnw>
    <xmx:p0i8Yl6UGeX592iNdqBSfGE_ifB6KOiUXAldkPfLHzkUpmAaE5xMsA>
    <xmx:qEi8YjflIjTfzcKG7P_pAR1dRL3MnKZeOM8XnF04d2uRdvpI9bD0Qw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:42:14 -0400 (EDT)
Date:   Wed, 29 Jun 2022 14:42:13 +0200
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
Subject: Re: [PATCH v5 13/28] clk: Take into account uncached clocks in
 clk_set_rate_range()
Message-ID: <20220629124213.2fuhlsjjtv3hnlqw@houat>
References: <20220516132527.328190-1-maxime@cerno.tech>
 <20220516132527.328190-14-maxime@cerno.tech>
 <20220629090146.8E3DEC341CA@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wlfn6nhswctj4syh"
Content-Disposition: inline
In-Reply-To: <20220629090146.8E3DEC341CA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--wlfn6nhswctj4syh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 29, 2022 at 02:01:44AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-05-16 06:25:12)
> > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > index 8de6339f4f8d..9aa5b946f324 100644
> > --- a/drivers/clk/clk_test.c
> > +++ b/drivers/clk/clk_test.c
> > @@ -362,9 +362,37 @@ static void clk_test_uncached_set_range(struct kun=
it *test)
> >         KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
> >  }
> > =20
> > +/*
> > + * Test that for an uncached clock, clk_set_rate_range() will work
> > + * properly if the rate has changed in hardware.
> > + *
> > + * In this case, it means that if the rate wasn't initially in the ran=
ge
> > + * we're trying to set, but got changed at some point into the range
> > + * without the kernel knowing about it, its rate shouldn't be affected.
> > + */
> > +static void clk_test_uncached_updated_rate_set_range(struct kunit *tes=
t)
> > +{
> > +       struct clk_dummy_context *ctx =3D test->priv;
> > +       struct clk_hw *hw =3D &ctx->hw;
> > +       struct clk *clk =3D hw->clk;
> > +       unsigned long rate;
> > +
> > +       ctx->rate =3D DUMMY_CLOCK_RATE_1 + 1000;
>=20
> Is this where we set the rate behind clk framework's back? Maybe add a
> comment here to state that.

Yes, I'll add a comment

> > +       KUNIT_ASSERT_EQ(test,
> > +                       clk_set_rate_range(clk,
> > +                                          DUMMY_CLOCK_RATE_1,
> > +                                          DUMMY_CLOCK_RATE_2),
> > +                       0);
> > +
> > +       rate =3D clk_get_rate(clk);
> > +       KUNIT_ASSERT_GT(test, rate, 0);
>=20
> This will almost always be true because rate is unsigned. Should it be
> KUNIT_ASSERT_NE() instead?
>=20
> Is there any benefit at all to this check?  We're going to check the
> rate with an expectation in the next line for what we're actually
> testing for, so it's not like we need to assert that the rate is
> non-zero before checking that it is exactly DUMMY_CLOCK_RATE_1 + 1000.
>=20
> I thought assertions were about checking sanity of the parts of the test
> that aren't under test. If the assertion fails then our test is so
> busted the expectation can't be trusted and we shouldn't even try to
> continue. It's similar to BUG_ON() and WARN_ON().

I'm not entirely up to speed on what is our expectations when it comes
to unit tests.

clk_get_rate() mentions that it can return 0, and it definitely
shouldn't with the setup we are testing here. So it was my impression
that we were in "totally busted" territory, but if you feel it's
overkill I'll remove it.

Maxime

--wlfn6nhswctj4syh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrxIpQAKCRDj7w1vZxhR
xaViAQCu7pFEOr0ACxrKXUsVN4bFwQxQl+xnROh1mOFqEBrfFAD9FdKwGvjTxXBd
91x5Y/JJ+0Fcf+wKrcZsE7UGtubaOgs=
=7S93
-----END PGP SIGNATURE-----

--wlfn6nhswctj4syh--
