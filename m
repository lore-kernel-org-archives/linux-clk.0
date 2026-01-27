Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF393644C8;
	Tue, 27 Jan 2026 19:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769543926; cv=none; b=hamSVuyBXb9wehtUhtqXPf76/WbzRCtiFW+vEVUdBaVajanMo1Ija2X6hEtaByisV3ygLrlwMVgernvCMmu0kaNrr9ZMZLhL6d9qXqc1ROhqy+R7k2vUybvTM9PkFJKige6nvG7W8uJOIwekNHXIKbnpoKw9xx5XjRRNa/l9VIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769543926; c=relaxed/simple;
	bh=yVJi2zWkrwsKLGbFmyrRKrvNw3djdjZQhSPesz1VLw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpW5SGS3jWcooL69Ghs3ObxUhO/Kxhg5V1ON5FFmIiUeaeZa/5BHv93lDKiapa/DH5D/pX4uUOqXLnMyTPRolD4dHvs7UDG16opxVw9TBwGxXnrbtWmo7f6QP2jr6BeJBCriJu1/Zf3XKyUisq93lrGvLp1MZwecgqYCRFQWdbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwTzX521; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwTzX521"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906D4C116C6;
	Tue, 27 Jan 2026 19:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769543926;
	bh=yVJi2zWkrwsKLGbFmyrRKrvNw3djdjZQhSPesz1VLw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwTzX521S4tIMV0PKJ/FVzalULKXyCTOr+es0XJkH1/lU6clkPxnwQDuv8ta9bvl3
	 X/yxKUGkrkqcrDWv1JOmtJobRY8CxmgTtM4jbg4TAl/zqXkEOdVpc1lcnySdQgBLth
	 ljqbrUOhir2VW/bdMOkMBjFYsQBEPSqTAuUc7L6OvcovdTUMyitHdD2hyKQZAUq+hZ
	 3Znb0uN1LQDRpSbiXiFAVJACB+4wpTryaFUfylZbcWkMNbFquMfNsSBeEpfmpcrHsr
	 fiMv6yWgr29giqjhbMbxV/OdJEXJq6bxOwl3o5GFP0M7ljbHKjm+JZ14Vl4Fh+9Sih
	 pDL0UPXje22ug==
Date: Tue, 27 Jan 2026 19:58:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260127-mystify-carmaker-150aa3fcd6c6@spud>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FutGC8lTVDehKqk5"
Content-Disposition: inline
In-Reply-To: <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>


--FutGC8lTVDehKqk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> Document bindings for Tenstorrent Atlantis PRCM that manages clocks
> and resets. This block is instantiated 4 times in the SoC.
> This commit documents the clocks from the RCPU PRCM block.
>=20
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 ++++++++++++++++
>  MAINTAINERS                                        |   2 +
>  .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++=
++++++
>  3 files changed, 187 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis=
-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-p=
rcm.yaml
> new file mode 100644
> index 000000000000..c5716a9928bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.y=
aml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Module
> +
> +maintainers:
> +  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +
> +description:
> +  Multifunctional register block found in Tenstorrent Atlantis SoC whose=
 main
> +  function is to control clocks and resets. This block is instantiated m=
ultiple
> +  times in the SoC, each block controls clock and resets for a different
> +  subsystem. RCPU prcm serves low speed IO interfaces. PCIe prcm serves =
all
> +  PCIe related functions, HSIO prcm serves high speed IO interfaces (Eth=
ernet,
> +  USB), MM prcm serves GPU, display and video processing functions.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - tenstorrent,atlantis-prcm-rcpu
> +      - tenstorrent,atlantis-prcm-pcie
> +      - tenstorrent,atlantis-prcm-mm
> +      - tenstorrent,atlantis-prcm-hsio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid indi=
ces.
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  tenstorrent,prcm-rcpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle reference to RCPU prcm, needed by other 3 prcms (PCIe, MM,=
 HSIO)
> +      as the control registers for the PLLs that drive these subsystems =
are in
> +      RCPU prcm's range

