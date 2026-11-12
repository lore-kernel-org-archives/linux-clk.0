Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794482471;
	b=HIxrfXbgh43MsgGsuVj03kvi51f5zDl7NF2hZi6WiqjXBOujVjbJT/6Z5d3wDpfbpxpZ
	 Jqw4h1xE18SSApDBSqCdc0qXb9vs4YDyv7BpC3tsNwJad/gA03bQTsJf11Vy2vKCdOy/w
	 Y1pUhLvPUwhE2mXvQcZGXPU2pM2dC4JAVrTiY+V8/wV/KS+O/U0r2qfz0xiG8OyNgBms7
	 i/DHZhMQKSzafYhajpFqUbQwfQ9j0ArJ+kTAMphHBHUANkn/XpdEO+AcLFFTpBevVtUeh
	 7z7L8HLo2xnLjsLqGijupyneoivx9+Pf2pIi1ZJOXuZJxd9zusceS2XIIIA+SdRn1PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482471;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=JAI4OUL2TrWY37F5xvd0X+8qNL/eL8wyTrg+ONCjoEs=;
	b=b+/YgCJKWDaitoaKQ23bElJdSVqFj8jUuz6FYGsmoTL/vcIZUNVBPLIsihb2R3lLA5XB
	 ekk8t32QsPh+5+Jbkm4apuuJbYe8s7J1JR5LZrklU5Jn+iWl9/jy9QWdMIXaCjtkgj6nG
	 OQMmKZ/Ounlh2A3BHvZylCbOrlwCT9h67yc1bte8g10harx/LQ847e+DVjiB8bwOFggff
	 N9KuVWipHk/cTJFFpp+FdQ1Yzmt25qX8rADnpmjMo6JtHq8ecKqXfoZ5Xv1HWP0ZvGJh3
	 o7scc6OJrLLAsTpW9TnO/9q31Af39GVMRaqR5WvhmW51uSsAMO44djUzoh1WFbk0qqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KJquWBYd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF5606A32A;
	Thu, 12 Nov 2026 11:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FF5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=KJquWBYd
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0529D202C92;
	Thu, 12 Nov 2026 12:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794482469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAI4OUL2TrWY37F5xvd0X+8qNL/eL8wyTrg+ONCjoEs=;
	b=KJquWBYdNO1p925AQ2jlEP1Br5a9Mv2C66vC3uv2eUhDSMbM9gunU33rBNI0DT90fdgjQ3
	xrSx7CTPKVmyBq47XMOpD1/V02W673G1jKnu6OFLCxi4ts9Xpy7laauDW/QR2yPQaYNtaH
	a79bqRMYx0qC2AkMzITaUxMytkLC2j5GeerenUqYjlwNSFT+OMwPtkB/TVnznRN9leoHQy
	snA3fHwYVC+aqQvLlrfx5qlRFezAV+dIFr7vUN3AYVcad3S2L/F8ZtkuzzMbzrm2m8GXej
	hbItJV4XXuUdcF/2jMI/EPKkXqEQOw7CEakVrrlUqVv2JbVqieghKr2N3lcaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794482469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JAI4OUL2TrWY37F5xvd0X+8qNL/eL8wyTrg+ONCjoEs=;
	b=PES9tuqo9Rc2Gnym6fcwG8dfYWu1DGmo17wmPa9qqTQHjTS8hP1WW4PtkxX/r6LYy9gBJN
	8BjLO3tCeaspT9vRtBWGmvXnCUOZIJ5qkHZHVH+jJJixfA2BQnm/XP0XCN/1QLylEiJYXU
	qql9Icoea27xCOmdNq5cMMNEKsmhJsZOpIWXoi1Y0MMj6kLVX8h4F4lZEzY1HAFR30KY/j
	OesXXmzpix65Q3jzfj1n3JYRVVHe5/7uEi3iQ9dDSTfbeAEGZ6eginhNJqqOL8W2K9pDqM
	3rLyN8RORqpJoKlf2ALWPtOkz7St8mngyFDx99Jb1E4ReWoUfbvR1iwdw8osyA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794482469; a=rsa-sha256;
	cv=none;
	b=RbCN62QjvVPGiuIyH0q18mcoTd+ZabtKUJhZO45YrUSkyoQ6yXvhc1+ZXSREh4PTcVW+xs
	wd+E6hGHT/NVYmp2Qpd1gpM+oIhO7xlNSFe4qaJFvqbZe4nw2XPPryzAgYeK+sm0A6SqO9
	Rbso7sB5rtOBbsPaGLShEzL4rp6jPnVFeINhHKK7maTw/xLtEthnCQI++w0uiiwgPi/cFz
	lEYIxx0iuudGCyVAkhqN5NbJKuY1C65yxKZvtsehYVdxTwq5RZkrpZikDCJJ1wbrV1tyub
	hFqGdrca+Pb8ByyB5dJwMjaxTV9rVPeDPcpkW2sc14Rezd0u5i057oJIBsj1Sw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <45683ba0cf239f394b621d84cbd5535f7eae410f.camel@pengutronix.de>
