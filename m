Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD05D3822B7;
	Fri, 14 Aug 2026 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720957; cv=none; b=o1wCWbnFXYLPsFUQX7vss/l41oOq4LxLvHy1FhqYt0IkvnzoaPkUMoWa/EhptzUUs5DvOkuvaO5vjPvvRF0sKLhpKOuyk/vId0k0pv6msq2ZTI8qpw1fpSvROlSTm0VFW/99sp303QWsTMLGUBKKQSXAKdwIf28GtPvbpkmIR6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720957; c=relaxed/simple;
	bh=3IC1BE5wu0MvLqa525cSWfcVgALOOqfEzKweZMUtXVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECcU2+G3dPDz76+dPk6x1hU1JgQlQx6XV0dzZUUokQGFf8FVFjwoDfDbVWeqHXgmMT8NGuGgvJSMJJp9nNOA3gJb8vTWnEVHR7H+p1fUeANxVVQczKw6I3OfCEFPiYtB+IcP3EmxqV7A7vVQbwSaTms50T0ieaEdN3n7uC4M+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTOHoGew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTOHoGew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660031F000E9;
	Fri, 14 Aug 2026 15:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786720956;
	bh=kmorQkK+4Ev4Z3RKxn3fV6jG5tvnbCoqC++sVg0KocY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TTOHoGewibpOLne/UO+Bfp7Lnm6S1ALUwHghNN6Q23tuQ9WrdbOJughJrOwSgqvuT
	 EybCRZ0Mr4hD038YjftrmiXfM0qPEsTMA31sPIKfQod79wc4YLr3To5lJliDDWmHJg
	 q6zOA0PcQqA4u7Gm2tdzQ5BiPCLNMdTDGilvDaPefvos4KU9K0GTLbPS+RtwVdPvdU
	 MY5cQszo6BGs57N9duwT2hPF/EdnN8Gq7pB6WhdTBx5SyNR6fXQYz42wX2lS91K1Wb
	 pYc9b4zuf6J027AA5/A0bcHIrocuyup1MjZwnUPNo+5Mq9EJSR07nh2y9FPwKxJZ7X
	 f7/M+I48v+Iwg==
Date: Fri, 14 Aug 2026 16:22:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Pedro Kopper <pedro.kopper@microchip.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, daire.mcnamara@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com,
	valentina.fernandezalanis@microchip.com, conor.dooley@microchip.com
Subject: Re: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val
 order
Message-ID: <20260814-boggle-derby-3f55c6c14bc8@spud>
References: <20260814092211.2158337-3-pedro.kopper@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QEQswmvPTbKtLig7"
Content-Disposition: inline
In-Reply-To: <20260814092211.2158337-3-pedro.kopper@microchip.com>

--QEQswmvPTbKtLig7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 10:22:13AM +0100, Pedro Kopper wrote:
> mpfs_cfg_clk_set_rate() passes the mask and value arguments to
> regmap_update_bits() in the wrong order. The resulting write becomes
> reg =3D orig_reg | val, causing bits to not be cleared if the clock
> divider changes.
>=20
> Pass the arguments in the correct order so the divider field is updated
> as intended.
>=20
> Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
> Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>

CC: stable@vger.kernel.org
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/clk/microchip/clk-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk=
-mpfs.c
> index ee58304913ef..7f044775aea8 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -285,7 +285,7 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, u=
nsigned long rate, unsigned
> =20
>  	mask =3D clk_div_mask(cfg->width) << cfg->shift;
>  	val =3D divider_setting << cfg->shift;
> -	regmap_update_bits(cfg->map, cfg->map_offset, val, mask);
> +	regmap_update_bits(cfg->map, cfg->map_offset, mask, val);
> =20
>  	return 0;
>  }
> --=20
> 2.43.0
>=20

--QEQswmvPTbKtLig7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCan8yuAAKCRB4tDGHoIJi
0szbAP4r5lkjOU05Z8OBHNcjRlUP+5eVU0Y+j/1qqkhgJWDo7wEApBkqLMPNQqSc
2hBKFESwyLLmkFM/+GEkcYTvKY/U6Ak=
=Po1h
-----END PGP SIGNATURE-----

--QEQswmvPTbKtLig7--
