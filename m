Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623D97346D;
	Mon,  2 Sep 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265167; cv=none; b=IAnC0qFbJdkMBSY0TYTenHfNyPYCy6AujOUFm/QA+eq0Gof9VJgYf2A83z5+bG0LzKheSD/dRVZ74oUVWouGln4NA0+ssJ/7sKvQH3Bwxm8o+Kjq8rXFOn68lAeNdo+IM5G7YDcFsN086mhFqCpz9kuMQx9kA2VKKoh5QM2yS5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265167; c=relaxed/simple;
	bh=uwDnexRZluuzQ4oXnfkJp+I6IvF2Y3M84Dkq8LqMqcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE+aDYuAYuhagjocVSYLsRZWDUflhTpLFb3GmrFPua0Qg4xqXUJ7GptdeLBsNpPvdWt4I8nG48uN3X8ptbWZqLejeXZ/ru1YNNwPc/sLzKQVbBJteW0jBpr9qHcFPJ1M1oaMNpsg4Ga8D6X/Iq7jd6ayxDZLxs9g5F34ma18vz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRqqH7Pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRqqH7Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76546C4CEC2;
	Mon,  2 Sep 2024 08:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725265166;
	bh=uwDnexRZluuzQ4oXnfkJp+I6IvF2Y3M84Dkq8LqMqcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRqqH7Pj7ujfnGKdPZpOBVxdb9rVDFReW4kpio/Z42hiEUDYl6WxfpS3nGUlQQmmz
	 pGzx5rgOLZN04wxnzrLEhYmmyYsLyod7QVJex5KXcqkvUPOdiWOGj//qpC6dRD9FmL
	 GEU0A0xOglIOlnJx7Hgs3uFfOmQH1C2JuzsaTZn9f5UBYsH7ZPHgHwHurQi+Xmoeac
	 EfxbTEbGpApSgxGVJAcxjAF0eHdkHScGTI2RGAGkY1kijT6/ShWM5x6YCNsYUvnQXz
	 pA9dVhJXm/qk+nIhrylATQaX4rPkN/m2K4/PSci9/yO7P4EOL3l5dYRDOjFabDWOO8
	 lmXYjOclE8Qwg==
Date: Mon, 2 Sep 2024 09:19:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/7] dt-bindings: clock: airoha: update reg mapping for
 EN7581 SoC.
Message-ID: <20240902-sandbank-aging-79e6a5cf383b@squawk>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
 <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vISb92k7QBBAADvZ"
Content-Disposition: inline
In-Reply-To: <20240831-clk-en7581-syscon-v1-1-5c2683541068@kernel.org>


--vISb92k7QBBAADvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 09:18:43AM +0200, Lorenzo Bianconi wrote:
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not public yet.

What does "not public yet" mean? The bindings are public, so someone
could have built a dtb without whatever non-public dts you currently
have. Do you mean, has not yet made it into a released kernel?

Cheers,
Conor.

>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../devicetree/bindings/clock/airoha,en7523-scu.yaml         | 12 +++---=
------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index 84353fd09428..ca426c328535 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -34,8 +34,8 @@ properties:
>            - airoha,en7581-scu
> =20
>    reg:
> -    minItems: 2
> -    maxItems: 4
> +    minItems: 1
> +    maxItems: 2
> =20
>    "#clock-cells":
>      description:
> @@ -75,9 +75,6 @@ allOf:
>          reg:
>            items:
>              - description: scu base address
> -            - description: misc scu base address
> -            - description: reset base address
> -            - description: pb scu base address
> =20
>  additionalProperties: false
> =20
> @@ -98,10 +95,7 @@ examples:
> =20
>        scuclk: clock-controller@1fa20000 {
>          compatible =3D "airoha,en7581-scu";
> -        reg =3D <0x0 0x1fa20000 0x0 0x400>,
> -              <0x0 0x1fb00000 0x0 0x90>,
> -              <0x0 0x1fb00830 0x0 0x8>,
> -              <0x0 0x1fbe3400 0x0 0xfc>;
> +        reg =3D <0x0 0x1fb00000 0x0 0x970>;
>                #clock-cells =3D <1>;
>                #reset-cells =3D <1>;
>        };
>=20
> --=20
> 2.46.0
>=20

--vISb92k7QBBAADvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZtV1CgAKCRB4tDGHoIJi
0p+JAQDslHQpzhQV/GCgUzxRSqxjDUIRf7Ia3aDAHzTaCsnzhAEApOTepuB2bYB6
RefrEFuKLW+XAU2TGyMkclyJdjUIcQk=
=Acec
-----END PGP SIGNATURE-----

--vISb92k7QBBAADvZ--
