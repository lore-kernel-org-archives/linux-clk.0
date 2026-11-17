Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939321;
	b=odgl+RLjjhUJReUMLLxjo6eYKpRtfrX/6k3WEVKrn/Uz6j3XRel6hB+vVLDl2hh8sN93
	 4JMg2twEEn+X5Hu+PigVim+6dDWsFg44SWnLE0DoysGPtUP0q7gbxm9prxUYxWgWAZOvq
	 7OPG21hCjYAuvbTfQfwsIW7aY2BsMey9p6cA/uVi0uF9uVEPZgbW53Pn2rDQ+4Q7nY+Qu
	 y2hke9R5U1/AwJf6jABLfUDqpWDb3fwZPMtEWN16d3lJCKvz8s4f4xo00Ncfqlyvq1lQP
	 Ait8no7arQXoIPQpkEZuLqLNK9WTHnZVuSxmkfcwhYj5aeXTtETar1UG+6ZFW+xckCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939321;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tgphSOA9aU0l2b8cExZcGrYaMgpbrWhvWwIZQpvsVSQ=;
	b=DaLq7hdoZL65XMv77/hiZahc31kNiKjwe29A7Sno7lH8pmSTXy0hH/p/rULlNAeEwAH6
	 TfJvBzQ/WmEOmC9fP+vgSAW5/M4PVjqKxp7elcjaOZnIYdaqxq+Wdnt7Ys3ceaegzznLC
	 9hqcgciSAfZVtwz7GDP3a6/iT3FW+IUwNR4c96DyMNW2BijL/L2AXcagMAaorJ9zQarK3
	 ABXEUs6N7jOgan6oKeST9wyxjKxy8BZGhWxkHD5FtuLm8d3AeKpGk0Lb9yvNWjWksqOUK
	 O9GqldBXh7vZCm7yW69j8OL2RvTfPCJIL+QF7cVTwGz2MkJSEK9vysnPceSLCfg9KJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iA1WXVQd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B450606A330
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iA1WXVQd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1C01F000C6;
	Tue, 17 Nov 2026 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939321;
	bh=tgphSOA9aU0l2b8cExZcGrYaMgpbrWhvWwIZQpvsVSQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=iA1WXVQdtUdPy9OOUlQTona/DgWCWh1qiFGeV2dqCLeSam6zdyP64bX4DtDh0qnc3
	 QzKeRHwFd6HH2nbZHoHkkpcrhl5wZbCmYAOvY7skUijpr6ZbAZhPj4KnPweg0wXheY
	 uCnh2uT9YG7fFqxjTR/IJ9/WI5oX0MvZg5PgPeecdHv6OVZ/GWmls0G6e36FlzwuSb
	 Tz2rwxo0BLQz8PV/Nw6R12g3/rrVDu5ewZrQFjRxUV8/tKokv5VIOM1pfuzoINTyhH
	 tyasx7Bg1jgdkmoNVj6pU1DyKN4g2v3qDqolBdxt7GX1XcSWz1iUl7yR9DWYMao/Td
	 4YWJQs9iKrYxA==
Message-ID: <sashiko-outbox-219321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] clk: en7523: add support for .set_rate for
 en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261117180213.88046-3-ansuelsmth@gmail.com>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
 <20261117180213.88046-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:15:20 +0000
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
- [Medium] clk: en7523: en7581_determine_rate() fails on unrounded
  div_table rates
--

commit 2aba0750bb722a13abf74ccd375ad0f3b952c3b5
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for .set_rate for en7581

This commit adds .determine_rate and .set_rate clock operations for the
Airoha EN7581 SoC and converts the BUS, SLIC, and SPI clock dividers to use
clk_div_table arrays with the standard clock divider helpers.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 27ead83b639eb..a41eabd40401d 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -774,11 +847,192 @@ static unsigned long en7581_recalc_rate(struct clk=
_hw *hw,

[ ... ]

> +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> +					     unsigned long rate,
> +					     unsigned long parent_rate,
> +					     const struct en_clk_desc *desc,
> +					     int *div_val)
> +{
> +	*div_val =3D divider_get_val(rate, parent_rate, desc->div_table,
> +				   desc->div_bits, 0);
> +	if (*div_val < 0)
> +		return 0;
> +
> +	return divider_recalc_rate(hw, parent_rate, *div_val,
> +				   desc->div_table, 0,
> +				   desc->div_bits);
> +}

[ ... ]

> +static void en7581_find_best_rate(struct clk_hw *hw, struct clk_rate_req=
uest *req,
> +				  const struct en_clk_desc *desc,
> +				  unsigned long parent_rate,
> +				  unsigned long requested_rate,
> +				  unsigned long *best_diff)
> +{
> +	unsigned long tmp_rate, diff;
> +	int tmp_div_val;
> +
> +	tmp_rate =3D parent_rate;
> +	if (desc->div_bits)
> +		tmp_rate =3D en7581_get_div_for_rate(hw, requested_rate, parent_rate,
> +						   desc, &tmp_div_val);
> +
> +	if (!tmp_rate || tmp_rate < req->min_rate ||
> +	    tmp_rate > req->max_rate)
> +		return;
> +
> +	diff =3D abs_diff(requested_rate, tmp_rate);
> +	if (diff < *best_diff) {
> +		*best_diff =3D diff;
> +		req->rate =3D tmp_rate;
> +	}
> +}
> +
> +static int en7581_determine_rate(struct clk_hw *hw,
> +				 struct clk_rate_request *req)
> +{
> +	struct en_clk *en_clk =3D container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc =3D en_clk->desc;
> +	unsigned long best_diff =3D ULONG_MAX;
> +	unsigned long rate =3D req->rate;
> +	int tmp_base_val =3D 0;
> +
> +	if (!rate || (!desc->base_bits && !desc->div_bits))
> +		return -EINVAL;
> +
> +	if (!desc->base_bits) {
> +		en7581_find_best_rate(hw, req, desc, desc->base_value,
> +				      rate, &best_diff);
> +		goto exit;
> +	}
> +
> +	for (; tmp_base_val < desc->n_base_values; tmp_base_val++)
> +		en7581_find_best_rate(hw, req, desc,
> +				      desc->base_values[tmp_base_val],
> +				      rate, &best_diff);
> +
> +exit:
> +	return best_diff =3D=3D ULONG_MAX ? -EINVAL : 0;
> +}

[Severity: Medium]
As reported by Brian Masney on v5 [1], can en7581_determine_rate() fail with
-EINVAL when a caller requests an unrounded rate on a clock with a
div_table?

en7581_find_best_rate() passes the unrounded requested_rate to
en7581_get_div_for_rate(), which calls divider_get_val():

drivers/clk/clk-divider.c:divider_get_val() {
	div =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);

	if (!_is_valid_div(table, div, flags))
		return -EINVAL;
    ...
}

Unlike divider_determine_rate() or divider_ro_round_rate(), divider_get_val=
()
does not round or clamp div to the closest entry in desc->div_table; it
requires DIV_ROUND_UP_ULL(parent_rate, rate) to match a table divisor
exactly. For EN7523_CLK_SPI (400 MHz base, spi_div containing only even
divisors 2..62), requesting a rate such as 150 MHz (div =3D 3) or 400 MHz
(div =3D 1) makes divider_get_val() return -EINVAL, causing clk_round_rate()
and clk_set_rate() to fail instead of rounding to the nearest supported
rate.

[1] https://lore.kernel.org/r/179444135864.1126566.13931750325129218557.b4-=
review@b4

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117180213.8804=
6-1-ansuelsmth@gmail.com?part=3D2
