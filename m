Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794497695;
	b=Qj4C22alFQi79d513p1RW137M3uaf6xIYJ8tWKrYDVtTwqto63uTUImMVvXOUDTUWDs6
	 qZeasjeAlVLpckR9s9Iw3QAN+wojgkPFxrfs2XXH/gLP4ZloxnLh7jaD2XMD6fqabuAIl
	 Cv9uMlHU36q09dg5aZhupFeqQHF6SJu+wFau1dLo1yYwLsFqaXn2yYyP9a/QtWGEvX9W3
	 YFIWN4tSQ4i2GmceaUGxoz16BSYHnhoHFPnhMIQEjIv5DEtI4etpmuirs+H9DXROyWpkA
	 acfVfvB/yYnAdM1GNUnXrrJJmXD29EcLpSQZvAqrotMQwoGbzOVVWPUrbOdVQ5zpmcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497695;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=JRagoxBDJAa5Q1wRFKByojnXq0h1AFaHVwsm+1tOWgU=;
	b=1eViURfWpVljY4M7z7HJdjIpnDBxypiaNAmlYSDsDsjG2nn/XSIcSYtQNSubw2BddPDk
	 hH5Cgc0KQ0uLN7uRcHtMqK7JKhxA6PfU8dyVbgEi5C8zqPwHlqXR7/GUeBK8NSVpu9vxH
	 6jYGS1R2q2FdKrggbX1e3ESS12tAm8NMEN4btsXxlPEBy4ovrWTxxiw6djyu14GDKg4XD
	 9Ljx1CIAgQ17UteLi5T1ol2btPBgnUYpiYsfrBaB9tdvZeH1R7qHvxYCPz5Q4cwzSZQJz
	 mj0SMLgURwkOvSMW1RGaTmC8EdAfXbAMLg6Hd/QAyxOCyBZtWJLUz2nnNx5uwO1ppJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JxX9nc3F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C14606A8AD;
	Thu, 12 Nov 2026 15:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C14606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JxX9nc3F
ARC-Seal: i=1; a=rsa-sha256; t=1794497676; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CZdytktonm5eT3qUQpKVdePHZ78/3rk21ik9/Ys3ImiGTeNM7yhs/Vd0oTuzZA8qoC9I4EgN2UgORtNTd64EKBePn5wZ+I8NEkozwqIVK6zKjt8XBxZzXxEWo6P62qFZWvEyQklQt5W58t+QJoFYMZq5hkbcEOdr6p6KUuu92lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794497676; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JRagoxBDJAa5Q1wRFKByojnXq0h1AFaHVwsm+1tOWgU=; 
	b=BlkpEqRiyTfHPbrjdHsE1bSL5eEaJfSqQ72R5KoSrL439EwrZICcT2X5PUseafHW+lHN7L06nmBzygWRFMNRcVwpV2gknBR8Q9CPEbI12cLBAZf+eiQV7CLhptOOE6KPJzUDF3XnNLX8PXKDvSE39Dn7dzB2Ns4OfZCKjs5iu4g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JxX9nc3Fqx6Bys5vXStyOvxUTmJkEeXl05X9gSHdVOvBEtRuJJLI+ZOO3CMnEFxJrkHcyFI2cztCXC3BamEr64/uBe/3baQi7OILgA5LFurCV0rkoSa+zb+kd4ppu3+SV20uSK3VxS9K3V153dtBu3muZ1HSyjhMstxR6Jq8jvk=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=JRagoxBDJAa5Q1wRFKByojnXq0h1AFaHVwsm+1tOWgU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794497675183343.2615853487197;
	Thu, 12 Nov 2026 07:34:35 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id B986B180BC0; Thu, 12 Nov 2026 16:34:30 +0100 (CET)
Date: Thu, 12 Nov 2026 16:34:30 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris <computersforpeace@gmail.com>, 
	Maxime Coquelin <maxime.coquelin@st.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Michael Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
Message-ID: <avXcTO17vMLnmaJZ@venus>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="iwqnrilbg3gxhv3t"
Content-Disposition: inline
In-Reply-To: <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.473.96
X-ZohoMailClient: External


