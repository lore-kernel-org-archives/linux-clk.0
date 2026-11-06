Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923961;
	b=w1c/eJ2RLNpp7iCJt97IVnnslssRJNTV2O4TPcltzP240+mTn/HzT0ber9mdKPWXlZso
	 QKFmTHsyN54peWppIPwvgwGt78TkTqUrbl1bMI7mhmxcxoCidfywV1Ekf0wsYlX+gYnUt
	 DlhENhUzB1MaaJ12YGUrzS/xx/B7tHDEve/Jlgx0mvO2SsEBz90QW3dbcy3IpOm6Lktlb
	 D6THyMCYHA/FCwjiEe+2n4D7MdsF206NusAzS2d7b9QdFClzK1KzAOFSV04MVhJrAp3/G
	 DAskOR3VmARJ+/u4UlqqT3tm495zg44hOwX0C+uSiQrsN4eXbiZ08lPUuAwV8Fvnshg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923961;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=K8FW1sHLLcTxrMcYSrv5jgqVe62bREH2o+W9bi+twIY=;
	b=ijiOaG9irNL1NpJtBBZtpKq3du9Bui1x2GQSvLcp/azpzXl/Gwm79ORJrin+tMHYzpVj
	 AhJ++5f8nz8p+gj74jGDdueRFf4ALbhuRLMfqOhetUv3/5XOR8moqPXxe4P79nQljjQbz
	 ItoopwWkE4dPU4QyaUY88xS+y3I3JlDR7RmmT9WzDARv5HQQaKNS1kGeJwzWlVmMxt49T
	 s6Ex75CfTLJzlUI0DcEO2+EOz3hS3DcvHvMO1Oq2PFsryKy7/uJHxl227PMoNj+f+F9w6
	 VeQ/r0NFKgHwwYaUBgbUDNS03DhWhNmZ5MjOk8aRuFE19bpme+s2ofddd/g6rMt4aqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FG0esetq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8886E606A31B;
	Fri,  6 Nov 2026 00:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FG0esetq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1A71F0089F;
	Fri,  6 Nov 2026 00:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793923961;
	bh=K8FW1sHLLcTxrMcYSrv5jgqVe62bREH2o+W9bi+twIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FG0esetqVsFoW/ZiGTtXwfUAKNaKaajlnvkDcRtHnqSG23mHkGGwgfyetqpS+pfSq
	 0llkeSE/Tl/vp4kUvIBNydIyOcTmtKuVQHbGXMNyBWSLFydBwsF2KVo8pf6Qbo+z1k
	 NFrJ9lWLyPAHjFpG+1fkp8RSQG2rDYw3w+kO9rFDx8BQjcnSGI5Tp/7Bm/2rxsppFt
	 wiQ/vNxVWm2o9YoKy6ITEntyHzwtXa6e5Zm86UAXu4kQhSlw06Vq0Y/lGfNpqPPe0U
	 jSFFsHfxr+qfoDLYe61kWIsJiR5uMMwqXMbn07mxV+1J48ttoCQIJeoQ2ylQLQ7gyp
	 s82KiFs4P6/PQ==
Date: Fri, 6 Nov 2026 00:12:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
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
Message-ID: <20261105-upload-golf-40927e20b7b9@spud>
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
	protocol="application/pgp-signature"; boundary="ReZYJndpgnBOOthu"
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-sysm-v1-3-a4fac07df823@telaak.dev>

--ReZYJndpgnBOOthu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 02:21:00AM -0500, Joseph Telaak wrote:
> Each peripheral block of the Siflower SF19A2890 has a clock and reset
> manager of its own, with a reset register, a clock gate register and a
> bus output enable. The blocks differ in which gate and reset bits they
> use, so each has its own compatible, and clock N of a manager is its
> input clock N, gated.
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

I think you should put these in a binding header file, rather than just
put them in a description like this.
I think you really need one for the clocks too, since you've got things
like
		uart0: serial@18300000 {

			clocks =3D <&uart_crm 3>, <&uart_crm 0>;
			clock-names =3D "uartclk", "apb_pclk";

		};

		uart1: serial@18301000 {

			clocks =3D <&uart_crm 4>, <&uart_crm 1>;
			clock-names =3D "uartclk", "apb_pclk";

		};
and it's not some simple case of 0 is always apb and 1 is always some
ancillary clock, the meanings depend entirely on what which crm node
we're looking at.

The rest of this seems fine though.
pw-bot: changes-requested

Thanks,
Conor.

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

--ReZYJndpgnBOOthu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau0bdAAKCRB4tDGHoIJi
0nyAAQD5lkfpyKIZ60YGWB2uq7U1N+Z8j6vIZJTkiQW8WE/zYAEArHRUgoy1k8Gg
cj6z9kRgN5kVfs+ldvQf/hmrVBoSqAw=
=/XAm
-----END PGP SIGNATURE-----

--ReZYJndpgnBOOthu--
