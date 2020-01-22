Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB65C2D0DB
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 11:58:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 010DA2465A
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579694318;
	bh=zvxL0JzekOs/rgWw6aUjFji+DOz/UzwZFXsi10vthE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Q4mpZfMLEaHT9PRoWHBAgMNhWZVvrPRENKt0G/0o9cDDQ1ikSs2kvG2oI6+zGk5WE
	 aX0uh/myy95McV5rRkwKwuuaNCVgBEuKMtO4ck3iN7pSej2KiUVL/DFD60nsVmD4EQ
	 57WNWGNKXyPOpPDiJCtXWGstS3IlMPWe53hvCLDE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgAVL6h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jan 2020 06:58:37 -0500
Received: from foss.arm.com ([217.140.110.172]:55580 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbgAVL6h (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Jan 2020 06:58:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1098328;
        Wed, 22 Jan 2020 03:58:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60A133F52E;
        Wed, 22 Jan 2020 03:58:36 -0800 (PST)
Date:   Wed, 22 Jan 2020 11:58:34 +0000
From:   Mark Brown <broonie@kernel.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-gpio@ger.kernel.org" <linux-gpio@ger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v13 00/11] Support ROHM BD71828 PMIC
Message-ID: <20200122115834.GA3833@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <20200120135446.GD6852@sirena.org.uk>
 <20200121083658.GH15507@dell>
 <20200121161512.GC4656@sirena.org.uk>
 <4d79e93ab4bd92d5a25a961350efe8ad821a11e9.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <4d79e93ab4bd92d5a25a961350efe8ad821a11e9.camel@fi.rohmeurope.com>
X-Cookie: Sorry.  Nice try.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 06:28:35AM +0000, Vaittinen, Matti wrote:

> And now when I am talking about this - I still need Mark's ack for the
> DT binding conversion patch (the BD718x7 PMIC bindings, not this
> series=20
> https://lore.kernel.org/lkml/20200115062921.GA9944@localhost.localdomain/
> ) - which I resent last week just for attention - but I guess patch
> naming is failing there too.

There's probably a bit of that as well but I think what happened the
last time you sent stuff was that it was sent at the same time as this
series and unless you're reading the subject lines carefully it looked
like fragments of old versions of that series or something.

> Mark, do you have any email hook for Cc: tag in patches? Should I use
> it for patches which I hope you to check? (I just learned the Cc: tag
> recently). Maybe that could help?

No, I don't have that and people just CC me on random stuff so I'm not
sure it'd help.

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4oOOcACgkQJNaLcl1U
h9Dj9wf9GnNpPHC3KtvF28plS0yJlR9gD6Yp7+bN+gO44g+VsTL9DHL/4mCEQ8Pc
yVT3tEUzgkpULU+ZE8VKaXaP4jHQGcNNlQbG8OKmY317061b1Sd48gdCSHn/Xu9A
PS9pXZVjmaGk6kQCIhKIWKGC65F74XLUsLUXKu2gzEdL5GroizsDDKD2N4a2iY+s
NPCspiLu4RmVvULNCj5qjBt9uJue90oiHRHMWr/vllRV1MkqGwD63/lqL+pWKj6m
DIA8Ux0SQMT8pVUUGkcETLwH6tQW4BCeJKF4g1xXYyKxtF7QKR3n7WXAwk6CeY69
ZXOpmZwN9bFbqDklFh0IrdNXsLT1xQ==
=cNqW
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
