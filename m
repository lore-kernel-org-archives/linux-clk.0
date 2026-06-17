Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EFA481A9C;
	Wed, 17 Jun 2026 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712693; cv=none; b=C0BitIdepGXlnfDD6OQDqNYAZ8LDfAK5uG1A/n7549zpXGeYb3dNFDw6yycJSHGLxpAeWNo4+Ffjfxw/hVWkkL36SeZbo0RjipDf2SE5AeyYI2voKEfSoSa50M9v+DMjX9Ha6IqcMDhMkRo8gpEPNTczabRcV2BWvmOnbrh52QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712693; c=relaxed/simple;
	bh=sMBiTVgGTd453I9+Z2fxKXT9pm7GomvIzVIVCtdXY2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSWnqz1HPHODMWz+Lp/lJXIZqvO8MRsrqoltD3idZvQ1CyR24EAgW+b7H52v/se8egDXdoEQBXyvifmKVHIikC86zBzJ8/WYRFaUYmWzSBFHkQ/E8E0sx0DrQt+u9ToKxYjocS2t+eMbdEHgeTytzlCQrU6F9UuFy8QrKJxgx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3b63sMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3b63sMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791501F00A3D;
	Wed, 17 Jun 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712684;
	bh=WyoCUSaY7cTlp3AfR6tdKEhPif5859XoOxUqx6uWA98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D3b63sMZ8Nqyj3tWzYwQx94av/qRF9kd3tVAhU5QocwWZHu9ItvSAG1LXFEuyba2z
	 tEUMrzQib3yDJLVcOdPItVVAfzTHonDFSQgDjanKHi6S/irkXiZwZ4EkyAk2WJtG1T
	 bOh8fYqBZ14Imepshun3O3PiqTDF0lsakVi/0SC1yFvBGKUMtGf7W529UKrtYYURj5
	 ddE4QU1E6MmUnV23+MgB0tBQMBwheD89ZqLdhgSFkSBYUSu7C4jHnT42akzebbPN7F
	 qWz4ZYuJg3YOpasu4m/+v2aRya/YjgR4YnJfUA9iEkAyCl5vHMndf9sUYhif9Eybf6
	 q3FvFEsztT+pQ==
Date: Wed, 17 Jun 2026 17:11:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 02/12] dt-bindings: clk: zte: Add zx297520v3
 matrix clock and reset bindings
Message-ID: <20260617-camcorder-profile-03c1b89b8a1c@spud>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-2-ca994bd22e9d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MgtTHcfuZASbjgtV"
Content-Disposition: inline
In-Reply-To: <20260616-zx29clk-v4-2-ca994bd22e9d@gmail.com>


--MgtTHcfuZASbjgtV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:26:22PM +0300, Stefan D=F6singer wrote:
> I split matrixclk into its own controller again because syscon/regmap
> deals poorly with device nodes that have more than one memory region. As
> a consequence I am passing all PLL outputs generated on Topclk down to
> Matrixclk.

This type of commentary FWIW can go below the --- line and instead just
write a normal commit message.
I do appreciate though that you put the information in the individual
patch.

> The syscon is used to generate the regmap shared between the clock and
> auxiliary reset drivers. The register space also contains at least one
> extra block of functionality, hardware spinlocks, that I expect will be
> necessary to communicate correctly with the LTE DSP firmware blob.
>=20
> Signed-off-by: Stefan D=F6singer <stefandoesinger@gmail.com>
> ---
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    topclk: clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topclk", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };

This should be removed from here, the tooling will satisfy the topclk
references, just as it has done for osc26m and osc32k. The example
should just contain the node the binding documents (and its children).

pw-bot: changes-requested

Looks fine otherwise.

Cheers,
Conor.

> +
> +    clock-controller@1306000 {
> +        compatible =3D "zte,zx297520v3-matrixclk", "syscon";
> +        reg =3D <0x01306000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>,
> +                 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
> +                 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_=
D4>,
> +                 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_=
D6>,
> +                 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_=
D12>,
> +                 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL=
_D26>,
> +                 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
> +                 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_=
D4>,
> +                 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_=
D6>,
> +                 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_=
D12>,
> +                 <&topclk ZX297520V3_UPLL_D16>,
> +                 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
> +                 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_=
D4>,
> +                 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_=
D6>,
> +                 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_=
D12>,
> +                 <&topclk ZX297520V3_DPLL_D16>,
> +                 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
> +                 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_=
D4>,
> +                 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_=
D6>,
> +                 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_=
D12>,
> +                 <&topclk ZX297520V3_GPLL_D16>;
> +        clock-names =3D "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
> +                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_=
d12",
> +                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d=
3",
> +                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_=
d12",
> +                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4=
",
> +                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll=
_d16",
> +                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
> +                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };

--MgtTHcfuZASbjgtV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajLHKAAKCRB4tDGHoIJi
0rtTAQCkpuMXzwTpUyyUIT1Q/nyTyjDia03337+P2NPurFZT5wD/RHaSOAgLeXL9
2JXMxj08ENwqu+MG5w7Za7FLbniv4g4=
=YGIE
-----END PGP SIGNATURE-----

--MgtTHcfuZASbjgtV--
