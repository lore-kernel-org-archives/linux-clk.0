Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777232;
	b=QQobbgcilc9i1H43guGT6zgYj6iT4YA98ZRsOC4GwjKo9IsfRmWNTCoAXkWAXP6/z8Eq
	 E3jQ9Ome2RX9EL7GkLGNvgwcl/ILGjDvwA1qtiTdCHkbHGIw0e31Ji2+U4nFp3pIktbZk
	 JOKM3Qj2Q2wkTVgp9yuPy12gFILV9f/AUgaYdggOdmH1Dc2rIDPNEY/836Xfg6EtR01/3
	 bkeqfUOboW5/Lv06KKU3rBTkTP4/sq0uPfn5sHDzWpSxbLagoVpPoKkg9IZwWHokr6upt
	 2IRSAbaafiTuI9nHDrvWhCmBLSAloNie9fIcWPDKigwIGBb0BfVe9aGgxDbWFheJxJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777232;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=thD6MT2WRu6GWDymo0KyOlUgqml9+iUvkSckk5ytwUY=;
	b=d9oGrahdGrp4rm+xjWnY0ZtmaAZqa7WJzLjmkyztkmaLgQKF5kBbx92ppDq55NuICnm7
	 9TTpjDN9N4FEllqhUM2z9yMd1PBeofUhAqfty5pY1Aj6Zg+bA/2CFgv05/dG06ZsL4i3y
	 slXzclJUiy1PLl8lDw7J0EAPHahPjcg1DEF2nBr++mN/cAQ4TK12DODZBlpI1JQcE5hRM
	 gSLVvrG8isw4cq0ZjJzpxlSewa1WMcpzIZRuq3VvomN/elA9GEfAU0TjvjuB+eVcaL7qg
	 DVctKlMu+MQ6i3Inzy37e9ivwPXA+OVEABqvm6BnDwIFMm4MVi5FkqPw182hITiHWpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCdmJ0Cs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4A2606A31B;
	Wed,  4 Nov 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kCdmJ0Cs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9068A1F000C1;
	Wed,  4 Nov 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793777231;
	bh=thD6MT2WRu6GWDymo0KyOlUgqml9+iUvkSckk5ytwUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kCdmJ0CsknkmGIE8Z5etVYCt5MjT319PhCt82pnggnioiNWCpKZyUWy2bx/GC6yew
	 PFAxaaYiTc2yqNpsE2bZOix8GqbmdXBAe/53IsvMw9NpIQiKyRVQizuHMBrucLibYP
	 OS+H0Opp7L3yVTy6AhDX1+wDCPlSX+fKg/bCNRv/8U2aSsD1Fw1DsGepvewkTs5J+Z
	 yM9fkDI/h+ItZbOj47N95ABg/CoOxrVuOkbxhkR021G6ufpatzEK5fp/6RXZUugtw1
	 XEZHiAQddO4EcKrBiGAtvunXfM5Jq6d1vnt4nTf27K+BOyWEtV3/Md7bs92a7HCzO3
	 /ZTti5C4dFAJA==
Message-ID: <sashiko-outbox-196792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890
 peripheral clock/reset managers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:27:11 +0000
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
- [Low] dt-bindings: clock: unwieldy per-compatible if-then conditionals in=
 schema
--

commit a648a6a258536238fc540454eb5ccb65637262cb
Author: Joseph Telaak <joseph@telaak.dev>

dt-bindings: clock: Add Siflower SF19A2890 peripheral clock/reset managers

This commit adds a Devicetree binding schema for the Siflower SF19A2890
peripheral clock and reset managers, defining twelve compatible strings
and their corresponding clock inputs and reset lines.

> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-p=
eriph-crm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890=
-periph-crm.yaml
> new file mode 100644
> index 0000000000000..7f0bce603b423
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-c=
rm.yaml
> @@ -0,0 +1,169 @@

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - siflower,sf19a2890-gmac-crm
> +      - siflower,sf19a2890-gpio-crm
> +      - siflower,sf19a2890-i2c-crm
> +      - siflower,sf19a2890-pwm-crm
> +      - siflower,sf19a2890-rf-crm
> +      - siflower,sf19a2890-spi-crm
> +      - siflower,sf19a2890-timer-crm
> +      - siflower,sf19a2890-uart-crm
> +      - siflower,sf19a2890-usb-crm
> +      - siflower,sf19a2890-wdt-crm
> +      - siflower,sf19a2890-wlan24-crm
> +      - siflower,sf19a2890-wlan5-crm

[ ... ]

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: siflower,sf19a2890-gmac-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC bus clock
> +            - description: GMAC register clock
> +            - description: RGMII transmit reference clock
> +            - description: Timestamp unit clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - siflower,sf19a2890-wlan24-crm
> +              - siflower,sf19a2890-wlan5-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AXI slave clock
> +            - description: AXI master clock
> +            - description: Radio platform clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: siflower,sf19a2890-rf-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Test clock
> +            - description: AXI slave clock
> +            - description: Boot clock
> +            - description: Low-power clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: siflower,sf19a2890-usb-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: USB controller clock
> +            - description: AXI master clock
> +            - description: USB PHY reference clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: siflower,sf19a2890-spi-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: APB clock
> +            - description: SSP clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: siflower,sf19a2890-uart-crm
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: UART0 APB clock
> +            - description: UART1 APB clock
> +            - description: UART2 APB clock
> +            - description: UART0 clock
> +            - description: UART1 clock
> +            - description: UART2 clock
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - siflower,sf19a2890-gpio-crm
> +              - siflower,sf19a2890-i2c-crm
> +              - siflower,sf19a2890-pwm-crm
> +              - siflower,sf19a2890-timer-crm
> +              - siflower,sf19a2890-wdt-crm
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1

[Severity: Low]
This isn't a bug, but properties.compatible in
Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm.yaml
combines twelve peripheral CRM variants that have different clock counts
(from 1 to 6 clocks), clock roles, and reset assignments, requiring seven
separate per-compatible if-then conditionals under allOf to constrain the
clocks property.

Would it be cleaner to split this binding into separate schema documents
rather than piling these per-compatible if-then conditionals into a single
schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-sf19a2890-=
sysm-v1-0-a4fac07df823@telaak.dev?part=3D3
