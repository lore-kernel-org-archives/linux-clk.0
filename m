Return-Path: <SRS0=oBAc=3K=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739A8C2D0CE
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 16:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BBFC2465B
	for <linux-clk@archiver.kernel.org>; Tue, 21 Jan 2020 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579624818;
	bh=iDsi8+4B9y9QAOLsr/dl5nAEor+qoMSKTflkBrE7cbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LouOQ4nERvI4XRsk8EYbMCTcS1T0IZPxPf1kMi1RRN1vAaVK48A3H6cguJH9+5mHL
	 dDgAnwhbV1XgF6P8yFL4Q0V4hF9tGMKSjILC319GTNTR1KhQ+PLTH2ZZb4w3ATa5fJ
	 PFJk86G4hJNBMY4c+ZetqTftKliD38JhU5EOQWvw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbgAUQkS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 11:40:18 -0500
Received: from foss.arm.com ([217.140.110.172]:45658 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726714AbgAUQkR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 11:40:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345B430E;
        Tue, 21 Jan 2020 08:40:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7E1A3F68E;
        Tue, 21 Jan 2020 08:40:16 -0800 (PST)
Date:   Tue, 21 Jan 2020 16:40:15 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: Re: [PATCH v13 03/11] mfd: rohm PMICs - use platform_device_id to
 match MFD sub-devices
Message-ID: <20200121164015.GF4656@sirena.org.uk>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
 <fc886259870ee2a67302b22a76c4347feff461ff.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dgjlcl3Tl+kb3YDk"
Content-Disposition: inline
In-Reply-To: <fc886259870ee2a67302b22a76c4347feff461ff.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
X-Cookie: You too can wear a nose mitten.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--dgjlcl3Tl+kb3YDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 03:42:38PM +0200, Matti Vaittinen wrote:
> Thanks to Stephen Boyd I today learned we can use platform_device_id
> to do device and module matching for MFD sub-devices!
>=20
> Do device matching using the platform_device_id instead of using
> explicit module_aliases to load modules and custom parent-data field
> to do module loading and sub-device matching.

Acked-by: Mark Brown <broonie@kernel.org>

--dgjlcl3Tl+kb3YDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4nKW4ACgkQJNaLcl1U
h9CE6wf/SicPr5c9+gMkQZUwm3Hxb3SENdi48/ATn2FNo5omIL/KDpITuK8I86Um
5CxTmoDOD8yqPqYm0iqTCDdSOHvhADqtxbMuOnp5AWcBc99hvldAncv9sXPII5uu
uWNY1X9+1pkjzS+oqMoyKTRyyTDkSizQ4cf1ID0Sre/sycEJ+3krqWXqmjUpOjJI
4eIYMTYU/w9FJ9XxX+0VoFe+aofb5MVGhnmMgeZDykPsQF/mNgW+nR78PYv35V3W
Lbbk9GL2HpTxW4qEYJz8ls5ONDLeFGDIWwnt2izeQUjOxcUH/LcUZbCiCBHp3pnt
SDaJsaRV3pdC7m3UdeFyS/reE24y5w==
=BuAW
-----END PGP SIGNATURE-----

--dgjlcl3Tl+kb3YDk--
