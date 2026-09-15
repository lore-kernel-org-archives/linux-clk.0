Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F087399352;
	Tue, 15 Sep 2026 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464966; cv=none; b=YcUdgxolfSXvwxqvOodrpw6uwIrs0Z+TUFh4A92nt7k/SanzxAbJpoi1+XKl/mEbUiXp2W2B3bfk0uK+ScLdKR2HjWsOvr9+byxUgmRjDsrLRuHLBwejb058BGYXDfSFJqkrIPyB0IEoVTvcaQpK0Uz3Hc9XPyERpZTrX46sGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464966; c=relaxed/simple;
	bh=+lid/M6xljziVtj3yjRarRkf4rpDQ6GCdGfqz68MAX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rOuEwaH/4rAitRhkyi5/MQlhMcOoATGKnzSncqZV/tjXbe6JxoPTZh3F/jsDSeJSvY+NTbtxrVkGnTWRCGcqH1RhIrAou0NwTqAxQbdnN+eSEHFuTyL4kcjGshYSQ45HoCETzfTIuo9mz3zZViLpNnd0J/tS3Ai7OjkrD2j/lws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEwdVqaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEwdVqaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2F31F000FF;
	Tue, 15 Sep 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789464963;
	bh=wfJT7fdvHTrIEDmOFAVn0+E6JlD4Jisetoz4OLEIXEY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AEwdVqaHRHVdUJ+mZ3sTBXusmqY5LolmOkfvysXLfoOeh4azOou63nbJZkqubaR5O
	 GKk6CC2bhO5uxheUVo50yk7yYgPdrxWbnS5TDSjE4zoSaRW1kEFh3UvQTT1H7+nULe
	 04QZT4vB+vwk84ycPMP6faeWiHC+JqIILacS8fHAN8y3PuIZJ2znRNJ5uAfslEhlrN
	 sJvPzogn1D7c947MUDDEkRzfHJvb+uHwPf7Tx6RIxRVd6ZzGKBRZX3otSX1mD9QHgv
	 lKUzup8FcONea92KGdX8TgUrvq/yJYTi0uDCf6DbRMTBdXifumWXy3EXR3GVIxY8Tk
	 UjeI/oh55COMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260915-feature-clock-guard-v5-1-42ab5dc3a6aa@bruker.com>
References: <20260915-feature-clock-guard-v5-0-42ab5dc3a6aa@bruker.com>
 <20260915-feature-clock-guard-v5-1-42ab5dc3a6aa@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 09:36:02 +0000
Message-Id: <20260915093603.4D2F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: clock: locked-gpios maxItems contradicts commit mes=
sage
- [Low] dt-bindings: clock: schema does not enforce mutually exclusive GPIO=
 properties
- [Low] dt-bindings: clock: example node name uses invalid underscore chara=
cter
--

commit 79ea3ad838118b16ee842ed66488a42eefcd7f13
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: gpio-gate-clock: Add a new compatible string

Extend the binding to support a gpio-locked-fixed-clock. This provides a
fixed-rate clock whose availability depends on one or more GPIO lock-status
signals.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6ec..00cf2ad66dd01 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml

[ ... ]

> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
> =20
> +  locked-gpios:
> +    description: GPIO that indicates whether the clock is enabled or dis=
abled.
> +    maxItems: 1

[Severity: Medium]
The commit message states that the clock's availability depends on "one or
more GPIO lock-status signals".

Looking at the schema definition, the locked-gpios property is strictly
restricted to exactly one item via maxItems: 1.

Does this maxItems constraint need to be increased to support multiple sign=
als,
or should the commit message be updated to reflect that only a single GPIO =
is
supported?

> +
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

[Severity: Low]
Since additionalProperties: false only enforces that properties must be
defined in the top-level properties block, both enable-gpios and locked-gpi=
os
are now allowed for any compatible matching this file.

Should this conditional block explicitly reject locked-gpios by setting it
to false? Without this, a device tree node with compatible =3D "gpio-gate-c=
lock"
can include locked-gpios and inappropriately pass schema validation.

> +  - if:
> +      properties:
> +        compatible:
> +          const: gpio-locked-fixed-clock
> +    then:
> +      required:
> +        - locked-gpios

[ ... ]

> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-fixed-clock";

[Severity: Low]
Does this example node name need to be updated to use a hyphen instead of an
underscore?

Device tree node names should ideally use hyphens and a generic class name
like clock. Using an underscore violates device tree naming conventions and
will likely trigger a node_name_chars_strict warning during compilation.

> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        locked-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-feature-cl=
ock-guard-v5-0-42ab5dc3a6aa@bruker.com?part=3D1