--iwqnrilbg3gxhv3t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 10:36:59AM +0100, Carlo Caione wrote:
> DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> PLL then computes a divisor of 7, not 1, for 5.94 GHz.
>=20
> Round up with (parent_rate - 1) / rate + 1 instead, building on an
> earlier fix by Sebastian Reichel. It divides by the full rate and does
> not overflow with clk_round_rate(clk, ULONG_MAX).
>=20
> Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing=
 large clock rates")
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/clk/clk-divider.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index f68216c65d3d..c3f46f9ee451 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -223,11 +223,21 @@ static int _round_down_table(const struct clk_div_t=
able *table, int div)
>  	return down;
>  }
> =20
> +/*
> + * DIV_ROUND_UP() without the addition, which overflows for rates close =
to
> + * ULONG_MAX, as with clk_round_rate(clk, ULONG_MAX)
> + */
> +static unsigned long _get_div_round_up(unsigned long parent_rate,
> +				       unsigned long rate)
> +{
> +	return parent_rate ? (parent_rate - 1) / rate + 1 : 0;
> +}
> +
>  static int _div_round_up(const struct clk_div_table *table,
>  			 unsigned long parent_rate, unsigned long rate,
>  			 unsigned long flags)
>  {
> -	int div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	int div =3D _get_div_round_up(parent_rate, rate);
> =20
>  	if (flags & CLK_DIVIDER_POWER_OF_TWO)
>  		div =3D __roundup_pow_of_two(div);
> @@ -244,7 +254,7 @@ static int _div_round_closest(const struct clk_div_ta=
ble *table,
>  	int up, down;
>  	unsigned long up_rate, down_rate;
> =20
> -	up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	up =3D _get_div_round_up(parent_rate, rate);
>  	down =3D parent_rate / rate;
> =20
>  	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
> @@ -423,7 +433,7 @@ int divider_get_val(unsigned long rate, unsigned long=
 parent_rate,
>  {
>  	unsigned int div, value;
> =20
> -	div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +	div =3D _get_div_round_up(parent_rate, rate);
> =20
>  	if (!_is_valid_div(table, div, flags))
>  		return -EINVAL;
>=20
> --=20
> 2.56.0
>=20

--iwqnrilbg3gxhv3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr13IMACgkQ2O7X88g7
+pp12w/+Jtgek0qMQ0a6JHmqzow6wkNT4+GjgGGKbd5CRBkx/uT1G8llmBdQ0GsT
89CBohhtcExHdubCspJD2ZFR3SidaGzOe1EElFfG5iSUTVIL9ptpY1HZfQtlkTL8
Q13lT2sr62yPExDHZVAYkxTsEKKVxycxcFSn+GrDPwzJaPqLqrM8GvvvJmorK8hE
v413+HPtFVZIi2OH98diCDcDiymZO8XdkxVOYT579at1P6EJNdnRoixPsp4MIiDZ
mbsHC/w+4xfbtpTgI8uZ5DoyAQV/K+P1vmrYyHCWEXOE9kjk1msJbLmI1hAzwoLG
xFl/NdclkfhwzHbFrSXyEPwYMfy5HezV32n2RBMciiSekTW3ga0Yri/p5MnX+XAv
LtmsoPIin7OrixZ59uRKsTDwE8gatqe4PfwlQBVykYkVbvptJ5rOQY5jqffxM3IS
9DpwMDixCZ78U34lppQURQhnqrX8KqLzpT6T8HZo6JUrRkncp1z/j06Tk3M3GjBj
uB1nhksHWIjS/7vGg0XhXTL2DfKWFsiGKj1mZ7tserSbN1Td2wG4Phga4xfJlbno
m4ARK5XTM1nYbvt7zHD+Icjci5qV3VS/qAFSDUlPHbMSNiQnHuRW4otd49S9Faul
tUHTTHMWi9Y28C28gdvfWd45ORUp6h936emA/VQl2IZw8YZfDGg=
=KjnP
-----END PGP SIGNATURE-----

--iwqnrilbg3gxhv3t--
