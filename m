Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888510;
	b=VSkUcFjpNwv1wslCJzrd3QTHQQBtAWCkMRhUPcMOSn9rNNcROmoKFGgvAhyX+yDyNiyO
	 28ySCF5FkCfP4cp5zwc2QvJ3r7k5d5VB8HY+EA6FHAYEfUqLsrPbCBh58cw6S56hnUxO+
	 L9NX1uGNBtbL4kQJEC4WEw5aJ65RKzb6+kzw8tTfyikPZpnfuN97T0303au+ajmW7QYmq
	 oLKUx5++rZ0gJlNIUoEzyi9trUgeZDCT1Yb8HQfQOomcdkn9xqyYLmybziX7CceHhA/P5
	 OnTX6ZHF4kl4oD34yT4XH07RyBU2GcrrKdOKhmNQudVFWGiKjp5U6fe8F4r+sCvHrHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888510;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eRO0we/jv1u/NCKEYpjhxs0l4uxNRSe89AWbOp+pBrw=;
	b=U99c7RJ0lIvGDqsQRt++9mUPPsGNQg2w5LZ3CKKMvoLoaFGD20U/faTur1Mlx8HivCu7
	 xMg9+g09lfyVu5LAoALfRMtrlo2+0/fqPWS+cxsmmIEVO20aFn79UYkLei6hF9s0tlhmS
	 gRpV5sZshOqQIM2mqRTI2n22OzQpZNXhLUY2CbmgOmMxRujwgRTbmscVNBIg6viVeRZUC
	 QL+/u5E0p302R+NSQadAqOKSRh7VfsCY7XhZs94aXvRGSfKmZqMWRokK4dgMuDCWfQLFn
	 ip9fo7PjzaM4aK5dalqql0gUG2uwcXsfSTUGm/DUyG5j5C0MzW5HGukWSUITI1I1i0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbO2xRiV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DAE606A326;
	Thu,  5 Nov 2026 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbO2xRiV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836281F00919;
	Thu,  5 Nov 2026 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888509;
	bh=eRO0we/jv1u/NCKEYpjhxs0l4uxNRSe89AWbOp+pBrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZbO2xRiVBvQm9kyUUFV3bOo4038eVIY0BsSXGe/BHF89DX/E54SHsjkCT6kbOsUbw
	 8mC4pY5HHLflZ0+/nLSkEiVw2rJHIiiSaggfXZFbnwQWOotIOtFe46QOX/iamWsiz3
	 XPQhnj5zPHEXTcpWQ6r+qpjwsX4KWpcoqdCEuuqjs1rHMzU/yQVNa2kdUCcXxNSyTv
	 4sbJm0PnlcLjXnbik2yZdJeZF/kt+++KYfLQEGfPiDX3LImcZi1feznP3i2ZLvcWLX
	 jGBG39NKqrDEJFB3rwVGsPASmJvZuZAWar5DAy0IDx+WSY68QTw1nO7UgPvAjtk5sp
	 hyp/mk6dN31FA==
Message-ID: <sashiko-outbox-199233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Dahl" <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, =?utf-8?b?b3Bl?=
 =?utf-8?b?biBsaXN0OlVTQiBTVUJTWVNURU0=?= <linux-usb@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105110715.2486432-3-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 14:21:49 +0000
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
- [Low] dt-bindings: usb: at91sam9rl-udc: SAM9RL clock macro in SAM9G45 exa=
mple
--

commit 42b3b9bce6c46bb748afcf89b465e4d50b66ad5b
Author: Alexander Dahl <ada@thorsis.com>

dt-bindings: clock: at91: Split up per SoC partially

This commit splits core PMC clock index definitions into per-SoC device
tree binding headers for the AT91/Microchip family and updates two device
tree binding examples to use the new SoC-specific macros.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc=
04ee90e05@thorsis.com/T/#u

> diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.y=
aml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> index cdbbd17f80363..15f5bb51fd8a7 100644
> --- a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> +++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> @@ -61,13 +61,14 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
>      #include <dt-bindings/gpio/gpio.h>
>      gadget@fff78000 {
>          compatible =3D "atmel,at91sam9g45-udc";
>          reg =3D <0x00600000 0x80000
>                 0xfff78000 0x400>;
>          interrupts =3D <27 IRQ_TYPE_LEVEL_HIGH 0>;
> -        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PM=
C_UTMI>;
> +        clocks =3D <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT=
91SAM9RL_PMC_UTMI>;

[Severity: Low]
In Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml, the
example node gadget@fff78000 has compatible "atmel,at91sam9g45-udc" with
interrupt 27 and peripheral clock 27, matching the USBA controller in
at91sam9g45.dtsi.

Should this example include dt-bindings/clock/atmel,at91sam9g45-pmc.h and
use AT91SAM9G45_PMC_UPLLCK instead of AT91SAM9RL_PMC_UTMI?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105110715.2486=
432-1-ada@thorsis.com?part=3D2
