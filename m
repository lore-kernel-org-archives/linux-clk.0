Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940379;
	b=ykKk6on2kOP0DDQwV8LggZ7F4vFlyo+KdKByH8TkA0EYi+qxnMyfovYeNZawPUhH7Fq/
	 FotTHSrwQ1eHiCJ1b9yVJtmDehPKw6xtFSYJWCZb+thJWZHPk3NfywdZMp7sJ5qTMWN1X
	 SGIpKXJgC4hMbM55ANVoGTgSzSDLzBkX3miG7RcnBdCoMsAyK9sDtHhOyoQAOfF8FikQv
	 Ue5Ah5uGDtpDU24yNW8NlrDRiAAzTyZmb9j6GsJ8LpSqdpQVM+gBZtGuzB0HWWxa6VkRC
	 U3f/uzeb0F6tOMKsKuxysWwAM4EaAvh14hgANqfLdSAfvB6Fgb84tmapFaB6q61Yd2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GmePKVwUTyJIhHXiaeb72UDlaGxd8K/qeNXjdeGy2Tw=;
	b=h9PShEEaZ7kdeAOZFGm/kAW88r6QYwsRLAEI+6ly8Gh59p7aUWtRSKSZ8Aw6u2NCmsYk
	 dNKEx9dJ/KjeMIX0q7nW/AOzx310EnnvyXy1lvZDhKftLR/dWSDZ/Mzolmyc8cOqPNlE0
	 vBagMmMM9lKSJoOFufduqCVp//cLvRE+8M+XDzObwfrviZ4C2zLT12cqvgXTelRn3k8Xy
	 E0aUUttTQXDfwcRfNubFpZWOMtHckzibje1m3yJT0ZgfESIom/7bSQPyImirkFqT4Qoro
	 uoNeP42AYZwMKvPlFaSnixqSkVqXmivfGrSOOF06NgXaym857+4OlEfoybnvtq0dgCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvEVYT4J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5E606A336;
	Tue, 17 Nov 2026 18:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CvEVYT4J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD8D1F000C4;
	Tue, 17 Nov 2026 18:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940379;
	bh=GmePKVwUTyJIhHXiaeb72UDlaGxd8K/qeNXjdeGy2Tw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvEVYT4JT/4cbTO0BpbChCog+JwwNluVAVEx7nBv3AwbL9nc2cTXmjUH4MvjeOI4s
	 +HuLNYhEkikO12ljOGgz3fcK+2JtxNRwA65gokchkdaSoBjE1HtrmEpTF+6+1Q6xWo
	 wxPG7wFIirNs62L0WAh2ScQ8J9P2gkNPOofmULsnvNUussZWa8dZUF0RpBDv+b3IsX
	 9md5TMsFh4AMJ/kooHb/S4BYXaqVk9pz7/Ic8+H54+XFjKjKZAnrHBvdf/OfXjR06o
	 5taY4N77yTDogx5/GPVjfLQopVTDy58QzpKS72yaqlFPxtYjcklB7OAhZhN25+z4Wx
	 zsdn9C/0/nGMw==
Message-ID: <sashiko-outbox-219345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/5] dt-bindings: clock: airoha: Document support
 for AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117182444.103123-2-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:32:58 +0000
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

commit f0ae95ef10113af9be9b8cf6b0ed7bcb3dcee33f
Author: Christian Marangi <ansuelsmth@gmail.com>

dt-bindings: clock: airoha: Document support for AN7583 clock

This commit documents the Airoha AN7583 clock and reset controller binding
in the EN7523 SCU schema, adding the airoha,chip-scu phandle property along
with clock and reset binding header constants for AN7583.

> diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.ya=
ml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> index fc37786ac7ed8..05cd20ce3ab91 100644
> --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> @@ -31,6 +31,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - airoha,an7583-scu
>            - airoha,en7523-scu
>            - airoha,en7581-scu
>            - econet,en751221-scu
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
airoha,chip-scu accurate?  As noted in the commit message and implemented in
drivers/clk/clk-en7523.c, the Chip SCU provides the registers used to read
base clock sources, dividers, and clock gates, whereas the main SCU
register block provides the registers for PCIe clocks, resets, and PHY
SERDES.

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
This isn't a bug, but with airoha,an7583-scu added, all four compatibles in
this schema now have separate per-compatible if-then blocks in allOf with
diverging constraints across reg, #phy-cells, #reset-cells, and
airoha,chip-scu.  Would it be cleaner to split the variants into separate
binding schemas (or consolidate shared constraints such as reg maxItems: 1)
rather than adding another per-compatible conditional block?

[1] https://lore.kernel.org/r/179383990045.753844.10400171550739497565.b4-r=
eview@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117182444.1031=
23-1-ansuelsmth@gmail.com?part=3D1
