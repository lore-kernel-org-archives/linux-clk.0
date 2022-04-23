Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09951C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 07:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233960AbiDWHfu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 03:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbiDWHft (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 03:35:49 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845501B12E0
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 00:32:52 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 148983200C6B;
        Sat, 23 Apr 2022 03:32:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sat, 23 Apr 2022 03:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1650699170; x=
        1650785570; bh=c1oi6TXTcCQk++oEWVFEXmjYzAMs9mRLfq4Dkflrz+g=; b=q
        dMP1si2rkF2hwnCiTR4q3cle9VhJauDc3dEDlBUsW3C2F4mtz3ZFiQchXN4906rF
        8U/gXFS1nVuIsWC+KG2avYpDXnFCbHJdO0WdJq/STBuzp+9j/Y4SvA+XEE4kfu+b
        2aQEhlk9dWbgMq5XUkGgwm+xlcHG0FIyWw3XXM9+pkd6SjUlfvAOZpdC5VDQvJ7V
        JEaL4nC7F0wFYzZNwAY93EvMew56qNCrfw6fj17PT8agravfRjC2IzfUkR2RKL/K
        OXREVzQLGIzQmBUvn5+TmalMkQ4/UwcJSIW0rwgrETiQavoKzflDpzN3mkXFSgYH
        quS51bEGgI+itrd6ZIe0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650699170; x=1650785570; bh=c1oi6TXTcCQk+
        +oEWVFEXmjYzAMs9mRLfq4Dkflrz+g=; b=YVHJnIJowCPD45KNplGnilEWIhoYM
        1mdrVLuwezsICzsRyccWcVFUZcqZDOjdnxdWEtOoVOLUTJxHGJVw+lW0v9HpP65h
        kj9RDXrGsWZIEPSZ+1KM9uwcfLpmMUNYFWk93CJ2y4tWvkt4apS6kNhk4DD0hmPB
        gQKdzsYVeAE5Y+2syV7rfieyNkYqc90dLAAR58D7zAwRSloJAo6Jcqzd00dGoPxi
        51xUCw1N9IcE/dQ+GkeuIilc/pn+xceSDS3ttzjdr0ew5lUV8rBxJH5XgaA4FTFi
        v8Mckj6pilVol6FhR70jcEJobRTObGcDz+BYS21GEUSC4w172/dEwOCFA==
X-ME-Sender: <xms:oatjYlIhGHKq7aoHUhJpIj4M10AGtLgDmDXmhXc-xchOioVJiv8L4g>
    <xme:oatjYhL4w122TR9MK3BS-1JNG-4v_W0yQh4NXTIThAQ7uZVbXEjhrXyrlc_DdUrEG
    gOmpAQNixIQ_3ILWzU>
X-ME-Received: <xmr:oatjYtsjSUHng8Md8w9cJPi7BLSEoVdij9SK1oyk1tIMxtFbJEL0nY4D1jtY5YqAxnJXfS9-9-aY4huIb0IEe_PtYOLpHHuR88rzbkc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdduvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepheejffefgefgieevjedvfffgvdfghedtgfdvueejvdejgfffvdeuteei
    vedufedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
    vggthh
X-ME-Proxy: <xmx:oatjYmZyIr9VdyDqdK78RSUSl9pBKX8W6sqkuC0oCjOfqwl2aMGGWA>
    <xmx:oatjYsYdvnrPRmXf_P77V-eM-RxUA3EkuuM7k7OLCo2OrhSi9txXkQ>
    <xmx:oatjYqAtIbkJqZg38FrmSReLqWYnY_RRUgl6_2VCYdMcz24elgnxxg>
    <xmx:oqtjYiO5xLwV3w_LzOsnElqWe5uf4kz3xc3kN07xPojNQKKb839Dew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 03:32:49 -0400 (EDT)
Date:   Sat, 23 Apr 2022 09:32:47 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 15/22] clk: Add missing clk_core_init_rate_req calls
Message-ID: <20220423073247.75ni6bwtvk4pf5fo@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-16-maxime@cerno.tech>
 <20220423035126.13A8DC385A0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220423035126.13A8DC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 22, 2022 at 08:51:24PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-08 02:10:30)
> > Some callers of clk_core_round_rate_nolock() will initialize the
> > clk_rate_request structure by hand, missing a few parameters that leads
>=20
> Which parameters?

min_rate and max_rate

> > to inconsistencies in what drivers can expect from that structure.
> >=20
> > Let's use clk_core_init_rate_req() everywhere to make sure it's built in
> > a consistent manner.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/clk/clk.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 83dd5f1df0b9..3a59152b06b8 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1480,7 +1480,7 @@ unsigned long clk_hw_round_rate(struct clk_hw *hw=
, unsigned long rate)
> >         int ret;
> >         struct clk_rate_request req;
> > =20
> > -       req.rate =3D rate;
> > +       clk_core_init_rate_req(hw->core, &req, rate);
> > =20
> >         ret =3D clk_core_round_rate_nolock(hw->core, &req);
>=20
> clk_core_round_rate_nolock() has a clk_core_init_rate_req() inside it.
> This is duplicating that.

Yeah, and it's an issue whenever we take the recursion path in
clk_core_round_rate_nolock() here:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L1412

We just call clk_core_round_rate_nolock() onto our parent clock, with
the child rate request.

clk_core_round_rate_nolock() will then call clk_core_init_rate_req(),
which will set the boundaries (after patch 12) and the best_parent_*
fields. The parent will then possibly modify the rate, its parent rate
(through best_parent_rate), and if it's a mux that allows reparenting
can modify best_parent_hw too.

We then return, and the caller of clk_core_round_rate_nolock() will have
its parent parent rate and clk_hw pointer, and not its parent.

The way I dealt with it is that I'll later remove the
clk_core_init_rate_req() call in clk_core_round_rate_nolock() (patch 17)
to stop updating the *child* request, and in patch 19 will create a new
request for the parent, with the parent details, separating properly the
child context and its parent's.

This isn't just theoretical, patch 19 has a unit test
(clk_leaf_mux_set_rate_parent_determine_rate) that will show how it
affects drivers too.

Let me know if you'd like to address this some other way.

>
> >         if (ret)
> > @@ -1512,7 +1512,7 @@ long clk_round_rate(struct clk *clk, unsigned lon=
g rate)
> >         if (clk->exclusive_count)
> >                 clk_core_rate_unprotect(clk->core);
> > =20
> > -       req.rate =3D rate;
> > +       clk_core_init_rate_req(clk->core, &req, rate);
> > =20
> >         ret =3D clk_core_round_rate_nolock(clk->core, &req);
>=20
> Duplicating again?
>=20
> > =20
> > @@ -2216,8 +2216,7 @@ static unsigned long clk_core_req_round_rate_nolo=
ck(struct clk_core *core,
> >         if (cnt < 0)
> >                 return cnt;
> > =20
> > -       clk_core_get_boundaries(core, &req.min_rate, &req.max_rate);
> > -       req.rate =3D req_rate;
> > +       clk_core_init_rate_req(core, &req, req_rate);
>=20
> So we put the boundaries inside clk_core_init_rate_req()? That sounds
> like it's required now after we clamp all the time.

It was already done in a prior patch (patch 12)

Maxime
