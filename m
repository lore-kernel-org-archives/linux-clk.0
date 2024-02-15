Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869017742
	for <linux-clk@vger.kernel.org>; Thu, 15 Feb 2024 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989947; cv=none; b=tadst9Imrd2yHUr/yQDkyGDIrOxB2OZYbXXuIQt1U/IIzO9Fry27TeOiYw0rOrIDgbEJX69IiGE8MCnFv1NR1JxOPo+jHdcGHTjO+cOiNaGCj/tEkWrWdirfh25oGlbwgCCp3uvH17TMUBwVAw6JbmsEEMSgOaUPd4Lq9IdustI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989947; c=relaxed/simple;
	bh=95fi5nN2of9hvh6FP5F11X6NqmJtqoQQdCWXMbLqazw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK4+SZkzEO/erNFK+hlj234q6O7Afpo51koFHewEZDI01dexMqKsDingT9sjFEv4eIQDF50r5ou/7uyb00UkCQKsWUGqKLklQWw+mGT7mNQH8J13cwBCBWhWOYESKjYm1SBvQO5RQl0x5FExop8Fo6+fOeZaVi68C9YYwRl7asc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raYCs-000389-AU; Thu, 15 Feb 2024 10:39:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raYCq-000rCz-TR; Thu, 15 Feb 2024 10:39:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raYCq-005HC9-2e;
	Thu, 15 Feb 2024 10:39:00 +0100
Date: Thu, 15 Feb 2024 10:39:00 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
Message-ID: <a2v3qm3erl7lfsmg445zyhihvtybbeis4ntrsdlqdf5wpjlyy5@bc7k5zyvzeyz>
References: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
 <f4noroegkbikrsjeisqlel46cu54emhnndtncnj4shygsbcaem@lixfb7ezeo5t>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5gtjxiskaykm4wii"
Content-Disposition: inline
In-Reply-To: <f4noroegkbikrsjeisqlel46cu54emhnndtncnj4shygsbcaem@lixfb7ezeo5t>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--5gtjxiskaykm4wii
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jan 25, 2024 at 10:44:45PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Jan 04, 2024 at 11:55:11PM +0100, Uwe Kleine-K=F6nig wrote:
> > This allows to simplify drivers that use clk_rate_exclusive_get()
> > in their probe routine as calling clk_rate_exclusive_put() is cared for
> > automatically.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Changes since (implicit) v1, sent with Message-Id:
> > 744a6371f94fe96f527eea6e52a600914e6fb6b5.1702403904.git.u.kleine-koenig=
@pengutronix.de:
>=20
> Given that I'm not the only one waiting for this change (see
> https://lore.kernel.org/linux-i2c/20240119072223.3986183-1-alexander.stei=
n@ew.tq-group.com)
> here comes a gentil ping. It would be great to get this patch into next
> now the merge window is closed.

Is there a chance to get this into next and then v6.9-rc1?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5gtjxiskaykm4wii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN264ACgkQj4D7WH0S
/k5HLwf/ZCge2QT8dBTWBs2PkqjfiWCw+sdZ81BNUtWS4lW/E4FeEYDfJT0s1dwx
4n2HuwfXMItQ5HiTeECCcfQwmiDDeQ3KXKFBXX0+wMBMDpjRuLfmR9UXmyHQlYui
5HFYSfSzoNq7XogbtfVyrCYHCd40wlv93+dHk4d7B0Pz7njRja1v8xG4S6ebZbvO
2kzJtJ2AGxbNCEHwPNgceLwPfOFhHHTg6l8NT2xGz6jCGnsOF52rsl0TKPmZpuwT
PDqzzMyuDMqpxDkIv3dw7rvD1sY3sHqsG9awzSCJ+6OXOpoF3l9ql6cBu9bAQN9v
/mdaf/Ox/HV2plvt8Zyl1YQfXZJ7TA==
=ArFk
-----END PGP SIGNATURE-----

--5gtjxiskaykm4wii--
