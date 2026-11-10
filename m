Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270817;
	b=UgIXqPeTBLxoyNbHFLmQlR2L27lKpKu+RiGl24qTdj6xsMWqt1xBm/82VfRiSLxH8+3G
	 kYvfGvF1r0slGQpsBb94M88g7zZM9WmEWZroWMtv9HXRHsY6zJ3mHVRL+YC8GbUWM7Zpg
	 csVXSANNPazANgr6sNeMmyPqQnuwgJM7jdVDa3dKSrI0WPribo6+q4zJSuK4Xz6LynxDr
	 VhqoJ1A09p2uTPQXlUQRCWCoum2kCk0PfTMWu/+2safnyQlx2GR7hk2oKiutNRwvaw58E
	 HA1Xtk6qYfbsBBCff1+AaLCr+YZsQxkPjLW9kOJ81pWFosBU1ciUiJtY983AZ7Tza/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270817;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=75we6jXuAiPy6mSHgJyi4LzXuAL4b5xMNZPqRnmxtgc=;
	b=npc339rHbMM1yC0DUa74lxLlj2VErOX9QhWtkS0mrozVFouAwROIRpsWtdT1a4q7ZSu6
	 vzDMjF+53fPieeqk7WGx3RHh0LDZG5W3kutRDtOpLv7j1RkrX+uv95oNZh3Uaf11KGh3m
	 xqjjuPfAn8kFIyZthezZrLZc3KeGG7X+Ulq2Lux+U47VKCjKgQkzsq+WYQHY1Xzg09IUE
	 DpC2OVimAyHn585WDPFYgAcQ1wrZPU0zKQAHFz8fnG8ICsnz7DFNzVYCI2KsLkrd2HEFQ
	 5qozPiG5wW7FTonMDJI5OvZ1EdLuiDvw/wFrWWABvSfcO0YN/PLDQdBTlTCgSo1kzjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S93vpFi5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05B9606A321
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 00:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S93vpFi5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DD21F0089F;
	Tue, 10 Nov 2026 00:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794270816;
	bh=75we6jXuAiPy6mSHgJyi4LzXuAL4b5xMNZPqRnmxtgc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=S93vpFi59zbkQBYiZ1LI91cPKf19TclvjELnvfD0rrnWjhr5r1N/tTPg+FWXOPdxh
	 SrKq5hvcwT6IURXJYU1Z0shPt8C18INSDZTeYORxOAN/8wbrpZJA6dEr5JE7TvdSAR
	 vrpkLcA3EnzyUgCmQ2QO3FTZfi73hFwhAnI+/KEuiUAefN6EfWOd2DeNU4QjDg0zO5
	 LfIurKUFh2UNRcds8yjM3olDUeCax60xyKMuvF+OVJUvV6Q/+kzrckxp6wO1PcUEfd
	 QXkVa3yFJvFneVzdneR+YcmroZTNWr1wjvRClV3zBapmLP5WPluIMlmawHrYq6/nbZ
	 4bVP0gXiGfpeQ==
Message-ID: <sashiko-outbox-205868@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] clk: en7523: add support for .set_rate for
 en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261110001128.1041-3-ansuelsmth@gmail.com>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 00:33:35 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: en7523: misuse of dev_err_probe() in runtime
  en7581_set_rate()
--

commit 5164adf91e05547277b7acad91e9f5b487a3781f
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for .set_rate for en7581

This commit adds clk_div_table definitions for the BUS, SLIC, and SPI clocks
and implements .determine_rate and .set_rate callbacks for the Airoha EN7581
SoC.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 6640e814d36a4..b0aed88528c5d 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk=
_hw *hw,

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
> +
> +	return 0;
>  }

[Severity: Low]
Should en7581_set_rate() use dev_err() instead of dev_err_probe()?
en7581_set_rate() is a runtime clk_ops.set_rate callback, whereas
dev_err_probe() is only meant for probe paths (suppressing -ENOMEM logs and
recording dev->p->deferred_probe_reason on -EPROBE_DEFER), and the sibling
runtime callbacks en7581_recalc_rate() and en7581_get_vals_for_rate() use
dev_err().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110001128.1041=
-1-ansuelsmth@gmail.com?part=3D2
