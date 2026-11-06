Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986551;
	b=eoNbB9IZj6GeiPxwaEYjyUcnYuT6U7Oi65VLEe6+yWXwihjqVbLcEwHTIXtoATB+7RAY
	 89J4wTes7PNuh+yLZR/xtE2KeZMPavJBBBFztEP6InPCYGjdqzG+Sx54ulaS2UVEwxcSx
	 VtKYDNtySO3JuHSFbF5tS+VMCZJqgKPJxoOGg+C+89pnIEIe2KMgBA/Kz7Ky66htTi1fG
	 FWgrQhbxdLlMzO/LNPOOPeRVuJxpdiOKHjH9s5hcCBKzcfzpr/C8fQalw99lhqU9WnfWv
	 iViBKXywOd3JVt8RhPYuL0bd8qdQbdwXGZrN2RICjvn7JCHrekiKyZgd+4GiVWd4tAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986551;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sm4OrPi0zAjxyxaN26uT9wuIudWQNgaYQxVZ5vD4Joc=;
	b=JF4+Cz2HS1wHVXkrvBWTLt7xIN7pGZv2zwgv+Qc6UTi6yd/C7p69g+ZY/DFvFgQR0wS7
	 LhLPLSM6gKWkhH+//UeRuf2OY5XOLu+yX+RFeTGsANtd9YWU2WO6Ffdmo5TUdu/XJ7fgq
	 MZ+es1Z3t69cEWtHv7eSHebh72JADP/59oztm0M6i93p4nA5UGqm0fCcoAC3XuhAGNiv5
	 KZLynCC9IuQD798PYoSBFoxfb/Gxnfz0lNUaigt5ZSKsHFMXcJjkSAOwR0HZVL61ThfVY
	 IJ/AL1icU+38v6ut7O4v69lY+XdxUhCUq7r8XoajsDeaGyDYrpEtugAqWcEq01srP+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho15CKcB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762B606A326;
	Fri,  6 Nov 2026 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ho15CKcB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019931F0089F;
	Fri,  6 Nov 2026 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793986551;
	bh=sm4OrPi0zAjxyxaN26uT9wuIudWQNgaYQxVZ5vD4Joc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ho15CKcB7O4FZs2HAbtefpKLJ/LqAH8zzCA74y7TPaatxXg0QE8bv/qA3KELSY6EW
	 4NkpZqnp9/XvJAmRE/fUfWtPhr+EPvI/E64BEgo5puMhL6O7BI0T4cMbleCI1EleiI
	 basOdYQyENe27qbK+jycvzN1+7mfXgCnYuTl2U/ljl9Hrq8U5CYWYnnsfIYH9el36+
	 73C2bo8RjaoT5VFRXhEVgUX7H0dHGQwwFN9DPs84gv+6b4RVRFn4pGuq0gclGif5VB
	 Na6rXacF7nQFpSh+Z+V+pF9eZDOOVyv6pvtHMjfWv35XmERXu73oaB5a+r8FrQgvuW
	 +szG84Z/vn31w==
Date: Fri, 6 Nov 2026 17:35:46 +0000
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
Message-ID: <20261106-armed-spoils-909d7d4f7d21@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="O0FeJVII/ayv5UPE"
Content-Disposition: inline
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>

--O0FeJVII/ayv5UPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 09:30:27AM +0100, Carlo Caione wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
>=20
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
>=20
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

This looks okay, but I don't want to sign off on it before seeing an
answer the my quesiton on the other binding.

Thanks,
Conor.

> ---
>  .../bindings/clock/amlogic,s7-pll-clkc.yaml        | 73 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/amlogic,s7-pll-clkc.h    | 42 +++++++++++++
>  2 files changed, 115 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.=
yaml b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
> new file mode 100644
> index 000000000000..e2b5ba5524a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s7-pll-clkc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (c) 2026 BayLibre, SAS.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s7-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic S7 Series PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Carlo Caione <ccaione@baylibre.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,s7-pll-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll
> +      - description: input gp0 pll
> +      - description: input hifi pll
> +      - description: input hifi1 pll
> +      - description: input hdmi pll
> +
> +  clock-names:
> +    items:
> +      - const: fix
> +      - const: gp0
> +      - const: hifi
> +      - const: hifi1
> +      - const: hdmi
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> +
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        clock-controller@8000 {
> +            compatible =3D "amlogic,s7-pll-clkc";
> +            reg =3D <0x0 0x8000 0x0 0x1e8>;
> +            #clock-cells =3D <1>;
> +            clocks =3D <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_TOP_PLL_OSC>,
> +                     <&scmi_clk CLKID_HDMI_PLL_OSC>;
> +            clock-names =3D "fix",
> +                          "gp0",
> +                          "hifi",
> +                          "hifi1",
> +                          "hdmi";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,s7-pll-clkc.h b/include/dt=
-bindings/clock/amlogic,s7-pll-clkc.h
> new file mode 100644
> index 000000000000..4014314a3eb0
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s7-pll-clkc.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 BayLibre, SAS.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H
> +
> +#define CLKID_FIXED_PLL_VCO			0
> +#define CLKID_FIXED_PLL				1
> +#define CLKID_FCLK_DIV2_DIV			2
> +#define CLKID_FCLK_DIV2				3
> +#define CLKID_FCLK_DIV3_DIV			4
> +#define CLKID_FCLK_DIV3				5
> +#define CLKID_FCLK_DIV4_DIV			6
> +#define CLKID_FCLK_DIV4				7
> +#define CLKID_FCLK_DIV5_DIV			8
> +#define CLKID_FCLK_DIV5				9
> +#define CLKID_FCLK_DIV7_DIV			10
> +#define CLKID_FCLK_DIV7				11
> +#define CLKID_FCLK_DIV2P5_DIV			12
> +#define CLKID_FCLK_DIV2P5			13
> +#define CLKID_GP0_PLL_DIV0P5			14
> +#define CLKID_GP0_PLL_VCO			15
> +#define CLKID_GP0_PLL				16
> +#define CLKID_HIFI_PLL_DIV0P5			17
> +#define CLKID_HIFI_PLL_VCO			18
> +#define CLKID_HIFI_PLL				19
> +#define CLKID_HIFI1_PLL_DIV0P5			20
> +#define CLKID_HIFI1_PLL_VCO			21
> +#define CLKID_HIFI1_PLL				22
> +#define CLKID_HDMI_PLL_DIV0P5			23
> +#define CLKID_HDMI_PLL_VCO			24
> +#define CLKID_HDMI_PLL_OD0			25
> +#define CLKID_HDMI_PLL_OD1			26
> +#define CLKID_HDMI_PLL				27
> +#define CLKID_HDMI_PLL_PIX_DIV5			28
> +#define CLKID_HDMI_PLL_PIX_DIV6P25		29
> +#define CLKID_HDMI_PLL_PIX_DIV7P5		30
> +#define CLKID_HDMI_PLL_PIX			31
> +
> +#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S7_PLL_CLKC_H */
>=20
> --=20
> 2.56.0
>=20

--O0FeJVII/ayv5UPE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4P8QAKCRB4tDGHoIJi
0k29AQCTJ294Vyu8WoKtwTE8vCVIj2e8Prhj+z474CV/zh6qUgD/QuGi2AwUeJZM
rEmZ2XkOgYe+EHZj67+lAYXHcliGTgQ=
=Aa3O
-----END PGP SIGNATURE-----

--O0FeJVII/ayv5UPE--
