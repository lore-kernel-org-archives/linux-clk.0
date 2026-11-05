Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841582;
	b=X2VxlW4b7N2QRhH9y0cXEJzSajB1qio9ZS82dr4a7QKrs4eJEuwblHA8lwl3VSC7BKuJ
	 GLoKxz+a1mM1TjckVMJM0CAmSfi89zgCVZm6tD0rnSzo3tGSu9eQeilDmNEq7eNW/TJk7
	 gRB+xeWwFi90XFdrdFE4cnKlbYBq9LHulxSd4Tf7dI0EPdTUG83IBFtfoyY/E4+WJIlz5
	 nilUFG7naTMUkgBQllTwphnkjAmLjW6TO6rBJB+al/fxjq0Y51BHQXA+sFmDhKpF2SlKH
	 IhEObkFv1qfkkjonx3Jiwkvyt5etHUpsqLxU9wFtjaGy7Rh6EGpKy5Mman34lJv9u/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841582;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ipE19vO735Vlv72+ZECb9RYfcfkbe37S23ffmmXmgcA=;
	b=eczmByu6/YwMxloLMMSK0fdt0xj1fB/bUCTWKq/9PLAxa0N1oXRP8z/mgbS3Dogrxega
	 88yecQtCbbJjYIYuR+3KbDECfxL+tLmHKsSX7PxfxoWAtCEOWct8J8hcbbezyRrkITPbb
	 QAb1C9Sj6Vr9OVxpNsRqRd8+EW9oFhFBuX9C1oekUplgBJN9U8M3U9KRgK7XNxZIg6rKb
	 35oDYWRYhbZQwMAMzsN6mVV97jK3KOulr53TXiFc/a0SYb7j5pOqIt5Djl32dbg8E7nzY
	 iYpjiPrJgRqkYDi0MBQ/ozk92EinOaWn7g4Q97Gqe/WWvcaQf+/I790BOWRNf/PBUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDYzKvk7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62362606A329;
	Thu,  5 Nov 2026 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDYzKvk7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A28D1F000C1;
	Thu,  5 Nov 2026 01:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793841582;
	bh=ipE19vO735Vlv72+ZECb9RYfcfkbe37S23ffmmXmgcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDYzKvk7o01uoSIQ/ewAQaE3leumH4vU0URqgMra4+yUfSJzVNwcGjP4BaAgx/BkA
	 WfZK5JjJe9mCJWiHgH6Ys2KS2PsuggLY9lbiHLNlEUgAx55P5ObELyqYfUgKxwIaWI
	 C5JxNAQIJgWr5knKVF1y3jBS+nuWU+3qY6P7qBTaSEwBEjG8tfZ2R3j3cN6Dnefp14
	 jzD9CebeJXnEtDN6UyGnIZRPYrmIRo709KqPlWOGYzbBi1oOZWnDblLbhOiE4QNb5n
	 m0I4BcX+pmfVs+X5ASYk3dcbYKmx/svhywTJXZT7xj/OJQ6je/g8JFJdlahLofVfHS
	 slOKHHEowhPAA==
Date: Thu, 5 Nov 2026 01:19:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890
 peripheral clock/reset managers
Message-ID: <20261105-dreamily-quicken-31e2b446a942@spud>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>
 <20261104-remote-festive-1e6d807ef014@spud>
 <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="ynKIO3rf7ScFiTT8"
Content-Disposition: inline
In-Reply-To: <CAPY4CJ5Q7BJuay6D0F6-yvjruHvOO4UQaP1wHKK9_exbH=hUxw@mail.gmail.com>

--ynKIO3rf7ScFiTT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 08:08:57PM -0500, Joseph Telaak wrote:
> > This binding looks like things that we often see that are actually
> > incorrect models of the devices in question - things that should be a
> > syscon but not implemented as one. I'd like to see what the actual dts
> > for this device looks like before signing off (or really even reviewing
> > this at all). Given how the clocks look, it is probably accurate but I
> > wanna be sure.
>=20
> The dts is a separate series I'm holding until the bindings settle. In
> it, each manager is a node like this one:

Just link me a tree somewhere with the dts, I;m sure one exists ;)

>=20
> uart_crm: clock-controller@19e24c00 {
> compatible =3D "siflower,sf19a2890-uart-crm";
> reg =3D <0x19e24c00 0x10>;
> clocks =3D <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
> <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
> <&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
> #clock-cells =3D <1>;
> #reset-cells =3D <1>;
> };
>=20
> with twelve of them, at 0x19e04400 (gmac), 0x19e08000 (wlan24),
> 0x19e08800 (rf), 0x19e0c000 (usb), 0x19e0c400 (wlan5), 0x19e24400 (i2c),
> 0x19e24800 (spi), 0x19e24c00 (uart), 0x19e25400 (pwm), 0x19e25800
> (timer), 0x19e25c00 (wdt) and 0x19e2b400 (gpio).
>=20
> You may well be right. I dumped the first 256 bytes of each block from
> U-Boot: all twelve have the same four registers at 0x0-0xc (reset, clock
> gate, one I have no documentation for, and bus output enable), and five
> have more past that: the GMAC's interface and RGMII delay registers at
> 0x40-0x4c, the USB PHY's at 0x40-0x8c, one register at 0x50 in each WLAN
> block, and two at 0x48 in the SPI block. So each block looks like a
> small system controller for its peripheral, with the clock and reset
> manager at its start.
>=20
> If that should be one syscon node per block, providing the clocks and

No probably not.

> resets and holding the peripheral's control registers, I'll restructure
> the binding, the GMAC glue and the USB PHY that way. I can also post the
> dts series now if that helps.


--ynKIO3rf7ScFiTT8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvZqQAKCRB4tDGHoIJi
0vJoAP48XzONgQM9jSTbYdH1mbu1z8mSDjtwafVehtu+TlEQ7AD/a4G3si1Ft8YU
VV6kizbLXqaiAnYeBbtH7zk7GTlGDgk=
=UKgd
-----END PGP SIGNATURE-----

--ynKIO3rf7ScFiTT8--
