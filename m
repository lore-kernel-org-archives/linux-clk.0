Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CB1C7EE2E
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 08:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238626AbjFMIWP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 04:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241163AbjFMIWK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 04:22:10 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFB3130
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 01:22:05 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id A928E5C01F8;
        Tue, 13 Jun 2023 04:22:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 13 Jun 2023 04:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1686644522; x=1686730922; bh=XB
        eckfw5YVdpxfRtdPhBQUf495CoFJyBQJzXNblbmME=; b=VQfDu4ZqKA74zl/Dhk
        tgG+ibsSfaKpNKOAsV1VNgNevtYJ0ScJqt+nDp700s2oEdLeykSFQDzG1Uae9YB2
        k03Xh3wqMZG9vPGgs1WfsxXQPY2wGHZ392mDEoopEZceBjWdk1DG5OTKDoQb4k7L
        L8GCOIPPrcHK+WHtga8Wk0RqnnxbSd3Bvp1zK7T3Os3hUvH2oTLgN5fmutplTTeU
        sEWHvUmkaLSIugjJT3nljgnVUi7bgU88VoqtQ+yxr2H5GmXOis6QHuN1JV6NJno5
        NZR2vffhPWz9mGP6YP7fx2gVFdtavQDF7uvj3dVTUJ5cuXjk9Idx7MT1FELZ2lOL
        VgmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1686644522; x=1686730922; bh=XBeckfw5YVdpx
        fRtdPhBQUf495CoFJyBQJzXNblbmME=; b=T+UBdd33a4Ao/4zppWWiBpURMm8bJ
        NpufC2tqHKgFCr3DuAghVVAfT9OFcEPjnygyUb0C+ahsQXBbnRW3a2lpVl4mWtDp
        H5dln26YSQQN/ILHhnl6SwpM6oi8jUNughBUG1+dGaNNndH4EdAgsQzhza3TyUpP
        fMqhU+pbvLObtABCn5wqKGmfW/xj6H0PY10rlt0+YDShPMRhr79qZLY6H4VpzX5g
        GDbBUaP2gJLb2p0VXpmct26KCu2MLjmP5WDkcqDup0f5Vhyzb/oq4isTITUVxM4V
        KIJZemJmIKMtfBMH6Lis9YtHpM0xUuNbUo0TYuXtnsUg+Q//nDXtg1jDA==
X-ME-Sender: <xms:KieIZBt0bZE92no3CyYcHyx3uIT2dLh_LkyS5IKo7YUJvTtS_DrnNw>
    <xme:KieIZKfNxPw6RzqacSPCHyjxuPDiyJ131K3LFPMixEYvzjhpiSo4mh4P_E76_SquJ
    hj_y-YmpRT1YFr7asc>
X-ME-Received: <xmr:KieIZEzy48_3oXUrLtBcc26VJBlBe5J3C3vBpbjPq5LOW5130LIsbHgE5WjxakHLOj60Fm2Q0gX7KmbyuWqz2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduiedgudefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtdfsredttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepueevudehuedtkeevgfduveejueefvddvvefhjefglefgtdekveeugeet
    kefgleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KieIZIPesdoA4ojzEEq2oDErwmZXpeCwcE3d84CCN-BoekPRV_5Qag>
    <xmx:KieIZB80reK514uAKAU9v-v3w2mYhZOBOWySffAR38ySqp2cFmi6Zw>
    <xmx:KieIZIWnDZBfzhXEvStSiW_9ZBp6ofxz7hycdIru4wk1nEucJHKKjw>
    <xmx:KieIZDkXZ0um_ln-COHjmb-RfvHSP-QvkpCJzugzY9IT8w4BrKaX3g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jun 2023 04:22:02 -0400 (EDT)
Date:   Tue, 13 Jun 2023 10:21:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 07/68] clk: test: Add a determine_rate hook
Message-ID: <ukjgbguxqxfs6u2igivmxmmidvjvumqfptwvjymk7n6p22isqv@tbubrts5a6wp>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech>
 <e8a1f3244395dc707a1d741e2d166a7b.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y3khdyz7af7h3pfc"
Content-Disposition: inline
In-Reply-To: <e8a1f3244395dc707a1d741e2d166a7b.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--y3khdyz7af7h3pfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 08, 2023 at 06:41:56PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2023-05-05 04:25:09)
> > The single parent clock in our kunit tests implements a mux with a
> > set_parent hook, but doesn't provide a determine_rate implementation.
> >=20
> > This is not entirely unexpected, since its whole purpose it to have a
> > single parent. When determine_rate is missing, and since
> > CLK_SET_RATE_PARENT is set for all its instances, the default behaviour
> > of the framework will be to forward it to the current parent.
> >=20
> > This is totally fine as far as the tests are concerned, but we'll start
> > to mandate a determine_rate implementation when set_parent is set, so
> > let's fill it with __clk_mux_determine_rate() which will have the same
> > behavior.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk_test.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >=20
> > diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> > index b3ed3b0e4c31..a154ec9d0111 100644
> > --- a/drivers/clk/clk_test.c
> > +++ b/drivers/clk/clk_test.c
> > @@ -104,6 +104,23 @@ static const struct clk_ops clk_dummy_minimize_rat=
e_ops =3D {
> >  };
> > =20
> >  static const struct clk_ops clk_dummy_single_parent_ops =3D {
> > +       /*
> > +        * FIXME: Even though we should probably be able to use
>=20
> Are we ever going to fix this?

We probably should, but I'm not entirely sure how.

> > +        * __clk_mux_determine_rate() here, if we use it and call
> > +        * clk_round_rate() or clk_set_rate() with a rate lower than
> > +        * what all the parents can provide, it will return -EINVAL.
> > +        *
> > +        * This is due to the fact that it has the undocumented
> > +        * behaviour to always pick up the closest rate higher than the
> > +        * requested rate. If we get something lower, it thus considers
> > +        * that it's not acceptable and will return an error.
> > +        *
> > +        * It's somewhat inconsistent and creates a weird threshold
> > +        * between rates above the parent rate which would be rounded to
> > +        * what the parent can provide, but rates below will simply
> > +        * return an error.
> > +        */

I guess it's mostly a policy decision: __clk_mux_determine_rate() always
has been returning rates that are lower or equal to the target rate.

If no parent can provide one, then the obvious solution is to error out,
which creates the inconsistency mentioned above.

Another solution would be to pick up a parent by default (the current
one maybe?) but then we could return a rate higher than the target rate
which breaks what we've been doing so far.

I'm not sure if one is better than the other.
Maxime

--y3khdyz7af7h3pfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIgnJwAKCRDj7w1vZxhR
xZAOAQCScse0Plo3xSkQ0Bgbb8C4QbZAX5dqE2yA2n7/X8ThSQEA7vLaOQqTfkjL
eP1lsYtetYhxhOtZ/iCgCGNro0Viww8=
=sNoT
-----END PGP SIGNATURE-----

--y3khdyz7af7h3pfc--
