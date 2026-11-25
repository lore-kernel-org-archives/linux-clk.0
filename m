Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633473;
	b=X0LEGwqj+DrZ7YltfTOz0XsipH8VtNxVmZP+CRR6XHtM4kOGnsc6Do+EQ9KgQq32l8Pf
	 bYIM44p0tnshujebduog8FdlX/y0dTKpV5GbfRWRDWDJ49JcfOlMcUC4FvJiio/YF/3IZ
	 Nt03lL/1/fQcQbTZzBaG+wjA5332AWrt75G4MvQss7yaSD1TpRJGZ39hrYuRYz2Q8vT7i
	 RTlVv0Jhxd5rpoaOm3Ng6o8MF/oD+ULTtjeImQSuJyX4bN0SR9NP4vpknZW3YipVsM2xk
	 mWyMCftZTYKeYZ6zDLAhAQ62xfsQ9vJstU0zStY2twkFm1+CncIa/tedqamWRyIp0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633473;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pA5kKd4iQVCR2KTF88e0onlEw0OIJivMaBXQAKw9JcY=;
	b=ZHFJg4wDax4VZZIp0SlqnK7r5mOzG/5qqAVmUiCdMQxmdg5NStBI7uuS5NvUpTV8QwZY
	 htjVJoIfkAoFqr2lSuT2t5/Cqs6/Ndo2MxQO+zBnVnAD2GsR8FSzbq9wyP8VJ79hN0BSQ
	 nbHa8bQblAoQA8Qf+IxcsPPoArFWBfmOGC9ET+owwC/vPMTeqYG0oOY/hNstDTexEd+hB
	 WsTkg9ZNzo6TYBc13RGQa/14Bw8OVa1XHGzmvjr9P6CTGsgDboOjGG2BZoa/EiHt8eqM2
	 bHIgXj04XAD1CoLl5hd22y4Xqq78Tot1/oEBVm/p2YLfFlfVJyuVMxXh3IhSU1oeeMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJCKwfY5;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F6606A326
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJCKwfY5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pA5k
	Kd4iQVCR2KTF88e0onlEw0OIJivMaBXQAKw9JcY=; b=AJCKwfY5zancEJ0KNEs5
	BY0lZzlYlJmnj9FDldXxMpkF2UQ6G3NP0Pv65NQOHCb7mHdX7oZR4bd1kjreGyBS
	DQwrkVc5MGJVbwCkrzImau3QiiF+zfKbcfnnYttrh/8X6+qiqyRKrmisp83QkeEl
	0j3v8eiB+lDwQeml5LqqFw83olMUSG/E9MJMpFBpMAoiCSgXVGJKPFy2kLMKYYa5
	flUkjEfOb2qe28B/9CZQ4CEnp36K3uBCWib7t6XNxMKMxV7RkCfexzhRbOynNmM7
	iSG/FyX4j6ZLIZ44HNhfrYMXAGF3sn8bunc+Jv73L4RSDCFMIgU+bD3RYuCCo5+p
	Yw==
Received: (qmail 1091951 invoked from network); 25 Nov 2026 20:04:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 20:04:29 +0100
X-UD-Smtp-Session: l3s3148p1@+sIUfx5hmNxtKXAi
Date: Wed, 25 Nov 2026 20:04:28 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awcxPKer4G5oXQKo@shikoro>
References: <20261125-rzn1-miic-resets-v3-0-f25a4b656d71@reliablecontrols.com>
 <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="eRna0Oic4QwHxYLT"
Content-Disposition: inline
In-Reply-To: <20261125-rzn1-miic-resets-v3-2-f25a4b656d71@reliablecontrols.com>

--eRna0Oic4QwHxYLT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

> The rzn1 system controller has two resets that need to be cleared for the
> mii converter to work. They are not directly associated with any clocks
> so they need a reset controller to set them.
>=20
> They are documented in the PWRCTRL_SWITCHCTRL (0x4000C188) register as:
>=20
> Bit 3: RSTN_CLK25 - Active low Reset for Timestamp signal selection logic
> Bit 4: RSTN_ETH - Active low Reset for RGMII/RMII Converter (50 MHz).
>=20
> Add a reset controller and add resets for those bits.
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Sashiko's comment about selecting RESET_CONTROLLER is still true.

> +static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
> +				bool set, unsigned long id)
> +{
> +	struct r9a06g032_priv *priv =3D priv_from_rcdev(rcdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	clk_rdesc_set(priv, r9a06g032_resets[id], set);
> +	spin_unlock_irqrestore(&priv->lock, flags);

I checked the docs again. (Do you have them? You can find the relevant
part here[1]). Figure 7.3 and 7.4 mention a reset propagation time of
5us. So, it is not describing a pulse of 5us. But every access to the
RSTN register needs this delay for propagation. So, despite the U-Boot
code not having the delay, I think we should add a 'udelay(5)' here
after the unlock. What do you think?

[1] https://lv.mouser.com/datasheet/2/698/r01uh0750ej0150_rzn1_introduction=
-2931374.pdf

Happy hacking,

   Wolfram


--eRna0Oic4QwHxYLT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsHMTwACgkQFA3kzBSg
Kba11g//cfNY/SqoXYVZbe5jUUEasxicviSn9VUDxqLOGOGA97dcdyA7kslpzPOg
73ZgXFIHXxN7Ud6vy61xNLp4pGNQPVd3CN972E3mm0DfgSqZjkvI7tCQbQGJfrBU
5KAXDlAvRp8TWZFZmYUlOS3HIeci/A0SGpy/J21jNwMOW3D5S7xshzNPKnjzFxSo
arum8BILxufSmeru5PseM9lDDwzYGBefVkgbBLGVSl66J8EGDnsc01qWvtEX2MFK
G8os2cq8Sood9CrVDAwk/3Uq6h27hOo4z3/C8yw1W6X9PKeJScLB7WuBY12qHjeU
NyPjHcVHV8ULKZP24HNRwj3tAEDPSX8xla8kqxL2x/1oml1pIRxNI6BPWQAboOAM
Ng8REWjSjRB4nih9NdZvmPjb7mgmAQM0bMconJhcEEgfTTJsSiXKuKOxwMFIQaKP
ZYrEdP6sgcufdL3HzCLxnB6tS4YnTlKnqZXfLkQtgAAi0bb6dEFfR3vj6HJvTcfj
W9UVm+o1gC3qzXVIyJ94rUPFvQGuJXZWuZC14SKb8Uu9ldVXOaniACEDABeUfURW
t2jGHwwP3xW6AAbx/wQKovyixV1L1Iqfe2dYE6VzdjBWtLJvgCqV3FeKP4YkUf30
M+m1K1g4AJ022+/n5VVKFDRGqJMOekznMULBmO0wWTScWJouSJg=
=70yD
-----END PGP SIGNATURE-----

--eRna0Oic4QwHxYLT--
