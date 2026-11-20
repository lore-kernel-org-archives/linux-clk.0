Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167066;
	b=jcAKKQDvZH8g5KWHuIXy/iucqw/A09XUVRNXccF8uU2sWyfBodQ0tVX/d+jnNR8UszSN
	 632pKjcPNrPFn/qXvpYPhn7fmwSxnq5qKIZu09psup+CKxUAs3taCbev40u+kHklKoNFx
	 wT+DX+OA3lATsnI2Nvge6XdPh4KD0KcxV9AsH9Q/F+mfO/JMway/MBQ2Lx86vOOn/OzLh
	 4XG7wNsMMkSRHsBrzZ7n7eMLj4hwdExtzz+DrwJoO3IOe87X0wSxXe96mkI+q4HDiTYhE
	 V3prNY0JzLUDcF+Zt/k2Yuk45RJBPt4AhxcVI9zFVC6+mOFEjuO1gz8bSEh4P4T124w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167066;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OCf75Fx8Ai6t0lF3SSBe/SqcSWFA8siREMgmIjNPvtw=;
	b=qt4Ujv/RXcbTR2mBk14fd+mE25IGK9SqgzOZ6SSTCWhfeqHo+bVogU1Mu5kdKdpmLL94
	 boKvTFXj1tzYdJZYswcHgAUaA9lMpG1UnpLgW7FHW9zz2khTv04JOX1JvlhBcbpfbKdrr
	 gLASP7kgS3+soNUTel1Hgy0WxZ/FCtJRv7VCIU4yesOgqUZUgXIovP66IrwEl4J5G9Ysg
	 /UPezwnTF+iwtPB2Cq0cx5qzTUSYYs6JbaKfsxoNmh9jSZpzXNRMVbk2VqC66lPmp8RLN
	 j83RjayW5w/huZ8S5Yw48duBtKNoMh520dn5NPTvdLdsO3bmzJSbW9KMsafHI5iH9Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=j4zY14Ej;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E825606A326
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E825606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=j4zY14Ej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=OCf7
	5Fx8Ai6t0lF3SSBe/SqcSWFA8siREMgmIjNPvtw=; b=j4zY14Ejcq6UA7scHG1f
	sESzw7YadTEDxETZXBudXGp9uvTVn7bd9oesG+nqEtKkcIXrpmgpvGqxIiwLPnFC
	s7ZstBwtDTAbU9VCDYsuXdc9SDXSe8sCzGmAiVRi0Hw7Hw+Li+w7dAtgueHMNtFj
	XNMnBbkGXftLrqlVwtMxjnKoWfmnZSmZZ/pDRvrYH11QCfNAIZCJBuiJ8hoalwhN
	70LDwn9iZEnqgohgMGBl9FVpJptbRSd6KEA4/c0yQYhWBQy27Af/deQwdMabAE1N
	ewpV+My+wK4S4K9rMKGuzKIr5QfY2bV/kKFdq5tNkGpDKiAlD9jJun26nbDYcZ1z
	PA==
Received: (qmail 1416495 invoked from network); 20 Nov 2026 10:31:01 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 10:31:01 +0100
X-UD-Smtp-Session: l3s3148p1@fT0E57FgbpsujnuU
Date: Fri, 20 Nov 2026 10:30:59 +0100
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
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awATU_lyjPBxThwq@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="wI2vg4tZYniA4rpi"
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>

--wI2vg4tZYniA4rpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 09:57:44AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
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

General approach looks good to me, just some minor comments...

> +static const struct regbit r9a06g032_resets[] =3D {
> +	RB(0x188, 3),
> +	RB(0x188, 4),
> +};

Please add the DT name of the reset as a comment after each line.

 +	RB(0x188, 3),	/* RST_TS */

or similar.

> +static int r9a06g032_reset_set(struct reset_controller_dev *rcdev,
> +				  const char *func, bool set, unsigned long id)
> +{

*func was likely debug help and is unused now and can go.

> +	struct r9a06g032_priv *priv =3D rcdev_to_priv(rcdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	clk_rdesc_set(priv, r9a06g032_resets[id], set);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int r9a06g032_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	r9a06g032_reset_set(rcdev, "reset", true, id);
> +	udelay(5);

For future reference, please add a comment pointing to chapter in the
docs where it is saying 5us is needed.

Rest looks good!


--wI2vg4tZYniA4rpi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAE1MACgkQFA3kzBSg
KbY8qBAAqsju+kzP2C7aoqbzO/2VbVOoegIp6nxG4ePZzZi7fWZwQQ2my2PZX8sJ
Fv6oyXmr2Jh0iG+CBCfQTRRa34ya9bPAQv+wUspgT/B0TPGRxhuQ8jP1LUzfBidR
ypH4KLVRvDAJMsKK9rdD2i4yI/3xqNpI0km+15IkqriDMXxU3J3fyWGTxCETKB8v
KGT2dVv/GDC57K5DY5DCP8rczMcIBhFQgV07CJmrDo2w5Ze8dMABgqm3xe8SzDYU
yVRl0Ccv2fLJpPmccasQzgg1aJi8KIbDAIVSTvMRVoZhiLRSOzUYQfuYJRpkMM6n
OyYKl0mDwnJyeIJs8qGjEXl0w2osrHSKMdi7ItK/ndH3l/s2h3mK7KuTPWwg7aJW
GuFgkcF1sbAS5EZN+Bv1nKPXFEEpgSWz1Kvwb3Yshn0PaGWP59NNq68u1oPzYrXc
00HOP2cPycotBuSjW5YJm3F72vbRDV3uOX/+RcAyNj59elduY2oNFIYlYPDXDS+E
8Zkcn9m5vGhJXyy8Qg2ysoc287fsThgO4EVyB4lYn4JmRW/1X4L4b7Zx9Lz5rK7M
f2mrPxtHz1DpLc5bcIPfwlDr2zEgyeJKpNRmRwj4Q+DQRGFXL9pGSVCrvb9/e/9j
sB6P90kZ2406EN8+l5Tf6AKtRh3gynP4vZpZ3ilJUpNcdsUFevg=
=CdDX
-----END PGP SIGNATURE-----

--wI2vg4tZYniA4rpi--
