Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838360;
	b=0Mfkw+iqEnYoD1XFDKFu0uJs/6VZSAylJsi75V+J8tR4E53XmkMSZeSYMt0epZPgzdcq
	 CE83CzTqjlq6ENZCnpRJrnzU4WIQyePts9/SALkzJyKgUmpfWBXYTTY4ImOZtpPWKMt9A
	 hwDqoEUcjBUONNJ38yTQOhrSiNsyTHxzEHhXR3Sr4pLlYKiYM72klxLD37skNb6r5eu4S
	 1ToEMxOovcXQdtTI8k73ng3UzZU3v9XxjEVSErIe5hFHZaHkvww//rNqxbctqmsXcWywX
	 E4CVUuG0zeak/T0QrpIV35KVw7hIMCxsqKuB0u5LD6UdVMs13u3h8ZayFkwZCYsr3+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838360;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UnICyylNHD/5H+Y36u3vS9vSqMGFEzEs7q0j3OAzCO4=;
	b=Vx+6CeXqI7/9TIYh+ym2xqyORnwyVCWBI7MVem7nL0SGqTa5mGhwcIYq5fPht4UBSUi1
	 v8z8MURo14REN8CBrAasWmKU54w6MO0/ZNfKXBdumFUIOSJb+FJnQkb0Tgn6PgTRAhA8i
	 4CVqeNQpEqhzhrpMIwGc7ydEQVD+UCJToOh/Sq38QoO6GtwRzuBOIivMggdn/nytt19+Q
	 xbqhFeCgSS4O2FAw0w6SKKfqfYYIYI0HTwFbwUeWMTAq4cRmPvMlETXx2jxlAL4iLkGA2
	 gnQHOMYkutA6ngiKGpUkYTL3HUxWd6f7m/vsZc1SaLuLW2PZfrBRA1scJcMCIFv/KyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUw8eJtk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A97606A328;
	Thu,  5 Nov 2026 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUw8eJtk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FF91F000C1;
	Thu,  5 Nov 2026 00:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793838360;
	bh=UnICyylNHD/5H+Y36u3vS9vSqMGFEzEs7q0j3OAzCO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iUw8eJtkvONgb9+zeDvM5MBqCLsrbAlmaI7wz+1IJ5iIeW3jU1BlN4kz1qL4iXFHO
	 FT/HSDSOlzCfRIekOYyrHuNPGe+XwHrRutYXHRHb9SL/S5Ae3zJGaNHrCWmnGBGs4p
	 LPW/u+fwcWWsv9uUba+ad9hqEtcULwfVmyDYtYjXzyd4T/5xXQ2ipPHLg9hImcjQsf
	 KbcKyROEIoC4wKboa6qVqWLCZ2mmqtdlsl1y80DUaOdR96zGqmEoFDyEgPYqZJdhzG
	 tVSmDKCBut/04PwjWRt4IyQrGcNYer+8dU8Cnjg2+xByYM8K6L95khYOoJTDA2FZiL
	 124mVUpdNjxYw==
Date: Thu, 5 Nov 2026 00:25:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
	marex@nabladev.com, changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
Message-ID: <20261105-path-pasture-495e4ac427f4@spud>
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
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
	protocol="application/pgp-signature"; boundary="1lKH3QNpXVhnab/7"
Content-Disposition: inline
In-Reply-To: <20261104004332.2141282-2-elder@riscstar.com>

--1lKH3QNpXVhnab/7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--1lKH3QNpXVhnab/7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvNEgAKCRB4tDGHoIJi
0sVTAQDSlKRamSkFndOik2tL87QvyeGfkFHvMdVNg2jXmLTitwD+MhuVC295p4ZZ
Q4f1ENjI013KM5UBohBC1sULlggSnw8=
=wCS1
-----END PGP SIGNATURE-----

--1lKH3QNpXVhnab/7--
