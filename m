Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719F5C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbiEKOsg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbiEKOsf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:48:35 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B27EAD19
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:48:35 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 7CBB13200983;
        Wed, 11 May 2022 10:48:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652280513; x=1652366913; bh=pT5b/BLkuF
        wfP80McntfZSszFM+f8SWN+U6zGSETTwo=; b=Rn5xiiSC0rA9DqfAo7gar6vzpY
        k0zmju1/VMQoTZRUZeHniWD1N2IXtN+y0i69lfXvqPQN5xU5S6M++f7aBwW7o7FE
        PJUrpmBj4BY/2yhYAAiH2hsgCZq0VtgAaFaBG55gdHXvk3ahcHeDjhWSeN78T6SA
        spF2lj7uoJ/vvXmVs7Ju6QAydztA8vNOjTkjXghg/gpdeXV/udzKPI+ENdwF0e4D
        evdxheBxdHU9pziBpdBAb5O/FNrHqpt6WkTv6fohLu4iFPN4n57Ox4KG62Z/oMap
        WDrMx4PsNmHWu6yXHU+kvMHzmBe9lxd+lf6SwOImVKd638nZftXYHzJRbSyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652280513; x=
        1652366913; bh=pT5b/BLkuFwfP80McntfZSszFM+f8SWN+U6zGSETTwo=; b=g
        HdWwBiT+eMCypNTKT7bDDxj0UqL/L3Z/qkGn7pa4hVYS4lDF/iDrXqLxmiNh5poI
        f+VZCThRPW4ARuuyy7Vv+Y2CO2yGelNohNxtVNPdH546PVvauIGMvS+C0luwPQB6
        hGAEwvJJC3EIfT8Z3qXj5yDS1Z5XE41PtJGqs0VDLcsptu/TH9Vq9+tEyKycktc1
        21ytFjsoKfhjmSiLnS1l5pdyosZ+mXknMvPlHXUn7nSvLYXVpqOlG8ZMfNjqIHJH
        JI10jaNDL9dTnRlQyCUOlYZz1Nu2FCdfG63WdwGESLbVedWdF0RMJDChh6oe1eGF
        LyAZnlJfnoEiRqJySBu1A==
X-ME-Sender: <xms:wMx7Yp5IYzu4Ytjl8HkN7YwZAq1wQLrvs5rNp-6bL5GztAaSxs-Zlw>
    <xme:wMx7Ym77IbpDEmCLKtZV7gYbnBlReuQ7LLBSkdDovkElWrTQGctPXSt09UPRKzNkd
    UUU9hMEVkP53_qIfr8>
X-ME-Received: <xmr:wMx7Ygc6Je3mFnaMW4l68IBk26ohrkDP0kOigcWwI51fWq6-HOiy0L6y98uoY_TSLa2QNOESKgzrt8c0l3yrEX1C1R8A_xwJMQTnlHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
    vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wMx7YiJrU0BoJH1jvYGT5zN-KodbQsuQWAnegVwMh1WjLVTti1N2Vg>
    <xmx:wMx7YtLtYNFBxzkeOBFjF0p63yyZdwm09XUyJ95In9m_ffrPkkbpEQ>
    <xmx:wMx7YryKbhYEDH6y8MtB_3yhnTz_sdlWJgpAfXW6FRa8_YJxH-bOyQ>
    <xmx:wcx7YmWYgWTwhcYXfJHUUDhF8uLzBv9agBNXOemOZDlS4aTbkytjrw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:48:31 -0400 (EDT)
Date:   Wed, 11 May 2022 16:48:30 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 00/28] clk: More clock rate fixes and tests
Message-ID: <20220511144830.wgs6zt27gzckbzng@houat>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="madtzlpkgajssi3i"
Content-Disposition: inline
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--madtzlpkgajssi3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Mike,

On Wed, May 11, 2022 at 04:42:21PM +0200, Maxime Ripard wrote:
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
> recently, and two patches to address a regression with the RaspberryPi4.

Those four patches are fixing regressions in 5.18. Even though the later
patches are also fixing some issues, the first four should have your
priority over the rest.

Maxime

--madtzlpkgajssi3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnvMvgAKCRDj7w1vZxhR
xRfgAP9q7GToM4fvQC3RYuC38cvPocJPCbp8+E49Ee5dX5wOIAEA1R/YtHj3Pi4d
ampoFeTlLM8Cj6oVdbpwxaOIJj95JAI=
=Tpoe
-----END PGP SIGNATURE-----

--madtzlpkgajssi3i--
