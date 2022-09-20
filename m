Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D07C54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 20 Sep 2022 12:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbiITMgE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Sep 2022 08:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbiITMfo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 08:35:44 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9F3754A3
        for <linux-clk@vger.kernel.org>; Tue, 20 Sep 2022 05:35:41 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id DF2283200A07;
        Tue, 20 Sep 2022 08:35:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 20 Sep 2022 08:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1663677337; x=1663763737; bh=X8Tn9L6l3u
        YAQL0VchxRl1Blatny/U4vljuAmQh0HD8=; b=s6vjSTeqk+Y8mKMI1Ppr7HKP2y
        q/fxwm+FUOt4y+FZmjIOF7Koa7HFsdIb951BRRKiub8XJBKuYYPdiEHRPEjqd3FH
        CsUPXbq6nIXWDHq3AXxNG0fc547QE6mXW6LAiAESaT7ThCv4s9IyA/QJvYc4FGvj
        6K+TKwcNCNnZXHOiiuNETGnDzK2LW9uc7/jJDoX8UXrpNXydr5xWcmCPXsJ5+hks
        ugijEM84bZZ68akyrnT2pKbTbuILInHWG+isJ6UNxqMy5h5/Z4No5Bm7BhRqXM8p
        FPS4E0aYU2MaxCK+5Yj9nxcnjiaFCoC6UdQ5USjyyotbbDFzD+29RDedWW8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1663677337; x=1663763737; bh=X8Tn9L6l3uYAQL0VchxRl1Blatny
        /U4vljuAmQh0HD8=; b=iwMXu6Yi/fhSOK1M+uALWfjQFH224pgtMeXG8ai1oqE/
        bLtyqlqFo/uR4iibOBM6rIYPbzihnuNjUoJ1uuF8C8kQ4nY7Wtt8s1fxIKLbwksQ
        BiDbYom/9U3KgKsVI/EotOAQxXB0fZkqqKzJpI/U8muoFxCJCalZd324rlZxQQQK
        7Vcdayqw+D1d54S8Z4HQjTWT91L5lItMfYuPPSU1TI2uTCbqGpmUxEQZgPtd+AgP
        7KHURe+Y6a+zEEEtwmuGGeYRKFvzCGpC5HHM3841oqK/AS623D6rfXWQ+C+7j8tD
        ZXrshVvTtTVVfZ/sndMZlVnMin8+Z1Uyz0B0QCoorQ==
X-ME-Sender: <xms:mLMpY1Qf2QtMew3clY3m3vsQk0f2QmWFUrYxC42XFzk6dLnScTzeWw>
    <xme:mLMpY-zq_R6spgbf6Phe-z9rhQFkeS_3gXDHrv7sZ5S4q_LnjFNzZjXw9FslRMuyq
    8ZkDsjNZDhnIin9FW0>
X-ME-Received: <xmr:mLMpY61mHYQf1AEHvhwrag6_pHEMqgIRJUaBsC5iEmSD9mxXh8DTsHJVqLCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mLMpY9CRI52UJoRTpnyk_INBiYBeiQvEdOowNlFsSsj5Zq1FfIJKwQ>
    <xmx:mLMpY-i5KeVHUZw58gtKsKy7_GHt5LxbAyHaMlTKQ21A4DfmcLjAMw>
    <xmx:mLMpYxo0kSKFkPBtr7Axy3Fq6XB-noMyjvx_VUhrej9LIIwQwlICRw>
    <xmx:mbMpY5PGgFydEt6fnM084J17xCa8-E7D0qrL8OTypRrjxjvK0DzpVg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:35:35 -0400 (EDT)
Date:   Tue, 20 Sep 2022 14:35:33 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v9 00/25] clk: More clock rate fixes and tests
Message-ID: <20220920123533.pr7vsfbugppuusrk@houat>
References: <20220816112530.1837489-1-maxime@cerno.tech>
 <20220902145305.znvsrcrcjrpr343c@houat>
 <20220917083137.DBB5CC433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t7qtwrwrycq26mkn"
Content-Disposition: inline
In-Reply-To: <20220917083137.DBB5CC433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--t7qtwrwrycq26mkn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Sat, Sep 17, 2022 at 01:31:35AM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-09-02 07:53:05)
> >=20
> > I believe this series fixes a number of real bugs in the CCF, in
> > addition to extending quite a lot the unit test coverage of the
> > framework. But if you just don't care, please just say so. I really
> > don't want to waste any more time rebasing and sending that series, and
> > pinging you on a regular basis if it's not going anywhere.
> >=20
>=20
> I've merged the patch series to clk-next. If things go sideways in the
> next week we can figure out what to do. Thanks for sticking with it!

It looks like you picked it up in a separate branch, but didnt't
merge/push the merge into clk-next?

Maxime

--t7qtwrwrycq26mkn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYymzlQAKCRDj7w1vZxhR
xT89AQDkmczRHXK2m6Yl3O6e8YICHbEjqCxajyKYaz4dfSIzugEArd2c5hquVu1x
eP/+s76HZMpycBsHZ3Bfds+sDKIhiAE=
=milo
-----END PGP SIGNATURE-----

--t7qtwrwrycq26mkn--
