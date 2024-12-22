Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE02480B;
	Sun, 22 Dec 2024 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734879085; cv=none; b=dHaYiCIPJ19p9kCWG6jmYelCOmL99ELx/jVGwlINtGnhK2sbdLk4+QSHLsHwlQPzd7vE0hhzdLMDvVe/cHPzy9pgO3o60gDk+1+BHHFkBexJJF59b2G2I8sMQoF5egQ7ZlACH4PwfQA+8DMP94SjaU2UOLu6+pSYJbadFwLweD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734879085; c=relaxed/simple;
	bh=usjZ2ZTH34TQ1C1N/Wpm4Rx7OSioMF26Mal38rPNRY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ8CmpD2ErUKUYINzTJ1A9XjoCLy2TI0V1IVlBu4Zo6DxRtMZma69Qs0VDS9WlVjSuBUAcGsAF1fGwfubuG0jKk5+K9ddMTjVym0ST0IMlQ8+rY5EoCrJCMrfO/OHzPFFovbVF2rKOHPrm8zAvdbFuZBjuxpi+dtwflE98Y2+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2wvSQGf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2wvSQGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6D0C4CECD;
	Sun, 22 Dec 2024 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734879085;
	bh=usjZ2ZTH34TQ1C1N/Wpm4Rx7OSioMF26Mal38rPNRY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2wvSQGfuB/AjjrxeUvDs8Yw4zPVyKUgOou1CNiG1/v+jlnQ3UjtBYc/f9ppxoVcA
	 CWIuXD2VAnJcsO3SSNOgRkGxVNgaK57pSRvjZiArCb15XaOyGcx4Zdg+bp7UJ7iryT
	 jC4TdJcMRLQ2MaVwpbzw3X1xWxW7xN162/4S1tTBVA+wtrbV7fK8DnbTD7eVAQUYFr
	 Hlb3iGPZrNdDkH04XefuM7TvB6cY0W1iT+c5AT6yc09NdG0EuEoarzH1gLNilRGXUQ
	 8k1kUPvdi0j/8nMip6BH6qQ6CZ1QG7GJ2tvzO61C8z2C59St55geuR+PltnzKkuKds
	 CeOt0sS6Ekxzg==
Date: Sun, 22 Dec 2024 14:51:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/38] dt-bindings: clock: add rk3562 cru bindings
Message-ID: <20241222-grandpa-vessel-66e9ca9cde75@spud>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-2-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WwHE6zSlu1Iv1ITo"
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-2-kever.yang@rock-chips.com>


--WwHE6zSlu1Iv1ITo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 06:37:47PM +0800, Kever Yang wrote:
> Document the device tree bindings of the rockchip rk3562 SoC
> clock and reset unit.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
>=20
>  .../bindings/clock/rockchip,rk3562-cru.yaml   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk35=
62-cru.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
> new file mode 100644
> index 000000000000..aa8dedf2bfce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3562-cru.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3562-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip rk3562 Clock and Reset Control Module
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The RK3562 clock controller generates the clock and also implements a =
reset
> +  controller for SoC peripherals. For example it provides SCLK_UART2 and
> +  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UA=
RT
> +  module.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3562-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +      - const: xin32k
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing the "general register files" (GRF),
> +      if missing pll rates are not changeable, due to the missing pll
> +      lock status.

Two questions:
- Why would it ever be missing? Seems like you should make it required.
- Why is it not possible to look the grf up by compatible rather than
  phandle?

Cheers,
Conor.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ff100000 {
> +      compatible =3D "rockchip,rk3562-cru";
> +      reg =3D <0xff100000 0x40000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +    };
> --=20
> 2.25.1
>=20
>=20

--WwHE6zSlu1Iv1ITo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2gnaAAKCRB4tDGHoIJi
0iI5AP9UIw3hr7XnZEKTMekdzNbzE8jdl/gywdcNsXRR8649PAD+J3EGtf7uIB8X
Xkt+VkIy6zUhiBUZdP3KF3OCqcEkgQE=
=PnXt
-----END PGP SIGNATURE-----

--WwHE6zSlu1Iv1ITo--
