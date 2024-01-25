Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69AF1292EA
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706219097; cv=none; b=R/HKfiQqz8U3lSEhD310XO1JTsUaV7DN07TvCqeaMAnHkXtUsEJLZCt360xgfHeuqS3FhEZnzDesyVmMr6H89v9qITNZp9AgMt2inCVcd1O+JbA3ULMxKdpoNeO1ImruCnQTFQhK+cmRQF0N2QXOdcbZ4CPpgzVRdIDsyo/C+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706219097; c=relaxed/simple;
	bh=8KV5JPgJBrvMHSbDqBVAyVv8wbCk20t4lo8z65TqgP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZ7l5upZ8NsGNiiXfBX3V7xmBchRrcdZKkEHyXYUGSnyOiwxv5coyyHTbegoz/206CenLqBM0qAjUFYNyQe6H7nI7GIJDsoDD8zCMEjZpLT5LSrVnpWV4G+qzrKS6IJAlVxHjUZM7dFC9alErJEZCJa0u4dDpYgSgKo4zhc0Qsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT7Wg-0003v8-P4; Thu, 25 Jan 2024 22:44:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT7Wf-002N8I-W1; Thu, 25 Jan 2024 22:44:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT7Wf-008ANx-2v;
	Thu, 25 Jan 2024 22:44:45 +0100
Date: Thu, 25 Jan 2024 22:44:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	kernel@pengutronix.de, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
Message-ID: <f4noroegkbikrsjeisqlel46cu54emhnndtncnj4shygsbcaem@lixfb7ezeo5t>
References: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pzygvxqjpeazzkhi"
Content-Disposition: inline
In-Reply-To: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--pzygvxqjpeazzkhi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Thu, Jan 04, 2024 at 11:55:11PM +0100, Uwe Kleine-K=F6nig wrote:
> This allows to simplify drivers that use clk_rate_exclusive_get()
> in their probe routine as calling clk_rate_exclusive_put() is cared for
> automatically.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1, sent with Message-Id:
> 744a6371f94fe96f527eea6e52a600914e6fb6b5.1702403904.git.u.kleine-koenig@p=
engutronix.de:

Given that I'm not the only one waiting for this change (see
https://lore.kernel.org/linux-i2c/20240119072223.3986183-1-alexander.stein@=
ew.tq-group.com)
here comes a gentil ping. It would be great to get this patch into next
now the merge window is closed.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pzygvxqjpeazzkhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWy1kwACgkQj4D7WH0S
/k6vUAf/brIKZkoBMYCX7JuNN+cnj7OKb8LoUzvh27UbbkPk1J31Ppatuc3qjTnK
uB4O4iTwYElYTlqoH7nD/RgdnRgoKbTHZKoJVOmB44615pLMqyYNJDpi/vakW912
4e/g72O1CnOBoBgj8Du2UWnvi4S3+LQKdDeL3Ero5nNhjby4aSERamf2sIqcijZK
W4HxbV5nrjUYIlNHEHnRHleBNqdmq48imitkITDfkN/3gobr5gAdBAiGqsiNieAN
ChgGQd4iAazGTut2s8CU5ThOPRXijLDOAj7kg2/Gmt4h3q9Ux+d2s5gs+SdwSxuJ
JvGuWxmAtZUJhrxMaWYRibIob4nlqQ==
=pq6l
-----END PGP SIGNATURE-----

--pzygvxqjpeazzkhi--
