Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C4D4C2D0CE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 16:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4DD1C24125
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579623316;
	bh=2OsKGwNcCaTLydomjIJ+EsDq5TJO3Ag/pmqXp6ZL3No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=N4Wg1EAiKRxfaWHrop94IQZGtZ6S9dpN7Qhs6ObMqJp56QVnceHvi/rd4HDJzClH4
	 L52U0VAZaml17HT5g7Lxibeh/PJ39Grxkc/KWkhQlpx6fzSZrdK1jatFhRSZD3iA6t
	 muRsUgeuYs++l/h2M7QgZkdS57p66tRX9LTp5u5E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgAUQPQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 11:15:16 -0500
Received: from foss.arm.com ([217.140.110.172]:45406 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728904AbgAUQPP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 11:15:15 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B24430E;
        Tue, 21 Jan 2020 08:15:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92B503F68E;
        Tue, 21 Jan 2020 08:15:14 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:15:12 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200121161512.GC4656@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <20200121083658.GH15507@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <20200121083658.GH15507@dell>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 21, 2020 at 08:36:58AM +0000, Lee Jones wrote:
> On Mon, 20 Jan 2020, Mark Brown wrote:

> > This is the *third* version of this you've sent today alone.  Please
> > stop sending me this series until the MFD has been merged, perhaps just
> > drop the subsystem patches while you resolve whatever the problems are
> > that remain with the MFD?

> > I'm pretty much just deleting these patches
> > without even looking at them at this point

> Don't do that please.  You are one of the reasons he's resending.

Me not looking at something can't reasonably be triggering the volume of
resends this series is getting, we're talking multiple times a week
here.  For example looking at the changelog in the cover letter the
thing that triggered the resends yesterday was converting a macro to an
enum, most of the others seem to have been changes for individual
drivers.

> Please review Patch 3, or you will block the submission.

That's the patch

   mfd: rohm PMICs - use platform_device_id to match MFD sub-devices

which given the title hadn't really registered as needing any
attention...

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nI5AACgkQJNaLcl1U
h9DeNwf6AzutJ2kYfngdUE4j9mLhaaPHaKVaUgIBANU5/CyED0MhVNdjge/yhEru
cFAQu4NftFk0Mvdd/2AoRPl6eZJpxZ0E4NLOd3l0tUNsQH5hn7Dbitab5Lqsj0g9
dR9D0YzRzQ0hdSABcqSFi/CNa5NQObwkP2rhQX9nj1jEvNPtdyGSyoLJOyOGnMXA
FHdu0lXlo+gACvp6TyDL87+mPD1BdMTHUz5lcPRl5RYpGfkqJr212NFUm/PRC7O8
J3erd7rAtJgkMulz8IDL/LFNUV3LUP1YRSmxQoip0kbO8fhmO1VY1YyNvkgGWdeO
rCHxjD0u7I2LtNzf8urfumibchfJIQ==
=xMOy
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
