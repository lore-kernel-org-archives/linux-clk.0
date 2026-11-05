Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838509;
	b=xFuBqAofmTmsa1x+zJNMWXzHTPZsrghCLikI3aS+8t5Zi9NCtk0l4PbJqRtw+XnJ4M2z
	 f/AG+27+go2P2EWPDh1Du3AUK+HXtC27BgbsRIoHtt7Ekvex2GvRDx66wiktjq/wi+yqW
	 lr+/y3sl0+SHr+sOaXmYXAvTUqsysl2sOlHE26gj3YGSBeq2kovQbTIxtYWPM3w+FwrUw
	 SOYSiUz7YuDxxspYELP/QWfoVbvkO+Cs27cPk9Xzk2XP9euGpVsCjM/Cu/EurfsijIsr1
	 0KfrCfPFeoFPQ69KjhfLBn6upcCxzqGOu6t5FAaLXTm54JM0Di17Bx64ElxRisUt2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838509;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K81hV8Ixa+KD7zZugzJFDJ9AdB7vh7U6NocjAnsxnFI=;
	b=Mz54DBBlOnnWM/I27h6Q14MDS/l7ru8PonQXyGp/3kBRgeXmaSzhvAHGg8opCoyjh7n5
	 3ixQIAyFrKaVPdWBwJvUAf12GbHiUuSDtXIpJLO8k9QvFlomzk8+207QrBwea47vDibgi
	 SAtysP0kS8oRzYWoGFPGXDuTAsVYEf+GT6z+1XcI6Ct1PvOGTeQw6C5xuY8rv0WMGpZqv
	 RIAh6eDKiDD8fPXLjH5XuPS8fMWf+Z1kGFYuM4OE/htD6fGSCXaxehC9kl7GghekMh4fB
	 24gQkxW5Y4Usebw4rkz/Lo6hu6H/rtPwgMHP4o/yZ7aMp6fmEyJFI6V54hrZpAlkG1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUqC6ZVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A951606A31B;
	Thu,  5 Nov 2026 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUqC6ZVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6C91F00A02;
	Thu,  5 Nov 2026 00:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793838508;
	bh=K81hV8Ixa+KD7zZugzJFDJ9AdB7vh7U6NocjAnsxnFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUqC6ZVvPYSI3j/QKkEzXYxzLhy/k7FQZrisVQmdsk3ePveecJDKmmGUXBVyLxCd1
	 hapkQmyqdBxkchSUpAOg3fkLs1GEz0OpyUEO2lClqof3eWtxZOVC0L2wMq9koJYi+u
	 tuTnb4z4OZ9D31NjdrvVTcys4YCQUcPLECLabNRM0GyW7S8PBGOW+xOwklaxZim/xB
	 +uLYaASZbVhUTxrk6ZdSHQxHMWfV329oJz88+b4R6FAdo7n2+6BUEnOupPeNgtJZET
	 GKxluBEh57kKeOh0u8DCJGrVFkRJYYXorij+fjqB9PXe00XWnF4L7t5oeWpcxbnbep
	 4v3EtJ6aiQXrA==
Date: Thu, 5 Nov 2026 00:28:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
	marex@nabladev.com, changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
Message-ID: <20261105-irregular-awaken-b329b9c37e70@spud>
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
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
	protocol="application/pgp-signature"; boundary="Scd5SOQBnLzS3Aso"
Content-Disposition: inline
In-Reply-To: <20261104004332.2141282-2-elder@riscstar.com>

--Scd5SOQBnLzS3Aso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 06:43:28PM -0600, Alex Elder wrote:
> Define the binding for the system controller that implements the clock
> and reset controller functionality present in the Toshiba TC9564 SoC.

Actually, can you mention the other features that this provides - the
service it provides to the mac, for example.

Cheers,
Conor.

>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  8 +++
>  include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba=
,tc9564-config-syscon.yaml
>  create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
>=20
> diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564=
-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba=
,tc9564-config-syscon.yaml
> new file mode 100644
> index 0000000000000..5a241a9c915d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config=
-syscon.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/toshiba/toshiba,tc9564-config-sys=
con.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Multifunction System Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The switch
> +  includes an embedded PCIe endpoint that provides access to various
> +  SoC peripherals via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, as well as a reset controller.
> +
> +  The clock controller uses registers within the same page as a reset
> +  controller, so this system controller controls access to both.
> +
> +  A total of 21 simple gated clocks are implemented within the SoC.
> +  At this time, support for enabling and disabling only a subset of
> +  them is provided at this time.  Similarly, the SoC implements 13
> +  resets, but currently not all of them can be controlled.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-config-syscon
> +      - const: syscon
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
> +      Clock ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
> +
> +  "#reset-cells":
> +    const: 1
> +    description:
> +      Reset ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@0 {
> +        compatible =3D "toshiba,tc9564-config-syscon", "syscon";
> +        reg =3D <0x0 0x2000>;
> +        clocks =3D <&tc9564_xo_board>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065d..2b1b29169e0e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28339,6 +28339,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
>  F:	drivers/misc/tc9564-pci.c
> =20
> +TOSHIBA TC9564 SYSTEM CONTROLLER DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-s=
yscon.yaml
> +F:	include/dt-bindings/soc/toshiba,tc9564.h
> +
>  TOSHIBA WMI HOTKEYS DRIVER
>  M:	Azael Avalos <coproscefalo@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/include/dt-bindings/soc/toshiba,tc9564.h b/include/dt-bindin=
gs/soc/toshiba,tc9564.h
> new file mode 100644
> index 0000000000000..66bcdf837f958
> --- /dev/null
> +++ b/include/dt-bindings/soc/toshiba,tc9564.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#ifndef __SOC_TOSHIBA_TC9564_H__
> +#define __SOC_TOSHIBA_TC9564_H__
> +
> +/* Clock IDs */
> +
> +#define CLOCK_PLL		0
> +
> +#define CLOCK_62_5M		1
> +#define CLOCK_125M		2
> +#define CLOCK_250M		3
> +#define CLOCK_312_5M		4
> +
> +#define CLOCK_MSIGEN		5
> +
> +#define CLOCK_MAC0_TX		6
> +#define CLOCK_MAC0_RX		7
> +#define CLOCK_MAC0_125M		8
> +#define CLOCK_MAC0_312_5M	9
> +#define CLOCK_MAC0_ALL		10
> +
> +#define CLOCK_MAC1_TX		11
> +#define CLOCK_MAC1_RX		12
> +#define CLOCK_MAC1_125M		13
> +#define CLOCK_MAC1_312_5M	14
> +#define CLOCK_MAC1_ALL		15
> +#define CLOCK_MAC1_RMII		16
> +
> +/* Reset IDs */
> +
> +#define RESET_MSIGEN		0
> +
> +#define RESET_MAC0_MAC		1
> +#define RESET_MAC0_PMA		2
> +#define RESET_MAC0_XPCS		3
> +
> +#define RESET_MAC1_MAC		4
> +#define RESET_MAC1_PMA		5
> +#define RESET_MAC1_XPCS		6
> +
> +#endif /* __SOC_TOSHIBA_TC9564_H__*/
> --=20
> 2.53.0
>=20

--Scd5SOQBnLzS3Aso
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvNpwAKCRB4tDGHoIJi
0nPsAP4koOrvtWUPoUrqXiTiCzsqa9eVCeyJFRvIGaSzg4kN/AEA0HgkBnYYSRIC
4qTvlim6KCBhs2Yq56DQL1AM/mK+6wo=
=PRtR
-----END PGP SIGNATURE-----

--Scd5SOQBnLzS3Aso--
