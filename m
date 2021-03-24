Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1144DC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 10:25:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3FF4619E4
	for <linux-clk@archiver.kernel.org>; Wed, 24 Mar 2021 10:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhCXKZC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 06:25:02 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:58055 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233440AbhCXKYe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 06:24:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 72B6FD59;
        Wed, 24 Mar 2021 06:24:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 24 Mar 2021 06:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=BhOfWdRFStCRVGCQaPz1+cPI1lv
        5DfrDmwaRhRJJtY8=; b=jmtZhAojeTooEy1QKZ1qm6qZVYSpYGDdubUrO0vUylI
        xUkBWJE3CJVvb8rDk8TMnDx+B4tm1vI7BlBXhjCJvqrO89EEzuEn3wrdo0o0nLiJ
        Gaa9aLGhHyT60J/bpmkcqXA2GBiGYGte9hnntyY22Ks/RVAHRW2iZhBPoqkXWKWE
        uM8ss2d0zxvQ99gcQuxz/Vrkxs+XSnqMbjnHU56ct1kayJV9ARXxpS3xHLPBXGRf
        dgw0KVO0un3NwAmM1XhkHuCnCKOa86vRYjhJ6e62PSv4+dP5eaIWLaeJKugvMMNE
        pQwR0iO0J7ZoR722U3BSA8EP+6I0pb2yvVbaLClfcFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=BhOfWd
        RFStCRVGCQaPz1+cPI1lv5DfrDmwaRhRJJtY8=; b=Jwlcc/HWzsNZFxje0Qoq9s
        2mGUEjHIaTs3iSprOMFeNdzDXnNM6mDKHO/1x1XwlV9jxa9+R0n2KO3QzEVpsAif
        Czqh+2C0GTtrXlWgyvVfB1tPJXVYjnWpiyNUcCnvaYc8eL97iz6nxJt3xMcHeku5
        M0vGmxEBYFd9gWd1FynFjvJE4yKgReuTzawXTQUoDIB4PRMkCLDZz0sQQlUfC0I7
        B2QCm0kg5D5yEo9WnC3o5uO9DNqFwRM50VW3AYcDUKO7OpTz3RYVDFt0E7ErYUfD
        sh5tKsLxruMkKEcAHGl+P8Y8QVk1+dT8x5TruQ0AxnzokKGnBBUHa0f2eoqKbyJg
        ==
X-ME-Sender: <xms:YBNbYFLA-O21O44Ys2GxzS4ZU52NsVK90FCKakqlXoiqZh6bNqU00g>
    <xme:YBNbYBKrQX9Bfx9W8BqzUmEUTHp5G9bvfa-yHxLuLBuWbJROI4on4zpZArOlo5cQl
    dt5ARIaJM1I5IdcM5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YBNbYNtaoHZSX_qcs79E3JxV0wbAHpa0qq148aQFzO1Oo_8IKA4Alw>
    <xmx:YBNbYGbdroSXilML_I1JBeBz7G1gz9Xx-e9iHDvrAjKTgGq4mpzDpQ>
    <xmx:YBNbYMasqWNys_ZTRY19InkFgarb89XzZJBGJzBemFX2_IL3hxthxA>
    <xmx:YRNbYDXDbZ7jXlp74BqBkEMfRKfriu6tKgPQVu_F0AH58a6wDb1n2g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3A5CF1080054;
        Wed, 24 Mar 2021 06:24:32 -0400 (EDT)
Date:   Wed, 24 Mar 2021 11:24:30 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>, Quentin Schulz
        <quentin.schulz@free-electrons.com>, Kevin Hilman <khilman@baylibre.com>
        , Peter De Schrijver" <linux-clk@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: Scaling back down a shared clock
Message-ID: <20210324102430.lzpup6kfwxxplntl@gilmour>
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
 <CAEG3pNA70G8R=ntBb4=XrQ6g2t7HKY-D-XYCOaww=usQ14KkrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="glnfmpna4xvbpp2x"
Content-Disposition: inline
In-Reply-To: <CAEG3pNA70G8R=ntBb4=XrQ6g2t7HKY-D-XYCOaww=usQ14KkrQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--glnfmpna4xvbpp2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike=20

Thanks for your answer

