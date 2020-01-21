Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68254C2D0CE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 13:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3203C21835
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 13:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579612263;
	bh=Ng6hbPiJmJhr/YvV2wiva2s65rLPKlsFU2Q5KtA79Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wjG28d/OwYFCloqDE/5XFkPL7Htxs6uHPAmuej1oWUo3I1pU+GvNwNptwya8ZLyA3
	 gFm/B3YhopuI4SbnU8Jsqzw0aWXUHNfuwqFN4kiAY7zRZkUHTpDjKfobpwdhSJjBbH
	 /mHxj1iKrROIseI8UAXmVN6xT+Vyba1MZcLlcUE8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgAUNLC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 08:11:02 -0500
Received: from foss.arm.com ([217.140.110.172]:43126 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbgAUNLC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 08:11:02 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4532830E;
        Tue, 21 Jan 2020 05:11:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B388D3F52E;
        Tue, 21 Jan 2020 05:11:01 -0800 (PST)
Date:   Tue, 21 Jan 2020 13:11:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200121131100.GB4656@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Content-Disposition: inline
In-Reply-To: <70ac7b71d5d54d4b90ded032214c473569b9fae1.camel@fi.rohmeurope.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 02:21:09PM +0000, Vaittinen, Matti wrote:
> On Mon, 2020-01-20 at 13:54 +0000, Mark Brown wrote:

> > stop sending me this series until the MFD has been merged, perhaps
> > just
> > drop the subsystem patches while you resolve whatever the problems
> > are
> > that remain with the MFD?  I'm pretty much just deleting these

> I was hoping the revision history in cover letter would be a fast way
> to determine if something relevant has changed. Additionally, I did try

All I'm looking at mostly is to see if my Acked-by tag went away due to
changes, I might look at the rest of a series if I have time but if I've
checked the bit that's relevant to me I'm not going to worry too much
about the rest of it.

> But sure, I should try to be more careful so that I don't need to do so
> many resends - and I really could drop most of the recipients earlier.
> Thanks for pointing it out.

What I was suggesting was more just dropping the driver bits while the
MFD gets resolved, I'm never 100% sure why but the core MFD often takes
a long time to figure out as seems to be the case here.  There might be
as many individual resends overall but each maintainer will see fewer of
them.

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4m+GMACgkQJNaLcl1U
h9BKSwf/amRSi5kOTHBHmHRKJe8WCgfxoPkzPyhnZgHTB3N4RiDzYNdfEMMQ2tlm
4bP6hXxDrYuZZvfm2nGVBTnjlpa86d8yDS4ED18H3rHgNs0YXdC5nN82bOYNfcKG
UvmeLt0MbXQYnLwNBE/wCC0vgr6WY9vcLi+WHBvFlA+uZwEAE9U3bwGkZ+eop82U
aShNaL2CETezt4EQgHLIBGev3fRbRnPJtgabY58dk/FT5ILRdZVwyC/3TKX0y88y
dWY/zlfukkRwBcvknjAwDkxWXPOxG6MrbeU9MDqo4Rl++VkmUhQHRNxGpesR6TrP
jRsdUqzobJC/p/EdsuF1j+LOfbOVKA==
=K9eS
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--
