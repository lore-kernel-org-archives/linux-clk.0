Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAC377ECF
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344977; cv=none; b=oBZaNMJ/+HWJzP9rTPiB4FZhIvspSCzM0NVUEfWd3cHafiJ85UAiphVPHxwYovH20W97dZF0obYU4j85IL6XLBkwTVLEd/rLTl6Gpr+HI/XWrwRmk0MPl/J0mHqaW0axFr8LJlp/zxPnUoUZ3pIbK1Gq6a20PjAo97xFk1qiUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344977; c=relaxed/simple;
	bh=KjkGEFEeYMGE5tWpb4iz6mos2IDfSvwrV1TRiR4FklE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aRcwqfh/uGAml4jiOljwxZomcuNOYGg2FlB/078Fb1mRLpIcpXtTo3cNNQx0HPTIV7pv6AHPBun6qJNJnIXAPCcTjfid+CsD/vGDcF8M2U+4VKVU69voViOEbjlCn0qSaeiZdvTiXDtpe5fg6k/m/F7dOibQGDHQk+zL8HJWcOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LN4ghG2V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LN4ghG2V"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so6365545e9.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788344965; x=1788949765; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZtvmbyOC+TIXQAgxX6du8Vv3LHAYS2xf4YGM8J09kA=;
        b=LN4ghG2Vajcz3DOsD3YSEug1ARFiSmHJIRRYbgXU4dHDw/eFUbEBJuzitDp5likK9s
         dCFM5GJUYQgyq38ZnpSMUGpXox2UodoK9Bz1bCEMDYtvbRJYie8UGVYcfdipJLKmaqII
         Y1ZG/89pQZoBF0EvlyCpKGqcmexhP3VvkrKJixVEA1miMQMEFzZdiAaxWFwlcnGSYi4x
         t3XEw5dXyHGJSfdXUYvEuAS+rMC9jmXVOWvc+d12zqP/2KEvUiAC2FoHZXQPgTPjzsTg
         21Syp7bZ/YvzKUy+ZFtvLwlaHeHxvyN/b4iNX52T9u5Ag9JteDWqwVIvSXfDebPVchR9
         CWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344965; x=1788949765;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZtvmbyOC+TIXQAgxX6du8Vv3LHAYS2xf4YGM8J09kA=;
        b=Lsch0YqZ9pCRQl0zlxFo44h3fvAfyqvk9pAj6hUo4t2EclzKmhyTmGLPX1KvkWJ+Ht
         6jiznfmNZI0nk5u/XEySVZh+HlLSU7o+Y0YpUukl9zCabQxHSkdpTRjKOaRLNQM6LM87
         2+tjhpssFl6SuT+TTImx75c+pNHIdsbW+RR9CUo6ke1jg4/FrRVG5BiiKtbeOlxlciyq
         PPHrmuqbL6RveGtRF/iXDLPjMxoh0tXSHejZmGjVXVE8bXX5FZbXaHqlqGhMZW5klc9o
         +LzHq393SDeyXaLiFftnte8RhlTpJmF5ot/D7exJ/y4u4q4xR/MHfXiwGXvJLydMMxN7
         iUfg==
X-Forwarded-Encrypted: i=1; AHgh+RrBloqL+JMxn5KcoimmKF4x0JA1xS4n4hTLZEN0PMeE69RD6pOm7fuY9ioWUz9jcWW7wLtq99nHIaU=@vger.kernel.org
X-Gm-Message-State: AFuF++maPcYE7jbjuH3OcYRfXdFVUJMm6sKLX10A+UVfhe5noqD8LR1A
	/EaUubvcJBjzfXN7vqW3fiu3odGh6ZAFNJCqMrvhLs4gX06f+3O6I0aH
X-Gm-Gg: AR+sD114GsG292N0dNIqgc82Z92HIeLo+M7Ddqt5cN6uDH12q7EE0JWW5RETHy9Tu9t
	pM4djJPScqIszsxHBdMOElu2TMCSWB2ufpHMSeHsPkvQiayIymj0aiJ7cHYEUyg3B/7I14Yaf9i
	zVKr4G8ekBFoMwPC2rGVUVvsOmvH0PJ6b6Z38uPpCY4DbHNSeh7FmIZkJNDoGFAGu0j0wmG3uDr
	5G3wxK0sDryNRc7fX42amn1o2yFys0yKT8YfUtG9xuM57hNzWI3b8Ny40ntRF4d81ZX/wq981Yb
	NfKJlhOYqa4mbID2QTmeALar7mgK5CIPJCwsVoqHPz3x2TguEmDgX6O1uv6A6Q4l9K0TJfaXDOc
	NlXtDPsHfYDM1JnY3t4WByBLz/ZLA2/vv2UEpqAvuDnMvtL9fVJS+YgbHEiHBAWQERxLaV7Ve4m
	uZGY+Pkf1znV42Zuvz79tdxowc0JyArbuQJ8zBdk994lHZlGQ0Jr8jdEBm1HNlZlYC+7m2OOE=
