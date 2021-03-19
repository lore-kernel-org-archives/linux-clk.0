Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DE7C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 19 Mar 2021 15:04:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 650056191D
	for <linux-clk@archiver.kernel.org>; Fri, 19 Mar 2021 15:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhCSPEZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Mar 2021 11:04:25 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52039 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230188AbhCSPD7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Mar 2021 11:03:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 919AE5C01DE;
        Fri, 19 Mar 2021 11:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 19 Mar 2021 11:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:mime-version:content-type; s=
        fm2; bh=dqb711OyQ9MSwiorUIvJrREblClDbeOAmJ9i+d9RDdQ=; b=cH5Gelr3
        8xcYdKfNimIzkYQezdCKPK8Nyq9/qmGIKHclzcGDQ5auLmcEAf0LlQd6XDJbBl/f
        Q16SgQrxP9y9AB/5jDGwLpruwmlIeh9hoPju8xz2tbfcO6f663Fo0hIklwQaDYXW
        W0SRfUEjPFuV4KMJAyjLFpViL8qMZlUIuL6oe+PnPpCq8qq4KbU/h5tsclzSw+Aq
        xd4+vOT0myqZPyY4AIHiaQwpTPyGumOuLoibxBgVF9gPMADjqnD0gUyz+m9Q2vrH
        Exuzi7WcSfzUmMbHhRyNKyiKSom9GJWZLo9S4nBRLpwFShNuIYKX1vnVaYGLKeTR
        1AaiklKvqJTdyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm2; bh=dqb711OyQ9MSwiorUIvJrREblClDb
        eOAmJ9i+d9RDdQ=; b=a8NbDky9vymX7H2fBWDAqd39TZBXlVMsHxdVYMniLTPfc
        iwwH6xwafTuKNk32hRHh11pIB1KdwdLD953ZLFfmSQrcEDQ2IZau0F22JN7j+RTe
        17NlVKSX1/4j7TyEoQH1ODJ3Yg868yFAMDx3hLnGh/qlSYTt3yH3wUUFSZIJx4k8
        1lIVhAC2P5Eb23jwgQG9Sjfmxe1a5gWOhPBFQstaPBLzCaym1FgOXKcubbXDpNfj
        LSXpUnKKlF2vLh6H+I4tXEAemaKfhCtvxMP08bSfQ7FGOsp7NK9ZOjg0Zs9g5FZs
        UMqZ8tEs1AGhVRnqoFT1hKrgpMFETWPLYSp7xxm2A==
X-ME-Sender: <xms:Xb1UYEpTKQ3IXTFqfsNz7Fa_9cgRqXQtIiLdPYM5FAOTSSQMCb21DQ>
    <xme:Xb1UYKlzGhjGXn7zm6D369DJ-YMDd70mB76PBOqO-tnXSZV6Xbvd66BDknmnM6ntr
    _rrYGm2o_GYHKwRdc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepgeehvddvffelveeiuefggfeiueduvdfhfeeuhffgleejleeghfdvgedtveegleek
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Xb1UYGEKHta4tmIYLPK5mG8vX32hfhocR7Hgczm-7sYgv8zPSOwb7Q>
    <xmx:Xb1UYDp-NJmsXhHeI-kAB_zdL8ttBg7kv_K0jHPU9kWxt_fy6N7LCA>
    <xmx:Xb1UYC7kOB0HV311VvJFj9um6t0vERr9s8K1ST67dhbp6xcduZHu-Q>
    <xmx:Xr1UYJ8AoYyE5rksmjsyyq52BCzuLcenwHfaC4EwmTGU1kRDRcMMlQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id AD4AA24005A;
        Fri, 19 Mar 2021 11:03:57 -0400 (EDT)
Date:   Fri, 19 Mar 2021 16:03:55 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Scaling back down a shared clock
Message-ID: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2pfhjhy3okbips74"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--2pfhjhy3okbips74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike, Stephen,

The SoCs used in the RaspberryPi have a bunch of shared clocks (between
two HDMI controllers for example) that need to be at a given minimum
rate for each instance (based on the resolution for the HDMI
controllers), but don't really have any maximum requirement other than
the operating boundaries of that clock.

We've supported it so far using the clk_set_min_rate function which
handles nicely that requirement and the fact that it's shared.

However, those clocks run at a fairly high frequency and there's some
interest in keeping them at their minimum to draw less power. Currently,
if we increase the minimum to a rate higher than the current clock rate,
it will raise its rate, but once that minimum is lowered the clock rate
doesn't change (which makes sense).

How could we put some kind of downward pressure on the clock rate to
make it run at its minimum all the time? It looks like the PM QoS
framework implements something similar for the bus bandwidth, except
that it's not really a bus that have this requirement here.

We were thinking about either adding a flag to the clock that would make
it run always at its lowest frequency, or to introduce a "boost" API to
bump temporarily the clock rate and then once done brings it back to its
default rate.

The first one though would be a bit dangerous, since it's mostly
use-case based, and if we don't get any clock user reporting a minimum
it might have a bunch of weird side effects, making clk_set_rate_min
required de facto while it wasn't before.

The boost API semantics would probably have a bunch of weird corner
cases. For example, how long is "temporarily" exactly, since for all we
know it might actually last forever. What would happen if we change the
boundaries or even the rate of the clock during a boost? etc.

I'd really like to get your opinion on this before I start working on
something.

Thanks!
Maxime

--2pfhjhy3okbips74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFS9WwAKCRDj7w1vZxhR
xXy/AQDzCNqTTtO4uVO9xg+RKZBiJwP1tZAK8lpTLxd/NWgmZAD/e5MwAZUNlPBd
xQOO0sL+sqzmfXhbeUGpgV6ZqLN97Q0=
=eQXu
-----END PGP SIGNATURE-----

--2pfhjhy3okbips74--
