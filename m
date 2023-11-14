Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7242C180;
	Tue, 14 Nov 2023 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/nqQqQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA62C433C8;
	Tue, 14 Nov 2023 17:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699983066;
	bh=jkdZ5mB8QhSCTtNuc3Z7qON1sLEsZWx5t6SxsjDMGrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/nqQqQETcc6iJBWzf7IQ80EGqqzYiyeoUkgDRfthRxuXU/cN0o8EA4tLfr/gCvu0
	 cxnOX3lXlWEaTok3f1T3B9mAFu0NV8pmCAxpqmX879b/Z/z69cOxJYFO9pSUFs/l80
	 c7CXKBucLPv8JA/x+y4unWR/JWxJADBLx0OmvyuC7sh4riivdIulLOkC4qvoePnA0i
	 yUO5/HgZxbAKEstTwaIPQ9UkcZbVWzRnABpFz8mTMZkmTzrHMKNOFn6ZQCFbqce+AW
	 OayixMJOiZRrapUAeARwyohnaCxTNgoLzBsh/+k+2RRJta8q2DjtEbpKCqtnPUE4iT
	 9Iul1XOM/goDg==
Date: Tue, 14 Nov 2023 17:31:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Message-ID: <20231114-grumble-capably-d8f7a8eb6a8d@squawk>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BObCPPDlTCtpWM3f"
Content-Disposition: inline
In-Reply-To: <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>


--BObCPPDlTCtpWM3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:20:11PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add clock generator node to device tree for SG2042, and enable clock for
> uart0.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi | 76 ++++++++++++++++++++

There's no need to create an entirely new file for this.

>  arch/riscv/boot/dts/sophgo/sg2042.dtsi       | 10 +++
>  2 files changed, 86 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi b/arch/riscv/bo=
ot/dts/sophgo/sg2042-clock.dtsi
> new file mode 100644
> index 000000000000..66d2723fab35
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-clock.dtsi
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +/ {
> +	cgi: oscillator {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <25000000>;
> +		clock-output-names =3D "cgi";
> +		#clock-cells =3D <0>;
> +	};

What actually is this oscillator?
Is it provided by another clock controller on the SoC, or is it provided
by an oscillator on the board?

> +
> +	clkgen: clock-controller {
> +		compatible =3D "sophgo,sg2042-clkgen";
> +		#clock-cells =3D <1>;
> +		system-ctrl =3D <&sys_ctrl>;

Why is this node not a child of the system controller?

Cheers,
Conor.

--BObCPPDlTCtpWM3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOu0wAKCRB4tDGHoIJi
0uT6AQD3FJYKLUrrVpL4tzEV3YskeSlnVP66eWfgWIZ+3O5aagD/b5dttSrtKFIt
S80P7AKBwUKY+5II2CtmlSZ4eep63Q0=
=4vEb
-----END PGP SIGNATURE-----

--BObCPPDlTCtpWM3f--