X-Received: by 2002:a05:600c:4795:b0:49c:ed88:a782 with SMTP id 5b1f17b1804b1-49ced88a78cmr2713745e9.6.1788344964779;
        Wed, 02 Sep 2026 03:29:24 -0700 (PDT)
Received: from strix.localnet ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm138145595e9.5.2026.09.02.03.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:29:23 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linusw@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 04/12] ARM: dts: zte: Declare zx297520v3 CRM device nodes
Date: Wed, 02 Sep 2026 13:29:12 +0300
Message-ID: <rJbfdbXrS62xFUkr8Ld5TQ@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartatLajs3yRkirKyBuoKqPXQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartatLajs3yRkirKyBuoKqPXQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 02 Sep 2026 13:29:12 +0300
Message-ID: <rJbfdbXrS62xFUkr8Ld5TQ@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-4-f8ad59c6426c@gmail.com>
MIME-Version: 1.0

Hi List, and in particular Krzysztof,


Am Mittwoch, 26. August 2026, 00:24:03 Ostafrikanische Zeit schrieb Stefan=
=20
D=C3=B6singer:
> This patch adds DT nodes for the main clock and reset controllers on the
> zx297520v3 board. It replaces the temporary placeholder UART clocks with
> the proper clocks exported by topcrm and lspcrm.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20

This patch is the only one of my Z29 Clock and Reset series that has not se=
en=20
review comments Did it slip through the cracks?

Linus Walleij added his R-B on the patch that added the mostly stub DSTI fi=
le,=20
so I added him to the mail too.

Cheers,
Stefan

