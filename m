Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966801;
	b=IgJhUlv6jBio+UzrFQ61Rb91Xj/SZgDKBlbJXJBLt+Lhpn+BYJl2y8pyk8p7/6nznjiU
	 rJCIyOwQrp7peaFf3kcZAMjqUEoi93S41qg4FSKP6stMStMVrjiYsrbbF1Hve1WLkQzq8
	 k5JhUOZYlOujWkXw8ugffoAncXprc/sHTpMRo3fRIEXUH0S7oHkxqTPaxI7gTqJgdmmwS
	 3vxM9CsWybQE9nz84bp393NJlc8gbDLS9uUWiAq3qS7j7fPPjSQv4CpvgaWiRELaJkDsy
	 UEPTpHOIm5jfaE6RY+PWKu94+toKpAr2/h0/N99cPDUI1WSUcz216QTB1IXMbPixGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966801;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7o7dC8sVs5kYGVKxPwaOkMHtYtBpkn3eb4t+mLT8WC8=;
	b=GxPShR1yJ208FLc65LBKZ4DHZXTVz+O85Dq9hbzIU6uiN3W8fkma7nDAr0xe9WMwuWAF
	 EQ76ZhoH0iZieN+06geOm9kMuVlWb/IIKPw41CTfBDhZaFk2GpDsK46l2cn0IpMxa9NtI
	 F/R2/UBPht/vwUon7fgw+NdF9DRhksv0x6JtETmbhxDuHfu0At9SWnmp+h+nsdN308hps
	 sN0RR+fTbYKVb0ej1ILXhESzmSsgYkD6LX7IJcXRti3rsVpiTqcUf3IhBHLgcUGJNpjOc
	 Gh69B8TvkVc+bgl5QezKDZD046dtQ/NK35UT/CmPeHYCyyMojpEvZr8dr1N3cQS7cxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6Gm8IbS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D31606A33C;
	Fri,  6 Nov 2026 12:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6Gm8IbS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22ABA1F008A1;
	Fri,  6 Nov 2026 12:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793966801;
	bh=7o7dC8sVs5kYGVKxPwaOkMHtYtBpkn3eb4t+mLT8WC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I6Gm8IbS6/1qLO4Zh9wcVI/eI1M6kpwcVNYs2Sq2aORbX3poX/r164MqZGBeCaDDM
	 nAF1O4n92huDczai1PZwdZlxYbFIoPQpIoIGwIgED9Mx7r+C3/vSboSrQefw+oJWSi
	 fBNRBEv32ATBqKwc25j6J5sQgIGsjaK/O4Xxi8M8bReT/Zo8RLSye3gBnDZR60QVn8
	 OToffIsuUVbY2mA6BmiNQDYjY8S9xj+WyJR8k5qdMt0hEl4wtTyRH3PXZZ6+z5RgfK
	 YJ6zA//QhK7pVFx6NXPetGc9qqlBCyMcTNsnkoz3xiAtU623FlQEo7F2uLzM07S8mJ
	 OcSlnnJLOF0Xg==
Message-ID: <sashiko-outbox-201378@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/5] dt-bindings: clock: airoha: Document support
 for AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106115852.189098-2-ansuelsmth@gmail.com>
References: <20261106115852.189098-1-ansuelsmth@gmail.com>
 <20261106115852.189098-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:06:40 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: clock: airoha: unwieldy per-compatible conditionals
  in airoha,en7523-scu.yaml
- [Low] dt-bindings: clock: airoha: inaccurate description of
  airoha,chip-scu in airoha,en7523-scu.yaml
--

commit 94419d913db80e12747b18f5e97b56dbea634264
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents Device Tree bindings for the Airoha AN7583 clock and
reset controller in airoha,en7523-scu.yaml, and adds clock and reset ID
definitions for AN7583.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fc37786ac7ed8..05cd20ce3ab91 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml

[ ... ]

> @@ -57,12 +58,36 @@ properties:
>        available serdes port.
>      const: 1
> =20
> +  airoha,chip-scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Chip SCU providing the registers required
> +      for configuring the PCIe related clocks and resets.

[Severity: Low]
As reported by Brian Masney on v9 [1], is the description of
airoha,chip-scu accurate?  As noted in the commit message, the Chip SCU
provides registers for clock gates, base clock rates, and dividers, whereas
resets and PCIe clocks live in the main SCU register block.

> +
>  required:
>    - compatible
>    - reg
>    - '#clock-cells'
> =20
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
> +        - '#reset-cells'
> +        - '#phy-cells'
> +
> +    else:
> +      properties:
> +        airoha,chip-scu: false

[Severity: Low]
This isn't a bug, but adding airoha,an7583-scu gives every compatible in
this binding its own if-then block under allOf, with differing rules for
reg, #phy-cells, #reset-cells, and airoha,chip-scu.  Would it be cleaner to
split the binding into separate schema documents rather than accumulating
per-compatible conditionals here?

[1] https://lore.kernel.org/r/179383990045.753844.10400171550739497565.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106115852.1890=
98-1-ansuelsmth@gmail.com?part=3D1
