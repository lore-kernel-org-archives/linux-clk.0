Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742163290C7;
	Mon, 10 Aug 2026 16:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378884; cv=none; b=fNzADuB/9zjNjo0V7fUaHpexahZ0okQ8Fn3AUobX9z1px2uA6e4V8JyTIUnevlQMkj+XOb6Kq8jBmqW8ZvbBS1noghIa7vqkmv9ZmSd+1dBeQky4uURtVfuL8ndgLjUkZlyBl9g/AClGEPAJGECit1NuD3pyjgYIZxhvzr28q98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378884; c=relaxed/simple;
	bh=HqCN5+u7OY3HM9Jn0UtP1HeGLBKrw0/MgLAjG/gYU54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6hWhz9hNiNjxcYV1l7tNO7VFnktYG8QB16TXrQJt+06uYXBQAefpoJ/wKtn7OsJgB9mmvZxiMzKKkXEoTmLSLbCxFjXumRa1uM5+TRWgexa9+SpFiBWGjen+rimPedRZ9I5XrTpv1O8ejipF5AGg7Rk56Oln+mTzqPAZGBEKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msiK0/eO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msiK0/eO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927BC1F000E9;
	Mon, 10 Aug 2026 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378882;
	bh=79wU8Yu+NU/DAJsW8oNPy2dh73JmWMKiOiNsiNjnXuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=msiK0/eO7wCa2Tk2DxziiJ0C3L2OOdlgv+bcr5VxXwDMkczKlG8H8SkRlHH6BSuM7
	 2PcWoP/n3jPiYRWJEbWoY8Wjin6u6nUBIBlCo7Uk9/D3m7ewxJ22a1c2QOihIbyOF7
	 yjEq0Epx58Q8OP5hNXhAlSOcIWL4/OjPERr+JL+XAlCBYNPTkdeFKQCLSoPOWx11fj
	 HW8nHtS/lkJqEb79LQEFG5L7eLPhOh/SJNWWKz6eUXR0leOTvNSkpYyzSqi/Ar3USz
	 j0UCmYjt5pygnqOFt4Q5mrUri/i+RYh5n3q0IWFP8D4osZ0yApeKBtCaycxDkwKmIK
	 Uig9r1yrn5XuA==
Date: Mon, 10 Aug 2026 17:21:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 8/8] riscv: dts: starfive: jhb100: Add syscon nodes
Message-ID: <20260810-cattle-cloud-87676dc2b9d7@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-9-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4x6DHvYA0rn/lkY"
Content-Disposition: inline
In-Reply-To: <20260809015054.210577-9-changhuang.liang@starfivetech.com>

--y4x6DHvYA0rn/lkY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:54PM -0700, Changhuang Liang wrote:
> Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
> pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
> pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
> gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h_syscon | h2b_syscon |
> vout_syscon | pcierp_ecsr_syscon | pcierp_syscon | usb_syscon |
> npu_syscon | per0_syscon | per1_syscon | per2_syscon | per3_syscon |
> sys0_syscon | sys1_syscon | sys2_syscon | strap_syscon |
> sfc0_filter_syscon | sfc1_filter_syscon | sfc2_filter_syscon.
>=20
> Also update the references of pll nodes.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

This looks okay to me. I'll expect to see it later squashed with the
initial support, as we discussed previously.

Cheers,
Conor.

