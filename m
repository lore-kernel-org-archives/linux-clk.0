Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6172941DED8;
	Tue, 15 Sep 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490133; cv=none; b=MTT0NbRymbAETudDIJMRJtwyDIZBC2lDAjyf0cfAX3UUDVUyhDbn9gkq45LckFo7fHoi6gwxIJ41U5ssmulVEGRWTLyTnKIQ7EkWtsdQYZOHbK/9afOi4vOnPBCHbwSUMXFzfooByGMEQjND8n1SXblW+PxmCvrClKRpQY+ZNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490133; c=relaxed/simple;
	bh=6zvquo4pqlbv1m1Jon2ogA4J4zD50ORhxchyV6RIKTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWlnyRq3ofu3a3iz6f21y//ipioF4D3pzxJShQQ1Tf9+fOe24cjYLRqPReB2jHDlOryyUrWxiAXctC6PNkSqdvsI592FN4kbUNwovCGFr2BrS8JtnVlSU03h0AtelsbqGFpfszCn6s+tkIuKVEwNNitGOPp6YP3t6uuE2Eb1+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ym4xPqjD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ym4xPqjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2C11F000FF;
	Tue, 15 Sep 2026 16:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789490132;
	bh=Do8mywAmhO0sEAhuzhg9iC1Sa77tKdZ3zERJMncLOdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ym4xPqjDmT1SgkF0u9fj4CFqq3Vahj01SIaqX1jud1IfH/8oFTfzZRxx6sxlpFuBB
	 I3g7wqCCfKt2qT4b+zsQDnNUE2fmYtVkWncslpQ7U1Vuq6hq9uBct6o7shznxwbx5p
	 pknIZQ4Ujz5XX5h6ero2Hm2zrcvsLVnNQWM1OTvey+okeQDjvKjMlcwSVQR0pMml/X
	 Ir3LOINSZLPFAu3NS0BcEsbTWfgZsutCXwN2KHwSVsFG66PYeNNenEeBJusRADBvlS
	 dh1UmqQEvT9AWw7Fg6Ck1/Chq2zUCs3PNfAkZtdsw3HX/f315VHi5eI3iy9XY2pxeI
	 nNz5mZBMoLDRg==
Date: Tue, 15 Sep 2026 17:35:27 +0100
From: Conor Dooley <conor@kernel.org>
To: V.Yurkov.EXT@bruker.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Message-ID: <20260915-charging-disliking-e8d2bb6bba31@spud>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-1-42ab5dc3a6aa@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rKMwTM2hmLv0VoQO"
Content-Disposition: inline
In-Reply-To: <20260915-feature-clock-guard-v5-1-42ab5dc3a6aa@bruker.com>

--rKMwTM2hmLv0VoQO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 09:27:39AM +0000, Vyacheslav Yurkov via B4 Relay wr=
ote:
> From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
>=20
> Extend the binding to be used also for gpio-locked-fixed-clock.
> A GPIO-locked fixed clock provider exposes a fixed-rate clock whose
> availability depends on one or more GPIO lock-status signals.
>=20
> Some hardware designs provide fixed-frequency clocks generated outside
> software control, such as by FPGA-resident PLLs. While the clock rate is
> fixed, a separate GPIO signal indicates whether the clock source is
> locked and producing a valid output.
>=20
> Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 ++++++++++++++++=
++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6e..00cf2ad66dd0 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> @@ -11,7 +11,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: gpio-gate-clock
> +    enum:
> +      - gpio-gate-clock
> +      - gpio-locked-fixed-clock
> =20
>    clocks:
>      maxItems: 1
> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
> =20
> +  locked-gpios:
> +    description: GPIO that indicates whether the clock is enabled or dis=
abled.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
> -  - enable-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-gate-clock
> +    then:
> +      required:
> +        - enable-gpios
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-locked-fixed-clock
> +    then:
> +      required:
> +        - locked-gpios
> =20
>  additionalProperties: false
> =20
> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-fixed-clock";
> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        locked-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };
>=20
> --=20
> 2.34.1
>=20
>=20

--rKMwTM2hmLv0VoQO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqlzzwAKCRB4tDGHoIJi
0oodAP45t3HC5/ZgqU7guHRctKvX0SWRA0ng/sKM4aIyU7McMwD+OfUJLrMzgDaD
Az6qTZV0oFrCfkBq6NTlAEL1G/CQ4AM=
=VO3r
-----END PGP SIGNATURE-----

--rKMwTM2hmLv0VoQO--
