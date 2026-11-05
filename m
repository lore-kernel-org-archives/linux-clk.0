Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837066;
	b=UByzd+rlAwyZg2iol3lF0f+clMJ6nMZ8yzAHgwkvk44yNDAoypcFnmDMfs8D0+bj6Xhn
	 UwbF9FqzBWkt0wz7WioB3K0xaaetDNEDLdJA2zxHOx4IjRrnYrMxmJQTPofKIUJ6awE3N
	 wPwjFEBt6AYbZmApZVoVEsQ+Vj1h3Y9pqpBJuxzUntKbReDy/ckIVKOQx8Xu7TwW/fCzf
	 W/OvqrR/flj8zHoG7IR3tAr0ENr4VqtSc7TiDSa2TJQHCqbCZsiZ4sNFhY2p7LyWNwySX
	 AuhPtx5Hcc9kHd83t5zcehQN1+HHMsj9GycrxR5HtbiqSJel6hXPQX3/XSFZ9j4D2Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837066;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jbmFG+0AVErgF8BXF37Cg4U/C7B/sjkiX56yGJOkyyw=;
	b=aZGF/AIZQAwytvw7pNkl58aIm8c2YfmsyBvdRSiezn5KzJ3tTmcCwHjIbAsP81YzT+3f
	 hR1mEeev3QstYxw2Bf/dg0FaDF0w/mFwPM4GjsbQ71lqznwdsvFBTPPEq88KL3Lp6p4bo
	 NB46p6jj2Eb7vgcD2udkt4yDS0Pel8vdH3hek5GKvaAunfG+37cvvgzjWsjW9/qH3MF/w
	 5u6A0xO4XZ8Dmd2VAcwD/Gf5G2oLmQkbu3NChaQh4Tm4QADMso8DrbPqwRCFXDGPU+ClW
	 MSKJiSIR5SQIzX40JLrTTsL7Zdnd8Cvc3lWVNpHZgcPYSHIsh2Vpq+EpnMIjCFmoQXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOHFFvdJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12217606A31B;
	Thu,  5 Nov 2026 00:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KOHFFvdJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237C01F000C1;
	Thu,  5 Nov 2026 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793837065;
	bh=jbmFG+0AVErgF8BXF37Cg4U/C7B/sjkiX56yGJOkyyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOHFFvdJlxTANAwPtCCMAYEcxRb9pmhQ5O7dVnASX5NpN1QH+iC7HGSy3NfcmxG5F
	 x6ub7+399RWrPIzQOrdiC2coOzqemgP8PjcSBsueftbH4l3kTuiIf27DkmsVe7mhU9
	 TrOHRtC921eReSy0i0/5e5i0YGZ0Atg7P89R/ydrObVAJMux51JkncFywmCLZFxfzx
	 ykyNUcDlWM9MzYKuyHUNJlbsFGgoDLotAppd/QIMAW3CM9tRDgTSqQYZ30YTkoRe6p
	 ZYvGJK4RWxYUCx2NXA7qzV5tRPSFcWx4GLMECHx0MlvabuC96KrGDVY3Wj6jBsD7KL
	 YyPyZIWkGy6lA==
Date: Thu, 5 Nov 2026 00:04:21 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add Siflower SF19A2890 clock
 manager
Message-ID: <20261105-chemist-hunk-cfe1c06caa63@spud>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-1-a4fac07df823@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="hsG5lu4MgbgM7BjA"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-1-a4fac07df823@telaak.dev>

--hsG5lu4MgbgM7BjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:20:58AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The clock manager of the Siflower SF19A2890 holds the SoC's PLLs and
> the muxes and dividers that derive the bus, CPU and peripheral clocks
> from them. The peripherals' own gates and resets are in separate
> blocks.
>=20
> The header is Chuanhong Guo's, from his SF19A2890 branch, without the
> count at its end.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  .../bindings/clock/siflower,sf19a2890-clk.yaml     | 57 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/siflower,sf19a2890-clk.h | 27 ++++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-c=
lk.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.ya=
ml
> new file mode 100644
> index 000000000..9b72f14c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/siflower,sf19a2890-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 clock manager
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +description: |
> +  The clock manager of the Siflower SF19A2890 holds the SoC's three PLLs
> +  (CPU, DDR and common) and the clock muxes with dividers that derive the
> +  bus, CPU and peripheral clocks from them. The peripherals' own clock
> +  gates and resets are in separate peripheral clock and reset managers.
> +
> +  The clocks are defined in include/dt-bindings/clock/siflower,sf19a2890=
-clk.h.
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 12 MHz oscillator
> +      - description: 40 MHz oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc12m
> +      - const: osc40m
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@19e01000 {
> +        compatible =3D "siflower,sf19a2890-clk";
> +        reg =3D <0x19e01000 0x800>;
> +        clocks =3D <&osc12m>, <&osc40m>;
> +        clock-names =3D "osc12m", "osc40m";
> +        #clock-cells =3D <1>;
> +    };
> diff --git a/include/dt-bindings/clock/siflower,sf19a2890-clk.h b/include=
/dt-bindings/clock/siflower,sf19a2890-clk.h
> new file mode 100644
> index 000000000..74b9d67ea
> --- /dev/null
> +++ b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +#ifndef __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
> +#define __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
> +
> +#define CLK_PLL_CPU		0
> +#define CLK_PLL_DDR		1
> +#define CLK_PLL_CMN		2
> +#define CLK_MUXDIV_BUS1		3
> +#define CLK_MUXDIV_BUS2		4
> +#define CLK_MUXDIV_BUS3		5
> +#define CLK_MUXDIV_CPU		6
> +#define CLK_MUXDIV_PBUS		7
> +#define CLK_MUXDIV_MEM_PHY	8
> +#define CLK_MUXDIV_UART		9
> +#define CLK_MUXDIV_ETH_REF	10
> +#define CLK_MUXDIV_ETH_BYP_REF	11
> +#define CLK_MUXDIV_ETH_TSU	12
> +#define CLK_MUXDIV_GMAC_BYP_REF	13
> +#define CLK_MUXDIV_M6250_0	14
> +#define CLK_MUXDIV_M6250_1	15
> +#define CLK_MUXDIV_WLAN24_PLF	16
> +#define CLK_MUXDIV_WLAN5_PLF	17
> +#define CLK_MUXDIV_USBPHY_REF	18
> +#define CLK_MUXDIV_TCLK		19
> +#define CLK_MUXDIV_NPU_PE_CLK	20
> +
> +#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H */
>=20
> --=20
> Git-155)
>=20
>=20

--hsG5lu4MgbgM7BjA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvIBQAKCRB4tDGHoIJi
0v4TAQDz2T3pBv1HIwfXdqi2XuQfYJ30bMfijkP4PiG+NxiZVQEArPYlprYAy20v
N/zplWFYB98YkYoKfgf5znEP89m+mg0=
=2HV9
-----END PGP SIGNATURE-----

--hsG5lu4MgbgM7BjA--
