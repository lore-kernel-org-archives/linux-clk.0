Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180096;
	b=b6ebtCMWPEhCvRor/3DzHyNr1u8vHq2YbMv5eKgYGfmasK0DhfYNhBI1LIImR2JbB/Uf
	 f1sS0OHL1CQvOhGfeZhheqbnY/dTm5iPO2aAW26a5S8shEPA+DpZQuCi7zW9UNJjsIWE2
	 Bpo7pZawQlndrC7NbSxpUPT0HXJUjrxLChCm+22bdfKC0R5rtsEMxb1v9IMknyffEZHfu
	 7XM9eqN0FhHkuuLos/Msl4/MnMzwc5G8pezCkJCcQRC1Tq8WQL8OD+ViQ10tqTmiy+FuN
	 foYsPurE2BVCO+llLs1UKoNj6tVYCvm8fhoWybOGP+NYhiLCV9WH3L1M5eRsJpcuKTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180096;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nRTwl6PA7scPTUTp4EChbVpQM+LG2WC8AJwvqiPP/m8=;
	b=ppOwIzZ+mOHIayiMZTr0OSYjLnjO6oCS62zngvkBR8ckpTtK/C45LSiGaUE175B2Effm
	 rE0RAyRgDQEN7FWSNrJnzN20/+c6B2nBNJmPgLawdCDMxhBYzcFYnMBISbD1CXtTbbPS3
	 T2khp7RidsPCJPXQ842FvlsN5fNiKw6nPdvL95C881QirPgOTHiJGciBEb7SE4z1/4Y1V
	 VdYUAIywHSGUMAt4+vwFCK0vgcSJG/BfJEU0BtBrmR/dvHKJGGkqM0/SVBgHzs/N2vcTJ
	 5FEBQIyVSbPoJYubHPqknfj3bSXQrUeW4yCJ+ylJIN2NtNhzo41WkhaXCWoIuahEegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eToLnO18;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34484606A320;
	Sun,  8 Nov 2026 23:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eToLnO18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9216E1F0089F;
	Sun,  8 Nov 2026 23:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180095;
	bh=nRTwl6PA7scPTUTp4EChbVpQM+LG2WC8AJwvqiPP/m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eToLnO1866ewRebs6N6G5BSxQTF2U2Kc0UhdYgEdR47hwwyqAlfeSiJo6o0SvAIlH
	 joEW6TVssRzjzRjZ7V2nf1+5lSQvqv/tZz4AvyQ0iiAbmQQ3teSj2rVHOMPhaIKJy9
	 e1XEi/FsoXOoZzwsMGxQnBa6o38deA7bIfoyaUc88ZmWrnI58+0BNx7g3P9WotHXEi
	 f+U+josKVZ3jA0a8ixgOMiMj2cE5Wp3pPHZXrB+2zjoeJOT4wVOXqHft6ToH+mXb1E
	 9YsSOmViP0nd+o0Q3bhvuWTU+qRSqHrvdU4AC/gBAfKzqKVUWprfuycMOuKXnhJr8F
	 FSCP5pxfZvcpg==
Date: Sun, 8 Nov 2026 23:21:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
Message-ID: <20261108-poker-appetizer-ae578e06f4ed@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
 <20261106-armed-spoils-909d7d4f7d21@spud>
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
	protocol="application/pgp-signature"; boundary="h18CTd9oqNUWFnDa"
Content-Disposition: inline
In-Reply-To: <20261106-armed-spoils-909d7d4f7d21@spud>

--h18CTd9oqNUWFnDa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 05:35:46PM +0000, Conor Dooley wrote:
> On Fri, Nov 06, 2026 at 09:30:27AM +0100, Carlo Caione wrote:
> > The S7 PLL controller supplies clock sources for the peripheral clock
> > tree and receives its reference clocks through firmware-controlled
> > oscillator gates.
> >=20
> > Add the binding and clock identifiers needed to describe this
> > controller and its connections.
> >=20
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>=20
> This looks okay, but I don't want to sign off on it before seeing an
> answer the my quesiton on the other binding.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--h18CTd9oqNUWFnDa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavED+gAKCRB4tDGHoIJi
0okdAQDMcXKZJeoTJVuXMbKA2aRXY0cbDWEgmMPMk8XpvQYvMQEAydnvuYk5uJNd
9LftLcLzS81VFE0iJ4VqHKGF4dmyBww=
=B5wK
-----END PGP SIGNATURE-----

--h18CTd9oqNUWFnDa--
