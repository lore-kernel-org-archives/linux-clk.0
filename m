Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3A24F052B;
	Mon, 28 Sep 2026 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790614144; cv=none; b=pOkPim3ZnuV87s2MZg0M8a2Hbw8UK4TTb591wBkrjo8pQABnI6Q8nzbMtffqP+YPbDJLb9F/WN7Ru0R0Tu7meHWZxcg2/NIvWlzosCgwWcBJUetVj9AaA/s6r0pdwvHjCMU9xD+cYuSqj8jI3xXp2TV0U8MiJBAgplAgauUcdJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790614144; c=relaxed/simple;
	bh=p6Z2HiR7wy1TjKUzDRhsOJ75b9wzxmwqrB147Z3fti0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEaqDI2/wccvzHa4LXeHGX9Yr1PpmDiijx5GsLLWdzzE8KydVS/jIQL7r6YThlsnKwA7JDbjfDGxNeoXRQqDWNCVp+5V6KX4Ox81zSCcTbwnqfye5RsKD45j2mS6mba4RFmbmTfQihL7gfUNBRbdrDO1W6vlLjIpwwYzlwX6+ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAKD5Ifo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAKD5Ifo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9311F000FF;
	Mon, 28 Sep 2026 16:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790614143;
	bh=mUWct8aizjZm3FpdazTy05+paU2XtXuaVqE657SoQPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JAKD5Ifo+jsV4cHgODTZ42PB6SQvPN6UZaZFjvPM9pxqyidjxwFQY1MzGBoQJC0Gg
	 60gu8qqhP1Fh/AepHjj0X3yMaCqhBNEk8m831xRnjjhj6HFGOtb8R9O2S9ssyRgvGC
	 0uPk0dfQapjZtX7pMogZoGfI8csxOpdDxXo9Qo9wAA2UJrEJNCS8lDKo8qkuNqYS0f
	 QUhqned/V5UkjOVMMCfp9wXjq6Z7vRXe3rdSp1gfMct8kKCUcGwdoQm5BN07tz4ozc
	 a5S9qC7LzJ/9LO/PmIHCD1H7+cbjRkIg4Ck2FCvg+mryclbnlQ1gOhsD5ODI+XOcjn
	 75nD3GC6JRqzg==
Date: Mon, 28 Sep 2026 17:48:58 +0100
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
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Message-ID: <20260928-disarm-unshackle-6cfc9c31f40a@spud>
References: <20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com>
 <20260927-feature-clock-guard-v7-1-8dd19568d9a2@bruker.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L1+02ogUpUOAI+8n"
Content-Disposition: inline
In-Reply-To: <20260927-feature-clock-guard-v7-1-8dd19568d9a2@bruker.com>

--L1+02ogUpUOAI+8n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 02:00:00PM +0000, Vyacheslav Yurkov via B4 Relay wr=
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

> ---
>  .../devicetree/bindings/clock/gpio-gate-clock.yaml | 32 ++++++++++++++++=
++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6e..1ad87c8b36b9 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> @@ -11,7 +11,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: gpio-gate-clock
> +    enum:
> +      - gpio-gate-clock
> +      - gpio-locked-clock
> =20
>    clocks:
>      maxItems: 1
> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
> =20
> +  enabled-gpios:
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
> +          const: gpio-locked-clock
> +    then:
> +      required:
> +        - enabled-gpios
> =20
>  additionalProperties: false
> =20
> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-clock";
> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        enabled-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };
>=20
> --=20
> 2.34.1
>=20
>=20

--L1+02ogUpUOAI+8n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarqaegAKCRB4tDGHoIJi
0qkgAPwLbnGmHMqfHyLBulYb5hGC1OUAB4zwxyfSelk4McM9egEA2ZKdn80e2nzx
ozh36yl5udmVC+2QUEb6cHqGivbo5wU=
=+wSo
-----END PGP SIGNATURE-----

--L1+02ogUpUOAI+8n--
