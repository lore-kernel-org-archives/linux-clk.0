Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462085;
	b=Plkq/ZBp61Tb4GhRaJbwpXqX6oHGReNeJ7FoIcVM5BgidbXNGt/M5fNseb45IbmAe/Gk
	 2vzvDvzWRwLXw0/ZlBpH8llGGT0U/fXK5Jo1KmoILNFdXvHxwJ6hJDPxo9QU/PD4cpSzN
	 szn9OALDCS/cI0iYEd1M1usNQMVXGe3xqrmcYyNvhniPC1uE2P1BwcxHKzK953kdtvylM
	 fgC567MFdf7Xe02W0rWa7HuZJ4eS+m9CVoq5R2zjWfwq0X9qZiJGamo/ujFmMRh/bDhT/
	 AzcNvoZicBDuIqBfbAAX5IMAYEblnxcCY43t92Sc8Eu68d3Zbulp1qC0cmxsnclN/Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462085;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W1SWFNQLmcVKTgJ7Q5gtIkU+itc7npvxKlUhVbVXDBU=;
	b=VR1qTRdXPxccBpxPpEkJwfoVV+i3qn3dEe38XK9b+nLgDEBCX07GGshgZ60FNDJ3vla4
	 ZfuL85tyJJi78Onz0HP55/1Y2tmqP9WAaCssy6klDTwD1f1XICgR5mIYo7p3y0NDRnqSo
	 /mYkXczw840TxME/oh94+GriXOWq21WgzKpz/0/IQLV3+8GiIIzvq4hDfyxFXbOVImTx9
	 2FOI0Q+H5nMlpoGEKapj8IPhQ6v0q8vrPDb2Ldg1VPjK9HpP31fxI1+EXGVHpVn0CCqzW
	 YT5RhUnlD/FZNDvbLIHu29sFVcmqf1NxU3s65NdO3V9M9sjR31hwInim4hyeYQPkOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=im6XFpW7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DF606A31C;
	Thu, 12 Nov 2026 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=im6XFpW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC4DC1F00A05;
	Thu, 12 Nov 2026 05:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462085;
	bh=W1SWFNQLmcVKTgJ7Q5gtIkU+itc7npvxKlUhVbVXDBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=im6XFpW703wJGjc35jBVWr/bpKt12C6JmjwPMVUXYOC0fNyecSCrGtwYNSDUHpoVF
	 kA8/BPN9KhUJEicOxB1vOmSBJyCO3G4A7/9IGvd7+2g85Cs+U6WQo0cJ7vYdj7lhS9
	 L5fcfZ47MrCxvADYB4d/YPue9bI1TCV5zFUaDPqPB9gDFuViuiTN30cEY40zNq+bGj
	 v17dQJdBKZe+CTFViUDVCOPoOUeKFRB71vgg2BEX0iDXyUSz26nGACA2AEwI7mdQfG
	 K+Wqnm00OmruUD4OHWfIetMdeEh19DU/Qh1bAssuPn7+VkpwsnZ1M3V8UVYkH0a1KX
	 fDC+oKhs+sNNQ==
Message-ID: <sashiko-outbox-210471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 7/9] clk: realtek: Add RTD1625-CRT clock controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112052544.555563-8-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-8-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:41:24 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: realtek: FREQ_MNO_MASK omits bit 19 of O divider for
  pll_vodma
- [Medium] clk: realtek: static clk_hw.init cleared without
  suppress_bind_attrs
--

commit 127e3b9f9c4378fa7aaceda027d1d3b761330569
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-CRT clock controller driver

This commit adds the CRT domain clock controller driver for the Realtek
RTD1625 SoC and registers the associated reset controller on the auxiliary
bus.

> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..b0cccf5c7af2d
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c
> @@ -0,0 +1,878 @@
[ ... ]
> +/* PLL VODMA: M (11:4) / N (13:12) / O (19:17) */
> +#define FREQ_MNO_MASK            0x63ff0
> +#define FREQ_MNO(_r, _m, _n, _o) { .rate =3D (_r), .val =3D ((_m) << 4) =
| \
> +				 ((_n) << 12) | ((_o) << 17), }

[Severity: Medium]
Should FREQ_MNO_MASK be 0xe3ff0 instead of 0x63ff0?  0x63ff0 only covers
bits 18:17 for the O divider field, so rtk_clk_regmap_pll_recalc_rate()
masks off bit 19 when reading RTD1625_REG_PLL_VODMA1 for pll_vodma and can
match the wrong entry in pll_vodma_tbl if O >=3D 4.

[ ... ]
> +static struct platform_driver rtd1625_crt_driver =3D {
> +	.probe  =3D rtd1625_crt_probe,
> +	.driver =3D {
> +		.name =3D "rtk-rtd1625-crt-clk",
> +		.of_match_table =3D rtd1625_crt_match,
> +	},
> +};

[Severity: Medium]
Does rtd1625_crt_driver need .suppress_bind_attrs =3D true?  During probe,
rtk_clk_probe() registers the static clk_hw structures in
rtd1625_crt_hw_data via devm_clk_hw_register() -> __clk_register(), which
clears hw->init to NULL.  Unbinding and rebinding the driver via sysfs (or
re-probing after a late failure in rtk_clk_probe()) will pass those same
static clk_hw structures to __clk_register() with hw->init =3D=3D NULL and =
hit
a NULL pointer dereference.  Unbinding also unregisters CLK_IS_CRITICAL
clocks while they remain prepared and enabled, triggering WARN_ON() in
clk_unregister().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112052544.5555=
63-1-eleanor.lin@realtek.com?part=3D7
