Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CE134CF;
	Sun, 27 Sep 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518111; cv=none; b=MIGWhGNjw1DRdI9cs8+ecfvJMNlfbkWeKPudr84O6H7My/APe0HUNlPC4KDCA0+LxtW6BnfRAv9AljR0nMcvjWE28QuLouYcBYMKaGP5wJo1YP+Q34qgqCUUDfRkaoJlC871JvQYWQ2UFiZA7qilCiVh1FYArHV4n/EyoQG2D68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518111; c=relaxed/simple;
	bh=6ymPVr3qXTcgrrsJTv9M7cZsAJD2TxyHDR04t0l/FZI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QpK6qkGOMnonKMGFg4bO7Y+8hDcP0h/2/XZfIdQW4E5dNmRhZtJRSMV8HHD0GhACyQ2eTJO/DgT2rHiOYHyqM9cyiFeLuU588G1Rq9kC6J3/aSwIDz1MpbCocE6CG6gA9AREehbOFqOAlKa5rLohMs9Epw7mZfxFpBBzGoIS6wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeLaZl+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeLaZl+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F378D1F000FF;
	Sun, 27 Sep 2026 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790518110;
	bh=PTAqnYQbHZ9fuSL8FRIS/fqnODsJvnGohmupF04Flw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XeLaZl+77Jh0T6mUisDJzK+GAUaKz8fJVvJCLN8wRT1Y4hhD8FnUdP6ipGbGUJUzc
	 Q9j9EsSgbFVvSu1MQGSzLMkPFwbHuu6gKEjh2vNNXBq37WCgNimgY3iJf7Tp9mjpJT
	 0TQqnXlI3zspQ81uTRmnbiQ89gdP4KOmBuPD+uAp+LoMLgHXKTi2Vjf3gSSehPYLAM
	 BPLB/EwQe2pzCl8FwMm51kL66wHwjXpWQxK867VqggHhwuO5iQMlui66KvWcsgpNfQ
	 omI1RwKm5QN4rw33wi3KxmnSUzqsbveYj7kZkYvifSDrGTIBYT5sjIHBNEaUasEXAA
	 aZNzbfUXviuTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260927-feature-clock-guard-v7-1-8dd19568d9a2@bruker.com>
References: <20260927-feature-clock-guard-v7-0-8dd19568d9a2@bruker.com>
 <20260927-feature-clock-guard-v7-1-8dd19568d9a2@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 14:08:29 +0000
Message-Id: <20260927140829.F378D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: commit message and compatible string mismatch
- [Low] dt-bindings: incomplete conditional validation of mutually exclusiv=
e properties
- [Low] dt-bindings: non-generic node name in example
--

commit 91b1494a8737e6c880936e93a4ab375dedf59e96
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: gpio-gate-clock: Add a new compatible string

The patch extends the binding to support a new clock provider that exposes a
fixed-rate clock whose availability depends on GPIO lock-status signals. It
updates the yaml to include properties for this new type of clock.

>     dt-bindings: clock: gpio-gate-clock: Add a new compatible string
>    =20
>     Extend the binding to be used also for gpio-locked-fixed-clock.
>     A GPIO-locked fixed clock provider exposes a fixed-rate clock whose

[Severity: Medium]
This isn't a bug, but there is a mismatch between the commit message and the
implementation. The commit message explicitly states it extends the binding
for "gpio-locked-fixed-clock", but the added compatible string in the yaml
is "gpio-locked-clock". Could the commit message or the compatible string be
updated to match?

> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6ec..1ad87c8b36b9f 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml

[ ... ]

>  required:
>    - compatible
>    - '#clock-cells'
> -  - enable-gpios
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-gate-clock
> +    then:
> +      required:
> +        - enable-gpios
> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-locked-clock
> +    then:
> +      required:
> +        - enabled-gpios

[Severity: Low]
Does this schema sufficiently restrict invalid property combinations?

By defining "enabled-gpios" globally, "additionalProperties: false" no long=
er
rejects it for the original "gpio-gate-clock" compatible. Since the mutually
exclusive properties are not explicitly forbidden in the conditional blocks=
, a
device tree containing compatible =3D "gpio-gate-clock" and an erroneously =
added
"enabled-gpios" property will silently pass schema validation.

Should these blocks forbid the mutually exclusive properties (e.g., using
enabled-gpios: false for gpio-gate-clock)?

>  additionalProperties: false
> =20
> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-clock";
> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        enabled-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };

[Severity: Low]
Does this example violate the standard Device Tree naming conventions?

The node name "clk_gpio_locked" is non-generic and contains underscores.
Should this use a generic node name describing the device function (like
"clock" or "clock-xxx") to avoid introducing an anti-pattern that users may
copy-paste and generate dtc warnings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v7-0-8dd19568d9a2@bruker.com?part=3D1
