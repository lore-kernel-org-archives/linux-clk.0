Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E2366052;
	Mon, 10 Aug 2026 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786378931; cv=none; b=Xt7nflh+TOowiOZR45C3eHAn0GVkCflYopF6Yuqn7xduNjnxVoyEn0azCuQF5suMJM1ONOlgZeRdOOmZfCmOdbAa4L4Lc0g9s5/6tKgk+B00Hp+asnvPJRa1DOVICxglitYXc6x+nqaeqsqxb6T7CpmmniF22VDQiHo5T6+rr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786378931; c=relaxed/simple;
	bh=Upl21JL8ciL5/o713zKipc/aj3OZLupgl1kAjGJ7OwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7RD8tdJAXSnaLFuMUw/dkRtXN4A+9h0sqGHg8XpXGdM0qn2yLeMGeg4wmcz8MPH1j1IWq82gltiCeH3YHTrUimvhqkSOoJsfA4B8Kn28p7k/Yxjy+OrpPy7/46xt8ffZLf48TVYdARTEP9kWUh9zLMDV3G1XH0gBXmZOX8T/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFgHk/Hb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFgHk/Hb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861B31F000E9;
	Mon, 10 Aug 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786378929;
	bh=R+nQqKrTrGCn1/1USoU4telVFbB6QfHRod55DukTIpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFgHk/HbEAtr7ptQ3k5MNMtvvzCLrzAS3WZYoGYf8PSq/SgtbEaZKnX+/il3Iz0SE
	 MMqiq2WxMoAb9HUdwSqRXRVYqFeQczs5UEPQZFeAe5W8pfrywHuG8TluXrod447UT0
	 3uZT8la9O6Q4bAq0APQe4X9WfWGpcK5oOGTUjcxYwR6m1NXY1B8ANewtJC2ch6k2Y5
	 XJ8EZ21kj4VYpmq/vl0KGGrIW3+t8/7mu0dwrSZwighMiI3cEhh2NMdodpP5+Fg+WO
	 5TG7241q4NRZ+jJAJXQuFhRxCA6mQYCExJ3f1c2pIEyF1wxcrnvXnhT9FYMoXHxnfE
	 X1PUILF0hfr0A==
Date: Mon, 10 Aug 2026 17:22:03 +0100
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
Subject: Re: [PATCH v4 5/8] reset: starfive: Introduce active_low
Message-ID: <20260810-overhead-seventy-cdab37ccb66d@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ff1WWiLCKZVhlsMd"
Content-Disposition: inline
In-Reply-To: <20260809015054.210577-6-changhuang.liang@starfivetech.com>

--ff1WWiLCKZVhlsMd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:51PM -0700, Changhuang Liang wrote:
> The JHB100 SoC supports inverted operations for reset
> assertion/deassertion, introducing an active_low field to distinguish
> between different operation logics.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Can you please get Hal to review this and the other reset patch?

Thanks,
Conor.

> ---
>  drivers/reset/starfive/reset-starfive-common.c | 6 +++++-
>  drivers/reset/starfive/reset-starfive-common.h | 6 ++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/res=
et/starfive/reset-starfive-common.c
> index 86dbb33bb216..7723520637ca 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -52,12 +52,16 @@ static int starfive_reset_update(struct reset_control=
ler_dev *rcdev,
>  				 unsigned long id, bool assert)
>  {
>  	struct starfive_reset *data =3D starfive_reset_from(rcdev);
> +	bool active_low =3D data->info && data->info->active_low;
>  	unsigned long offset, flags;
>  	void __iomem *reg_assert;
>  	void __iomem *reg_status;
>  	u32 mask, done, value;
>  	int ret;
> =20
> +	if (active_low)
> +		assert =3D !assert;
> +
>  	if (data->info && data->info->discontiguous) {
>  		id =3D starfive_reset_id_to_hw_id(data->info->map, data->info->nr_rese=
ts, id);
>  		if (id =3D=3D STARFIVE_RESET_ID_INVALID)
> @@ -70,7 +74,7 @@ static int starfive_reset_update(struct reset_controlle=
r_dev *rcdev,
>  	reg_status =3D data->status + offset * sizeof(u32);
>  	done =3D data->asserted ? data->asserted[offset] & mask : 0;
> =20
> -	if (!assert)
> +	if (active_low =3D=3D assert)
>  		done ^=3D mask;
> =20
>  	spin_lock_irqsave(&data->lock, flags);
> diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/res=
et/starfive/reset-starfive-common.h
> index 0d4e634de58e..c7f80e744700 100644
> --- a/drivers/reset/starfive/reset-starfive-common.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -15,6 +15,12 @@ struct starfive_reset_info {
>  	unsigned int nr_resets;
>  	unsigned int assert_offset;
>  	unsigned int status_offset;
> +
> +	/* If active_low is false, setting the bit to 1 asserts
> +	 * the signal while clearing it to 0 deasserts it, and vice
> +	 * versa.
> +	 */
> +	bool active_low;
>  	bool discontiguous;
>  	const struct starfive_reset_map *map;
>  };
> --=20
> 2.25.1
>=20

--ff1WWiLCKZVhlsMd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann6qwAKCRB4tDGHoIJi
0mrFAQCe6LL/fNbn7QcGbEMfuYIdu5/9Lnk4y7bNCihQwEi53QEAtJ3dYCnVEcBf
Y2xL1pYCAab8CXAAayqFSqes8TJLFQQ=
=v9a5
-----END PGP SIGNATURE-----

--ff1WWiLCKZVhlsMd--
