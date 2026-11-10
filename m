Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269956;
	b=Ik3XiSPljAKFnzo7Sljj1cZSaVzucu92/+gFaqrNdcjuvDDLaDncaww6IvnOT/MZ3rvj
	 6Bb0/nC8chXt3si6mI4uaL+IXpVaYPo4O/ATQPNqaSIf9kKQ+aLjYPZimZLtttMln2jzG
	 h6rw8un6NoBu0aKqr+looG7GSZZDmDIOpFVk6wfQuBaWOQD9E0udZV1pMzlE0pvERezH2
	 a3Z+h+cPM7zEBukderyUr+XkDx50mBQDefvf0QKSj8Dla0R3XvnRVrDI2qCyJeAHCOxP3
	 hLyGjaMIRqNeq2D+TxF5GOTKm1ZbeCCiQdOooa6k28MHcRnPb7FegLlEcBRkP/XCAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k2nj6EFwtFEoGtqUTnS6Y+9lcxQ+ylbF3CebdYj5FfE=;
	b=qeAsFQcN0pg5RHuahzCGVcdlQuXGpt1iCMccFQSjNtZfN9wG/9r0YNl5e5bnFA2DBH38
	 SATNAyW2irG61LxKNI9UKxHr/ex4El84tkmEO9BSTL2k9tOWurjNtSqjDl1SVnyQB05YL
	 4WqYUgWgJvTJ2OfzpTxmpSCm0If6Tw+unPxJ7sEs8GZZixOdbbSZZL/pXbbqlGZqNpv8O
	 BEasCj1YDiPTaiO72ujV4YNwBuc+mlK2BtRVbRNPPZr6ls4+Em9vxiZrEan1i71H/a/NC
	 wiIpZ9ZTheupA1XgvwuNiXVixoFZJ6y/UXqd3Ku728Bh6KTsxkF6R6teItfdqwNjdCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DwksX/ik";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC85606A337;
	Tue, 10 Nov 2026 00:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DwksX/ik
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFFD1F008A1;
	Tue, 10 Nov 2026 00:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794269955;
	bh=k2nj6EFwtFEoGtqUTnS6Y+9lcxQ+ylbF3CebdYj5FfE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DwksX/ikUtARzsjADm3q50PeuoQDRMxygiuyL0uIfw7in0xnoUdVRgP+/2sq0Kf3v
	 i1dSPwcb4JBMbdJQnmvG4WXEBaarzpsCHaAcYIUnFyUqKt9MPv3Pwvll78JarIG/YD
	 Khz/lDjbXh/BFxleQK73Fz+ITJXyYQ9odqTUFlmyG/v0bXxITltvTvuH83kVtwu2gw
	 h+QHGnujuIKc6T1ZqF2tmHbMqRg8VN9YvgavdJnxynw62Afbi9YueGZtuphkI5bdfI
	 pV2dnEOOnhtRwaAoC6pRq+G18MNKI19eTzal2XRKeAs212yLL7OVtraZunNugxp1Ce
	 mHT0a+j8Ca+mQ==
Message-ID: <sashiko-outbox-205833@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/5] dt-bindings: clock: airoha: Document support
 for AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110000753.508-2-ansuelsmth@gmail.com>
References: <20261110000753.508-1-ansuelsmth@gmail.com>
 <20261110000753.508-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 00:19:14 +0000
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
  in schema
- [Low] dt-bindings: clock: airoha: inaccurate description of
  airoha,chip-scu
--

commit 078856d9f139a456969b8b085cbf1d617f56642a
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents Device Tree bindings for the Airoha AN7583 clock and
reset controller, adding the airoha,chip-scu property and clock/reset ID
definitions.

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
airoha,chip-scu swapped with the main SCU register block?  As noted in the
commit message and implemented in drivers/clk/clk-en7523.c, the Chip SCU
provides base clock rate and divider registers, whereas PCIe clocks and
resets live in the main SCU region.

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
This isn't a bug, but with airoha,an7583-scu added, every compatible in
this binding has its own if/then block under allOf with different rules for
reg, #phy-cells, #reset-cells, and airoha,chip-scu.  Would it be cleaner to
split the diverging variants into a separate schema document (or at least
consolidate the shared constraints) rather than adding another
per-compatible conditional branch here?

[1] https://lore.kernel.org/r/179383990045.753844.10400171550739497565.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110000753.508-=
1-ansuelsmth@gmail.com?part=3D1
