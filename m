Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9CA1D618E;
	Mon, 13 Oct 2025 20:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760385643; cv=none; b=A8x5ElWGCsmI2kw/ZkFkn7tG+8ngLBUDPrT9FPytkNwucwhW1GrpDIm1PMTjtbWf7al+/PHzkQ8xjofKpgHFgPL4SbQ15KQEiw6iDcZSBQnC7KqXRlVOILhKfpgKR99ii4L5esB1TLYyfGD2imQnkjUXcuLjij7tjA7iA6Dg3Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760385643; c=relaxed/simple;
	bh=Pp/wUQvCcGY/kK52Ly1VfDofH1MmCFpfDv4Y9TLAeac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX6/TEmA1JnJvsOb27TVdipM4/u2WA6MiqEbX0ZbczSmM3oojNFG3SBir8NvfkZFsi5RgvK+p/yHy/oS65L18rW+znQEKaSwv8T+BRA2gGjDfodDX0Ke20/6kq4OVFtKIqfZmSL6FT8ORXq4Cg1qriE0qLCRqOpKA3YXcCY7ll8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sxe1mwX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sxe1mwX5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82542C4CEE7;
	Mon, 13 Oct 2025 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760385643;
	bh=Pp/wUQvCcGY/kK52Ly1VfDofH1MmCFpfDv4Y9TLAeac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sxe1mwX5fbLJATXzJ2JuuwYg7tu1htDS2VKhlzgTry3nglfBTH/yGASCB2FoDzAw/
	 U24HyDuLbH81n6eJkTqiz7oZaf9eVclaM0F4g1GAOQM81ombjqD8O3tN11D31+9VHd
	 OKFriDi6hluF8ZmrtdeXCpbBvJqkpDIB6BSOUv1qhfXDJtcSYiSE/nUfzPbRWpH4l2
	 S6AISM5QX1fqv6k9lm6R4uvVsGx93RTo8hoUX16ww6/yhMlkUREYrxAB0vy1W+0Una
	 CNkhfiTcHeBlR/P62rvd1ItsfRHSJEEvQUauBC5vhe8EDR2gFdzZ2VpFrdmRuwljfq
	 lwkdbFTO+nEkQ==
Date: Mon, 13 Oct 2025 21:00:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clk: si522xx: Clock driver for Skyworks
 Si522xx I2C PCIe clock generators
Message-ID: <20251013-finally-stopped-7f5ebac801b3@spud>
References: <20251011223846.261652-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fePTil87fCsJXjR+"
Content-Disposition: inline
In-Reply-To: <20251011223846.261652-1-marek.vasut@mailbox.org>


--fePTil87fCsJXjR+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 12, 2025 at 12:35:59AM +0200, Marek Vasut wrote:
> Document the Skyworks Si522xx PCIe clock generators. Supported models are
> Si52202/Si52204/Si52208/Si52212. While chip is similar to Si521xx, it also
> contains many subtle differences to justify separate driver.
>=20
> The Si522xx has different register and bit layout, supports spread spectr=
um
> clocking and slew rate settings, and no longer contains the old BC Byte C=
ount
> configuration register. Instead, the I2C protocol is yet again very sligh=
tly
> different, but this time at least compatible with regmap.
>=20
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> ---
>  .../bindings/clock/skyworks,si522xx.yaml      | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/skyworks,si52=
2xx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/skyworks,si522xx.yam=
l b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
> new file mode 100644
> index 0000000000000..6ad26543f9d21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml

Can you just pick one of the compatibles here?

> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/skyworks,si522xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Skyworks Si522xx I2C PCIe clock generators
> +
> +description: |
> +  The Skyworks Si522xx are I2C PCIe clock generators providing
> +  from 2 to 12 output clocks.
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - skyworks,si52202
> +      - skyworks,si52204
> +      - skyworks,si52208
> +      - skyworks,si52212
> +
> +  reg:
> +    const: 0x6a
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    items:
> +      - description: XTal input clock
> +
> +  skyworks,out-amplitude-microvolt:
> +    enum: [ 600000, 650000, 700000, 750000, 800000, 850000 ]
> +    description: Output clock signal amplitude
> +
> +  skyworks,out-spread-spectrum:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 100000, 99750, 99500 ]
> +    description: Output clock down spread in pcm (1/1000 of percent)
> +
> +patternProperties:
> +  "^DIFF[0-11]$":
> +    type: object
> +    description:
> +      Description of one of the outputs (DIFF0..DIF11).

typo, DIFF11.
Does this regex actually work? I don't think it allows anything other
than DIFF0 and DIFF1, since it evaluates 0-1 as a range and 1 as another
range.

Cheers,
Conor.

pw-bot: changes-requested

> +
> +    properties:
> +      skyworks,slew-rate:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [ 1900000, 2400000 ]
> +        description: Output clock slew rate select in V/ns
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        clock-generator@6a {
> +            compatible =3D "skyworks,si52202";
> +            reg =3D <0x6a>;
> +            #clock-cells =3D <1>;
> +            clocks =3D <&ref25m>;
> +        };
> +    };
> +
> +...
> --=20
> 2.51.0
>=20

--fePTil87fCsJXjR+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1aZwAKCRB4tDGHoIJi
0mlSAP9yVVaqkRVqRNtkZ0Ycq/6I3Siw6V3YOMRYt0faimhBrQEAy5EcD1KzGWPb
sYjW7qxLujaalJf2kI+EwvHMmzyqmAY=
=UoBZ
-----END PGP SIGNATURE-----

--fePTil87fCsJXjR+--
