Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483D1C9EAF;
	Wed, 23 Oct 2024 16:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701011; cv=none; b=Snt/G6KOak4eSXx3YBEz0oKCKe9GtZ8UbZI8Z+3EY9tbCcgpD+mPtN+xrQ6Tn2MfYGJJUNMvGeR59YQZ+oSvuANmCBHtAGzZHT4D3DaBe3Y8dmyMzFd3Bs7aKfSjZQofsMkY2DWDTHSVMWOjhjXcZ/jdjkGjg4tsM8cMmpCcYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701011; c=relaxed/simple;
	bh=tR6ZRhyK7Sm/Rzy9KYSP2XfAzgT15xqzfaZCffXrm7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2FOKNdOuB4j3ygBH4FMeBsdFStMxK315PM3AL+9zcoXu3GUChoZuj4XjDw1nhueyYART4jtJgTGxb0Kwq1MVLGq8IcGqC8PNcn6lXdc/JXy+ATlnyIFyvPqysn0nON8B/8XCiG7YWX3dtAljOxrCpMwGB1GbymX9EnqCFrjjBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6q/VM7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6q/VM7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B586AC4CEC6;
	Wed, 23 Oct 2024 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701010;
	bh=tR6ZRhyK7Sm/Rzy9KYSP2XfAzgT15xqzfaZCffXrm7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6q/VM7XIfbEKQm2NomojnFSCUf82U8kcnsKtepLUhD4Vda3YJ+hRQ8cPRGNanCIR
	 xMKlpmJNvu+jo9ZTZ3Z7qXsHX3/SMGC54zv8OD+WVGttauqeBnUJBVkRy/EQn3cpnz
	 KMIOp3MZFV1vbqSZRAvFQl7VkhoGaAUoKB7+NOSTZbgdivgGkMxHfyPyQUyCieQvjw
	 36aYXD0FwAoOzXNNQ6318NohcrIt0JnkKRm8fygACoOS/AeIusiA7NLE1oFVDpVoDa
	 IV4UeskjwME5f3rXU4nkASAI6hhoPYdz0NX6IwfV6/4ttayqxpv5IP9+owrGMMJJbb
	 qshDEqkEXZA8g==
Date: Wed, 23 Oct 2024 17:30:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/2] dt-bindings: clock: axi-clkgen: include AXI clk
Message-ID: <20241023-tucking-pacific-7360480bcb61@spud>
References: <20241023-axi-clkgen-fix-axiclk-v1-0-980a42ba51c3@analog.com>
 <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J5M4fBmjclbyCSI/"
Content-Disposition: inline
In-Reply-To: <20241023-axi-clkgen-fix-axiclk-v1-1-980a42ba51c3@analog.com>


--J5M4fBmjclbyCSI/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 04:56:54PM +0200, Nuno Sa wrote:
> In order to access the registers of the HW, we need to make sure that
> the AXI bus clock is enabled. Hence let's increase the number of clocks
> by one.
>=20
> In order to keep backward compatibility, the new axi clock must be the
> last phandle in the array. To make the intent clear, a non mandatory
> clock-names property is also being added.

Hmm, I'm not sure. I think clock-names actually may need to be mandatory
here, as otherwise you'll not what the second clock is. The driver would
have to interpret no clock-names meaning clock 2 was clkin2.

>=20
> Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/clock/adi,axi-clkgen.yaml   | 21 +++++++++++++++=
++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml =
b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
> index 5e942bccf27787d7029f76fc1a284232fb7f279d..f5f80e61c119b8a68cb6e7a26=
ed275764f8d200f 100644
> --- a/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
> +++ b/Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml
> @@ -26,9 +26,21 @@ properties:
>      description:
>        Specifies the reference clock(s) from which the output frequency is
>        derived. This must either reference one clock if only the first cl=
ock
> -      input is connected or two if both clock inputs are connected.
> -    minItems: 1
> -    maxItems: 2
> +      input is connected or two if both clock inputs are connected. The =
last
> +      clock is the AXI bus clock that needs to be enabled so we can acce=
ss the
> +      core registers.
> +    minItems: 2
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: clkin1
> +          - const: s_axi_aclk
> +      - items:
> +          - const: clkin1
> +          - const: clkin2
> +          - const: s_axi_aclk
> =20
>    '#clock-cells':
>      const: 0
> @@ -50,5 +62,6 @@ examples:
>        compatible =3D "adi,axi-clkgen-2.00.a";
>        #clock-cells =3D <0>;
>        reg =3D <0xff000000 0x1000>;
> -      clocks =3D <&osc 1>;
> +      clocks =3D <&osc 1>, <&clkc 15>;
> +      clock-names =3D "clkin1", "s_axi_aclk";
>      };
>=20
> --=20
> 2.47.0
>=20

--J5M4fBmjclbyCSI/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxkkjQAKCRB4tDGHoIJi
0lv4AP0RLHKgJM4qGckMySO5E44cUyoCdkik/JQzRmGPjbXniAD0DynVB6iVJaT3
y2JDIZNNDWhoPX1F+Mz9mmNc2UVOAg==
=vfgp
-----END PGP SIGNATURE-----

--J5M4fBmjclbyCSI/--
