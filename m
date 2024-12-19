Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608D1A9B5C;
	Thu, 19 Dec 2024 19:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734637792; cv=none; b=OWm3vVWhS96KEbkXkr0CVYTcE8UMianRzfaSImi+5xv2/ApPIakcCMxLq3ohOnDMcvZdOSIDg6LdAquwUmdVEg9MYQncCGY3+76F5EErpzttQMDclllb1Mmpcw8Jdoj0bKIYf3X8JZgHckILilrByc+Nt2tSZ5rnm1BNyDUBqs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734637792; c=relaxed/simple;
	bh=rGOvvqg02/2Kcbo+slRA09ppaoCh2Sdscv53DQPXwwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtaEXOHal66aSR+QwztNSPJ6gtZtPTOocNOA0jO/oV49eYjMRWS2vCRwah2zYDmDu7dJQ29mQ64KvwVmcXZqwjeOqYQeUYVqyzXWQZ3b6QKQtk6YXlmC1MFPYV1NStdP3lpeAFxFzX1oUPwGokn5rYoZGHgintG23qKwmK/ylwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNoPFuai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNoPFuai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D7AC4CECE;
	Thu, 19 Dec 2024 19:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637792;
	bh=rGOvvqg02/2Kcbo+slRA09ppaoCh2Sdscv53DQPXwwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNoPFuaissLylLW6vl6ENQR11UJB32vS4pGe0DTWHhbfAVBov3DWOJsuyXWkZelOS
	 pwfPu7gX9wTE3VG6afRok5aMPh8fl2+kue6Y7MWSn8TFrSXRCMxHI9HL9FlbVuBbn9
	 GlcWNB00kAzw0WozKoRiLJfZ/UvcB1LjyDQbz3zWQlxbwzLJAsavKVPmnXVDf6Vp1O
	 n3fOWLMTn4H01vq1NdMltXKWdEsWV2h8t9dC3Htqv+TljtHKKHLFDco42BMBgIwboj
	 Wp+K1yH5BnL/3GWXnMTLd986iCZ/UHVIIk+Z793S9XuPKtEm8qv6itBSH8Rkcg6PKE
	 ETaU6H0R51U5g==
Date: Thu, 19 Dec 2024 19:49:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <20241219-lash-lather-31443ced0e0c@spud>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ngXsONZmUzjSKy68"
Content-Disposition: inline
In-Reply-To: <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>


--ngXsONZmUzjSKy68
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
> The imx8m-clock.yaml binding covers the clock controller inside all
> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
> support two operating modes: nominal and overdrive mode.

This implies that only the two modes you mention are possible, but you
leave the option open to a dts author to use either. How come?

Makes it seem like we only need one of these, for whatever the
non-default option is?

>=20
> While the overdrive mode allows for higher frequencies for many IPs,
> the nominal mode needs a lower SoC voltage, thereby reducing
> heat generation and power usage.
>=20
> In any case, software should respect the maximum clock rate limits
> described in the datasheet for each of the two operating modes.
>=20
> To allow device tree consumers to enforce these limits, document two new
> optional properties that can be used to sanity check the clock tree.
>=20
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++=
++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/D=
ocumentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a81478..a6ae5257ef53 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -43,6 +43,14 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx=
8m-clock.h
>        for the full list of i.MX8M clock IDs.
> =20
> +  fsl,nominal-mode:
> +    description: Set if SoC is operated in nominal mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  fsl,overdrive-mode:
> +    description: Set if SoC is operated in overdrive mode
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
>  required:
>    - compatible
>    - reg
> @@ -95,6 +103,12 @@ allOf:
>              - const: clk_ext2
>              - const: clk_ext3
>              - const: clk_ext4
> +  - if:
> +      required:
> +        - fsl,overdrive-mode
> +    then:
> +      properties:
> +        fsl,nominal-mode: false
> =20
>  additionalProperties: false
> =20
>=20
> --=20
> 2.39.5
>=20

--ngXsONZmUzjSKy68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2R42gAKCRB4tDGHoIJi
0vi0AQDyo0dpjmecgbYGZWFjWTgwStcmLQ4GGpLpOk50s+I6rgEAhLl57IPin5RD
Msn0CDRtkfOYmjJkFXiEEwgZVTCHvgo=
=JUib
-----END PGP SIGNATURE-----

--ngXsONZmUzjSKy68--