> ---
>=20
> Version 11: Improved the above the line commit description, removing
> references to "previous patches" that won't make sense when reading it
> in the kernel commit log.
>=20
> Version 10: Fix issues with dt-check-style --mode=3Dstrict in newly added
> code, but left issues in existing nodes alone.
>=20
> Version 9:
> Sort new nodes by mmio address
> rename syscon-reboot to "reboot"
> adjust to changes in bindings
>=20
> Version 7:
> Add phy nodes to topcrm
> Remove syscon from matrixclk again
> Adapt remove now-removed extra clk inputs from matrix
> Add reset to LSP
> osc26m -> clock-26m for the fixed rate clocks, likewise for 32k
>=20
> Version 6:
> Add syscon to matrixclk
>=20
> Version 5:
> Re-name from *clk to *crm
> Add the syscon-reboot node here because the binding requires it
> Re-add accidentally dropped uart2 IRQ
> ---
>  arch/arm/boot/dts/zte/zx297520v3.dtsi | 101
> ++++++++++++++++++++++++++++++---- 1 file changed, 89 insertions(+), 12
> deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi
> b/arch/arm/boot/dts/zte/zx297520v3.dtsi index a16c30a164bb..ebac3cd137df
> 100644
> --- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
> +++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
> @@ -3,12 +3,26 @@
>   * Copyright (c) 2026 Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>   */
>=20
> +#include <dt-bindings/clock/zte,zx297520v3-clk.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/reset/zte,zx297520v3-reset.h>
>=20
>  / {
>  	#address-cells =3D <1>;
>  	#size-cells =3D <1>;
>=20
> +	osc26m: clock-26m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <26000000>;
> +	};
> +
> +	osc32k: clock-32k {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +	};
> +
>  	cpus {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> @@ -20,15 +34,6 @@ cpu@0 {
>  		};
>  	};
>=20
> -	/* Base bus clock and default for the UART. It will be replaced once=20
a
> clock driver has -	 * been added.
> -	 */
> -	uartclk: uartclk-26000000 {
> -		#clock-cells =3D <0>;
> -		compatible =3D "fixed-clock";
> -		clock-frequency =3D <26000000>;
> -	};
> -
>  	timer {
>  		compatible =3D "arm,armv7-timer";
>  		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> @@ -75,18 +80,87 @@ uart0: serial@131000 {
>  			arm,primecell-periphid =3D <0x0018c011>;
>  			reg =3D <0x00131000 0x1000>;
>  			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&uartclk>, <&uartclk>;
> +			clocks =3D <&topcrm ZX297520V3_UART0_WCLK>,
> +				 <&topcrm ZX297520V3_UART0_PCLK>;
>  			clock-names =3D "uartclk", "apb_pclk";
> +			resets =3D <&topcrm ZX297520V3_UART0_RESET>;
> +
>  			status =3D "disabled";
>  		};
>=20
> +		topcrm: clock-controller@13b000 {
> +			compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +			reg =3D <0x0013b000 0x400>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&osc26m>, <&osc32k>;
> +			clock-names =3D "osc26m", "osc32k";
> +			interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 43=20
IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 45=20
IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 46=20
IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names =3D "usb-up", "usb-down",
> +					  "hsic-up", "hsic-down";
> +			#phy-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +
> +			reboot {
> +				compatible =3D "syscon-reboot";
> +				mask =3D <0x1>;
> +				offset =3D <0x0>;
> +				value =3D <0x1>;
> +			};
> +		};
> +
> +		matrixcrm: clock-controller@1306000 {
> +			compatible =3D "zte,zx297520v3-matrixcrm";
> +			reg =3D <0x01306000 0x400>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&osc26m>, <&osc32k>,
> +				 <&topcrm ZX297520V3_AHB_PCLK>,
> +				 <&topcrm ZX297520V3_MPLL>,
> +				 <&topcrm ZX297520V3_MPLL_D5>,
> +				 <&topcrm ZX297520V3_DPLL>,
> +				 <&topcrm ZX297520V3_GPLL>,
> +				 <&topcrm ZX297520V3_GPLL_D2>,
> +				 <&topcrm ZX297520V3_GATED_OSC26M>;
> +			clock-names =3D "osc26m", "osc32k", "ahb", "mpll",
> +				      "mpll-d5", "dpll", "gpll",=20
"gpll-d2",
> +				      "wclk-osc26m";
> +			#hwlock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +		};
> +
> +		lspcrm: clock-controller@1400000 {
> +			compatible =3D "zte,zx297520v3-lspcrm";
> +			reg =3D <0x01400000 0x100>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&matrixcrm=20
ZX297520V3_LSP_MPLL_D5_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_MPLL_D4_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_MPLL_D6_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_MPLL_D8_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_MPLL_D12_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_OSC26M_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_OSC32K_WCLK>,
> +				 <&matrixcrm ZX297520V3_LSP_PCLK>,
> +				 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
> +				 <&matrixcrm=20
ZX297520V3_LSP_DPLL_D4_WCLK>;
> +			clock-names =3D "mpll-d5", "mpll-d4", "mpll-d6",
> +				      "mpll-d8", "mpll-d12", "osc26m",=20
"osc32k",
> +				      "pclk", "tdm-wclk", "dpll-d4";
> +			#reset-cells =3D <1>;
> +			resets =3D <&matrixcrm ZX297520V3_LSP_RESET>;
> +		};
> +
>  		uart1: serial@1408000 {
>  			compatible =3D "arm,pl011", "arm,primecell";
>  			arm,primecell-periphid =3D <0x0018c011>;
>  			reg =3D <0x01408000 0x1000>;
>  			interrupts =3D <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&uartclk>, <&uartclk>;
> +			clocks =3D <&lspcrm ZX297520V3_UART1_WCLK>,
> +				 <&lspcrm ZX297520V3_UART1_PCLK>;
>  			clock-names =3D "uartclk", "apb_pclk";
> +			resets =3D <&lspcrm ZX297520V3_UART1_RESET>;
> +
>  			status =3D "disabled";
>  		};
>=20
> @@ -95,8 +169,11 @@ uart2: serial@140d000 {
>  			arm,primecell-periphid =3D <0x0018c011>;
>  			reg =3D <0x0140d000 0x1000>;
>  			interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&uartclk>, <&uartclk>;
> +			clocks =3D <&lspcrm ZX297520V3_UART2_WCLK>,
> +				 <&lspcrm ZX297520V3_UART2_PCLK>;
>  			clock-names =3D "uartclk", "apb_pclk";
> +			resets =3D <&lspcrm ZX297520V3_UART2_RESET>;
> +
>  			status =3D "disabled";
>  		};
>  	};
>=20
> --
> 2.54.0


--nextPartatLajs3yRkirKyBuoKqPXQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqX+ngbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiXQ4QAIgh4cHS40dzpXGGXT06
nMhiX21hOye6pUgSIUkl7edEIS9jiyMtrziDQ6y08OJGZQuMkBvX7rv70aYYpcNZ
N2ssTTrip9PyBdNxLdsz2KP3bhnlUK6Xksuk6OuvupuUcFeLojqMEXDCToTGBWmn
GZTiROWut21Q6RF+XyRKaztTrVJO3IfGyQZGsKt7lWHRLK8NXAJKBlnTUgPHWxht
UsHVUXebz+0qObRB+mSOVkFFAe4t0FpKyfrSMiZw7UKduO/F35gRovOHs2sIw4WR
VhjJRneHiRl1CNw7F+wyzdzl4Uq8bMsIiwDKSB6qj920+3oV2vS2nu9WYtT2MEPK
AzT4b8SAsDQbcExV2j0jpyHqArQlumqYpueE2rsqzS6oa+DHu352RWng7cPyA+sI
SVs7Dx+DGNp6Fxmhm/SSItKDMX8u/6D6fjbBW0N8PUZ3NyCbyWQ/zt971VsC6bVb
U/nALB5LYCR3sBilrIC2JGJef+1cFanxITSCYLdOoStI9oI6aLumRRQayVXp94NW
BJk1m4SJUa+J8ff+WeexXpVYYfnWp9nCYkG+q0es0kgR1Z+0YQKRYDeaviqxcQLq
26krvpcuMP8cgWx920NVjKh7DXPVW++x8F52hqPYZyYqM5ONWgdIWTfmTCa8Temz
JE70f1rWWHE+Spu4bDjfQkPB
=CjRJ
-----END PGP SIGNATURE-----

--nextPartatLajs3yRkirKyBuoKqPXQ--



