Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839917;
	b=eAj2XswXGxSLo2SON3TMP4qHioXyMHfC41dbNCiEkn0tAtSOKWXEb2TSRa5Nb+sDrPp0
	 6K8tHyiMjSFVvqLnsFQhOt8wRKpRGKlqXIE4MOMV9ySJB3qNs5muNGg1Oep6FfCW/VZK7
	 NcIUdXr6et/Meus5wkUlIxatwONZzTtThA76MV5hqxpHDBFczv9I0TK3PVBtszHEVxMX7
	 rZRIwTILWhxzeXKFQBDnw4h7ymhVK4o5nbcHenXmgs5bA1vWnmMa0nN+bs7zbxzHpk0b8
	 VLwKI6Q/rDLRENnJUyACKPA4Ze+T+LRtmkiGnlSxPC5wp1wVrVl7UeKE5btSUsWSikA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839917;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jC6Rl8OL1Kzy4wK4yFDwZnNsRuwOkhfy36xbhUjmYfA=;
	b=BlN1R/nUUEOC+32iGcYaRSkJmDgMcpPLY5ydA9XS0INChf3AdrqonxqtExyWHz+IT7iI
	 HUwzYy+QrKdKhcQqRDWfEt6dWyh6rfuGEKNMo1EYZKdmesZzFWqkPgVeDhFur1U2iyTH3
	 Je4qYWCLUhEkT1ixkjtWgAF4mEZDZwLwO2sCyUuz7gQdTjbIO9GIxw6CyGrq4YSEOfVBs
	 8RKEiQo7Hmeq5uf9RaUrW319tYkvdZsThunm5qLBqEIEDdu0wlUvR9LsGK6wzeOiRAXff
	 kggy8XojnvfSr7ZjT0PlQOQhnt4yznGAum3n203hfjxQWjUj00h4gsn1G6Y3+5Ilgmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpTyKhc9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F52606A31B;
	Thu,  5 Nov 2026 00:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TpTyKhc9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38D81F000C1;
	Thu,  5 Nov 2026 00:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793839916;
	bh=jC6Rl8OL1Kzy4wK4yFDwZnNsRuwOkhfy36xbhUjmYfA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TpTyKhc9cgixP5Yn6A5MiEigq3sfhFKapiVdwybf/FnMT0JQ/ZQjYoHverD8+6wDH
	 eqiS8r+Tg0isNXhagdUHI0kAUlXiBs1uVjWiYQDESqvKA9Ht63M4LGuxFafLGNuHFq
	 FChBL+UhkWn31pfUhrVMmV0JbETpAUzGafCtxgM5a7JdOlExs05lUzlrfmKUgUDrrT
	 MlXXjECvVMDVWg8mKhlzTt+4P/seajX/5jpv13RE7M4XqCZix3Xpzzmxn7c8hprSWv
	 CoOaTBY+eXdVdmPTwLZsyLqkkUxFp68+9cXFGf1U9fYMFO/gOzd3WGEyXeQ4IYBXPj
	 sF3k3uYUNh9Pg==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/3] dt-bindings: clock: airoha: Document support
 for AN7583 clock
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261012115954.92718-2-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
 <20261012115954.92718-2-ansuelsmth@gmail.com>
Date: Wed, 04 Nov 2026 19:51:40 -0500
Message-Id: <179383990045.753844.10400171550739497565.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=4802; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=w9Qvnb2bO0tM32Mb07C9hVaogiw4zqEjFmB6y8+LbHU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJeX5adfnQBA++GDZHneB6ulch+xeq46XG5qeSs/HWrz
 NaWOlp1dZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARu70M/x1tdq4NEA4K6OY/
 UOF1SiPR9OrMe1Okjl/v+xPyU8fWup/hf5LH8tMWaYv2Tsqc5vFZcvfdu9+fi8UpTMira5s/+cy
 CiRwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Document support for Airoha AN7583 clock. This is based on the EN7523
