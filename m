Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A53F1AD7;
	Sun, 27 Sep 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790516351; cv=none; b=uT4L6qC+TV7hNscXksvJym1DBdhlWSX0o3sukyOYJWmn/GmAyOfh3Lym7GAiH6i3XIJ8CgeVbQqSpc/q//8IirGc0IKHJmhCiO1pa66p5JODnW1q4Bzq0ocFpIjkYV08kbxn2mrdkW39tkX3JnH9B645Bg6c7ACh/JZm/xtZCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790516351; c=relaxed/simple;
	bh=oMJ1fkPGutiRVvHe4zIu+G8O40wHQrjefNKjUDOwHBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I6/rodaFhDVe0/dilM1m6rHp0D2860cnE93S951yIqg6MY9u+MLeuqMbBRvMvlZan7v+SSVE6VYczDIUrdfFGSzsDqbeXuZo1U4c3qY/jC5oyyoHYaRIStGxclGaD/dn9D5lo8Jkx8aveP2k+HsJlhiOtUOVo99G424ilSgX2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYmDilGJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYmDilGJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE52E1F000FF;
	Sun, 27 Sep 2026 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790516349;
	bh=QkwGNTsfExRzWNhwQoFHwKORlde5wqI3C2aUYTeC14I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FYmDilGJjx2fhnGwo942MeRvX8PBXSjkoTubEcvO1M6evJmUE1RQXQ8d8/Yy0JXRK
	 AE3SDhkLLZvwpemb/hp7NYsHcVnAfWYFBGtIOsWafctfEwXo1DIffwFMJXYBgxNLfr
	 OTWcCxjpPg5+7MTmIoN70Sx/RzrjlpfS83jLa8Zz3e4MhGaqEXWd/nVH1QLGbUdlbp
	 i7/KbKfMVjd4juZS/rRVa1SO72u7XdFKfWOISbWovwlVsVR7rxBqrRSRCGvR/OG3Xr
	 /5YT+RF1HPIBl7QxEFjm3bw/fo/nK7QPhte4fFm0h0PKlDDnyFrTCD7Cz09p5urW3H
	 UCOZXY3DvxkSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: gpio-gate-clock: Add a new
 compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vyacheslav Yurkov" <V.Yurkov.EXT@bruker.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260927-feature-clock-guard-v6-1-007983b13ec2@bruker.com>
References: <20260927-feature-clock-guard-v6-0-007983b13ec2@bruker.com>
 <20260927-feature-clock-guard-v6-1-007983b13ec2@bruker.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 13:39:08 +0000
Message-Id: <20260927133908.BE52E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: clock: gpio-gate-clock: compatible string mismatch bre=
aks validation
--

commit 2b809675a6d656fd8b8fcf12572b9880f2905a0c
Author: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

dt-bindings: clock: gpio-gate-clock: Add a new compatible string

Extend the binding to be used also for gpio-locked-fixed-clock.
A GPIO-locked fixed clock provider exposes a fixed-rate clock whose
availability depends on one or more GPIO lock-status signals.

> diff --git a/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml=
 b/Documentation/devicetree/bindings/clock/gpio-gate-clock.yaml
> index d09d0e3f0c6ec..f44fdb17b627b 100644
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

[Severity: Low]
Does this missing "-fixed" suffix introduce a regression in validation? The
commit message, conditional block, and example below all use
"gpio-locked-fixed-clock", which will fail schema validation against this
enum.

[ ... ]

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
> +          const: gpio-locked-fixed-clock

[Severity: Low]
Does this compatible string mismatch introduce a regression in schema check=
s?
If the hardware uses "gpio-locked-clock" from the enum above, this
conditional won't match and will allow invalid nodes to pass validation
silently by bypassing the required "enabled-gpios" check.

> +    then:
> +      required:
> +        - enabled-gpios
> =20
>  additionalProperties: false

[ ... ]

> @@ -40,3 +61,10 @@ examples:
>          #clock-cells =3D <0>;
>          enable-gpios =3D <&gpio 1 GPIO_ACTIVE_HIGH>;
>      };
> +
> +    clk_gpio_locked {
> +        compatible =3D "gpio-locked-fixed-clock";

[Severity: Low]
Will this compatible string cause a regression during dt_binding_check? The
example uses a string that does not match the allowed enum values defined
above.

> +        #clock-cells =3D <0>;
> +        clocks =3D <&pll>;
> +        enabled-gpios =3D <&gpio0 4 GPIO_ACTIVE_HIGH>;
> +    };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927-feature-cl=
ock-guard-v6-0-007983b13ec2@bruker.com?part=3D1
