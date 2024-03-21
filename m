Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931884FC8
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711030337; cv=none; b=WVILfzz197M77FGmXCDkllqp2OLCJY+d8Mse8Tkn4pilzg6WrrstJy0sMKPm5LIPoBc+EojwYuAydWaLMGDY5vma09fMWUudOCfTIR0r1oeJ+mOyPeYakp+o/74jorU2nbPgb/lbBC7zXBfbvn7sUFtM85zm5vlhmXSMIx65GNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711030337; c=relaxed/simple;
	bh=hYKb+B81JZWuRL8wHIsxuFruFkxryc76n9zuvVbBsYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vE3O4xaWss8ncjkSuTpmS0uU56lYeaUfH3ucD31qFbkAw0Ao8dDjqM4vcPPv+rKavERFZLB/+0ylOqwwM8lOyC1mHTg2mZ/PfI1+v0CLLVP7b3CMCxtJyTWwosYGyXoWHFP/YwoNWQuf34wPNJWGYQCQ2PMLL+tuqv18CdbmVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rnJ9D-0007Gf-1R; Thu, 21 Mar 2024 15:11:59 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rnJ99-007fFS-Hl; Thu, 21 Mar 2024 15:11:55 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 215602A8CE9;
	Thu, 21 Mar 2024 14:11:55 +0000 (UTC)
Date: Thu, 21 Mar 2024 15:11:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: imx: imx8mp: Add pm_runtime support for power
 saving
Message-ID: <20240321-banjo-glider-767ee4368dc0-mkl@pengutronix.de>
References: <1711026842-7268-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6tie6ol7qkt2yffl"
Content-Disposition: inline
In-Reply-To: <1711026842-7268-1-git-send-email-shengjiu.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--6tie6ol7qkt2yffl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21.03.2024 21:14:02, Shengjiu Wang wrote:
> Add pm_runtime support for power saving. In pm runtime suspend
> state the registers will be reseted, so add registers save
> in pm runtime suspend and restore them in pm runtime resume.
>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
> changes in v4:
> - use struct clk_hw_onecell_data clk_data in priv struct

Well done! Looks good to me!

For the data structures:
Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6tie6ol7qkt2yffl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmX8QCcACgkQKDiiPnot
vG9N5Qf+MFE6Uwi/4mzSsaklYvqgzCsLgerxRmozvrrscwMpR53/I0SsCtgThCiR
pXeTSrtU6V2UqSOz7ncrh8KgDET9uzkHHy565JS4jiTVIMgfZ5JfD8GBIHOw8sxc
5ZNrefSDFD8sKP4PbQy4rSmzpk8knh7wbmLI1U+hCfyeYqcUD+rG314XsR7hk0EK
gsVyZtiQuV6bLzbUeqMHQRE4r+yXRAaWAq8dcR1Itthb1rsHAvqDxmUCIE9jIWaL
MfwLXLRkNdycxtXJPvEO2sDu8yYpagL7zTwJHS8c5X9YPAeSTwhxmlo3jc83GK5o
G6QyJYf7lw8YD70L7D8Ais5glkwVAw==
=WMvz
-----END PGP SIGNATURE-----

--6tie6ol7qkt2yffl--