Subject: Re: [PATCH v6 14/15] reset: starfive: jh71x0: Support discontiguous
 reset IDs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Thu, 12 Nov 2026 12:21:08 +0100
In-Reply-To: <20261008123338.11081-15-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
	 <20261008123338.11081-15-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-08 at 05:33 -0700, Changhuang Liang wrote:
> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
>=20
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for discontiguous controllers, a
> table mapping reset IDs to hardware bits. Add
> reset_starfive_jh71x0_register_with_info() to register such a
> controller, and translate the reset ID in the update and status
> callbacks when a map is provided.
>=20
> Existing users of reset_starfive_jh71x0_register() are unaffected.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
>  .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
>  2 files changed, 107 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/res=
et/starfive/reset-starfive-jh71x0.c
> index 29ce3486752f..fd1c755a0017 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
[...]
> @@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
>  	return container_of(rcdev, struct jh71x0_reset, rcdev);
>  }
> =20
> +static unsigned long
> +jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned in=
t nr_resets,
> +			 unsigned long reset_id)
> +{
> +	for (u32 i =3D 0; i < nr_resets; i++) {
> +		if (map[i].reset_id =3D=3D reset_id)
> +			return map[i].hw_id;
> +	}
> +
> +	return JH71X0_RESET_ID_INVALID;
> +}
> +
>  static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct jh71x0_reset *data =3D jh71x0_reset_from(rcdev);
> -	unsigned long offset =3D id / 32;
> -	u32 mask =3D BIT(id % 32);
> -	void __iomem *reg_assert =3D data->assert + offset * sizeof(u32);
> -	void __iomem *reg_status =3D data->status + offset * sizeof(u32);
> -	u32 done =3D data->asserted ? data->asserted[offset] & mask : 0;
> -	u32 value;
> -	unsigned long flags;
> +	unsigned long offset, flags;
> +	void __iomem *reg_assert;
> +	void __iomem *reg_status;
> +	u32 mask, done, value;
>  	int ret;
> =20
> +	if (data->info && data->info->discontiguous) {
> +		id =3D jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets=
, id);
> +		if (id =3D=3D JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}

Why is this lookup done in the ops?
It should be done once in fwnode_xlate instead.

> +
> +	offset =3D id / 32;
> +	mask =3D BIT(id % 32);
> +	reg_assert =3D data->assert + offset * sizeof(u32);
> +	reg_status =3D data->status + offset * sizeof(u32);
> +	done =3D data->asserted ? data->asserted[offset] & mask : 0;
> +
>  	if (!assert)
>  		done ^=3D mask;
> =20
>=20
[...]
> @@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *de=
v, struct device_node *of_no
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +
> +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct =
device_node *of_node,
> +					     void __iomem *assert, void __iomem *status,
> +					     const u32 *asserted,
> +					     const struct jh71x0_reset_info *info,
> +					     struct module *owner)
> +{
> +	struct jh71x0_reset *data;
> +	int ret;
> +
> +	if (info->discontiguous && (!info->map || !info->nr_resets))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "discontiguous controller without a valid ID map\n");
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops =3D &jh71x0_reset_ops;
> +	data->rcdev.owner =3D owner;
> +	data->rcdev.nr_resets =3D info->nr_resets;
> +	data->rcdev.dev =3D dev;
> +	data->rcdev.of_node =3D of_node;

You can add a custom fwnode_xlate that does the
jh71x0_reset_id_to_hw_id() translation if info->map is set.

> +
> +	spin_lock_init(&data->lock);
> +	data->assert =3D assert;
> +	data->status =3D status;
> +	data->asserted =3D asserted;
> +	data->info =3D info;
> +
> +	ret =3D devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n"=
);
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/res=
et/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..36f198139602 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,9 +6,28 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
> =20
> +struct jh71x0_reset_map {
> +	unsigned long reset_id;
> +	unsigned long hw_id;
> +};
> +
> +struct jh71x0_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;

This seems superfluous, (map !=3D NULL) means discontiguous already.

> +	const struct jh71x0_reset_map *map;
> +};
> +

regards
Philipp
