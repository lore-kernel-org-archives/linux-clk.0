Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307755;
	b=kDCh01/et8fgxK5mOeh0tXLht7QELmmBtLavy8xKycYZmi7aCfIQ2wDuJm7PmaGHZuFo
	 ziYimsp0vpXhMgaH4qRL/J196K/wRFv5/Eg78CXzcWVyb4Vhh/coUXwjs8QGpJikC2PJV
	 /k7fxEmk+XoVgkWsOYENJosTd3GgRikwG7A8kn09PWg1xc39shInkXzA/WBHdXw212P9b
	 6A38sEKT+hPYRGkJNcmExvXY7UQGOzFkhwY4rRpMu8XvKNwtv98uQhhsBp4zlf/XClYKb
	 i+1HAMymhusCLU+CkCBt+fbjxG9uKwtSFRpfSoyoUNsV42d7TiV+X2tBYHXC7DbCZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307755;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iWP2CZAkG4eD7hnYu+nDWuqH9itBVNhxkIcUyAB8zMo=;
	b=y04uFbE0bGf6RLcA/EmVl8YUi8oa7KdnW4+aqE0ROR6Huqivq0ITJNMGyub06Hoag77+
	 AMO6LS4JCK+9kyIuYOjP/zLTK+uQRfO2Mh5hOQk9pVRdSJjMqgWCIEhgp9WgFtbdv2sqP
	 w5yO+cjzb2vABfDagjqrVP9q/4VTzxV3iOAHCtbQG/R9B63I+DZuu0SZRvPc5Eroft+41
	 kbmMdJk2VzJO2ZIdLRdLa0m6AM5hq2AzDWCl26nxwFgNwHbZNi0duRtRL0oIncmbrc15G
	 BrEMEy1exAL+gjDDM4n7bB/ZkEU4b87WzQuWk4BlmL+DX7jASChgXpgMd+1Qj7cP4Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOi1N+5C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8A606A31C;
	Tue, 10 Nov 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HOi1N+5C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315B21F0089F;
	Tue, 10 Nov 2026 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307754;
	bh=iWP2CZAkG4eD7hnYu+nDWuqH9itBVNhxkIcUyAB8zMo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HOi1N+5Csjag0ojWGIDpI8FO1/24jFA90rmgjne8kGwY8B3/WYVgJHMbIqJBkerB8
	 ytEc1KT6zjWoQEmxREvmDmY7fWXE4TOVCJ2AHgDyZ7INaAF6nYn4E2RFKakwOAajkv
	 jDHVIoXTRx2OPKpaiAqN522IOgblK5Vsk8D5XUC0eBKMbbGyhEmpIqVlguRE8l6Ehp
	 hCk1vGQcu3hHnAVBTWrlDqnl0A6e/f5WIA4N8rZ0Eo0ETaFjA0OxpxNblsm+2qmxIn
	 Os/OLAzaWNAvjqUCaQlalVAUnKkX9+S9rtzgFryJbMePkspFelwthVLzCDTLsIz567
	 nd0AOX9UwHtWA==
Message-ID: <sashiko-outbox-206890@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v1-2-667829cd290a@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:49:13 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: arm: stm32: split STM32MP23/25 SYSCFG into separate
  schema
--

commit a55565d107267a4ad1a075c0905a54ac3317622d
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

dt-bindings: arm: stm32: Add clock-controller sub-node to STM32MP2 SYSCFG

This commit adds a clock-controller sub-node to the STM32 SYSCFG binding,
requiring it on st,stm32mp23-syscfg and st,stm32mp25-syscfg and forbidding
it on all other variants.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b842..38c844e8f19db 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -45,6 +45,10 @@ properties:
>    "#size-cells":
>      const: 1
> =20
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +
>  patternProperties:
>    "^phy@2[48]00$":
>      type: object
> @@ -80,6 +84,7 @@ allOf:
>          - "#address-cells"
>          - "#clock-cells"
>          - "#size-cells"
> +        - clock-controller
>          - phy@2400
>          - phy@2800
>      else:
> @@ -87,6 +92,7 @@ allOf:
>          '#address-cells': false
>          '#clock-cells': false
>          '#size-cells': false
> +        clock-controller: false
>          phy@2400: false
>          phy@2800: false

[Severity: Low]
Should st,stm32mp23-syscfg and st,stm32mp25-syscfg be split into a
separate binding schema?

Unlike the other seven compatibles in st,stm32-syscon.yaml, which only
take compatible, reg and optionally clocks, the STM32MP23/25 variants
forbid clocks and require six dedicated properties and sub-nodes
(#address-cells, #clock-cells, #size-cells, clock-controller, phy@2400
and phy@2800) that have to be explicitly set to false for every other SoC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ups_mp25_c=
lk_syscfg-v1-0-667829cd290a@foss.st.com?part=3D2
