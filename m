Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792968799;
	b=HxLCS2drzShxx+Br0cRRv66P6RiIP+s/K+caeyPjPA7v8+QiMlAoYYWafu+x18rKM0hZ
	 u15JTi6uZaI1FaHibWhQaKCWJjx1rUjH+sIaRb67lUu1yaiJdwdk+VIQDecXAqp/rHK7Q
	 9I+LblApXwB4+VMkDKmDd3txnxcUkmSdVyDWbBAOzI3a/ZinzBpXsnJfnQak0k+tw5jtJ
	 ujWwlAEvpnQRmVDsK67q7M5zTja5TbVurwfXjpwZfWAIJ4ysTZijSoNCOhW0EKOTDe9FC
	 qiA/2f11KMs3XOhHNWuB623GBQ4mMa8NltRBTgwiP6LrUCt7G3W83R+0S8Lj4lkoH4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968799;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=GVMGWBA+doRG5gBfYl36HB4dJIKG+rbnEDlBd4twPQo=;
	b=jHLVN6GYkRPywjhWesX7NNfJDWjjxbcefdABLeiSeUeWOCPZRlhFO3gvnpHBiX1tipQk
	 wkwG9G0rvpstdQJq4oIl3wvxShaK0xGNDjBltOmHxqUEAAInZPQ171Z1JTNoTNUJVhnrs
	 7BVEtqm2nT+GXi2cjskpYvNiSUOyYwbqmOi/XVZNpp6KPgbPnMBrXg59y3lUr7CR0CyRX
	 MimogTr3fL23BlPA92rsSHeGEDHkIlYddioe8fzTVHPpx46wPfWGDE19M7qFAAWYsUj6v
	 bNK5ZD9yS7w8s4Cz4vwQhDY/+I2ZpAxJ4GxwpW5tg4eM4J1TfIMGEXvlS3bvdkezDug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDBIPq80;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41A606A31A;
	Sun, 25 Oct 2026 22:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDBIPq80
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072181F01825;
	Sun, 25 Oct 2026 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792968799;
	bh=GVMGWBA+doRG5gBfYl36HB4dJIKG+rbnEDlBd4twPQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDBIPq8082STVAbpK/dhoqKQX0p90ygwzGL96Yrk64xLM6B8ewnaPBUPrTAGyz0Y9
	 1kN0u7UokMJVTrRAawHlio0VP5Bg+xY21Y6Tt60J9BdxkDQeGrhNoqB7DPpGTMhyap
	 9jtPwE+fma1vWMO4od2a8h0K4AratjSZ/bGB1A4oV41Tyc417SyEdVj0iCrgzqywh2
	 Ru+U6+Lj3/btC4qBsm/NY8JaRhsgNDarlfVT3yph2P2tU92K8vAUTAI56yXlNl/F/0
	 IJx/2VFvBF5rR2opam8LJGTTFxEv0efGnI6PmSOMnc9WsDZCwtiPOiJkAGDSAL+bAI
	 Lr++F/m02IbLw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 63FCC1AC5994; Sun, 25 Oct 2026 22:53:16 +0000 (GMT)
Date: Sun, 25 Oct 2026 22:53:16 +0000
From: Mark Brown <broonie@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, perex@perex.cz, tiwai@suse.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>,
	jiebing chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH v7 0/7] Add support for S4 audio
Message-ID: <at6IXIyAkf90DU1W@sirena.co.uk>
References: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
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
	protocol="application/pgp-signature"; boundary="vAQcFAodtabSXAEP"
Content-Disposition: inline
In-Reply-To: <20261025192404.209695-1-christian.koever-draxl@student.uibk.ac.at>
X-Cookie: Victory or defeat!


--vAQcFAodtabSXAEP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 08:23:57PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> This picks up Jiebing Chen's "[PATCH v6 0/4] Add support for S4 audio"
> (and the tohdmitx S4 patch) unchanged apart from rebasing, with
> Jiebing's authorship kept, and adds one fix on top:

Jiebing (who I notice that you have not CCed...) also sent a v7:

   https://lore.kernel.org/all/20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlo=
gic.com/

Please coordinate with each other.

--vAQcFAodtabSXAEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCat6IXAAKCRAv73Ows9A4
iUkDAQCQveKgx4r2d/eG20lgPhus7tKTm51YTADZ/MON+PoyegEAs8Sr/ir19Hyl
KSZbcPte+19qqTv9mWpsTI64D0/Qsg0=
=I+6b
-----END PGP SIGNATURE-----

--vAQcFAodtabSXAEP--
