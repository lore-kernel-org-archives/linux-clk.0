Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417537;
	b=og4OSYaAomFy/u/7qXt28gtpG2PsvyBKxRN91O7JlAtVBpevhYP8/KxogOLYCapzoTJJ
	 sXVReqfHeQrXsEJmxruxPGmOs9tnDuxNkjvreeje3FCNOq6MEWzUMxt9SHNgD9cEH+iMi
	 g6lRwp6bYwYEvlYUgeT0CEcx29T+q68zNbHplyDeGFuLcR0VkbNcNZNsmf7v62RrLCmDK
	 Hna+BoPIjU5747OGUfPydndCrAeTQBjqFBQq6/DONiIByX8j1RVBTljMFDKSjNHtU/nxe
	 guVQNtNHpARWGNQZ7H1s+PNjwZHASr0jEwjNUrUyj3vgf6U28mWWOwm8hls3Z7h6bzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417537;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=SbZNDieBY9hzEjO8/yCRQWNmGrtK1StoZinKCNvVSwY=;
	b=WG0u26OGhWy1uQa0mXSmOvIeRBRqLV0EhKEJnjDmWnlXifgZWHnKy//ZKGPsrSNYRZ1v
	 w3Qyaij440GLHL/lZpAmgt026Jdv/lkGKudrJ6iBF2+u1e4zsFUhY/Ih0cmQi5hC7D02E
	 Q373920jsZpu8tINVgcOi9Ca1jD5YwGwNx2+KZ2HJPYYMygLJ72nueMy7dDaqeiA6Vs7Z
	 n/70b5TCr1sa3qjazKLoKdD3SGVXAb51dXj9RhogXPHsvsdv6cLiO8JodBsAimE65RArW
	 twc/oHUGnm9Fi5wahLnDdrcAvQuNzisAFnpYK8xnHmb6heRGy+GuRI0O9eFXsw5+OTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQk0ITmt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE3A606A321;
	Wed, 11 Nov 2026 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQk0ITmt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23E71F00A05;
	Wed, 11 Nov 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417536;
	bh=SbZNDieBY9hzEjO8/yCRQWNmGrtK1StoZinKCNvVSwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQk0ITmtBFI6MNWa6tcqdRP1Rrb1hw8KJqL3wDZjKkLS7qWsr8dkgtxobdWYng3pn
	 q5ZO2KEOq/2ybyWYi1AhNEADaRFen86B9Qfc9zEijmOyQVXqJ5iAAn19vBib/ebrrg
	 5Kf3k4DZdSx3HaFJzdPXXRcot0z8gkEkBVYvg5IY+dDOKPmybYmtL+kpMieQukIbXL
	 hliusqQdHIYaUXsUNUmacQNVuD3WYmhX/ofmNDcaVRlplYYojaJCWxS8lj8rnQQHRj
	 qbhT2IDffnC934hn2HpwgVmjLyCdlenDNhpkU3pmwTV7O5NULFrr+8rk8Jv1Lj8+Z0
	 nrzWsuEDXXAHg==
Date: Wed, 11 Nov 2026 17:18:50 +0000
From: Mark Brown <broonie@kernel.org>
To: jiebing.chen@amlogic.com
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v8 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Message-ID: <81581939-3079-4549-9bb8-2e935c173a7f@sirena.org.uk>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-2-1489241e4c83@amlogic.com>
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
	protocol="application/pgp-signature"; boundary="oOrGjpPCIIgGz7y5"
Content-Disposition: inline
In-Reply-To: <20261110-audio_drvier-v8-2-1489241e4c83@amlogic.com>
X-Cookie: Do not pick the flowers.


--oOrGjpPCIIgGz7y5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:28:25AM +0800, Jiebing Chen via B4 Relay wrote:
> From: Jiebing Chen <jiebing.chen@amlogic.com>
>=20
> Add S4 SoC tocodec compatibility support.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--oOrGjpPCIIgGz7y5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr0o3kACgkQJNaLcl1U
h9CsCwf9Elzjbf8nHCLS5M+WLOLUCXXBlKz4ioAbZpwXCXKM+LrRVNgnLw4IzNmX
POCp7OsztudK0+BWIZeo+K2/TRsSvkV5MnHLUBJ07sUq7LzHkotnhyviWmaxqwCM
vr96FBCba5vQ3KI8XWOH7UUNdUVXiKxuPBMpxut7ZTLvEUKNtajO8tEs+vfT9nuw
j+oMdNOLg+QdZhAqjzkbaarX44zJ7iSHHRdlZ1sWRuX7ygFc6mMWB0OrZV+3v6X+
dSkRdZUhBV9TTA3GavN4+DlqnCaXpzcmIbZu4nKWvLSlFM6TaM3NHoJ9aC6xdLyb
q6fQTd6FJ01z/qrQYUlUr3chvx+7MA==
=C328
-----END PGP SIGNATURE-----

--oOrGjpPCIIgGz7y5--
