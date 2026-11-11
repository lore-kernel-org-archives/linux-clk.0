Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421815;
	b=mXbzPRJOgcEBnQkbWSKYpw6SUTgf4Ym8jw+WCWrE4XxRI92aP+vD5saqOfrembf0szHr
	 XeRnDIEsB3zzcaYkyWJL4jkpjX+yyV+1YL5VyZUszlXRp4anKe/9wRTSd+CJPuPgrpsfh
	 w/yMAP/GB18xLYsSmSGHSHgO4mEPzCQYY8JDk4snHObWbXkH2xcjsFeF8p8eeeGhE6An+
	 wlXqj1I1DomeuiW/dmivVcLt8DfkWm8xT48q8gBxA/I4sW312esBoi+RMsQ4Q7m7DGFgN
	 P2zj/JPFqTZtdJfsx73vUerce+icN4TVGl7iXjzfvBv6O8fUyMCaexJSkZr+iYx7kxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421815;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EuOa60Ku4o0cUd0PWdN0468HJGiEY7AKoqQ4rnmYJQ8=;
	b=ui48spxjTSsZUYSh0od1pab1CS7xQ6+3BLMZ8RrHpJ0G0zSDUA6pIzUiigb+zm1Nbn4H
	 lASuajUP1S7LFaj+SUGFofBlI02aTWH4XNEINfUklNcDVaYvgrmr4QP2oPTMYXLQMK7/+
	 qx2jCejOksepdQopQff4tAnwpsE+DoXzHo8PqcNo6XZFy/YLRfnIyum9CKpwFwYFVJxvp
	 TYWc1lfEtQZULMLknXwlavZxR9OgDEuDu/vQPDNIlyLsFLrnJhAW0SF9QbWKNM9m5Tzlp
	 V07MBXRvC8+gUEjnzUDOaoJf/T2z9eNKJWCUalz31B1G9PotvXOO9RpwZtBPkYzeeWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPx9s7Ow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B83606A32D;
	Wed, 11 Nov 2026 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SPx9s7Ow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856D21F00A05;
	Wed, 11 Nov 2026 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794421815;
	bh=EuOa60Ku4o0cUd0PWdN0468HJGiEY7AKoqQ4rnmYJQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SPx9s7OwRiIFM+qJTSyTwrhGtWShlmwnbqfXQGGpqpBUKbUD8Q+wBxTeCw7HTdClO
	 RqtBDI2kKoIpVd9mRuufBN/Rz3Bt3SBZsUWw/kpXRhvVcwAUvc0AS/Z0sR9rMJi7CC
	 6ECr5Ib07OcRIY1NIKK1FG+GTAsYyZaiRXA3luJLIYVbJK9pbiSaeuwlEZb3knVyFZ
	 SqZBA1P4KucdSPTSQimEcOVX/0/UFUraigd6bbdkcetF359pY5E6LRxf/WGEehwENm
	 rKJ4esyOrV1iFIxvVP1it2MgFUPPnQLSRou3Sy2aOabNUANZTcscl15UZQB49PlQok
	 vNVFNnxxQ3Y1A==
Date: Wed, 11 Nov 2026 18:30:10 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: Add Siflower SF19A2890
 peripheral clock/reset managers
Message-ID: <20261111-roving-untrimmed-5148dcf08b9d@spud>
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-3-d2fcb723e4f1@telaak.dev>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FWXTyTnJg+Xe1HHP"
Content-Disposition: inline
In-Reply-To: <20261111-sf19a2890-sysm-v2-3-d2fcb723e4f1@telaak.dev>

--FWXTyTnJg+Xe1HHP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 03:19:02AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> Each peripheral block of the Siflower SF19A2890 has a clock and reset
> manager of its own, with a reset register, a clock gate register and a
> bus output enable. The blocks differ in which gate and reset bits they
> use, so each has its own compatible, and clock N of a manager is its
> input clock N, gated. The header names the clocks and resets of each
> manager, since their meaning depends on the manager.
>=20
> Based on Chuanhong Guo's binding, which described every block with one
> compatible and its bit layout in properties.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

