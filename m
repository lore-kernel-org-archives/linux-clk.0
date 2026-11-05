Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836998;
	b=DVdinEtXZfKdAl1P4YARSMyukus+CTU/koR6hjZe8IYEFn0eys0N04+vS9NEbf/EXyCE
	 VW40PbWkbR0CtSbzmWW3S43LtqsqrT8s0YMpiAC+IkkBTfvIdCskvgziXsy3gG1hcoIxB
	 sCEnGKF3SDmGl4HHqOWTYPD0hRKDu7Olrk6qnLMOKrcKjR61/+lAFh4tMSWcLTE0mYkbk
	 xAwbfYFkaLYLN+6k7up0QwWOoOIih7OjMH3qFtVZJ8eVuEEVMTyQVGgrbOWb1OBUuYlLz
	 VoxcIp4+/n1d6SEzbVmhiJRHcgiq5DO9pl3XWvRRQoSV9jvWXiO5B1ori69bwO1lZBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836998;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Mj0OYqNWyM7ZRvEnqupH/g1QTFeLzpiA4WER+LFUBZI=;
	b=fDh5/v4incS3xZX1ZE1JnAieRJjCY48Fdfws7FxoWPO7shJ/v1UO9uUt2kl33ik8yE7J
	 ANc0H1YqUQIwtmPtAXHy0AuJKlo0rGx21AfYlV3u+4/THiJmv5OWmjgyCNBuwYziELMYi
	 VCOc7FvX8Jli51twUI2Ajp28ji86hmpNgeJ+cfa9odCckIabxNCF906IgzVrcJu4JTqJZ
	 vT0+8to1Q+35XAAcEpCuXy7FdE/YwXnjhETnoV8blmcp57buT2FeoGGEiYV/olJrlxbHa
	 Kuuxhdt6Nn++WfZ87bzlR9IuT2YHwdEI0oUcy6AUXnsMvfq35CQhML52FDUIDXOBkaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mO42Ab1/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31158606A332;
	Thu,  5 Nov 2026 00:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mO42Ab1/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091C81F000C1;
	Thu,  5 Nov 2026 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793836997;
	bh=Mj0OYqNWyM7ZRvEnqupH/g1QTFeLzpiA4WER+LFUBZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mO42Ab1/pdoAuYIMDGYMDLxa6lkLKh2MsW2SZh84mibd5Hc+gSzneHs7iORpdHaHb
	 Vkojc4ygzX/H9t6rJELt8ktMMtcBjdgc9UtW37nS6sfvOn7BrYUCjHbHxN/YUGZMLN
	 peVPvwUrIInq4FEcBy3iTP3X5fbn2dQrfHRsZjGHt7EPlH/PuuRdL1iKU90WWknYQX
	 ecDO2RY0gj+jiAU1Dp8NGwcER0eRVpbuc43nWJnO//VelgiJWMPprk+uWRPBh0OYsW
	 xmQvi7be0a3rf3OAXSCFKRGGgRD4YtvPr30HpRfSxZ7I3lYpvRAZE3t0TZVn0sXpW6
	 gaSMwqLeHrZoA==
Date: Thu, 5 Nov 2026 00:03:13 +0000
From: Conor Dooley <conor@kernel.org>
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>,
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: Add Siflower SF19A2890
 peripheral clock/reset managers
Message-ID: <20261104-remote-festive-1e6d807ef014@spud>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>
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
	protocol="application/pgp-signature"; boundary="pzTvqsj+MD13nmtr"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>

--pzTvqsj+MD13nmtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:00AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Joseph Telaak <joseph@telaak.dev>
>=20
> Each peripheral block of the Siflower SF19A2890 has a clock and reset
> manager of its own, with a reset register, a clock gate register and a
> bus output enable. The blocks differ in which gate and reset bits they
> use, so each has its own compatible, and clock N of a manager is its
> input clock N, gated.

This binding looks like things that we often see that are actually
incorrect models of the devices in question - things that should be a
syscon but not implemented as one. I'd like to see what the actual dts
for this device looks like before signing off (or really even reviewing
this at all). Given how the clocks look, it is probably accurate but I
wanna be sure.

Cheers,
Conor.

>=20
> Based on Chuanhong Guo's binding, which described every block with one
> compatible and its bit layout in properties.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../clock/siflower,sf19a2890-periph-crm.yaml       | 169 +++++++++++++++=
++++++
>  1 file changed, 169 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-p=
eriph-crm.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890=
-periph-crm.yaml
> new file mode 100644
> index 000000000..7f0bce603
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-periph-c=
rm.yaml
> @@ -0,0 +1,169 @@
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
> +  Clock N of the manager is input clock N, gated. The reset lines are:
> +
> +    gmac-crm:  0 GMAC
> +    usb-crm:   0 USB controller, 1 USB PHY power-on, 2 USB PHY
> +    uart-crm:  0 UART0, 1 UART1, 2 UART2
> +    the others: 0 the block
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
>=20
> --=20
> Git-155)
>=20
>=20

--pzTvqsj+MD13nmtr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauvHwAAKCRB4tDGHoIJi
0tJsAP9hmAhQezOCEyCbsJRnvqw8Kn+Oogzh96Jrp+YtB8TFgwEA+IFe+z56AyHi
f8NRcrJ/uPdeTb5jqVqP94TaDbEUzwU=
=J/Ed
-----END PGP SIGNATURE-----

--pzTvqsj+MD13nmtr--
