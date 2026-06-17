Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEE48A2BF;
	Wed, 17 Jun 2026 15:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711761; cv=none; b=G8ngTdmK4PfCD1HdvIdvms1XsBk/s7vnpn5w7joAJNtftz+57xvCYzB0whhc/BjzDp5sGdqzB3K+mz2DoU2umDxUjkEDuMc0kfUcggKs2Ge0CYFf8bokCkU7Tgjc1XpUihyJfGDI1RWj2KiJ/AmtMp5CfVfd2MiX+yxRofHGMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711761; c=relaxed/simple;
	bh=RJY/owfCjcYnX7Fu5Vb0SRHAlQ6ZcOI6syvOLwXAse0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afZA39g57gaeuterfYOV7oHg/FYkD4/aFbvfHcTGpFMOkOJrHIpasI3O/Na1gbv8FrhyC74jW8SZf1wokx2L1Dme7fXkZNAayjYOpL1I7ljdz1TpXNF4xEP0lK0ur1TvPf/GfSs1yAWWn9uLsJS+gbz1UGrj+F88WP7VPqOC1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcuB6n/X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcuB6n/X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DBA1F00A3A;
	Wed, 17 Jun 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781711749;
	bh=kuLjsOyt0s5N38trSvmQ1A2O6kbOr5UBIbKVqpy5InY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YcuB6n/X2IIBSZTP9S/LMJ9qQfHOxCrLbI0D3CWyBwp4POMB+5EsXNMbc2yzcrUtD
	 x17mefYivkjXN8odDek8MiyW/zARNfVCQhOJidilozik9SiB7iHWmPu6Q1Hyp05/8p
	 X0b7k4ndD3DR1lYup83aru8/S5JmC/SVsYFXOp2hMimF+P5mSUD5pwdPjrxp95gs7H
	 keUgL/u5RkDD3UKIvmHvZW4b0sv/XhMsD4MoS+M1mZ1a6M3g5Nd13KPqAeEvMKrFze
	 7M9BaQAh/2m/zmBPCvX//q5xpyglifFkAb8KtaLs7LFLElqOb50AogG+g0K4JfELmm
	 SDE5Ev4SHp7OQ==
Date: Wed, 17 Jun 2026 16:55:44 +0100
From: Conor Dooley <conor@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, gary.yang@cixtech.com,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
Message-ID: <20260617-clinic-blank-61289f8fc1c2@spud>
References: <20260617060437.1474816-1-joakim.zhang@cixtech.com>
 <20260617060437.1474816-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H3jp4bQy33qL1L2I"
Content-Disposition: inline
In-Reply-To: <20260617060437.1474816-4-joakim.zhang@cixtech.com>


--H3jp4bQy33qL1L2I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 02:04:35PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> The AUDSS CRU contains an internal clock tree of muxes, dividers and
> gates for DSP, I2S, HDA, DMAC and related blocks. The clock provider is
> a child node of the cix,sky1-audss-system-control syscon and accesses
> registers through the parent MMIO region.

Why can this not just be part of the parent syscon node?

Cheers,
Conor.

>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/clock/cix,sky1-audss-clock.yaml  | 72 +++++++++++++++++++
>  .../dt-bindings/clock/cix,sky1-audss-clock.h  | 60 ++++++++++++++++
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cix,sky1-auds=
s-clock.yaml
>  create mode 100644 include/dt-bindings/clock/cix,sky1-audss-clock.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock=
=2Eyaml b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
> new file mode 100644
> index 000000000000..ea813c5a2307
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cix,sky1-audss-clock.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cix,sky1-audss-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 audio subsystem clock controller
> +
> +maintainers:
> +  - Joakim Zhang <joakim.zhang@cixtech.com>
> +
> +description: |
> +  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
> +
> +  This node is a child of a cix,sky1-audss-system-control syscon node
> +  (see cix,sky1-system-control.yaml). It does not have a reg property; c=
lock
> +  mux, divider and gate fields are accessed through the parent register =
block.
> +
> +  Software reset lines for AUDSS blocks are exposed on the parent syscon=
 via
