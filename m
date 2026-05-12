Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB7C3E0733;
	Tue, 12 May 2026 17:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607511; cv=none; b=IQJs3s0I8FOpeN4zN0+qQXlihhoAzzHA23DT5NBHFeIlH4YjVoivYxektMoT41/2waxLXVJPTGLW+jdQXmxJ+Bn4AL5kjwzjikqpKF/3h++G4oQJ4KwUiTddPIHmhQX0oXGc1AgSQs4S1txakImZz6RqZ7NL0iUbe2WTMpcJD8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607511; c=relaxed/simple;
	bh=Lh4wZ2wxbXrL/PMypQSELTSMyjIJKr5egJCQ3MixpNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7iHeqx0SB5b1uZem1xE5vbn5Mtc9W/jf+At3yE5tP1sSDD8Frc8CM/DhS5pmW8oo3zg3kx58WxnM2H8pWfkA5gP/nwIUIvvgiI8vPO0EXiwJZmoYPBQhyVbS8Lv7Z3JkdWUVaBngjsQTuRWKX8iVXT3FVSllpt9Sjl0HZZhVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBhAfbh/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBhAfbh/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18981C2BCB0;
	Tue, 12 May 2026 17:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607511;
	bh=Lh4wZ2wxbXrL/PMypQSELTSMyjIJKr5egJCQ3MixpNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nBhAfbh/Rz/3sOchPEJ7316+gfWx8Zlpfpur8Va/rByCxc3VKBhfXd09EcGAiDstx
	 33B208k8iVJPVyVYzgqD3z0GEBEaNgeo8i8o8ISr5bQ3V00uWqf0I0YNi44RiWc4H6
	 r1wY0DPFN4qllsDpjRAuEH8YyCV8fsHFHfRCEeA2IvZXo8LKNTp8o8pdaRQw2m8+VT
	 r7PG6CUQdOMJBU99axUJZJr41QWnSiRLqaFa79yj+Qgl+x/FqW8bxJjdxtV65iuwmC
	 r+z1fRRTSbaBezAXTEodCEfu6+YERtuKB5fWlLpbRFVwth8U5SrcnQIJbyw4PMPaJm
	 OxUwwl1S+hrMw==
Date: Tue, 12 May 2026 18:38:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Message-ID: <20260512-operator-vindicate-339bf407d7f3@spud>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
 <20260512083521.3448-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e5f+9DcEecnTfzlC"
Content-Disposition: inline
In-Reply-To: <20260512083521.3448-2-changhuang.liang@starfivetech.com>


--e5f+9DcEecnTfzlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 01:35:10AM -0700, Changhuang Liang wrote:
> Add documentation to describe StarFive JHB100 SoC System Controller
> Registers.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfi=
ve,jhb100-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb1=
00-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh=
b100-syscon.yaml
> new file mode 100644
> index 000000000000..0add3d9727ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-sysc=
on.yaml
> @@ -0,0 +1,107 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 SoC system controller
> +
> +maintainers:
> +  - Kevin Xie <kevin.xie@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive JHB100 SoC system controller contains MMIO registers used=
 by
> +  other hardware modules (e.g., PLL, eMMC, PCIe). These modules access
> +  specific register offsets, bit masks, and shifts within the system
> +  controller region for configuration and status.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jhb100-b2h-syscon
> +          - starfive,jhb100-gpu-syscon
> +          - starfive,jhb100-h2b-syscon
> +          - starfive,jhb100-host-syscon
> +          - starfive,jhb100-husb-syscon
> +          - starfive,jhb100-husbcmn-syscon
> +          - starfive,jhb100-husbd-syscon
> +          - starfive,jhb100-npu-syscon
> +          - starfive,jhb100-pcieep-ecsr-syscon
> +          - starfive,jhb100-pcierp-ecsr-syscon
> +          - starfive,jhb100-pcierp-syscon
> +          - starfive,jhb100-per0-syscon
> +          - starfive,jhb100-per1-syscon
> +          - starfive,jhb100-per2-syscon
> +          - starfive,jhb100-per3-syscon
> +          - starfive,jhb100-strap-syscon
> +          - starfive,jhb100-sys0-syscon
> +          - starfive,jhb100-sys1-syscon
> +          - starfive,jhb100-sys2-syscon
> +          - starfive,jhb100-usb-syscon
> +          - starfive,jhb100-vout-syscon
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jhb100-per0-syscon
> +              - starfive,jhb100-per1-syscon
> +              - starfive,jhb100-sys0-syscon
> +    then:
> +      required:
> +        - clocks
> +        - '#clock-cells'

Probably missing and else: clocks/clock-cells: false?
And the same below for resets?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jhb100-pcierp-syscon
> +    then:
> +      required:
> +        - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@13010000 {
> +        compatible =3D "starfive,jhb100-sys0-syscon", "syscon";
> +        reg =3D <0x13010000 0x2000>;
> +        clocks =3D <&osc>;
> +        #clock-cells =3D <1>;
> +    };
> +
> +    syscon@13014000 {
> +        compatible =3D "starfive,jhb100-sys1-syscon", "syscon";
> +        reg =3D <0x13014000 0x4000>;
> +    };
> +
> +    syscon@11719000 {
> +        compatible =3D "starfive,jhb100-pcierp-syscon", "syscon";
> +        reg =3D <0x11719000 0x1000>;
> +        #reset-cells =3D <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47e4b368347f..6f6aac7cea95 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25613,6 +25613,11 @@ S:	Maintained
>  F:	drivers/reset/starfive/reset-starfive-jhb1*
>  F:	include/dt-bindings/reset/starfive,jhb1*.h
> =20
> +STARFIVE JHB100 SYSCON
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon=
=2Eyaml
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> --=20
> 2.25.1
>=20

--e5f+9DcEecnTfzlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNlkAAKCRB4tDGHoIJi
0osyAP9nG5LpF/CsWXBrsbCldev1ga7IWfs9Nuw6cCVorDxtlwD8Da2mhdujsZzD
dWkYJ8EY0O5iSm8tU81TxPJeGAoIHwQ=
=/WCt
-----END PGP SIGNATURE-----

--e5f+9DcEecnTfzlC--
