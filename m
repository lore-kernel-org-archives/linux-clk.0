Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195143;
	b=TwdocaC9GgyXAZl2b/gt5RnWiR/diyPwCF9Y18eyBqRPcWGGOqQx15Ht8vP8x+DZeVIh
	 BQjkxijbZTC6N9dHpAbuNDoRgYm4lmmUMIvKrVvQOpC4rtpzkEDXNeekySPwwCbO19CSR
	 yYbqZdoYdReJoGex81MTheQKYIgzjY1YkESl1jGojJ3Oqvb0eU9iOOrbuhsAIBCDl+q9L
	 SwXVYmsZ1TP/n2NWEW9vnB/az7yQOXOcMF84w88MvCrz2zxY923XNgdx9lssDPmcupUNl
	 wS1nY2Y5OVklCvHZAS1hcar6aQ8hVh4TDrHpA/i3d63A3K/bomKyhbupCd5HgoClRRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195143;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oV6VKtNhHasYxl4NkugUYrjVe5denbhbDusaHR3VM6s=;
	b=yviniFJTl2QNZYhQfmwPp7542Pt9or49U1DkNpPJKu7NSSAuFTn45kMzpd2OToeWim7C
	 ae5y3hvvrGoJE9efbaQ6K+rEqfGeLLaNr1sPpdbfrV4z6/vdBmsmFPeZQvV8ygee7lpgv
	 ky4jgZCLzA0QVuorbSjuZJZxF+x2QEpCI2pl2OOs9YCGbU4zFi8P62J6MeIVrzkwFdAS9
	 HY+KW72swZ0ftDAZ7eg09t/l8D5ctyqbseL5RjB+r6AlDgBunuU+d20iqCAUJ0rQITVF6
	 /aDq8TdIBP8tp9k+YznHSA75Xh4z0FNoy0fKb2LssrGpr8Isz9TbpgTswrBLLSoGE4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iehZe/Si";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC6960A2621;
	Fri, 20 Nov 2026 17:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iehZe/Si
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F641F0093E;
	Fri, 20 Nov 2026 17:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195142;
	bh=oV6VKtNhHasYxl4NkugUYrjVe5denbhbDusaHR3VM6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iehZe/Si6YXYFvqLtRVfZjD1W9gBXKKfUhzEVeinVliyNKLveqSmT86Uqw8fHyE4C
	 gBCEAFsSmhnnOV4A0XIMFo6MWINcuOVrj55OwqYluQHdQN9nyfU7qU2fWe3yINGzpi
	 lSAu9JvKop7/0ttveEGkah7QUtMrgHu4F1DbMl4qrgYBcFxYVDC/esAQMKdQVTJewE
	 Pa6tKreBIUDJPiUqu0DmuhPd2+1WY5womWP7UqN7Y/fmW8jTuML9EdOWB56ccRJUmA
	 hBn70pwSaCNW/fKvd2Z4hPdxs4Bhdhd/4NPtCtyz5/kqL9U8ZZb4AG8+RT6fz9jN1b
	 20NxmusfZzjPA==
Date: Fri, 20 Nov 2026 17:18:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: gpio-enabled-clock: Add a new binding
Message-ID: <20261120-oversold-enlighten-48e6c36e74de@spud>
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-1-c1c05a498d9a@bruker.com>
 <179519084920.3795820.18319787881002052092.b4-review@b4>
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
	protocol="application/pgp-signature"; boundary="QVQCvAX8U4/YW9tJ"
Content-Disposition: inline
In-Reply-To: <179519084920.3795820.18319787881002052092.b4-review@b4>

--QVQCvAX8U4/YW9tJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 05:07:29PM +0100, Jerome Brunet wrote:
> > Add the binding for gpio-enabled-clock. A GPIO-enabled clock provider
> > exposes a clock (can be any type of clock) whose availability depends on
> > a GPIO status signal.
> >=20
> > Some hardware designs provide fixed-frequency clocks generated outside
> > software control, such as by FPGA-resident PLLs. While the clock rate is
> > fixed, a separate GPIO signal indicates whether the clock source is ena=
bled
> > and producing a valid output.
>=20
> On v5 I pointed out that the input is not fixed in general. It might be y=
our
> specific use-case but it does not generalize.

Does this mean you are asking for the commit message to be reworded?

--QVQCvAX8U4/YW9tJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCawCBAQAKCRB4tDGHoIJi
0pCzAP9BHXF0ePANFPyDgfB2NYu6l6luuc9NjiMM/vrnL72IQwD/V1sdAD/FSEzy
pldUSIYFk7cZfWmOt1u6QsxGmsaM/Qc=
=WodM
-----END PGP SIGNATURE-----

--QVQCvAX8U4/YW9tJ--
