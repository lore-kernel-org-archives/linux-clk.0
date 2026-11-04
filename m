Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820726;
	b=OgiFatDw5HphdUMx9NKpkhqSyp4bC6e0VutH5jj8XhXWimNIQuUSPpajKRryf8821PxX
	 RJUj3SStcXdhim5g//mW6WGsxMfBD4yl6H3ncahdQW9vucMIZlGyufCKMTBzM55g5mIdV
	 BIpAVCbjth1a1dKw8W4OkgeMUY/csp6Du0oxoz2pZ6GnaO1l/iWRhxw3bGNFccXXQkSmr
	 1huOPrvELXjy0mfppAWTjjMAdhK5IWvOEJgxE1guoXcGN1UEFeD7VKJAU3kFmJw/4lxdF
	 EPbFV8iDfsB2fV8z80Da9qC3hqCKrIZQgSo/0IPA/w9UjQ2XrArPXoXoxfZ0c1qT55Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820726;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LI3L54yf3Hu6B0kchqGTshiXB7oIqG5hDgLSlPPE8Zc=;
	b=tWTMzr6NE2t9pglxS5qmP69Il/hvKmV0Ow2oTDOedySj3JuIHwPSjz0QayT5hrhWmmtv
	 Sl8tnJLkZPvNamstl0loYrGMX3id0nvy4oO1jVeL7asqxnmPQTdcay0foojqfGHB8LTsk
	 SO27kvyAWaZJQSKsFI4hbHde3fke5c++oPOTm0elbuoHw/gXs1pToggLFSUXi5MQh6sfm
	 7PyNTRv/EwbnbJLwHgeLGwfVxQbVx1JK8COxLiHoDUmsDK6sAauIgMVBnQ/rIDXkvK6Nr
	 XUdkeC6lbDqrUaNP2FvrkZaSTpzPdtyS9Gq3Cnr3WeZ97KI5dWrCBrMyLsrlIAuoaFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b98vdSJ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D1607817E;
	Wed,  4 Nov 2026 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b98vdSJ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF1A1F00919;
	Wed,  4 Nov 2026 19:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793820725;
	bh=LI3L54yf3Hu6B0kchqGTshiXB7oIqG5hDgLSlPPE8Zc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b98vdSJ+6Xtse6UIG6LKRJZBpAI8duYypZxUqToArrT58fzA56QExS8fPHE49Y5oR
	 6J3mMVo64OOWxOwOAt92vZPtNvsuB/BTF7/AoePfCBtnUSAzlgzcANlK9ttU77Eit+
	 2puLU61+072/HH16kxVzjgKC3r8QSChKJOPRPHvCBsP4WavqNcSF95IyT5u/FX34Jp
	 ly06QkDtJc9vhaJ72yQ16zt/FhKgYoVqhpV5dB9CbJbjGwLt92Gwmq5WOx1sMlJi+L
	 Ig2ctMq6TisxBNUNYLm7+EIZ0cBdT2Qm9ya2Thlk2L45r51jbVZ/moB9LoUbB22AyI
	 b9VOZimhisJSQ==
Message-ID: <sashiko-outbox-197954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
 <20261104-h616-pwm-v8-v12-1-8ed39b0dba69@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 19:32:04 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: pwm: allwinner: split sun50i-h616-pwm into separate sc=
hema
--

commit e6edbdd3d4cc396aa4ef672101ddfbb0d8e92bc7
Author: Richard Genoud <richard.genoud@bootlin.com>

dt-bindings: pwm: allwinner: add h616 pwm compatible

This commit extends the Allwinner sun4i-a10-pwm binding schema to document
the Allwinner H616 PWM controller compatible (allwinner,sun50i-h616-pwm)
and its #clock-cells property for exporting channel bypass clocks.

> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pw=
m.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> index 1197858e431f2..3b1819c8630cc 100644
> --- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> @@ -14,6 +14,13 @@ properties:
>    "#pwm-cells":
>      const: 3
> =20
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      The cell selects the PWM channel whose hardware bypass path is exp=
orted
> +      as a clock. Its rate follows the selected shared pair source and d=
ivider;
> +      the PWM period, duty-cycle and polarity logic is bypassed.
> +
>    compatible:
>      oneOf:
>        - const: allwinner,sun4i-a10-pwm
> @@ -36,6 +43,7 @@ properties:
>            - const: allwinner,sun50i-h5-pwm
>            - const: allwinner,sun5i-a13-pwm
>        - const: allwinner,sun50i-h6-pwm
> +      - const: allwinner,sun50i-h616-pwm
> =20
>    reg:
>      maxItems: 1
> @@ -62,7 +70,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun50i-h6-pwm
> +            enum:
> +              - allwinner,sun50i-h6-pwm
> +              - allwinner,sun50i-h616-pwm
> =20
>      then:
>        properties:
> @@ -83,6 +93,27 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun50i-h616-pwm
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          minItems: 2
> +
> +      required:
> +        - "#clock-cells"
> +
> +    else:
> +      properties:
> +        "#clock-cells": false

[Severity: Low]
As reported by Sashiko on v11 [1], this isn't a bug, but since the H616 PWM
controller is a distinct hardware block that also acts as a clock provider =
via
#clock-cells, extending Documentation/devicetree/bindings/pwm/allwinner,sun=
4i-a10-pwm.yaml
requires defining #clock-cells under top-level properties only to disallow =
it in
an else branch for all ten older compatibles, while splitting the H616 cloc=
ks
and clock-names constraints across two separate if-then-else blocks in allO=
f.

Would it be cleaner to split allwinner,sun50i-h616-pwm into its own binding
schema document instead of adding another conditional block here?

[1] https://lore.kernel.org/r/20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail=
.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-h616-pwm-v=
8-v12-0-8ed39b0dba69@gmail.com?part=3D1
