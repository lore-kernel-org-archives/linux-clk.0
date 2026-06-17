Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6987480328;
	Wed, 17 Jun 2026 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711800; cv=none; b=hpavGFi2w7Nm+/WeS+XS2KODan5g2dXxCeQziLWu0fWOVIGioCn/tyRVWa4w894C9tYk/V9GKd+Svr1PZ/udCJXMQ5HcGrEb6dmf/pM1y4kO4pfm3cBAYeSnK1Bt0M4dFt+rAkx0Jd5f9p/OrwNDB19kTQtMPcIPS5lHKaA3Kpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711800; c=relaxed/simple;
	bh=ouP0s2SokYSfDUab4TWEmgXE2f6RHxBh8vfLFB+oUmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gY5DZJRVspkw0A1Vc8WcS+ys/3qO6XiLmkErScT6TF6cBURzAjUaa0HrlpTSSdbHipVQKhtPH6jWPB6qMHvq8JS9Jp7HxTZUyU9e6SW9Bgw3966db6cyzHntmyimozQBK/MUnJnv7h+z6iFpDuHXYoRcoaVGxf4y6aq92jnzL24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIL/e6Kz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIL/e6Kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F261F000E9;
	Wed, 17 Jun 2026 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781711786;
	bh=b3igiyBFgh2jFv3ANznSMMApxq86Mex+9yLSze6gqC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIL/e6KzcxwD7v/7Ow/fSBgKCRSNWFFPD1fVxpHk6MWQjsEzxFtYu1wBZgu1vNvBd
	 /KYmTj0KTMiYb/fU9l1tbhbW/3QNEcfOTijjFr5zCdZXb+5IwSQQEPiiOzwSWzCSHV
	 PV3hZ/3+usfgQA54gsFEMoyDBdQnfvd/th5g8FTXfu1G9AB+pLq5pctqUutsX76xlV
	 FnKmMF+p2pZIMriOihiAC44DS28m8h/ogDSB0EIkZprHoR2yfMpX921lUakW/trNOG
	 7/jiyMGx+CVVPZXHfzVnQmVqyh6x1C34w+VB62+SD8PHF+hxhkjTG3MjDhfUlcZ0cO
	 x5pyotX2xhNtg==
Date: Wed, 17 Jun 2026 16:56:22 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ultrarisc: Add DP1000 Clock
 Controller
Message-ID: <20260617-squirt-maimed-6b3b273af10e@spud>
References: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
 <20260617-ultrarisc-clock-v2-1-9cb16083e15e@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PVK+HrIdPtUTwcqp"
Content-Disposition: inline
In-Reply-To: <20260617-ultrarisc-clock-v2-1-9cb16083e15e@ultrarisc.com>


--PVK+HrIdPtUTwcqp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 02:02:54PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add doc for the clock controller on the UltraRISC DP1000 RISC-V SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../bindings/clock/ultrarisc,dp1000-clk.yaml       | 60 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  7 +++
>  include/dt-bindings/clock/ultrarisc,dp1000-clk.h   | 27 ++++++++++
>  3 files changed, 94 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk=
=2Eyaml b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> new file mode 100644
> index 000000000000..ede565ec440c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
> @@ -0,0 +1,60 @@
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
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ultrarisc,dp1000-clk.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      clock-controller@11080000 {
> +        compatible =3D "ultrarisc,dp1000-clk";
> +        reg =3D <0x0 0x11080000 0x0 0x1000>;
> +        clocks =3D <&osc>;
> +        #clock-cells =3D <1>;
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d6db8cb608f..b7e43313c65f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27439,6 +27439,13 @@ S:	Maintained
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
> index 000000000000..751125f99965
> --- /dev/null
> +++ b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> @@ -0,0 +1,27 @@
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
> +#endif /* _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H */
>=20
> --=20
> 2.34.1
>=20
>=20
>=20

--PVK+HrIdPtUTwcqp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajLDpgAKCRB4tDGHoIJi
0j6gAP9VSJ/vNhU5a9hwBpNy4gKNHEOtWljEnEKXzvIZVKsuTwEAs8gyKr+pM70P
TiFUXpEpRuLneAudmilzjn7tVQJegQE=
=tk6F
-----END PGP SIGNATURE-----

--PVK+HrIdPtUTwcqp--