This looks a bit messy with all the different clocks, but I don't think
there's any value in breaking it out to 17 individual files nor is there
anything common really to try to combine conditions etc.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../clock/siflower,sf19a2890-periph-crm.yaml       | 166 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   2 +
>  .../clock/siflower,sf19a2890-periph-crm.h          |  87 +++++++++++
>  3 files changed, 255 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-p=
eriph-crm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890=
-periph-crm.yaml
> new file mode 100644
> index 000000000000..f464cfffb2a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-c=
rm.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/siflower,sf19a2890-periph-crm.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 peripheral clock and reset manager
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +description: |
> +  Each peripheral, or group of peripherals, of the Siflower SF19A2890 has
> +  a clock and reset manager of its own: a reset register, a clock gate
> +  register, and a bus output enable that the peripherals need as well as
> +  their clocks to answer bus requests.
> +
> +  Clock N of the manager is input clock N, gated. The clocks and resets =
of
> +  each manager are defined in
> +  include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h.
> +
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
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 6
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/siflower,sf19a2890-clk.h>
> +
> +    clock-controller@19e24c00 {
> +        compatible =3D "siflower,sf19a2890-uart-crm";
> +        reg =3D <0x19e24c00 0x10>;
> +        clocks =3D <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_PBUS>,
> +                 <&clk CLK_MUXDIV_PBUS>, <&clk CLK_MUXDIV_UART>,
> +                 <&clk CLK_MUXDIV_UART>, <&clk CLK_MUXDIV_UART>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de087d1c255d..47a3a72a5d08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25703,8 +25703,10 @@ M:	Joseph Telaak <joseph@telaak.dev>
>  L:	linux-clk@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> +F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-crm=
=2Eyaml
>  F:	drivers/clk/siflower/clk-sf19a2890.c
>  F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
> +F:	include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
> =20
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hansg@kernel.org>
> diff --git a/include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h b/=
include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
> new file mode 100644
> index 000000000000..1cf54761fe72
> --- /dev/null
> +++ b/include/dt-bindings/clock/siflower,sf19a2890-periph-crm.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H
> +#define __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H
> +
> +/* siflower,sf19a2890-gmac-crm */
> +#define CLK_GMAC_BUS		0
> +#define CLK_GMAC_REG		1
> +#define CLK_GMAC_TX_REF		2
> +#define CLK_GMAC_TSU		3
> +
> +#define RST_GMAC		0
> +
> +/* siflower,sf19a2890-gpio-crm */
> +#define CLK_GPIO		0
> +
> +#define RST_GPIO		0
> +
> +/* siflower,sf19a2890-i2c-crm */
> +#define CLK_I2C			0
> +
> +#define RST_I2C			0
> +
> +/* siflower,sf19a2890-pwm-crm */
> +#define CLK_PWM			0
> +
> +#define RST_PWM			0
> +
> +/* siflower,sf19a2890-rf-crm */
> +#define CLK_RF_TEST		0
> +#define CLK_RF_AXIS		1
> +#define CLK_RF_BOOT		2
> +#define CLK_RF_LP		3
> +
> +#define RST_RF			0
> +
> +/* siflower,sf19a2890-spi-crm */
> +#define CLK_SPI_APB		0
> +#define CLK_SPI_SSP		1
> +
> +#define RST_SPI			0
> +
> +/* siflower,sf19a2890-timer-crm */
> +#define CLK_TIMER		0
> +
> +#define RST_TIMER		0
> +
> +/* siflower,sf19a2890-uart-crm */
> +#define CLK_UART0_APB		0
> +#define CLK_UART1_APB		1
> +#define CLK_UART2_APB		2
> +#define CLK_UART0		3
> +#define CLK_UART1		4
> +#define CLK_UART2		5
> +
> +#define RST_UART0		0
> +#define RST_UART1		1
> +#define RST_UART2		2
> +
> +/* siflower,sf19a2890-usb-crm */
> +#define CLK_USB			0
> +#define CLK_USB_AXIM		1
> +#define CLK_USB_PHY_REF		2
> +
> +#define RST_USB			0
> +#define RST_USB_PHY_POR		1
> +#define RST_USB_PHY		2
> +
> +/* siflower,sf19a2890-wdt-crm */
> +#define CLK_WDT			0
> +
> +#define RST_WDT			0
> +
> +/* siflower,sf19a2890-wlan24-crm */
> +#define CLK_WLAN24_AXIS		0
> +#define CLK_WLAN24_AXIM		1
> +#define CLK_WLAN24_PLF		2
> +
> +#define RST_WLAN24		0
> +
> +/* siflower,sf19a2890-wlan5-crm */
> +#define CLK_WLAN5_AXIS		0
> +#define CLK_WLAN5_AXIM		1
> +#define CLK_WLAN5_PLF		2
> +
> +#define RST_WLAN5		0
> +
> +#endif /* __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_PERIPH_CRM_H */
>=20
> --=20
> Git-155)
>=20
>=20

--FWXTyTnJg+Xe1HHP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavS0MgAKCRB4tDGHoIJi
0iMjAQD6GsZJXeGSpIxaL15f7l00mbgyl5Irzb8iW+6YCoPj8QEA/8tUgwNMJoi1
/rbE+PDjq1qeiHvcr/ibveKYvszCkgU=
=N8sr
-----END PGP SIGNATURE-----

--FWXTyTnJg+Xe1HHP--
