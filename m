Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875428C869;
	Thu, 11 Jun 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199000; cv=none; b=pDPp614ymCRL97x0xejzGwhLoCAv4yWrwzu5bEAaw9OQ6ZbAwpCfvmdPL2tpLU0+/0y8BczTkLK5Dqbv4NN9IAZbI1iTaV7EAkq61E4u+lRwXZxCJH4wq7GMbbzecIf/tVm03CkjipTR5tZvuKBehntSolztwEoDbPzkw67gJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199000; c=relaxed/simple;
	bh=Gli4vqL31n8B484yHw1NLtjIm8qQdWNWlv0wIH+41HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRMlspmh3/NxW59Y5Qw+R2YeObMqBuIkZMH5kSQrFpYrkxNHHjMAwdqWnOe7d8KHo+ZGpaA/mwsfQf/15qb++ouQaLfS7iRQvd1UGcNDt8xpkbvq6+eNh9G39wWqVbXXdhr0SBvkrbY7YOZsCsw9I7c4neP4mWBAcR6pOzNXStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnfBSnne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnfBSnne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E1F1F00893;
	Thu, 11 Jun 2026 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198999;
	bh=GrveczpwkgXcKPkC8yeGc+zOFLRJoml7yG8K7quieLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UnfBSnneSPgrpTaTPbSrbcGeGcuHqy7CDOEWWbZxF6oWTxpJCfHI/UrDcix/wUobE
	 Tpt+LVPcT8OOwHXSB25lyd/b6TQVY22/Gr8e3llM4b+TFcQ5h7hAS+I7SIyDebEvVq
	 0Kt3Ji473ic3mChtuDCi/QUmyJyxkJIk/EndeMDRwl1chAEW2eq53vzxWSYVhEpg9g
	 tlE/LUyAwc/DssdGtYstzRFukgpVHRq8djMFZe+NK+U5DtF0L0TOcSvzTRHaRxQWNN
	 reCGqacNhyAciqXcYFXX8c2VfIaajdQYu6fKtRNhNIZ90/xVvmrbcu2Wks5fiy1Sz9
	 aI/et0CiMqHnQ==
Date: Thu, 11 Jun 2026 18:29:55 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: ultrarisc: Add DP1000 Clock
 Controller
Message-ID: <20260611-reformist-wish-75a73a1d2c49@spud>
References: <20260611-ultrarisc-clock-v1-0-2d93ebb4cc13@ultrarisc.com>
 <20260611-ultrarisc-clock-v1-1-2d93ebb4cc13@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ayPzEpkGFiDk9z12"
Content-Disposition: inline
In-Reply-To: <20260611-ultrarisc-clock-v1-1-2d93ebb4cc13@ultrarisc.com>


--ayPzEpkGFiDk9z12
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 05:40:53PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add doc for the clock controller on the UltraRISC DP1000 RISC-V SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/clock/ultrarisc,dp1000-clk.yaml       | 72 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  7 +++
>  include/dt-bindings/clock/ultrarisc,dp1000-clk.h   | 29 +++++++++
>  3 files changed, 108 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk=
=2Eyaml b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> new file mode 100644
> index 000000000000..d4d3d851a079
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ultrarisc,dp1000-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 Clock Controller
> +
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description: |
> +  The UltraRISC DP1000 clock controller is driven from a single external
> +  oscillator input. It provides a system PLL with fractional multiplier
> +  and post-divider stages, several fixed-ratio derived clocks for
> +  the on-chip subsystem, Clock Configuration Register (CCR) divider
> +  outputs for GMAC and the UART, I2C, and SPI root clocks, and
> +  per-instance gate clocks for UART0-3, I2C0-3, and SPI0-1.
> +
> +  All available clocks are defined as preprocessor macros in
> +  include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      External oscillator input clock used as the parent of the PLLs.
> +
> +  clock-names:
> +    items:
> +      - const: osc

Clock names don't really have any value when you have one input clock.

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
> +    #include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
> +
> +    osc: oscillator {
> +      compatible =3D "fixed-clock";
> +      #clock-cells =3D <0>;
> +      clock-frequency =3D <24000000>;
> +    };

Drop this whole node please.

> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      clock-controller@11080000 {
> +        compatible =3D "ultrarisc,dp1000-clk";
> +        reg =3D <0x0 0x11080000 0x0 0x1000>;
> +        clocks =3D <&osc>;
> +        clock-names =3D "osc";
> +        #clock-cells =3D <1>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e035a3be797c..3331f1edf002 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27357,6 +27357,13 @@ S:	Maintained
>  F:	drivers/usb/common/ulpi.c
>  F:	include/linux/ulpi/
> =20
> +ULTRARISC DP1000 CLOCK DRIVER
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-clk@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> +F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> +
>  ULTRATRONIK BOARD SUPPORT
>  M:	Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>
>  M:	B=C3=B6rge Str=C3=BCmpfel <boerge.struempfel@gmail.com>
> diff --git a/include/dt-bindings/clock/ultrarisc,dp1000-clk.h b/include/d=
t-bindings/clock/ultrarisc,dp1000-clk.h
> new file mode 100644
> index 000000000000..5e484f652b08
> --- /dev/null
> +++ b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> +#define _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> +
> +#define DP1000_CLK_SYSPLL		0
> +#define DP1000_CLK_SYSPLL_DIV2		1
> +#define DP1000_CLK_SUBSYS		2
> +#define DP1000_CLK_GMAC			3
> +#define DP1000_CLK_UART_ROOT		4
> +#define DP1000_CLK_I2C_ROOT		5
> +#define DP1000_CLK_SPI_ROOT		6
> +#define DP1000_CLK_PCIE_DBI		7
> +#define DP1000_CLK_PCIEX4_CORE		8
> +#define DP1000_CLK_PCIEX16_CORE		9
> +#define DP1000_CLK_PCIE_AUX		10
> +#define DP1000_CLK_UART0		11
> +#define DP1000_CLK_UART1		12
> +#define DP1000_CLK_UART2		13
> +#define DP1000_CLK_UART3		14
> +#define DP1000_CLK_I2C0			15
> +#define DP1000_CLK_I2C1			16
> +#define DP1000_CLK_I2C2			17
> +#define DP1000_CLK_I2C3			18
> +#define DP1000_CLK_SPI0			19
> +#define DP1000_CLK_SPI1			20
> +

> +#define DP1000_CLK_NUM			21

This is not suitable to have in a binding, move it to the driver if it
is required.
pw-bot: changes-requested

Cheers,
Conor.

> +
> +#endif /* _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H */
>=20
> --=20
> 2.34.1
>=20
>=20

--ayPzEpkGFiDk9z12
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairwkwAKCRB4tDGHoIJi
0ieUAQC2OlnRatU5DtRncty33MuOUgnrMjQBX7iNfMcxicwskgEAoQoUX1MX7hOA
3m5kGUWUlEae9xIf28jXUhEYPxLo+Qg=
=UXyL
-----END PGP SIGNATURE-----

--ayPzEpkGFiDk9z12--