This is pretty suspect sounding, if the PLLs for !rcpu are controlled in
the rcpu register region, why is it not a clock parent for the !rcpu
prcms?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - tenstorrent,atlantis-prcm-pcie
> +              - tenstorrent,atlantis-prcm-mm
> +              - tenstorrent,atlantis-prcm-hsio
> +    then:
> +      required:
> +        - tenstorrent,prcm-rcpu
> +    else:
> +      properties:
> +        tenstorrent,prcm-rcpu: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@a8000000 {
> +      compatible =3D "tenstorrent,atlantis-prcm-rcpu";
> +      reg =3D <0xa8000000 0x10000>;
> +      clocks =3D <&osc_24m>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8fe..0fc7bc6d0458 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  T:	git https://github.com/tenstorrent/linux.git
> +F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
>  F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
>  F:	arch/riscv/boot/dts/tenstorrent/
> +F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> =20
>  RISC-V THEAD SoC SUPPORT
>  M:	Drew Fustini <fustini@kernel.org>
> diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/incl=
ude/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> new file mode 100644
> index 000000000000..3820781127c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Tenstorrent Atlantis PRCM Clock and Reset Indices
> + *
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#ifndef _DT_BINDINGS_ATLANTIS_PRCM_H
> +#define _DT_BINDINGS_ATLANTIS_PRCM_H
> +
> +/*
> + * RCPU Domain Clock IDs
> + */
> +#define CLK_RCPU_PLL		0
> +#define CLK_RCPU_ROOT		1
> +#define CLK_RCPU_DIV2		2
> +#define CLK_RCPU_DIV4		3
> +#define CLK_RCPU_RTC		4
> +#define CLK_SMNDMA0_ACLK	5
> +#define CLK_SMNDMA1_ACLK	6
> +#define CLK_WDT0_PCLK		7
> +#define CLK_WDT1_PCLK		8
> +#define CLK_TIMER_PCLK		9
> +#define CLK_PVTC_PCLK		10
> +#define CLK_PMU_PCLK		11
> +#define CLK_MAILBOX_HCLK	12
> +#define CLK_SEC_SPACC_HCLK	13
> +#define CLK_SEC_OTP_HCLK	14
> +#define CLK_TRNG_PCLK		15
> +#define CLK_SEC_CRC_HCLK	16
> +#define CLK_SMN_HCLK		17
> +#define CLK_AHB0_HCLK		18
> +#define CLK_SMN_PCLK		19
> +#define CLK_SMN_CLK		20
> +#define CLK_SCRATCHPAD_CLK	21
> +#define CLK_RCPU_CORE_CLK	22
> +#define CLK_RCPU_ROM_CLK	23
> +#define CLK_OTP_LOAD_CLK	24
> +#define CLK_NOC_PLL		25
> +#define CLK_NOCC_CLK		26
> +#define CLK_NOCC_DIV2		27
> +#define CLK_NOCC_DIV4		28
> +#define CLK_NOCC_RTC		29
> +#define CLK_NOCC_CAN		30
> +#define CLK_QSPI_SCLK		31
> +#define CLK_QSPI_HCLK		32
> +#define CLK_I2C0_PCLK		33
> +#define CLK_I2C1_PCLK		34
> +#define CLK_I2C2_PCLK		35
> +#define CLK_I2C3_PCLK		36
> +#define CLK_I2C4_PCLK		37
> +#define CLK_UART0_PCLK		38
> +#define CLK_UART1_PCLK		39
> +#define CLK_UART2_PCLK		40
> +#define CLK_UART3_PCLK		41
> +#define CLK_UART4_PCLK		42
> +#define CLK_SPI0_PCLK		43
> +#define CLK_SPI1_PCLK		44
> +#define CLK_SPI2_PCLK		45
> +#define CLK_SPI3_PCLK		46
> +#define CLK_GPIO_PCLK		47
> +#define CLK_CAN0_HCLK		48
> +#define CLK_CAN0_CLK		49
> +#define CLK_CAN1_HCLK		50
> +#define CLK_CAN1_CLK		51
> +#define CLK_CAN0_TIMER_CLK	52
> +#define CLK_CAN1_TIMER_CLK	53
> +
> +/* RCPU domain reset */
> +#define RST_SMNDMA0		0
> +#define RST_SMNDMA1		1
> +#define RST_WDT0		2
> +#define RST_WDT1		3
> +#define RST_TMR			4
> +#define RST_PVTC		5
> +#define RST_PMU			6
> +#define RST_MAILBOX		7
> +#define RST_SPACC		8
> +#define RST_OTP			9
> +#define RST_TRNG		10
> +#define RST_CRC			11
> +#define RST_QSPI		12
> +#define RST_I2C0		13
> +#define RST_I2C1		14
> +#define RST_I2C2		15
> +#define RST_I2C3		16
> +#define RST_I2C4		17
> +#define RST_UART0		18
> +#define RST_UART1		19
> +#define RST_UART2		20
> +#define RST_UART3		21
> +#define RST_UART4		22
> +#define RST_SPI0		23
> +#define RST_SPI1		24
> +#define RST_SPI2		25
> +#define RST_SPI3		26
> +#define RST_GPIO		27
> +#define RST_CAN0		28
> +#define RST_CAN1		29
> +#define RST_I2S0		30
> +#define RST_I2S1		31
> +
> +#endif /* _DT_BINDINGS_ATLANTIS_PRCM_H */
>=20
> --=20
> 2.43.0
>=20

--FutGC8lTVDehKqk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXkY8AAKCRB4tDGHoIJi
0jInAQDZnV6JJ1pZNzWdenkIpnsTR+i8o1G0hpbHPCOTGJsZBwEAyp2ZAZ7lnr4o
7w9a/PH/+3klmja6c1p79tniIL/WtQ8=
=t8Ha
-----END PGP SIGNATURE-----

--FutGC8lTVDehKqk5--