> clock schema with the new requirement of the "airoha,chip-scu".
> 
> The register for clock and reset for normal system and PCIe are scattered
> between the "SCU" and "chip SCU" registers (they are 2 different register
> block, the name is taken from the programming guide)
> 
> - Chip SCU provide register access to some clk gate and clk rate
> - SCU provide register for reset, PCIe clock, other clock gate and PHY
>   SERDES.
> 
> Upcoming and current airoha clock driver all follow this pattern of
> declaring one of the 2 register and use a sysconf for the other as the 2
> register block are tighlty coupled.
> 
> EN7581 internally handle the syscon with a direct reference by the use of
> syscon_regmap_lookup_by_compatible while AN7583 wants to make this
> explicit in DT with the new "airoha,chip-scu" phandle.
> 
> Similar to EN7581, also AN7583 permit the selection of the serdes line.
> 
> Add additional binding for additional clock and reset lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml     | 23 +++++++
>  include/dt-bindings/clock/en7523-clk.h        |  3 +
>  .../dt-bindings/reset/airoha,an7583-reset.h   | 65 +++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 include/dt-bindings/reset/airoha,an7583-reset.h
>
> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fc37786ac7ed..8b94113d00ab 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -31,6 +31,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - airoha,an7583-scu
>            - airoha,en7523-scu
>            - airoha,en7581-scu
>            - econet,en751221-scu
> @@ -57,12 +58,34 @@ properties:
>        available serdes port.
>      const: 1
>  
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Chip SCU providing the registers required
> +      for configuring the PCIe related clocks and resets.

How about this?

    description: phandle to the Chip SCU syscon providing the registers
      used to read the base clock source and divider settings.

> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: airoha,an7583-scu
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +      required:
> +        - airoha,chip-scu

The Sashiko feedback about including #reset-cells looks legit here as
well.

> +
> +    else:
> +      properties:
> +        airoha,chip-scu: false
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
> index edfa64045f52..0fbbcb7b1b25 100644
> --- a/include/dt-bindings/clock/en7523-clk.h
> +++ b/include/dt-bindings/clock/en7523-clk.h
> @@ -14,4 +14,7 @@
>  
>  #define EN7581_CLK_EMMC		8
>  
> +#define AN7583_CLK_MDIO0	9
> +#define AN7583_CLK_MDIO1	10
> +
>  #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
> diff --git a/include/dt-bindings/reset/airoha,an7583-reset.h b/include/dt-bindings/reset/airoha,an7583-reset.h
> new file mode 100644
> index 000000000000..410e19802cf7
> --- /dev/null
> +++ b/include/dt-bindings/reset/airoha,an7583-reset.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 AIROHA Inc
> + * Author: Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
> +#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7583_H_
> +
> +/* RST_CTRL2 */
> +#define AN7583_XPON_PHY_RST		 0
> +#define AN7583_GPON_OLT_RST		 1
> +#define AN7583_CPU_TIMER2_RST		 2
> +#define AN7583_HSUART_RST		 3
> +#define AN7583_UART4_RST		 4
> +#define AN7583_UART5_RST		 5
> +#define AN7583_I2C2_RST			 6
> +#define AN7583_XSI_MAC_RST		 7
> +#define AN7583_XSI_PHY_RST		 8
> +#define AN7583_NPU_RST			 9
> +#define AN7583_TRNG_MSTART_RST		10
> +#define AN7583_DUAL_HSI0_RST		11
> +#define AN7583_DUAL_HSI1_RST		12
> +#define AN7583_DUAL_HSI0_MAC_RST	13
> +#define AN7583_DUAL_HSI1_MAC_RST	14
> +#define AN7583_XPON_XFI_RST             15

This line uses spaces before the value while the rest of the file
uses tabs.

Brian

-- 
Brian Masney <masneyb@kernel.org>
