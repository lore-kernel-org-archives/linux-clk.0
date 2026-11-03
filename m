Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695623;
	b=Rzb6UUKG++sOwnygd4riHPhwieI4TBFEcrN09Wkptft3AKsQeqsgZVxslwICpyTfz9XA
	 oGn/ncPpxu0ijPKGf0OvIAgmpVI4d0HlMT95RrPQXk2YdgiI4Fv5V6tonRY7l9X6h0Wcc
	 FhiIktPbsNCb3TpTpH6SjrQWSdOWyio1FCQqEE6uCztet3xtb2LY8LvTuf8hLjNdn5si+
	 iyyeL65vaoF3lge0keevhoOUvhdL6x2r2o7LgcpkaNv/YVbFwGkUaDa4r5WVq8TAzutpK
	 UNKk42qYqnYjjAAQK2nviq6eE3+89EMJmyI/P3gc2alQwGlNu+Gtyr5+I+ru1XnE9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695623;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z2SdosHR0dRaK0cAeienXDKylXIiLhb3yBvKfMtb5Dc=;
	b=2H9kMV4Bk4ICi2jJQcDG5fR9K06QfCrONM/FfiuiHb8gxUBThSkDI8KsbRyt/IJS4Ve1
	 j26LWPKZqpuNZQZRfEgrH5nvIogod6UgnW009Y7AZD5juyCam5JZTMoy4Z8xbi2tr6arC
	 0LocVgsUbpfme2B4a7qiEdw8Ga7ssUVB9Ild973ma2Kuvtx7OoEGkt13q66tylc70+UAT
	 q2kZmk+18I6ZJPdNC1EShWDJA4ykW774UafbgH1keaKThXe8eOLwZoeLE98uZ8X9jpWzy
	 dUgvA3cTMMNP0WoSOrHNDnWAWnNrAeW5qBfAvu33yLynu5gav1Ujt8FXtabkIzNvMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLvHZI3B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0684606A956;
	Tue,  3 Nov 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLvHZI3B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253501F000C1;
	Tue,  3 Nov 2026 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793695622;
	bh=z2SdosHR0dRaK0cAeienXDKylXIiLhb3yBvKfMtb5Dc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLvHZI3BSin+iBVhNdBxHyQNbtp4VOoYKl/q+P9GrQDrSP+IrPP4pah29cOmyL3sF
	 QtRVcS5HEBhg9p4gmRPW8KbGdKyJOGGCZYWaG4AmHThY0Ut/v67DbewBZir+C+PaiA
	 XxqPuO0JeR4RkNvZ/maaHvRrJ78wtKB2oH8dB1wUwIodE/w2SQKy0ylYbO08YF5XFB
	 NkoM6m20bu2mXStslz4zCUHtnWLHU8F7+xBh71PVbQBlKFNCWK/bNab2DgLiN0h2NE
	 MzvIzQS3cdbZ9iF6K7zVktYXfsFxkQ3OmFKZXCQmTsttqiOvqX6BP+AkdKDSTlH8xi
	 IVcGt4NGqFzCA==
Message-ID: <sashiko-outbox-194870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/5] dt-bindings: pwm: allwinner: add h616 pwm
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
References: <20261103-h616-pwm-v8-v11-0-07abb59575c3@gmail.com>
 <20261103-h616-pwm-v8-v11-1-07abb59575c3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:47:01 +0000
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

commit 84bc5e75b753199a825a57cc155aa02311bdc3e8
Author: Richard Genoud <richard.genoud@bootlin.com>

dt-bindings: pwm: allwinner: add h616 pwm compatible

This commit adds the allwinner,sun50i-h616-pwm compatible string to the
existing sun4i-a10-pwm binding schema, requiring two input clocks and
#clock-cells =3D <1> for the H616 PWM channel bypass clock outputs while
disallowing #clock-cells on the older variants.

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
This isn't a bug, but since the H616 PWM is a distinct hardware block that
also acts as a clock provider, extending allwinner,sun4i-a10-pwm.yaml
requires defining #clock-cells at the top level only to disallow it for all
ten older compatibles in an else branch.

It also splits the clocks and clock-names constraints for
allwinner,sun50i-h616-pwm across two separate if-then blocks in allOf (sett=
ing
maxItems: 2 and items in the first block shared with allwinner,sun50i-h6-pw=
m,
and minItems: 2 in the second block).

Would it be cleaner to split allwinner,sun50i-h616-pwm into its own binding
schema document rather than adding another conditional block here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-h616-pwm-v=
8-v11-0-07abb59575c3@gmail.com?part=3D1
