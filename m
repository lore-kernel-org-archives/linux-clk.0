Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497947;
	b=zSVPLaOZv8FeyN+sqzOZMWwqEayti2jvJSIpgoxXU/TOI3v6lbrteAsmmxB3i23feBKH
	 80aiyC7ojVpu0LtxYKN3hjAWaV3GEQZklNxtMC+lp8H0ldrKcYaLOsPuQhn38lRjnR6ml
	 sxtHAdV2nD2pZfv2Q2bCpp/GdLHfoxVGju0mDnVq3eMGuooUPd0u1a9vmDoMt4OARmjMV
	 Pu854gY8dRJTN49i+FE2FRGiI0zf52YGMHwcSc4p0zmLm1YpeOuZkj+UKSvRla2e0DVOQ
	 GQdPsLLUqT6fK3TUZU2LDa+9DE1kLnQZWMOkO1Dk/SKrF3IDH6qzqBSDZqCUxNIR24Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497947;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=lIXJ87kxd9eQVBK6fk3UlegeNVro2twhhnyzAdeUOME=;
	b=jFw5+teA+yJn/1OKqbwmGVv/QLe3Aq6WSrVkMbfT6j66jke1VXB5A9WX2N5loGRSz5Zt
	 FexpSz5UdHjq5+9oCZ7FKdADQHNZOa22CSyLaTCT2mEkJRTcnVsDtgbRVIM1B0/2CSOz0
	 hqNgUuuhgXMhWwtCsbbnebM6JiwMz12sYnLo6abPwUUNLQ3gIHXonNOHkxgqP4yAnjYqm
	 lIMNwaM01Kstv3HaEdk9lC2f738AkGznvoDqMrxIL+AJrNl73lksq0Y3zvkxBWKzacBRP
	 d+O159iTZdAbvNtuV8sLShih/s4BDc0H2l/noibhexEr1qCJ+DLmhLA2ktqU/ZipPKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kJ1YY3YW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA59606A334;
	Thu, 12 Nov 2026 15:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA59606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=kJ1YY3YW
ARC-Seal: i=1; a=rsa-sha256; t=1794497929; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SZo2sOXQID8TA6Vw2Ck9Giu72ukoIQNg/cYKDFY1+ZlEt4IgmhP3aP+RLKIEfO/UabdBkevEL9h7e/SvImF6vI866eA0JUUkZBlOE6CA16vheh/nweSG1dhIzWh2AYpqTqm2t2eTGsWUH2DRppMs5uKlS8MpXUVyz2iX22bniZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794497929; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lIXJ87kxd9eQVBK6fk3UlegeNVro2twhhnyzAdeUOME=; 
	b=D8Z5R9giGMvwqbELAOQvDF93JqnTA37YRcJ/lAq/OG81bkVn97ihcUxBYETiCet6xE8iHf6/6PQe8ncIumGp3b/NsYarDwoDtvlHRV5SgSwvo1e20W/1q9eZc4mLvvbA5ITIVhacy/SMGQFint1BvEGoZoU2L2MsmVJ9PJ1KzCs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=kJ1YY3YW6Mk7MqC10zlRrIMspmDs4Cxh3P71adlO8fL7qTXWzgnUITF9bwyOIpfn71wWCSBvMj1Uajx9i9GCBn2R7ZAiupmIgsAbls5qBvy/Bmh3TAV5Sjxsf8PIGriPuYS6dpWfghNiPiVsenwLZb+Qz7h7QV2slDefKKl3L1U=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=lIXJ87kxd9eQVBK6fk3UlegeNVro2twhhnyzAdeUOME=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794497927174141.20643400838412;
	Thu, 12 Nov 2026 07:38:47 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 83AA2180BC0; Thu, 12 Nov 2026 16:38:42 +0100 (CET)
Date: Thu, 12 Nov 2026 16:38:42 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Brian Masney <masneyb@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Brian Norris <computersforpeace@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
Message-ID: <avXcic19CqrpL3SH@venus>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
 <179449618653.1227210.1767827907767958978.b4-review@b4>
 <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v3zf5vaosfj6ao5d"
Content-Disposition: inline
In-Reply-To: <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.473.96
X-ZohoMailClient: External


--v3zf5vaosfj6ao5d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 04:29:55PM +0100, Carlo Caione wrote:
> On Thu, Nov 12, 2026 at 10:09:46 +0100, Brian Masney wrote:
> > Hi Carlo,
>=20
> Hi Brian,
>=20
> > >  static int _div_round_up(const struct clk_div_table *table,
> > >  			 unsigned long parent_rate, unsigned long rate,
> > >  			 unsigned long flags)
> > >  {
> > > -	int div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> > > +	int div =3D _get_div_round_up(parent_rate, rate);
> >=20
> > _get_div_round_up() returns an unsigned long however it's downsized to
> > an int here.
>=20
> Right, but wasn't also DIV_ROUND_UP_ULL() previously returning a u64
> that was stored in the same int?

I would also argue, that this is a separate fix. Looking at the code
involved it goes all the way down to this incorrectly using int for
a clock rate:

/*
 * ...
 * @determine_rate: Given a target rate as input, returns the closest rate
 *		actually supported by the clock, and optionally the parent clock
 *		that should be used to provide the clock rate.
 * ...
 */
struct clk_ops {
    ...
    int (*determine_rate)(struct clk_hw *hw,
                          struct clk_rate_request *req);
    ...
}

Fixing that will be a bigger task.

Greetings,

-- Sebastian

--v3zf5vaosfj6ao5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr13YIACgkQ2O7X88g7
+pq9MA//VjlOYlQKPIhGRt9s18w0TNK/1g7sv6eo6UVp+cp3fI2t4tDOPd1X7XY4
a5qxhjd7e9HkaPO/G8oEeP2EY0BzYXOCjXrt7djjKtzSJz62hauxsBGFNdJHC0NK
FND471nMdxvFPbWQCfdcZY+EDhDZPpPgpN/72OeVHJx4AOWgSi5WVzx1xN5dSjbd
b8/pZhdbW9Fz4Du88m85Y0lBmz+WjCxcDeAwHn3IbSESqKn3t65LzFh2C3cXUe9h
mcWJjNdGAIPczEZH3N58LviUEeix47IM09DJnPaN9hgtqMYsPgsI0Bh/jtS/4F5X
wsZBLL/2ehvfrcFoCOxqNo1kIaqgcnNGQBqOJdErzdjaLsb+fPezlmuh8OuA267c
fsK/lHaZhJon9KpB50B9c/2mn3WlDO+RVDCNJpU4FyPgjMJCqxDNQrnT6PDKeypW
nC4WgsafpPGnGuPvsA2mqeJuvZ3cT4eE8lIptrYMJwpn6lqZiEmkVrzGPDePIf/P
6oHOoXFHWbcgoqZkx5u/W08K2G/FhD26qCm/dFdT3lfKKZipxYEczR3Z0e0/mi2d
WbuNRDNwhfInH+Gz35nRp1SCjY0DSdj9OCnh5L1XK+OMP5tAe22HWjG1F3LFdHrT
NE2Li21dKYIhFZD8wxyawUpJhM3HaszRjaTXFs0HqLsf8HjLiRE=
=dBFs
-----END PGP SIGNATURE-----

--v3zf5vaosfj6ao5d--
