Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316648;
	b=xaLxjGMmeYs+cLoNb82nLfPXkJvRr9MrZIVcNfA5ztl0dMLOwSJlK05ZtH9r4fUz5Zut
	 BsPWVs+n0B0skPxwM+Tf4G9Cy2JL2/vulBuL7e7SQsAfEjGVZFroZ/NY1092L2kqNq+ka
	 ARqn4qFPYQ09h5AvLJdjE8sZRRsYmQuQWTUqTfHJRCF2Z+8XZzxI4HgP5xCJextBXb/m5
	 1EArvrSwKSBB8BKVQ3JrF9BJmWu7i59crl5101iZHvJqRGeJ/MfRpAED5lJgiocyiiDCt
	 fNEqDZeZklFruUiyisQCIp/neGotMmxMaDT7BCFje8Uhd8MqCJDEs5l3t+/BMf0AKNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316648;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cGK07w7TYM7HqmBCdFzdjKTvX9kQsTUkfBDXOwKVYGA=;
	b=Hg62Xm9QudB1VlG6zo1UcHAkXuBiv2Pof3LXIcQUEzNVFMZx7niBQPlOvQQQJd04Uioe
	 kUPJg/mqmkyfLH1kbpWyGcLYg7uWuTa0H2epCrRQ6Ktkdpfxzj5l0mHRkhI3LsGE1X9Pg
	 B1I4z3XlZhY0zRFc9e1yX0KdLhkr2GUeA88O6wW1d4GBgJY8eD3p5zz0PW/SozBM1GGEs
	 h0i0CPsCZK0xG5BIpHzQnpXNCy7we9oOpVUmNICq2BKtb+NTlQMzG92e72Y5kR42PaLc/
	 QrVdKOwd+EmeLgL+sjBbiJbUuZecGUZ2+FNzOHFVQPMAoCD0TK8SgtLrcCXlh6JKerg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ialyH5vV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A16071E5B;
	Tue, 10 Nov 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ialyH5vV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146A81F008A7;
	Tue, 10 Nov 2026 13:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794316647;
	bh=cGK07w7TYM7HqmBCdFzdjKTvX9kQsTUkfBDXOwKVYGA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ialyH5vViJEP12l1XVFj3sxh9FyfN36/9ZMN72LvvdR7qo3jCs3LXXmYwv4iwkuMe
	 va15b4QVhEhLNKuzSsUwVUQZROGrxyBhuZ11KtEvd1OOF+oOq36YPnNRxNHdSOiCQn
	 B9gE7nBY69o3BXENXptU+L0WupaSjYV6ax781/zZElY5rgqLJjInddu3BtPuGtus6S
	 5G+bFOZ+ic5v93lfm5Ih+jZKSrA7Xx6HXX8QxiJXuU9xtnv+KF4fvRJ6C4aSkc1CLJ
	 M8YyqQHv2jdSJPBvWXAu/bbR9pMXi6ADURNKxZm9qtQEFaZC4KXNhN0/rTZ43tcZbN
	 yNFo7QfJe21fQ==
Message-ID: <sashiko-outbox-207108@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 13:17:26 +0000
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

commit a6e3f1e2b7c45d1069bba34abc7927e0b05e5a42
Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

dt-bindings: arm: stm32: Add clock-controller sub-node to STM32MP2 SYSCFG

This commit adds a required clock-controller sub-node to the STM32MP23x and
STM32MP25x SYSCFG bindings and deprecates the top-level #clock-cells
property.

> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.=
yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b842..13c02844a91f9 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -38,6 +38,10 @@ properties:
> =20
>    "#clock-cells":
>      const: 0
> +    deprecated: true
> +    description:
> +      The LTDC pixel clock multiplexer is described by the clock-control=
ler
> +      sub-node.
> =20
>    "#address-cells":
>      const: 1
> @@ -45,6 +49,10 @@ properties:
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
> @@ -78,8 +86,8 @@ allOf:
>      then:
>        required:
>          - "#address-cells"
> -        - "#clock-cells"
>          - "#size-cells"
> +        - clock-controller
>          - phy@2400
>          - phy@2800
>      else:
> @@ -87,6 +95,7 @@ allOf:
>          '#address-cells': false
>          '#clock-cells': false
>          '#size-cells': false
> +        clock-controller: false
>          phy@2400: false
>          phy@2800: false

[Severity: Low]
This isn't a bug, but should st,stm32mp23-syscfg and st,stm32mp25-syscfg be
split into a separate schema document instead of adding more conditionals
to st,stm32-syscon.yaml?

Unlike the simple syscon nodes in this binding, the STM32MP23/25 variants
forbid the top-level clocks property and require a distinct set of child
nodes and cell properties (#address-cells, #size-cells, clock-controller,
phy@2400, and phy@2800) that have to be explicitly disallowed for every
other compatible in the file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ups_mp25_c=
lk_syscfg-v2-0-624559bb8ec7@foss.st.com?part=3D2
