Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A69EC2D0DB
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 12:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1DD824683
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579695107;
	bh=mL+0d/4YMdepMpqewqSVlsBO3foyzjlZH5fwG9gBFpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=UaSA/8pvt1LkrgT1wRPxxCp+qOsnAycliEpUTzONsX9qsEI1VUYqT4UmsPAj9076Y
	 pACrZ52ckmbfYt5sNXzyF3JP3TovipcWrnYUwDKEvvUHhlggPhX35jZsdzD4BaD5J9
	 m/vLAiINs9XOctkzVNXbbRVxPnzDIwHpmvrdXIF0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgAVMLr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 07:11:47 -0500
Received: from foss.arm.com ([217.140.110.172]:55672 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgAVMLr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Jan 2020 07:11:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D5B5328;
        Wed, 22 Jan 2020 04:11:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F171F3F52E;
        Wed, 22 Jan 2020 04:11:45 -0800 (PST)
Date:   Wed, 22 Jan 2020 12:11:44 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200122121144.GB3833@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <20200121083658.GH15507@dell>
 <20200121161512.GC4656@sirena.org.uk>
 <20200122073230.GK15507@dell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline
In-Reply-To: <20200122073230.GK15507@dell>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 22, 2020 at 07:32:30AM +0000, Lee Jones wrote:
> On Tue, 21 Jan 2020, Mark Brown wrote:

> > That's the patch

> >    mfd: rohm PMICs - use platform_device_id to match MFD sub-devices

> > which given the title hadn't really registered as needing any
> > attention...

> If I chose patches to review based on subject alone, I would miss a
> high percentage of reviews.  Maybe your mail/manual/brain filters
> need to be improved.

It's the subject line in combination with the fact that it's in the
middle of a big MFD series that's getting a lot of revisions where I
know I've already gone through the bits relevant to my subsystems on
earlier revisions - it's *very* unusual for new things to pop up in the
middle of patches to other subsystems.

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4oO/8ACgkQJNaLcl1U
h9A5rggAgdjslpaVNqvFe8JGgh2yTlx0PiAPFYT+zo6PdMyvntBbO7V8tgWxiiBW
DkfBVLZGFJb+b2ch6FrFaa8XFhbSJesV8T68+izWxy+aX75fVEruTj9IO0ZL4Z8r
GkS+J2/CWAYS9LFL+9BOSVp3ug5CiEwEXavKTrkodDvgo/Lkkf58Im4HEMTYBkc5
iCpNfI7rBRKVZBXyHjfiIrJVJ4ZCAel0zM3MkExOB5ea6S4/zURKJVCaDuqLZXTL
Dm1TZrcaEvB8b+KWJ6yjQQrO3dkn8g3mpx5QzWwKblIMjSqAm4fpdMgxWiZUG7PN
WKGHBo6zlFPnUeINqAnBzfRddLMM5Q==
=+32F
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