> +  #reset-cells (provider). Reset indices are defined in
> +  include/dt-bindings/reset/cix,sky1-audss-system-control.h.
> +
> +  Four SoC-level reference clocks listed in clocks/clock-names feed the =
AUDSS
> +  clock tree. The provider exposes the internal AUDSS clocks to other de=
vices
> +  via #clock-cells; indices are defined in cix,sky1-audss-clock.h.
> +
> +  The parent cix,sky1-audss-system-control node describes the SoC syscon
> +  NoC (or bus) reset via resets and the audio subsystem power domain via
> +  power-domains.
> +
> +properties:
> +  compatible:
> +    const: cix,sky1-audss-clock
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-au=
dss-clock.h.
> +
> +  clocks:
> +    items:
> +      - description: I2S parent clock for sampling rates multiple of 8kH=
z.
> +      - description: I2S parent clock for sampling rates multiple of 11.=
025kHz.
> +      - description: clock feeding most devices in audss (NOC, DSP, SRAM=
, HDA, DMAC, I2S, and Mailbox).
> +      - description: clock feeding for HDA, Timer and Watchdog, which is=
 a delicated 48MHz clock.
> +
> +  clock-names:
> +    items:
> +      - const: x8k
> +      - const: x11k
> +      - const: sys
> +      - const: 48m
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cix,sky1.h>
> +
> +    clock-controller {
> +        compatible =3D "cix,sky1-audss-clock";
> +        #clock-cells =3D <1>;
> +        clocks =3D <&scmi_clk CLK_TREE_AUDIO_CLK0>, <&scmi_clk CLK_TREE_=
AUDIO_CLK2>,
> +                 <&scmi_clk CLK_TREE_AUDIO_CLK4>, <&scmi_clk CLK_TREE_AU=
DIO_CLK5>;
> +        clock-names =3D "x8k", "x11k", "sys", "48m";
> +    };
> diff --git a/include/dt-bindings/clock/cix,sky1-audss-clock.h b/include/d=
t-bindings/clock/cix,sky1-audss-clock.h
> new file mode 100644
> index 000000000000..7e9bd3e6c7a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/cix,sky1-audss-clock.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2026 Cix Technology Group Co., Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
> +#define _DT_BINDINGS_CLK_CIX_SKY1_AUDSS_CLOCK_H
> +
> +#define CLK_AUD_CLK4_DIV2	0
> +#define CLK_AUD_CLK4_DIV4	1
> +#define CLK_AUD_CLK5_DIV2	2
> +
> +#define CLK_DSP_CLK		3
> +#define CLK_DSP_BCLK		4
> +#define CLK_DSP_PBCLK		5
> +
> +#define CLK_SRAM_AXI		6
> +
> +#define CLK_HDA_SYS		7
> +#define CLK_HDA_HDA		8
> +
> +#define CLK_DMAC_AXI		9
> +
> +#define CLK_WDG_APB		10
> +#define CLK_WDG_WDG		11
> +
> +#define CLK_TIMER_APB		12
> +#define CLK_TIMER_TIMER		13
> +
> +#define CLK_MB_0_APB		14	/* MB0: ap->dsp */
> +#define CLK_MB_1_APB		15	/* MB1: dsp->ap */
> +
> +#define CLK_I2S0_APB		16
> +#define CLK_I2S1_APB		17
> +#define CLK_I2S2_APB		18
> +#define CLK_I2S3_APB		19
> +#define CLK_I2S4_APB		20
> +#define CLK_I2S5_APB		21
> +#define CLK_I2S6_APB		22
> +#define CLK_I2S7_APB		23
> +#define CLK_I2S8_APB		24
> +#define CLK_I2S9_APB		25
> +#define CLK_I2S0		26
> +#define CLK_I2S1		27
> +#define CLK_I2S2		28
> +#define CLK_I2S3		29
> +#define CLK_I2S4		30
> +#define CLK_I2S5		31
> +#define CLK_I2S6		32
> +#define CLK_I2S7		33
> +#define CLK_I2S8		34
> +#define CLK_I2S9		35
> +
> +#define CLK_MCLK0		36
> +#define CLK_MCLK1		37
> +#define CLK_MCLK2		38
> +#define CLK_MCLK3		39
> +#define CLK_MCLK4		40
> +
> +#endif
> --=20
> 2.50.1
>=20

--H3jp4bQy33qL1L2I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajLDgAAKCRB4tDGHoIJi
0h5+AQCZewSDRlcOq2M4+7bLDUZ1dbF2OLY5oXnkHuWGJ9PD3gD/UtpFAB35VcqP
zuLveKAYWRUTTQuzEKwycGrY2NOvsw8=
=lm+A
-----END PGP SIGNATURE-----

--H3jp4bQy33qL1L2I--