On Fri, Mar 19, 2021 at 12:58:05PM -0700, Michael Turquette wrote:
> On Fri, Mar 19, 2021 at 8:03 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Mike, Stephen,
> >
> > The SoCs used in the RaspberryPi have a bunch of shared clocks (between
> > two HDMI controllers for example) that need to be at a given minimum
> > rate for each instance (based on the resolution for the HDMI
> > controllers), but don't really have any maximum requirement other than
> > the operating boundaries of that clock.
> >
> > We've supported it so far using the clk_set_min_rate function which
> > handles nicely that requirement and the fact that it's shared.
> >
> > However, those clocks run at a fairly high frequency and there's some
> > interest in keeping them at their minimum to draw less power. Currently,
> > if we increase the minimum to a rate higher than the current clock rate,
> > it will raise its rate, but once that minimum is lowered the clock rate
> > doesn't change (which makes sense).
> >
> > How could we put some kind of downward pressure on the clock rate to
> > make it run at its minimum all the time? It looks like the PM QoS
> > framework implements something similar for the bus bandwidth, except
> > that it's not really a bus that have this requirement here.
>=20
> I'm a fan of _get/_put semantics for these types of critical sections.
> In hindsight I wish that the all of the rate change APIs followed a
> _set/_release or _get/_put pattern. clk_rate_exclusive{_get,_put}
> probably gets the idea right, but only for a limited use case.
>=20
> In your case, it would be cool to set the min rate at driver probe,
> then _set the rate to perform work and then later _release the rate
> once work was finished, and the default behavior in that case could be
> to try and target the lowest possible rate.
>=20
> Seeing as how the common clk framework just celebrated its ninth
> birthday a few days ago on March 16, maybe it's time for a rewrite
> with almost a decade of lessons learned? ;-)

Happy birthday I guess ? :)=20

> Anyways, I digress. For a real solution to your actual problem, could
> your driver do something like:
>=20
>   clk_set_min_rate(clk, min_rate);
>   clk_set_rate(clk, operating_rate);
>   do_work();
>   clk_set_rate(clk, min_rate);

Like I said, it wouldn't really work in our case unfortunately

We have several occurrences of that in the SoC, but the one I'm the most
familiar with is that we have two HDMI controllers that have an internal
state machine, and both are fed from the same clock.

This state machine needs a clock that is at least as fast as the pixel
rate (plus some margin), but there's no real upper boundary, it just
needs to be fast enough to move pixels around (as opposed to a "real"
pixel clock or an audio clock that is fairly rate sensitive).

The thing starts to get a bit messy when both HDMI controllers would run
at different resolution, since in this case, you would have one
controller that would call clk_set_rate to enforce its state machine
rate, and then the other.

This would work fine is the second controller runs with the same or a
higher resolution, but if the second controller runs at a lower
frequency you just stalled the first one by dropping the rate below
what its state machine requires.

clk_set_min_rate feels like it's aimed at what we want to do: we set a
minimal frequency for each user, and the clock runs at the maximum of
all the minimums.

Our sole issue with it is really that whenever that maximum of minimums
drops to some lower value (because the display is disabled for example,
or changed to a lower resolution) the actual rate of the clock isn't
changed, consuming more than we would expect from that workload.

This makes sense to some extent if we consider clk_set_min_rate and
clk_set_max_rate functions only as functions to modify the boundaries,
since we are still totally within the operating boundaries of the clock.

But then we're missing something to negociate the best rate for a given
clock between all its users.

> The final rate at the end of this sequence may end up being min_rate,
> or could be something higher based on the constraints of a different
> struct clk in another device driver, which is taken into consideration
> during clk_core_get_boundaries() which gets called in the clk_set_rate
> -> clk_calc_new_rates path.
>=20
> >
> > We were thinking about either adding a flag to the clock that would make
> > it run always at its lowest frequency, or to introduce a "boost" API to
> > bump temporarily the clock rate and then once done brings it back to its
> > default rate.
>=20
> New flags and boost APIs both make me a little sad :-(

I guess another way to implement something like that could be a callback
to return the ideal state of a clock for a given clock + users, that
would be ran each time a clock parameter (rate or boundary at least)
would change?

Maxime

--glnfmpna4xvbpp2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFsTXgAKCRDj7w1vZxhR
xQXdAP4lbTBzTgXP5p1JvHenfX+mXuXQRbypPnwoqm+LdE1SEwD8DsCGYg6UNxq8
dz5gD8FrA1GAkZoR5gp+qApwnPbW+AA=
=gOjc
-----END PGP SIGNATURE-----

--glnfmpna4xvbpp2x--
