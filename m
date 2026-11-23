Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437931;
	b=5cczdvMgXHpYSB8j8LNYNGfmpT4jAIvJOmR5iIMDI2FAVoFbGGlCbrwyJeC+Kgcv0uQp
	 /ZbMFf3ptv9cqm/alii94vEV/lwiyCKgbUXB0JtRvdf9d8RBpNLS+VyAekf3JM/Fx44d7
	 1jfYlpAOdiw9n0hgzdlroKKB3q/DNnJW49f/4Satta/C0xda7THDMiwxmibX0k9SksLRg
	 tE2KlsESOSuY3x2EPYv+61N1pi+qxFbvBbxxz9xHmW0oqwyNKm8JoKtKj7KuwqiWHW02R
	 rD30w+qS01jprDiY5M8vzGEWRz1Q9yLZQQ6DZCTD7e1w0iLQLoLmm+KK/9cH5vVoVhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oJzZnpzhv8Z+QwxLAsKihYnR+pNUZ6xaPGPOqHQORnM=;
	b=Y8Mjyj2ly+wnk2RrMdPb4LxpL6UuT+cGKeiVWC54NRxhQ9ehH0pUyl89bp8P47tDSkWA
	 sbLr1ax96jnbAMmGGPXJkzbsmMPXAw8bwAdw0naITlcvJFMGUvHJQgH6RHzHePNsocvBF
	 J8kah7WFlD7QxzliF7q6kR4S/1uHoIZfj2X0qe/pXX/jubvgrxElL27/QJdwz6QDYZ0/c
	 f7wXpSFo220uJN/anTFfQYvm/CqNRaamWV6BpGUJ9nsk7phl1K79qrlFJ/bmkdlRyECv6
	 AQEO2wDeZbGdIY8YV5zIW8r2YIgiaooFN3lGjfKQj3BKYEl+Cl3Qf4au9cGYjobkisw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqpvEEom;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB1606A31A;
	Mon, 23 Nov 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NqpvEEom
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26961F000C0;
	Mon, 23 Nov 2026 12:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437931;
	bh=oJzZnpzhv8Z+QwxLAsKihYnR+pNUZ6xaPGPOqHQORnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NqpvEEomXwhfiTdanfNqjKNVW/ZI8vckIUWjFow0MUJNpUl3odJ3292vS6F8rElMg
	 4J3R27nu/jQ+2NG5A4nxkTm82iWLL1Red1Kwr8fzwbmWDLGGPr9bEv0R5A6CEEiML0
	 5NjA3BdBoTQo+7MIBOMPjUSlGGTBYCFIRuYE6iE911Ak4T808YOfLi3eXwFua0S5pM
	 C+EF6V4tABjhc5Bl0yM/T30plXJnfEw8EtYgkhF2guWdsj42W2PFdAIuQZR6QpcC5A
	 1mFsh3UFxruWu4ZtbOzA6Vma6GZP6Celu6wykdgv2wC309egurVJXFeD/HYHs4x+U0
	 k5q4pTAEzbrAg==
Message-ID: <sashiko-outbox-229245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] media: dt-bindings: media: i2c: add OmniVision
 OV12A10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-5-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-5-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:45:30 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] media: dt-bindings: ovti,ov12a10: invalid $id and $schema
  URIs break validation
- [Medium] media: dt-bindings: ovti,ov12a10: 0-based MIPI CSI-2 D-PHY
  data-lanes indices
- [Low] media: dt-bindings: ovti,ov12a10: deprecated pwdn-gpios and
  custom vana-gpios
--

commit 2adecf2c1e39908b70d5c8d587dc348d341ebb34
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

media: dt-bindings: media: i2c: add OmniVision OV12A10

This commit adds a Devicetree binding schema for the OmniVision OV12A10
12-megapixel MIPI CSI-2 CMOS image sensor.

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yam=
l b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
> new file mode 100644
> index 0000000000000..6919277c2b3f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org
> +$schema: http://devicetree.org

[Severity: Medium]
Should $id be http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
and $schema be http://devicetree.org/meta-schemas/core.yaml#?  The bare
http://devicetree.org URIs cause make dt_binding_check to fail validation.

[ ... ]

> +  reset-gpios:
> +    description: Active-low reset GPIO.
> +    maxItems: 1
> +
> +  pwdn-gpios:
> +    description: Active-low power-down GPIO.
> +    maxItems: 1
> +
> +  vana-gpios:
> +    description: Active-high analog power enable GPIO.
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply (2.8V).

[Severity: Low]
pwdn-gpios is marked deprecated in
Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml in favor
of powerdown-gpios.  Also, since avdd-supply is already required for the
analog supply, a board-level GPIO enabling an external analog regulator
or load switch should be modeled as a regulator-fixed node supplying
avdd-supply rather than a custom vana-gpios property on the sensor node.

[ ... ]

> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            items:
> +              - const: 0
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +
> +          link-frequencies: true

[ ... ]

> +            port {
> +                endpoint {
> +                    data-lanes =3D <0 1 2 3>;
> +                    remote-endpoint =3D <&csiphy0_ep>;
> +                    link-frequencies =3D /bits/ 64 <216000000>;
> +                };
> +            };

[Severity: Medium]
Should data-lanes be 1-based (<1 2 3 4>) instead of 0-based (<0 1 2 3>)?
Per Documentation/devicetree/bindings/media/video-interfaces.yaml and
v4l2_fwnode_endpoint_parse_csi2_bus(), physical lane 0 on a MIPI CSI-2
D-PHY bus is the clock lane and data lane indices are 1..4, so constraining
data-lanes to 0..3 collides with the default clock lane and rejects valid
1-based sensor endpoints.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D4
