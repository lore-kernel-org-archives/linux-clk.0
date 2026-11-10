Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336879;
	b=ME5cIVLOHrCSoGadPxwwKh74JpoqDQf5F1C/PkVl3W9qgKCdmlAr6x3nWTjJyl9Z9leP
	 G6QYQe6/15GBDXQQ3PrJY50BTf0OKrtTjKu3aFY5L0cM/fCIwcYO3shZwWHCvp3Wmg/bg
	 Vl9cGTRXN0HmEZy76eW1KXXpICEG8P0aJO/q+7NZMo8c6xDfaUBerFzo9TF2YAosaorK9
	 kU+vIMn1/GpoCse3Y/MSxuwaMDbt3nYd+1lHzkPdH8FJDp28xlA57ojWUPYF3ESGZq5QZ
	 2BZ4RHb18i7IPpXHNJWbjUoY2xIvpZ1LW5zMOQyF1AGCBZW1uwtWDVDWvIw8iP0hhnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336879;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eE5rfuFrAE7EyUnvlrVRPnNovvwKuchWNSa6LJLS/nE=;
	b=Wai0bU/FT2dE1qaOWQGXYiMtr1sK4FFAMD3lQ968dRBGRXzVLziXskzcR8Z0G3xobxtZ
	 mUDcst1NcITVYE7JyE5vXBrVyjJ7ZdtpvdFsN48P/7aSsLThkGUTg89blMXa6ZE6XiMv5
	 1x4HiiIE/aR5+qgOg4FrH7k5FevCSSyK+xQoMXFSeKxDmJZn4Q2upg5O/XuH2yRizfYtE
	 ealP2MSxeITpOfG9fSYc2gfgdTT0AEXAihPWx/fHaNVr81TwVHXmOjHgdCr7Vl9Ihhtms
	 CnaTGkj1+zJB67e6FR0QgOqaDeXlpma7A/ED//ppl1HBJIgsFHuu4ivLrAs2nAC+6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PPFZG21/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA02606A327;
	Tue, 10 Nov 2026 18:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PPFZG21/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A45A1F0089F;
	Tue, 10 Nov 2026 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336878;
	bh=eE5rfuFrAE7EyUnvlrVRPnNovvwKuchWNSa6LJLS/nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PPFZG21/eEZ7TiuF/sGhvkL/Sh0x5mWfvE7iOxERQ8fPE0RhXyOymvrqLfDKk1Bzg
	 Jt8fbqbDIHqfU2LocrnKqwHnpIMni2Zzn7PiNQf8sU4IrCMBv0tyMGOV2LgcHblTzG
	 rQqVZpkMQ4rUBuCM01VPpiSNgqoz2PLSN4+9YPnJ3wM4YO+1OW4+Fxy3AvewNowAMv
	 2w5EDNGJM0s6hfSYZ6QFCep8SounMIQvA86IS7hnWTtL1jJ3HSmHOJ6fuFQnSVnwQl
	 SVWEvGoaBA/V/ysgN1N7xV3cTZYiTDeEMd+5QbPDBZYG47VIZlQwcY6Vu9qAoteFUX
	 ih4QehnD971Jw==
Date: Tue, 10 Nov 2026 18:54:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Message-ID: <20261110-confidant-bundle-08385b99bd78@spud>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
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
	protocol="application/pgp-signature"; boundary="HHiI4yu939XMUIIC"
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>

--HHiI4yu939XMUIIC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:42:17AM +0100, Gabriel Fernandez wrote:
> The LTDC pixel clock multiplexer of the STM32MP23x and STM32MP25x
> SYSCFG is described by a clock-controller sub-node of the SYSCFG node.
>=20
> Add this sub-node to the SYSCFG binding. It is required on STM32MP23x
> and STM32MP25x and not allowed on the other SoCs.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

Why does this need a child node at all, can't the clock controller
properties go straight into this syscon node?

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 6 +++=
+++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..38c844e8f19d 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -45,6 +45,10 @@ properties:
>    "#size-cells":
>      const: 1
> =20
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
> @@ -80,6 +84,7 @@ allOf:
>          - "#address-cells"
>          - "#clock-cells"
>          - "#size-cells"
> +        - clock-controller
>          - phy@2400
>          - phy@2800
>      else:
> @@ -87,6 +92,7 @@ allOf:
>          '#address-cells': false
>          '#clock-cells': false
>          '#size-cells': false
> +        clock-controller: false
>          phy@2400: false
>          phy@2800: false
> =20
>=20
> --=20
> 2.43.0
>=20

--HHiI4yu939XMUIIC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavNoaQAKCRB4tDGHoIJi
0iZXAP9cnh198rDZ/sUSZ260FfuknKWIsjUf89bqGNDkZUL2sQEA2zKAIIi4Rl1B
iDzxXQOq8c3ujrIfaJuAzDie/dAXkwI=
=KdWK
-----END PGP SIGNATURE-----

--HHiI4yu939XMUIIC--
