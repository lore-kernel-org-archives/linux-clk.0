Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180074;
	b=mlE6KrUX/nbvoj8+elCQbPjHP3ifsCI9iAru5CTHm5kXTbU5Um1BwCpUi9JW2fj5jvse
	 B/Uis48o+nJqY9KUAtF59uaBAaJKh8hWf9j6kauwYys670EQR96pfRev98ADjvS7oHY7v
	 WBenwQKqh44maMkYlrf5LBt3d8HqPndlivj785Y0mmI9Ups/b+GZ0BGWndYeLBZqz1mZB
	 Y27id5hnUuBGVGzJfSlaA0b0MdkUWY7yUtquDoPaj3TCARQBUh2r5yOlMYVP1OTu/l5Ei
	 GkQsh/LD9DU0haZNuUtkVXzTR7W0U7y3N5DUpjAiB934qqma4J1CvQ+KUYH1gyvIlyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180074;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PcBmZo2LxPiZ1DooWOhkTG+L22kCLVLPysQqIhdI0es=;
	b=W1Issdu4hHxFdMCuFmZkssB1StQXFwdWgd9asFsK2qN/wZRZaPCn7eW3GskyLL2T+vUf
	 n/mZVsJ6VE5dY1I8Fwpf589ePXFTesrfASmmJWAAyXmH27HQLbgpCk/pLQTRFBPCvhZ4H
	 +Fz9gh4BAt5bYQla8SacY82KVbJfciT7vaTtiNOb9peba3JGGJMmP8HCwjIQnSWoG7DcB
	 DZxPA2jH/gvLcsYHmIn+gqGZIfIKcJsqbsc8dyNOVlXG28aed/h0X9iJE4EbLXdEbE2OM
	 Vu3QUde1j/dHq3oImW6oZmdg098NuM8WZJHSNmxQw6BS9oAZuj8pTEKONCLSz+EoNOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8hmYRrU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF16606A31C;
	Sun,  8 Nov 2026 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8hmYRrU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E541F0089F;
	Sun,  8 Nov 2026 23:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180074;
	bh=PcBmZo2LxPiZ1DooWOhkTG+L22kCLVLPysQqIhdI0es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b8hmYRrUruhBbHPv68CfkNWMuyiwryxXsIA8qPlCtdx+38OUpfDk0/Q/MARxhe7yg
	 bkGgWgOn6KBfX4a2Jg0pXBU2nRxP8Y0koeyjqoqyJAnL9Hf8Vkg6v5PxqFHHfYUOmR
	 ybdZR0RmkbbpCXXiNuRLELHigVzqUVG5CqElbE+jvfAXslzC7V44LJD4yuHhb5BMJU
	 Qmi7NwBw6HoBvGgXquS+djEiSYIpNLaQvasRMpHp7VyeYikZTAEWgrQTvxHXagTBxj
	 aXlEGX2dDQ/PVmFMySY59PqURczf2hUF5H4jtaIEuaxK3YEZc6a6dDO7TflfkxzBh9
	 AUnmdXai8JIdw==
Date: Sun, 8 Nov 2026 23:21:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <20261108-computer-backed-d98862794d18@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="hKoZ7BNqYWgXY8wN"
Content-Disposition: inline
In-Reply-To: <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>

--hKoZ7BNqYWgXY8wN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 09:30:24AM +0100, Carlo Caione wrote:
> The S7 firmware exposes clocks through SCMI, including sources needed
> by the other clock controllers.
>=20
> Define their identifiers so devicetree can reference these
> firmware-provided clocks.

Are SCMI clock IDs actually suitable for being bindings? Can't the IDs
vary here between versions of the firmware?
They're also not a "made up" set of indexes, like traditional clocks
are, they're real numbers that come from some document akin to
interrupts that we do not have bindings for and no driver is likely to
reference these definitions either right?

Is something like this not more suitable for being included as a header
in the amlogic dts directory?

>=20
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  include/dt-bindings/clock/amlogic,s7-scmi-clkc.h | 27 ++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h b/include/d=
t-bindings/clock/amlogic,s7-scmi-clkc.h
> new file mode 100644
> index 000000000000..10d7caa5d1e2
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s7-scmi-clkc.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 BayLibre, SAS.
> + */
> +
> +#ifndef __AMLOGIC_S7_SCMI_CLKC_H
> +#define __AMLOGIC_S7_SCMI_CLKC_H
> +
> +#define CLKID_DDR_PHY_OSC			0
> +#define CLKID_USB1_PLL_OSC			1
> +#define CLKID_TOP_PLL_OSC			2
> +#define CLKID_HDMI_PLL_OSC			3
> +#define CLKID_USB0_PHY_PLL_OSC			4
> +#define CLKID_USB1_PHY_PLL_OSC			5
> +#define CLKID_USB0_PLL_OSC			6
> +#define CLKID_ETH_PLL_OSC			7
> +#define CLKID_ADC_PLL_OSC			8
> +#define CLKID_CPU_CLK				9
> +#define CLKID_DSU_CLK				10
> +#define CLKID_GP1_PLL				11
> +#define CLKID_ACLKM				12
> +#define CLKID_PWM_G				13
> +#define CLKID_PWM_H				14
> +#define CLKID_PWM_I				15
> +#define CLKID_PWM_J				16
> +
> +#endif /* __AMLOGIC_S7_SCMI_CLKC_H */
>=20
> --=20
> 2.56.0
>=20

--hKoZ7BNqYWgXY8wN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavED5AAKCRB4tDGHoIJi
0hDPAP9YclqOSMdTbrycJ3d5X3ODkP1cdB9jLCe8Tunz3gRHwwD+Mrj45Sqm1RAo
fyN12kabh2Nu3j+H2vcVuvNGcpj/TAA=
=Zf8q
-----END PGP SIGNATURE-----

--hKoZ7BNqYWgXY8wN--
