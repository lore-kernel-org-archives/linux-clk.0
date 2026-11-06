Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965514;
	b=z6NMj7naNWOTymT6MngBLoeeDRI/3P3kq8B589X43+5Rn+fUz6r1Z03DgkLb1C99qSYr
	 yAoeQU5zR5b8EVOAl1JQ1UgUCU+pRusvwejzBJX4odDoc9CA/eFXUdektR4CY7ppjlWfK
	 3TE0RE6g35ETCsLo7qO0FTniUuMowVWR9FUeg1MHJXT14QC4ZtVj1a0ZgdRNcyP+w03cP
	 814QepO1v7do1DQGooFwYX98WUPkFA7K8w+phGbs8MKvE92CqK2P2yIRYCmqMILeciAZz
	 ozpGTtfQXBsOQaEyjAWJybk6/4yKIIo90sEbMvb4s+DyMI3xmTwbfsO61ICEawhTi1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6HtPOjWBq4whbuyZ9O0eODyZE2stdPcMKM1h6SekQ3o=;
	b=xc1ED2jbpeIA5KYI5uxMAgvQDUjVS+fa4IjMAntkkHVoQUst4OC1gK/+wuWY9Y8U0eqS
	 kLRW7YA6sz7TIgfssKq7JJBm78IQ6ZoorhT62dC2ONvLIAfkNNBGrnOZGqxUzdVTQ4rPt
	 Tg35V0Eo8gmKbrkYwlDb/ML6FE+QHgAj7RaN8ghVIkV6j3kPlRbn6qV85ablBEVh7Vqdy
	 pizlVv+HFMbwA+hgv9N63VihSW/jrzLo5Vr2wD05wI0/mw6/N6JGgXFxISQGbpD+oGSrM
	 ldBkZyjy5SPjAZPI55+jRPu1o7M4GrFAQtig3MDcZk+CA2acHTtiZf79KcPtKtMPXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7HIO096;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAFE606A330
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W7HIO096
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07761F0089F;
	Fri,  6 Nov 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965513;
	bh=6HtPOjWBq4whbuyZ9O0eODyZE2stdPcMKM1h6SekQ3o=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=W7HIO096qnwq9I/eUpcGgpsp5/L5ga25EZ6JUu61KJKV0wIlodS+XhE5BENoHPg1P
	 dZizYOBB1zj/P5ItnmkIYZpfXeYsZoSzj2GZuxYyequ2fCT453O9IuY+ZrvLTd3+Fu
	 xRHq5cx31QQbpIKkRBN7IXCfWLK8CeO+JcnvMe6Pm4pwizYbyvzzZT6v4pwZIucj+D
	 qcN2Jex7HYNP5wp9TijFdnL6jb/qCLOCzNK9G7KafdtC9pzEB6vaLrspupbPSn/753
	 M80evEGxXTMP85vFySzJRD8tuNOvMYiuOqo5vcZfJeNiOGd0x137j00Dnm4o9P9noM
	 j1oStuh4qE2Xg==
Message-ID: <sashiko-outbox-201354@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: en7523: add support for .set_rate for
 en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261106113227.182324-3-ansuelsmth@gmail.com>
References: <20261106113227.182324-1-ansuelsmth@gmail.com>
 <20261106113227.182324-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:45:13 +0000
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
- [Medium] clk: en7523: division by zero in divider_get_val() when rate
  is 0
- [Low] clk: en7523: misuse of dev_err_probe() in runtime
  en7581_set_rate()
--

commit 21c9a3ba438d14108d5599a5785e71997f1e9fbe
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for .set_rate for en7581

