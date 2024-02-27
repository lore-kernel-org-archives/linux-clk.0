Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1FC54672
	for <linux-clk@vger.kernel.org>; Tue, 27 Feb 2024 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019544; cv=none; b=YBFTItDai+SvJQ+fD/A2hwXP4hItd8Sn4aTzSKMiZerKvrlXTBiHT7tHFutft2OtG6vPZcfarvkSWO9dzJSjc0MkDzvQAH6i+0sb8vNiLlYTCWgjcMQHmGn7VoRrlR06FjSZ+zom1m8Veq9M69M7S3U7/T+SrxCC0Ui24w9EWb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019544; c=relaxed/simple;
	bh=5bM6/TbEseMrHcQY+p2rxrVxolAj6mAGNSGiPP3s+p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI5uc3ASf9FIZjUG107u3eumozcoNDQvVkK31Nt5UOpkivnC1028kR2iMKhgwFDbKKg1/dIphf97BS44hwJbNm0Fh22Ddgtau2bF/R2bFOojCDje5bfKnv+WQmnts3ejt5WwhccRJUcdvgR7/H6P5X2hVBFtWKuRatGRNfQKudA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1res3D-00049D-SY; Tue, 27 Feb 2024 08:38:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1res3C-0039EX-BB; Tue, 27 Feb 2024 08:38:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1res3C-00CIrj-0q;
	Tue, 27 Feb 2024 08:38:54 +0100
Date: Tue, 27 Feb 2024 08:38:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	kernel@pengutronix.de, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v2] clk: Add a devm variant of clk_rate_exclusive_get()
Message-ID: <n25yhjcopyon7yuo2l6t6akklrfz4l3flcfl34aycdlr7x4yaf@ta53zqedauzo>
References: <20240104225512.1124519-2-u.kleine-koenig@pengutronix.de>
 <f4noroegkbikrsjeisqlel46cu54emhnndtncnj4shygsbcaem@lixfb7ezeo5t>
 <a2v3qm3erl7lfsmg445zyhihvtybbeis4ntrsdlqdf5wpjlyy5@bc7k5zyvzeyz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="el57atpm4xfb4nzp"
Content-Disposition: inline
In-Reply-To: <a2v3qm3erl7lfsmg445zyhihvtybbeis4ntrsdlqdf5wpjlyy5@bc7k5zyvzeyz>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--el57atpm4xfb4nzp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Feb 15, 2024 at 10:39:00AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Jan 25, 2024 at 10:44:45PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Thu, Jan 04, 2024 at 11:55:11PM +0100, Uwe Kleine-K=F6nig wrote:
> > > This allows to simplify drivers that use clk_rate_exclusive_get()
> > > in their probe routine as calling clk_rate_exclusive_put() is cared f=
or
> > > automatically.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > > Changes since (implicit) v1, sent with Message-Id:
> > > 744a6371f94fe96f527eea6e52a600914e6fb6b5.1702403904.git.u.kleine-koen=
ig@pengutronix.de:
> >=20
> > Given that I'm not the only one waiting for this change (see
> > https://lore.kernel.org/linux-i2c/20240119072223.3986183-1-alexander.st=
ein@ew.tq-group.com)
> > here comes a gentil ping. It would be great to get this patch into next
> > now the merge window is closed.
>=20
> Is there a chance to get this into next and then v6.9-rc1?

I wonder if this patch is still on someone's radar and why it wasn't
applied yet. Does it need an ack by Russell before Stephen picks it up?
Is it too complicated and needs more time to review? Can someone please
comment what the stopper is here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--el57atpm4xfb4nzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXdkY0ACgkQj4D7WH0S
/k4cTAf9HT6L2MtgqVawPPK57URKIBN7dGt7UHl14PPe2ao91ugvb9rjpV+S0Ugn
CrOu4OirDTTb9Wh7WhpS/nsEiO0tRadgMgOkMd0skxCetsEv+4ZAmQaTo3LAWQw5
vcaoVjUqXSBez/TIiLxjmtzoDqjbsqSVYH5vPB7YEn5tPKgNvzGFAwBUmcnBOeuv
d2aZ2+UvZbRHTS2YAKZhkLBAzEFmPmVFp0mP9bhASPEWXRat1y1gT5DRWgZ7t2D8
H7q1UwgfZo0Kuns7gXBloik0AAcFufPPDJy8W3Xbt8yOGJBEmNTBOyY27ZlV1Dyl
ohR3k4ernOm2yH/Ky5IBN4NrPoKUyQ==
=UGap
-----END PGP SIGNATURE-----

--el57atpm4xfb4nzp--
