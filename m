Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A0FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 13:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA70C61452
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 13:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235524AbhI2N3b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 09:29:31 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:41655 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229846AbhI2N3a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 09:29:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 79F072B011A1;
        Wed, 29 Sep 2021 09:27:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 29 Sep 2021 09:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=6C/iJ1ffI9rUTpcaRyBkXlkx1Zb
        QQSzY1AH6rDwK+gA=; b=GkkoLWN3ri9d+BfDmgSm2OKR/XM+FqAmQhi5SYtoSlK
        sT4AQMylXQVJotsD5eUckYqxMY9UmOn3v5wDXt9w/y88z8qVHwAcqBkYJ8VwINPM
        bcu47E9plfgPbvaRzRrqTT9ZveQLXULZnvXRxhfgBln8wMfQ5HQAR2jbm79DHYvc
        jS03fLGlo6J+MBQVhIPyF79eC4lQ/GNF4AXGZqr5Wn9f3MVcVB41+SK7gduU33sb
        fIsZLmNtoCN+hb2Stf5n2feT7JkLaq+4cr2JSkJlK4Ln6uZSRZbHPbGqO2LMugIX
        eHvl+Xw6hOyXpiJR+ReFlbb5Z1QgYejkKupntmk+wtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6C/iJ1
        ffI9rUTpcaRyBkXlkx1ZbQQSzY1AH6rDwK+gA=; b=cRxhesrhf48+fFs+bZQONN
        SD6ToSeTE2KbD3yjtbqLKmOXeHgGTMB8efTcWkQS6e28Y4aBRoH4EBbUHNsegF8C
        Khmew77Af076NbK2AN62gRm+wEO/T6koUVz/iIrQq0+FnETl74rHHIs0/9kG+MA+
        O6uStJzfSGCooUoI0ZZrW4DMFqGGkaDDFiDrG7Tjl4R6OZ1l5tQ/ABHwl1vaZnBP
        68RCbNK3HC1yHECJPC3ZXCmQk6x9RZgX3y5rZxcZyjcRidx0eBjI71OhEW/nHCzn
        UPFFg8JYc7iU+cmLhMnFJbRk3oHJZVo4oIWbbcPd1GcA/L/Bq+g24ijkKzIhgH7g
        ==
X-ME-Sender: <xms:02lUYTbdgYULFKbGxv0s_kmKWf1sA0bV1Ou-cZ4Q96-IRqE_EoAV0A>
    <xme:02lUYSbQx45e9NJf17zy7hlYLsfGw2W8o-FKCsZA-HKS0o6evToFGtyO6bUt9aYQe
    FWqVfo5hXS8-agsjWE>
X-ME-Received: <xmr:02lUYV8cfh4b7jeJDfWioepGq1-qsR6juzrZyGdDrRsuIjYrmKBMwU3GcGpdFpPHc0EUBPzOfgTPl2XzsjVKyz5LAP-ExDiAZ6sJNf3D>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
    gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:02lUYZraphfZcLjVsdZ89lJV2yrE-iLQc9Dt7wHsI6AZtvjNiu02hA>
    <xmx:02lUYeozrUhhK-Jt7VgHtK_b50cn3Dp4D98h_JwDdddYH8_36NNIDA>
    <xmx:02lUYfTyAdc4O1AURxw5GgyQNS3vrANQkkaVEgwtUjyNj_MMEvocfw>
    <xmx:1GlUYbSqinCmnkRjqdhphGPpQOswR9TRgMcQmkxqs5TlFshqJOjN7Ih1084>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 09:27:47 -0400 (EDT)
Date:   Wed, 29 Sep 2021 15:27:44 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     nicolas saenz julienne <nsaenz@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/5] clk: bcm-2835: Remove rounding up the dividers
Message-ID: <20210929132744.ursafra4jajpmljg@gilmour>
References: <20210922125419.4125779-1-maxime@cerno.tech>
 <20210922125419.4125779-3-maxime@cerno.tech>
 <1d94747e74061f05395c34a4c441f96823dbf53a.camel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k7dl7qcxxmtg7pfs"
Content-Disposition: inline
In-Reply-To: <1d94747e74061f05395c34a4c441f96823dbf53a.camel@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--k7dl7qcxxmtg7pfs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 28, 2021 at 06:26:55PM +0200, nicolas saenz julienne wrote:
> On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> > The driver, once it found a divider, tries to round it up by increasing
> > the least significant bit of the fractional part by one when the
> > round_up argument is set and there's a remainder.
> >=20
> > However, since it increases the divider it will actually reduce the
> > clock rate below what we were asking for, leading to issues with
> > clk_set_min_rate() that will complain that our rounded clock rate is
> > below the minimum of the rate.
> >=20
> > Since the dividers are fairly precise already, let's remove that part so
> > that we can have clk_set_min_rate() working.
> >=20
> > This is effectively a revert of 9c95b32ca093 ("clk: bcm2835: add a round
> > up ability to the clock divisor").
> >=20
> > Fixes: 9c95b32ca093 ("clk: bcm2835: add a round up ability to the clock=
 divisor")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
> Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org> # boot and basic fu=
nctionality

Does that mean you're ok with merging it through the DRM-misc tree?
Florian, Mike, Stephen, any objection?

Maxime

--k7dl7qcxxmtg7pfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYVRp0AAKCRDj7w1vZxhR
xSWSAP9XndCsJarnvHMEXFLHhCdYgDMbnHRCxZttFGFS4pAP6gEAzwFfFa+DnjcF
dhUDt6RJQPGoYz/lejjdLlzIvSIkeg8=
=7O+H
-----END PGP SIGNATURE-----

--k7dl7qcxxmtg7pfs--
