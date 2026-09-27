Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC837357CF1;
	Sun, 27 Sep 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521703; cv=none; b=DTm65EoPRQsY6XPmJbGf4iGhxg0h696D2ly6XvHgS6ZQSAGCpkRaHzFusmsckUVLOmzC5kukjdlWdx9EppgNK348RB78GMkCVo+8tPTV45rwn5jdorOikSUiMYjfA7Dn+UAyRlF3Mk2K40UcQ9jJL2gJbQtB4nrk37/htcXkv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521703; c=relaxed/simple;
	bh=plEgzDa5bKJ9zsmZEMly2ktugMTTHi3SKxISJQeZM8Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XDtNTPqSpPkbtCPHWw28jWyxq/58u3Jd38gVTn/CcTtIwcKqatGuIf6kLpOJvwMx5IvpjQFkNtgtolcoRiNcQ6z0gosfuKh5FFExe7DSlaTR22eUxIhwB6qs+VHx17QMjCl7q7G2oSh8D67rvIGSZ5DipBLtO3aSl/7dVMWsO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPaP4150; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPaP4150"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B331F000FF;
	Sun, 27 Sep 2026 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790521701;
	bh=7gfVLmDvb82Q6jpti80+ILIW5cFQbSYjV7SbmWHH/DA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPaP4150AId9LoFQIMog6ZA1y7/K5KMdesLe6iE5W3Kq+uI3wYzlB9SuX5T8EiNbZ
	 DAxMJVA3DTpdctfRS0/gkvLa+g52G5MtrEb/kHxMW9oKFDBB5aKMusrvqE+qzH9+eh
	 9uxmjQD2z2mgw9gF1MBIiervwQMI4QLehlcGcBYFAWMoZhgeF63U1h72UvLdNpYd/J
	 FHtxjkqFrFeiApo66fIH4jind1Kyj58Bl6ovj93JLA6Rn81EZL0BeUYMcx1nQkeow9
	 QJak+39u+5M0EpdL7ZYGTq79bVl0wJl1gVEflFYIhZkcZ2GW4yVZJsuueOtd7B2+og
	 QVK3jYZ8mAUrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
References: <20260927-feature-clock-guard-v8-0-630938e302a1@bruker.com>
 <20260927-feature-clock-guard-v8-1-630938e302a1@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 15:08:20 +0000
Message-Id: <20260927150821.34B331F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt-bindings: clock: mismatch between commit message and compatib=
le string
- [Medium] dt-bindings: clock: enabled-gpios maxItems restricted to 1 contr=
adicting commit
- [Low] dt-bindings: clock: example node name uses invalid underscore chara=
cters
--

commit 27371721055a09fb1d350d670a8c103b2d13f3cd
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: gpio-gate-clock: Add a new compatible string

This commit extends the gpio-gate-clock binding to support a GPIO-locked
fixed clock provider. The provider exposes a fixed-rate clock whose
availability depends on GPIO lock-status signals.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6ec..1ad87c8b36b9f 100644
> --- a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> @@ -11,7 +11,9 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    const: gpio-gate-clock
> +    enum:
> +      - gpio-gate-clock
> +      - gpio-locked-clock

[Severity: Medium]
In the properties:compatible definition, the enum defines the string as
"gpio-locked-clock". The commit message states the binding is being extended
for "gpio-locked-fixed-clock". Could this mismatch cause confusion for users
and developers reading the commit log who might assume the compatible string
is "gpio-locked-fixed-clock" and attempt to use it?

[ ... ]

> @@ -23,10 +25,29 @@ properties:
>      description: GPIO reference for enabling and disabling the clock.
>      maxItems: 1
> =20
> +  enabled-gpios:
> +    description: GPIO that indicates whether the clock is enabled or dis=
abled.
> +    maxItems: 1

[Severity: Medium]
Does this maxItems constraint in properties:enabled-gpios match the intended
design? The commit message indicates the clock availability depends on "one
or more GPIO lock-status signals", but this property restricts the
configuration to a maximum of 1 item. Users attempting to provide more than
one GPIO based on the commit message will encounter schema validation
failures.

[ ... ]

> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-clock";

[Severity: Low]
In the examples section, is this node name compliant with device tree
conventions? Node names containing underscores generally trigger warnings
during device tree compilation (such as from dtc -W node_name_chars_strict).

> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        enabled-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v8-0-630938e302a1@bruker.com?part=3D1