This commit adds clock divisor tables and implements .determine_rate and
.set_rate callbacks for the Airoha EN7581 SoC clocks.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 6640e814d36a4..db7447be31c33 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk=
_hw *hw,
>  		return 0;
>  	}
> =20
> -	return rate / en7523_get_div(desc, val);
> +	if (desc->div_bits) {
> +		val >>=3D desc->div_shift;
> +		val &=3D (1 << desc->div_bits) - 1;
> +
> +		rate =3D divider_recalc_rate(hw, rate, val,
> +					   desc->div_table,
> +					   desc->div_flags,
> +					   desc->div_bits);
> +	}
> +
> +	return rate;
> +}
> +
> +/*
> + * Simulate rate with every divisor supported
> + * 1. Search the divisor for the requested rate
> + * 2. Simulate the final rate with the new divisor
> + */
> +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> +					     unsigned long rate,
> +					     unsigned long parent_rate,
> +					     const struct en_clk_desc *desc,
> +					     int *div_val)
> +{
> +	*div_val =3D divider_get_val(rate, parent_rate, desc->div_table,
> +				   desc->div_bits, desc->div_flags);
> +	if (*div_val < 0)
> +		return 0;
> +
> +	return divider_recalc_rate(hw, parent_rate, *div_val,
> +				   desc->div_table, desc->div_flags,
> +				   desc->div_bits);
> +}
> +
> +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> +				    const struct en_clk_desc *desc,
> +				    unsigned long rate,
> +				    u32 *base_val, u32 *div_val)
> +{
> +	struct device *dev =3D clk_hw_get_dev(hw);
> +	unsigned long parent_rate, tmp_rate;
> +	int tmp_base_val =3D 0;
> +	int tmp_div_val =3D 0;
> +
> +	if (!desc->base_bits && !desc->div_bits)
> +		return -EINVAL;

[Severity: Medium]
Can en7581_get_vals_for_rate() pass rate =3D=3D 0 into
en7581_get_div_for_rate() -> divider_get_val()?

Calling clk_round_rate(clk, 0) or clk_set_rate(clk, 0) forwards
req->rate =3D=3D 0 to en7581_determine_rate(), and divider_get_val() divides
by rate without checking for zero:

drivers/clk/clk-divider.c:divider_get_val() {
	unsigned int div, value;

	div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
    ...
}

Rejecting !rate at the start of en7581_get_vals_for_rate() would avoid a
division by zero.

[ ... ]

> +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
> +	struct en_clk *en_clk =3D container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc =3D en_clk->desc;
> +	struct device *dev =3D clk_hw_get_dev(hw);
> +	struct regmap *map =3D en_clk->map;
> +	u32 base_val, div_val;
> +	u32 reg, val, mask;
> +	int err;
> +
> +	err =3D en7581_get_vals_for_rate(hw, en_clk->desc, rate,
> +				       &base_val, &div_val);
> +	if (err)
> +		return err;
> +
> +	if (desc->div_bits) {
> +		reg =3D desc->div_reg ? desc->div_reg : desc->base_reg;
> +
> +		mask =3D (BIT(desc->div_bits) - 1) << desc->div_shift;
> +		val =3D div_val << desc->div_shift;
> +
> +		err =3D regmap_update_bits(map, reg, mask, val);
> +		if (err)
> +			return dev_err_probe(dev, err, "Failed to update div reg for clock %s=
\n",
> +					     desc->name);
> +	}
> +
> +	if (desc->base_bits) {
> +		mask =3D (BIT(desc->base_bits) - 1) << desc->base_shift;
> +		val =3D base_val << desc->base_shift;
> +
> +		err =3D regmap_update_bits(map, desc->base_reg, mask, val);
> +		if (err)
> +			return dev_err_probe(dev, err, "Failed to update reg for clock %s\n",
> +					     desc->name);
> +	}

[Severity: Low]
Should en7581_set_rate() use dev_err() instead of dev_err_probe() here?
en7581_set_rate() is a runtime clk_ops callback rather than a probe
function, and the sibling helpers en7581_recalc_rate() and
en7581_get_vals_for_rate() already use dev_err().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106113227.1823=
24-1-ansuelsmth@gmail.com?part=3D2