> ---
>  arch/riscv/boot/dts/starfive/jhb100.dtsi | 193 +++++++++++++++++++----
>  1 file changed, 159 insertions(+), 34 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> index 6b2863fd3fd3..e76cf0f3c380 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -282,36 +282,6 @@ pll1: clock-pll1 {
>  		clock-frequency =3D <1000000000>;
>  	};
>=20
> -	pll2: clock-pll2 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <903168000>;
> -	};
> -
> -	pll4: clock-pll4 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <100700000>;
> -	};
> -
> -	pll5: clock-pll5 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <100700000>;
> -	};
> -
> -	pll6: clock-pll6 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <2400000000>;
> -	};
> -
> -	pll7: clock-pll7 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <1950000000>;
> -	};
> -
>  	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx {
>  		compatible =3D "fixed-clock";
>  		#clock-cells =3D <0>;
> @@ -393,6 +363,97 @@ bus_nioc: bus {
>  				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
>  			ranges;
>=20
> +			pcieep0_ecsr_syscon: syscon@10511000 {
> +				compatible =3D "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x10511000 0x0 0x1000>;
> +			};
> +
> +			host0_syscon: syscon@10519000 {
> +				compatible =3D "starfive,jhb100-host-syscon", "syscon";
> +				reg =3D <0x0 0x10519000 0x0 0x1000>;
> +			};
> +
> +			husb0_syscon: syscon@10695000 {
> +				compatible =3D "starfive,jhb100-husb-syscon", "syscon";
> +				reg =3D <0x0 0x10695000 0x0 0x800>;
> +			};
> +
> +			husbd0_syscon: syscon@10695800 {
> +				compatible =3D "starfive,jhb100-husbd-syscon", "syscon";
> +				reg =3D <0x0 0x10695800 0x0 0x800>;
> +			};
> +
> +			gpu0_syscon: syscon@10745000 {
> +				compatible =3D "starfive,jhb100-gpu-syscon", "syscon";
> +				reg =3D <0x0 0x10745000 0x0 0x1000>;
> +			};
> +
> +			pcieep1_ecsr_syscon: syscon@10d11000 {
> +				compatible =3D "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x10d11000 0x0 0x1000>;
> +			};
> +
> +			host1_syscon: syscon@10d19000 {
> +				compatible =3D "starfive,jhb100-host-syscon", "syscon";
> +				reg =3D <0x0 0x10d19000 0x0 0x1000>;
> +			};
> +
> +			husb1_syscon: syscon@10e95000 {
> +				compatible =3D "starfive,jhb100-husb-syscon", "syscon";
> +				reg =3D <0x0 0x10e95000 0x0 0x800>;
> +			};
> +
> +			husbd1_syscon: syscon@10e95800 {
> +				compatible =3D "starfive,jhb100-husbd-syscon", "syscon";
> +				reg =3D <0x0 0x10e95800 0x0 0x800>;
> +			};
> +
> +			gpu1_syscon: syscon@10f45000 {
> +				compatible =3D "starfive,jhb100-gpu-syscon", "syscon";
> +				reg =3D <0x0 0x10f45000 0x0 0x1000>;
> +			};
> +
> +			husbcmn_syscon: syscon@11045000 {
> +				compatible =3D "starfive,jhb100-husbcmn-syscon", "syscon";
> +				reg =3D <0x0 0x11045000 0x0 0x1000>;
> +			};
> +
> +			b2h_syscon: syscon@11135000 {
> +				compatible =3D "starfive,jhb100-b2h-syscon", "syscon";
> +				reg =3D <0x0 0x11135000 0x0 0x400>;
> +			};
> +
> +			h2b_syscon: syscon@11135400 {
> +				compatible =3D "starfive,jhb100-h2b-syscon", "syscon";
> +				reg =3D <0x0 0x11135400 0x0 0x200>;
> +			};
> +
> +			vout_syscon: syscon@11135800 {
> +				compatible =3D "starfive,jhb100-vout-syscon", "syscon";
> +				reg =3D <0x0 0x11135800 0x0 0x400>;
> +			};
> +
> +			pcierp_ecsr_syscon: syscon@11711000 {
> +				compatible =3D "starfive,jhb100-pcierp-ecsr-syscon", "syscon";
> +				reg =3D <0x0 0x11711000 0x0 0x1000>;
> +			};
> +
> +			pcierp_syscon: syscon@11719000 {
> +				compatible =3D "starfive,jhb100-pcierp-syscon", "syscon";
> +				reg =3D <0x0 0x11719000 0x0 0x1000>;
> +				#reset-cells =3D <1>;
> +			};
> +
> +			usb_syscon: syscon@11820000 {
> +				compatible =3D "starfive,jhb100-usb-syscon", "syscon";
> +				reg =3D <0x0 0x11820000 0x0 0x10000>;
> +			};
> +
> +			npu_syscon: syscon@118e5000 {
> +				compatible =3D "starfive,jhb100-npu-syscon", "syscon";
> +				reg =3D <0x0 0x118e5000 0x0 0x100>;
> +			};
> +
>  			uart6: serial@11982000 {
>  				compatible =3D "starfive,jhb100-uart", "snps,dw-apb-uart";
>  				reg =3D <0x0 0x11982000 0x0 0x400>;
> @@ -410,7 +471,8 @@ uart6: serial@11982000 {
>  			per0crg: clock-controller@11a08000 {
>  				compatible =3D "starfive,jhb100-per0crg";
>  				reg =3D <0x0 0x11a08000 0x0 0x1000>;
> -				clocks =3D <&osc>, <&pll6>,
> +				clocks =3D <&osc>,
> +					 <&per0_syscon JHB100_PER0PLL_PLL6_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_400>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_800>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER0_NCNOC_INIT>,
> @@ -422,10 +484,17 @@ per0crg: clock-controller@11a08000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per0_syscon: syscon@11a09000 {
> +				compatible =3D "starfive,jhb100-per0-syscon", "syscon";
> +				reg =3D <0x0 0x11a09000 0x0 0x1000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
>  			per1crg: clock-controller@11b40000 {
>  				compatible =3D "starfive,jhb100-per1crg";
>  				reg =3D <0x0 0x11b40000 0x0 0x1000>;
> -				clocks =3D <&pll7>,
> +				clocks =3D <&per1_syscon JHB100_PER1PLL_PLL7_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER1_NCNOC_INIT>,
>  					 <&sys0crg JHB100_SYS0CLK_BMCPER1_CFG_800>,
>  					 <&sys2crg JHB100_SYS2CLK_BMCPER1_NCNOC_TARG>,
> @@ -437,6 +506,13 @@ per1crg: clock-controller@11b40000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per1_syscon: syscon@11b41000 {
> +				compatible =3D "starfive,jhb100-per1-syscon", "syscon";
> +				reg =3D <0x0 0x11b41000 0x0 0x1000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
>  			per2crg: clock-controller@11bc0000 {
>  				compatible =3D "starfive,jhb100-per2crg";
>  				reg =3D <0x0 0x11bc0000 0x0 0x1000>;
> @@ -458,6 +534,11 @@ per2crg: clock-controller@11bc0000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per2_syscon: syscon@11bc1000 {
> +				compatible =3D "starfive,jhb100-per2-syscon", "syscon";
> +				reg =3D <0x0 0x11bc1000 0x0 0x1000>;
> +			};
> +
>  			per3crg: clock-controller@11c40000 {
>  				compatible =3D "starfive,jhb100-per3crg";
>  				reg =3D <0x0 0x11c40000 0x0 0x1000>;
> @@ -477,11 +558,16 @@ per3crg: clock-controller@11c40000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			per3_syscon: syscon@11c41000 {
> +				compatible =3D "starfive,jhb100-per3-syscon", "syscon";
> +				reg =3D <0x0 0x11c41000 0x0 0x1000>;
> +			};
> +
>  			sys0crg: clock-controller@13000000 {
>  				compatible =3D "starfive,jhb100-sys0crg";
>  				reg =3D <0x0 0x13000000 0x0 0x4000>;
>  				clocks =3D <&osc>, <&pll0>, <&pll1>,
> -					 <&pll2>;
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>;
>  				clock-names =3D "osc", "pll0", "pll1", "pll2";
>  				#clock-cells =3D <1>;
>  				#reset-cells =3D <1>;
> @@ -491,7 +577,9 @@ sys1crg: clock-controller@13004000 {
>  				compatible =3D "starfive,jhb100-sys1crg";
>  				reg =3D <0x0 0x13004000 0x0 0x4000>;
>  				clocks =3D <&osc>, <&pll0>, <&pll1>,
> -					 <&pll2>, <&pll4>, <&pll5>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL4_OUT>,
> +					 <&sys0_syscon JHB100_SYS0PLL_PLL5_OUT>,
>  					 <&sys0crg JHB100_SYS0CLK_NPU_NCNOC_INIT>;
>  				clock-names =3D "osc", "pll0", "pll1", "pll2",
>  					      "pll4", "pll5", "npu_ncnoc_init";
> @@ -511,6 +599,28 @@ sys2crg: clock-controller@13008000 {
>  				#reset-cells =3D <1>;
>  			};
>=20
> +			sys0_syscon: syscon@13010000 {
> +				compatible =3D "starfive,jhb100-sys0-syscon", "syscon";
> +				reg =3D <0x0 0x13010000 0x0 0x2000>;
> +				clocks =3D <&osc>;
> +				#clock-cells =3D <1>;
> +			};
> +
> +			sys1_syscon: syscon@13014000 {
> +				compatible =3D "starfive,jhb100-sys1-syscon", "syscon";
> +				reg =3D <0x0 0x13014000 0x0 0x4000>;
> +			};
> +
> +			sys2_syscon: syscon@13018000 {
> +				compatible =3D "starfive,jhb100-sys2-syscon", "syscon";
> +				reg =3D <0x0 0x13018000 0x0 0x2000>;
> +			};
> +
> +			strap_syscon: syscon@1301a000 {
> +				compatible =3D "starfive,jhb100-strap-syscon", "syscon";
> +				reg =3D <0x0 0x1301a000 0x0 0x2000>;
> +			};
> +
>  			intc: interrupt-controller@13220000 {
>  				compatible =3D "starfive,jhb100-intc";
>  				reg =3D <0x0 0x13220000 0x0 0x80>;
> @@ -518,6 +628,21 @@ intc: interrupt-controller@13220000 {
>  				interrupt-controller;
>  				#interrupt-cells =3D <1>;
>  			};
> +
> +			sfc0_filter_syscon: syscon@14090000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14090000 0x0 0x1000>;
> +			};
> +
> +			sfc1_filter_syscon: syscon@14091000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14091000 0x0 0x1000>;
> +			};
> +
> +			sfc2_filter_syscon: syscon@14092000 {
> +				compatible =3D "starfive,jhb100-sfc-filter-syscon", "syscon";
> +				reg =3D <0x0 0x14092000 0x0 0x1000>;
> +			};
>  		};
>  	};
>  };
> --
> 2.25.1

--y4x6DHvYA0rn/lkY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann6fAAKCRB4tDGHoIJi
0hBCAQDVK9rLq93tfFflke4FNIJBMWbcVaXBWPLgEGL6YahE9gEA+J+BgtSwc8rP
+EtwVJ/ULG+ugnCgqveyph9v8NXdrw0=
=vfMb
-----END PGP SIGNATURE-----

--y4x6DHvYA0rn/lkY--
