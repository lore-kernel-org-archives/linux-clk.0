Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795216437;
	b=A72ShcqxtJqN4MjjXNFHxsjggjLJaxHNQ32WGtjTHwjlk4PCEr4UZK8dyz00kwzOldAA
	 osJ3yN76wW3u4FhStb9e4KGjS9Mo6t/QqEM3YWwTU7e3waW9E7xLScO+x7ptIpxQE+Lh3
	 jnlGZS+Vcmp3bfekrBtkXDTcKatZgDlhln+2B9yhPq+mlFn2yNCpNLGA8WhNO11W5O+I8
	 zs4TwhX0pddqNREH79kVHwDMZbo6jHPFjvYKT8luD8GDq8bKCKUUzyCu5GQ5NI4B/Yr/m
	 FC2wdRiXRRqxk21ui3qDMJ03JuWW2y4Qyzv7OnbYEe1xDoVuMGkVwB0XZUl1fnVPk3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795216437;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GleaotWQee3JlNmgmMjdUZCltz74VVoKYJOyaFjqs3g=;
	b=UEqZGnA8I3f+9Um0SWGJ5XEyVQ9pqW15qiCErB40otPb+PDqFcmBw2UkQe6JQYRniGlT
	 ZzIamhbj/tmOqmbqxL4Cw0e3g1ym4QuGLNr/OMT1QY8v4MqmPEujmHLa9h0Lrvx6xTSEx
	 zlq/IxZ719A5CxGmvekOa+/IXDVNq2p1H6pCdihZUbnY+WRuHQAmNqXkxAE2o1ReUApV0
	 qbtaJEa/wAdrRPEPgXXmy0Vwl/n9d8CghjimRHqukZ4pECmq7TjoW9qc1bmlAiozsVaLB
	 McfzaB+F9Mwda5GnZ0sgy+0jKU2ZjXzOYQFdJ+LekMVZie+QRL4gpFsJFhKu+KXV9Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRD7RkSp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE8606A33D
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 23:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bRD7RkSp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548031F000C0;
	Fri, 20 Nov 2026 23:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795216437;
	bh=GleaotWQee3JlNmgmMjdUZCltz74VVoKYJOyaFjqs3g=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bRD7RkSpP3lZNnPBJ2XSJOrwkWYpb7+G6nQoTJVJe1/I5zcFqoybEN5ujuGoEtOMX
	 GebL8dseJG/7zWTcyUVnxPxEfCkOtbv7zKiqo5GuLZ6RbyVOc/WMyw2IM9lZm+n9Ef
	 6hFeqTX5Om159rJAEnN0fxKZ2g4UvCJCtqmqhgfaO76EmgJPCPoyThywpXTq39V60E
	 yaoHjC+QbJrVRLOMdxL3ocSEkvVppZoY0Jqw6tHos8RsyjEGHZxhs9jfPQLRgaEZl+
	 bNgvSr2hPRjxpXFHqeem31gtgh9DftnYg8VUY/xbFHJtV2SSnatxGADqb6zYlR0koy
	 RISsbQWOW0Izw==
Message-ID: <sashiko-outbox-226339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] clk: en7523: add support for .set_rate for
 en7581
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>, linux-clk@vger.kernel.org
In-Reply-To: <20261120225916.158641-3-ansuelsmth@gmail.com>
References: <20261120225916.158641-1-ansuelsmth@gmail.com>
 <20261120225916.158641-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:13:56 +0000
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
- [High] clk: en7523: division by zero in _div_round_closest() via
  en7581_find_best_rate()
--

commit e6dd4eae87f38e0af65399298c3f7bcf2f939553
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for .set_rate for en7581

This commit adds .set_rate and .determine_rate support for Airoha EN7581
clocks and switches rate recalculation to the standard clock divider
helpers.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 8c00646ecdc6a..f47f3ee75057e 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -773,11 +846,210 @@ static unsigned long en7581_recalc_rate(struct clk=
_hw *hw,
[ ... ]
> +static void en7581_find_best_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req,
> +				  const struct en_clk_desc *desc,
> +				  unsigned long parent_rate,
> +				  unsigned long requested_rate,
> +				  unsigned long *best_diff)
> +{
> +	struct clk_rate_request div_req =3D *req;
> +	int ret;
> +
> +	if (!desc->div_bits) {
> +		en7581_update_best_rate(req, requested_rate, parent_rate,
> +					best_diff);
> +		return;
> +	}
> +
> +	/* Treat each internal base rate as a fixed parent for the divider. */
> +	div_req.rate =3D clamp(requested_rate, req->min_rate, req->max_rate);
> +	div_req.best_parent_rate =3D parent_rate;
> +	ret =3D divider_determine_rate(hw, &div_req, desc->div_table,
> +				     desc->div_bits,
> +				     CLK_DIVIDER_ROUND_CLOSEST);
> +	if (ret)
> +		return;
> +
> +	en7581_update_best_rate(req, requested_rate, div_req.rate, best_diff);
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

[Severity: High]
Can this trigger a division by zero in _div_round_closest() when
requested_rate exceeds parent_rate?

en7581_determine_rate() loops over every entry in desc->base_values[], so
requesting e.g. 500 MHz on "gsw" (whose base_values are 400 MHz and
500 MHz, with div_table =3D=3D NULL) calls en7581_find_best_rate() with
parent_rate =3D 400 MHz and div_req.rate =3D 500 MHz.  Without clamping
div_req.rate to parent_rate, divider_determine_rate() ->
clk_divider_bestdiv() -> _div_round() reaches _div_round_closest() with
parent_rate < rate:

drivers/clk/clk-divider.c:_div_round_closest() {
	up =3D DIV_ROUND_UP_ULL((u64)parent_rate, rate);
	down =3D parent_rate / rate;

	if (flags & CLK_DIVIDER_POWER_OF_TWO) {
		up =3D __roundup_pow_of_two(up);
		down =3D __rounddown_pow_of_two(down);
	} else if (table) {
		up =3D _round_up_table(table, up);
		down =3D _round_down_table(table, down);
	}

	up_rate =3D DIV_ROUND_UP_ULL((u64)parent_rate, up);
	down_rate =3D DIV_ROUND_UP_ULL((u64)parent_rate, down);
}

When table is NULL and CLK_DIVIDER_POWER_OF_TWO is not set, down is 0 and
computing down_rate divides by zero.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120225916.1586=
41-1-ansuelsmth@gmail.com?part=3D2
