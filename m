Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278704;
	b=NuTc4X++SyHZwWGUBwtn2JzBmmOioisHP1ww7sw/oQK9K6DtgMrO+vWk7k2i/PSX3EZO
	 8XHnkMilXpJ+0H/Jql9uei6uwTErkt12QxnbzzozSvJJWGVMLE00wX6Gmjlm8IQMRRAvM
	 cOn6l6xg7BnoKW/Z9mUDTgExLRB9Wa20d3lWXxa2SoZOBd+UBnnKBL3lPm7JJS7mlMX/O
	 taV57WaODVLL3ZL2Ck9UxfoMgLXkMXTjtUmUmgDZ5tjLBZcaPJ6hpFs0Uu7O4Wst/UXkM
	 kGNUhRcd1YvD/fieHO95LeW63PgeRw4gd+rwg/uTKflUCSKpkOmkz9P5+hSI/PaG5eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278704;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2dj621xlnc36AtUmapMH8WKqOt2OTF5gOx5Yx+nRFE8=;
	b=DVxhZk59i0lbmN9PyR8qoXIY44/LG+3HW+hlJPZCUlEKBZInZUcGXSreV/EZByosUB13
	 gZKZvAhLExogR0RUYQXk/TBREUt1RHOIQZpIzaQsSNpApoBeQNxmtfD9C7AS2t6nCQpDM
	 ZeEwly67pXAMmucNOaUUxhK3qSsTsJQCYXQbumfT9NWlQrGEVU4w7BrM9HK5vMbiio6jB
	 TfrPHwbkTFpW27Z1k7aJVO7LEDcGQdGgzKLSNguADgsE0m1E+PXbqixim1b8SSvS0nVse
	 Q6vUItECp8DJt/EdTwKZZYCndAnV4JWUpT1NS8Bu0p7nvdExz+xDFrKVMq71UVj3p+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTsbMwkg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFE606A331;
	Tue, 10 Nov 2026 02:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oTsbMwkg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7976F1F0089F;
	Tue, 10 Nov 2026 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794278703;
	bh=2dj621xlnc36AtUmapMH8WKqOt2OTF5gOx5Yx+nRFE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oTsbMwkgclRaoLjDGoY9wp4zJdT/iULkUi/nzf1/byrsKnCWYgg86nR6/7hKdiGaF
	 JeY+fbr67xX79T1/qczSsYkZTOHJI2+q928DkgVExf7f+NisBYBE72ZXhz3RCsPqTn
	 t+mBTGUXvQve2Q9jLzBN1mvxXvX6oIJR+vEIA1/o6TBV5xLs0K0sf88ObnXMI5q1a0
	 DQUIYaS85tLdrztq4vlXmNdyPi8q6gm1IE7lY4vLa2rMrrC1VvnEJyyuWSHfY8o+aS
	 9ZElSvR9plZZhXNgcUcb7UccbbFdFznjlQAqEdpG1EStM4TimInXv/cMuZFG/3y5js
	 ADMwPoL7JzQyA==
Message-ID: <sashiko-outbox-206063@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/5] dt-bindings: clock: meson: Add audio power
 domain for S4 soc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiebing Chen" <jiebing.chen@amlogic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
References: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
 <20261110-audio_drvier-v8-1-1489241e4c83@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 02:45:03 +0000
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
- [Low] dt-bindings: clock: meson: commit message omits s4-audio-clkc
  compatible
- [Low] dt-bindings: clock: meson: power-domains forbidden on AXG and
  SM1 variants
- [Low] dt-bindings: clock: meson: unwieldy per-compatible conditionals
  in allOf
--

commit 3f9534e5b3c2551a42b1642e1cc62923e9975fcc
Author: Jiebing Chen <jiebing.chen@amlogic.com>

> dt-bindings: clock: meson: Add audio power domain for S4 soc
>
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>

[Severity: Low]
Does the commit message omit that this patch introduces the
amlogic,s4-audio-clkc compatible string and its #reset-cells requirement?
The title and changelog only mention adding the audio power domain for S4,
but amlogic,s4-audio-clkc was not present in this binding before.

> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-cl=
kc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.ya=
ml
> index fd7982dd4ceab..75ddaf8d80917 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
> =20
>    '#clock-cells':
> @@ -100,6 +101,9 @@ properties:
>    resets:
>      description: internal reset line
> =20
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
> @@ -115,6 +119,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,g12a-audio-clkc
> +              - amlogic,s4-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
>        required:
> @@ -122,6 +127,18 @@ allOf:
>      else:
>        properties:
>          '#reset-cells': false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false

[Severity: Low]
Should power-domains be set to false for the other compatibles here?  Both
AXG and SM1 also have dedicated audio power domains in hardware, so
disallowing power-domains in the else branch causes dtbs_check failures if
amlogic,axg-audio-clkc or amlogic,sm1-audio-clkc nodes reference them:

drivers/pmdomain/amlogic/meson-ee-pwrc.c:axg_pwrc_domains[] {
    ...
	[PWRC_AXG_AUDIO_ID] =3D MEM_PD("AUDIO", axg_pwrc_mem_audio),
};

drivers/pmdomain/amlogic/meson-ee-pwrc.c:sm1_pwrc_domains[] {
    ...
	[PWRC_SM1_AUDIO_ID] =3D MEM_PD("AUDIO", sm1_pwrc_mem_audio),
    ...
};

[Severity: Low]
This isn't a bug, but adding another per-compatible if-then-else block to
amlogic,axg-audio-clkc.yaml makes the shared schema harder to maintain,
especially since S4 also diverges from AXG, G12A, and SM1 by not using the
slv_sclk0..9 and slv_lrclk0..9 clock inputs.  Would it be cleaner to split
amlogic,s4-audio-clkc into its own binding schema, similar to
amlogic,s4-peripherals-clkc.yaml and amlogic,s4-pll-clkc.yaml?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-audio_drvi=
er-v8-0-1489241e4c83@amlogic.com?part=3D1
