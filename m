Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B69C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 16:11:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC7E961A1D
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 16:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCYQLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:11:06 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:49869 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229670AbhCYQKc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 12:10:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 11C99180D;
        Thu, 25 Mar 2021 12:10:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 25 Mar 2021 12:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=ESM4FqMgZ+0RUA2MrQvNkDgoDG8
        DnKWTVejSnhzrZG8=; b=PFnyArR9ee8fUlgucNHHvbum8Frykau+yGQ9xBXnkDe
        cbeLq5CiDc2ucWbiW8d9lAkwsukO6szoHliDeq40nwqkkGhh65YhXnHqpbvDMJWr
        jfvL6kq2PfeO52QqDlL1MYBiDHDJvkpfb7c/upGApYV+4f4TriWFRbEb+uA9HHA0
        oIGWOXxUqoY64pyXQ2bynZMw26YN2U0Z25loAx1VfxFAa7cMwAEPwHVELHH7XeM9
        I6KZJPhMg3XdDymFLC+1/f5hQxhMRhzJRIzZU6J9Wg7uErbxw480ScMmhESnzijO
        CVfmZ7NllpT1FSXkyuZax0Zr1rHTIvxDkXZJu+hEluw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ESM4Fq
        MgZ+0RUA2MrQvNkDgoDG8DnKWTVejSnhzrZG8=; b=VPiXrVIspFA+qwuBzT7hhm
        ICt8wJJeZGPFTaEKTeXJ3OW+5aJWaepnLjFVexmQxSRaPie2xcpaKlqGWHxktLcJ
        6cxpjcKgrtyCKy/5MV22w4a6/K0VqlnblyPCy0FnIOsz97x43OfZSsOL3AcfhzYv
        dEVqMJExwN5mwQZ82hxrE+Ca0QoxvpMYjjKCvcTvBIB9GU4vTRY88U8HD45etEYB
        KQOvQdV2TjoKwX443D1hkA7B0WrehLxMq0CVyg7o7w42luEJaZ5lz5ipVg9bK8Xw
        wB729yq5IVpux1qxreJjFkcg9HBb61DDoP9HESfgDSAzTr7/8YY453Zl7XKnXGEw
        ==
X-ME-Sender: <xms:9bVcYLj2RGigOEVprFHfgBnwFJtKnm9EnFwL7-poHPv-DA_lxvv-rw>
    <xme:9bVcYOdeDmxSu0JyGEm2Zb_PX02LaIZQwI2KFOcris8vMD1LH9UGQxgLY8MMvhWv8
    7CW-16fPbk0pLSEFFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
    jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
    ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9bVcYD4phYhMy8JW_hCHftBRSKDSVo29Ff2zLfB1VEgtXUxUU5LONw>
    <xmx:9bVcYHg3mP057WytmnjG5MbKqiR4sn79h_n1IFHzkxZ-nuZLDpZW6Q>
    <xmx:9bVcYKH9_zLDcRZS3yc05iYJa7y9y_Vfb6aI46Jqrx_GiyM15Y8xCg>
    <xmx:9rVcYFZuKf9UeNZd3giTjzOSv_9w4RpGuQCXRNsOw4W1w-ot59HCrw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 996DF24005A;
        Thu, 25 Mar 2021 12:10:29 -0400 (EDT)
Date:   Thu, 25 Mar 2021 17:10:28 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Abel Vesa <abelvesa@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: Scaling back down a shared clock
Message-ID: <20210325161028.u72koxewte7s65kw@gilmour>
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
 <YFxerzh3a4xSzRu/@ryzen.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pm4wpw6kzrsqdkmz"
Content-Disposition: inline
In-Reply-To: <YFxerzh3a4xSzRu/@ryzen.lan>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--pm4wpw6kzrsqdkmz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 11:58:07AM +0200, Abel Vesa wrote:
> On 21-03-19 16:03:55, Maxime Ripard wrote:
> > Hi Mike, Stephen,
> >=20
> > The SoCs used in the RaspberryPi have a bunch of shared clocks (between
> > two HDMI controllers for example) that need to be at a given minimum
> > rate for each instance (based on the resolution for the HDMI
> > controllers), but don't really have any maximum requirement other than
> > the operating boundaries of that clock.
> >=20
> > We've supported it so far using the clk_set_min_rate function which
> > handles nicely that requirement and the fact that it's shared.
> >=20
> > However, those clocks run at a fairly high frequency and there's some
> > interest in keeping them at their minimum to draw less power. Currently,
> > if we increase the minimum to a rate higher than the current clock rate,
> > it will raise its rate, but once that minimum is lowered the clock rate
> > doesn't change (which makes sense).
> >=20
> > How could we put some kind of downward pressure on the clock rate to
> > make it run at its minimum all the time? It looks like the PM QoS
> > framework implements something similar for the bus bandwidth, except
> > that it's not really a bus that have this requirement here.
> >=20
>=20
> Maybe interconnect + devfreq is the solution here.
>=20
> I did something similar here:
>=20
> https://lore.kernel.org/lkml/1613750416-11901-1-git-send-email-abel.vesa@=
nxp.com/

Unfortunately, this is some internal device requirements (internal state
machine) so we don't really have an interconnect there

maxime

--pm4wpw6kzrsqdkmz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFy19AAKCRDj7w1vZxhR
xfLyAQCBSfoHav3DkNO8BLFp2KsdwTBj8LB+kM+uttcAIM/0cwEA3hov+H/9DoDE
F/muqmF+E3PGAA8TzszsekIo5og9TQg=
=885w
-----END PGP SIGNATURE-----

--pm4wpw6kzrsqdkmz--
