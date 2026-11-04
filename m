Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826150;
	b=mUDK4I5kbnu37TuDzL18l7Nw8QmfjzpdBWlnxiQ7FPhoiLb8JpAwpTGoRauciATZWj7V
	 KDaYeYuMJLrHIRe3jzRpGmWZQUB8hbFgRvYDIc5pVedJ6mvo9o5uf6wUz2ov7M86c3NHT
	 qaAdf6AXgviaxkA/1l1XvOFF4HcDtsyqsFGjledo8Zjvx3zZ3O7aJxvjMZ2HYHCCDaXdX
	 INkKDkZ7o+G8gkV5WtqiQzC2T1HVLuQrpac3kH4FvXb6mKWSqRyCZUHJ4AxCmAS1n0iJ/
	 O8QBl4ppGpxT2P+KfVgMFAfQhf1lkd6A4pdFB03QYMMrgoDthupktYwbz1bDBDg7uQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826150;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Q8kQAFfFv+Tk9IA1MC9W1/r4oqlc2CdHUpjWypDOPUA=;
	b=mhsa08kyzHvfJFaliDkJn9psdWIaHmYlI70AmZLdzwT5xMjis1TevnS8zaVdCvlI+z6E
	 7vodTcL3AHxDkhE3sApcKl4OCbfrTagQBwmWguE0E+RnPNUomycgH5rmHjA2ch9HN1ZsJ
	 RMjvUy/rFtrqaqNhhEc+aOBo3KwvDkGYvuRZv/EzPcK/HcZwlVBg2n9H08Ciyt0QVTiBD
	 pGK2Xk+PaVBTOx1o0Q5TgcQ5fAb98zfn4BtOHYwd81fESMy1PQ1kR+vNlHEbGMpQxv7Xv
	 EoPWNUKbFZD/nTyl/FewJ8vtQccZfG/LASY0p+3teNfg/xUJ0EAUmjsLe5vrYqfbbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyq3j4P1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE72D606D4DB;
	Wed,  4 Nov 2026 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dyq3j4P1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A847C1F00919;
	Wed,  4 Nov 2026 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826149;
	bh=Q8kQAFfFv+Tk9IA1MC9W1/r4oqlc2CdHUpjWypDOPUA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dyq3j4P1UAAXmEmU+jbrGKm9Gh3fOy1vMNeDL6lk4d7XnEtViiNfYfPaOvccRjVbk
	 E4mQIlWkQ3+KCTBJI/h5gmW7WYPhOEbpcF8WGoTdwW0pW8YOPAvb8XNG30RLHAKvkH
	 vZkm0hXuf/QJz7gog2SB57D+Q8S8pnVm1euEKqXbanaOlV40bcpEzbsXZb+1BU+ZeV
	 fDbpU57mmWCJdXXFgnZHx8FbNnzcFTnB9z7u1VuLPecQsFNtEdKkgmHZrEFmKcw9jO
	 D91JaM1NxVLnxoso2pASi/IY1IDwudaoLCR9AZlzqHPxTrvJjU7G81S6TgbvTk09gG
	 OlJyKyey+EMOw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] clk: en7523: add support for .set_rate for
 en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261103205500.14974-3-ansuelsmth@gmail.com>
References: <20261103205500.14974-1-ansuelsmth@gmail.com>
 <20261103205500.14974-3-ansuelsmth@gmail.com>
Date: Wed, 04 Nov 2026 16:02:12 -0500
Message-Id: <179382613236.620422.4831269606969371751.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=dDWFZI4JaxwlPXxTETYqIbJ/iRrpsQTX+QjUXsujZCo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJez42xyZi1PdriY+CFwLPTt/sGep86kPPfUkrbTfLuq
 vf779+U6ChlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiJw4z/M/esvdw3iT/2cej
 127ufKTyzUKVTc131onfnZI/9nIxtm1mZNj210b1euvT3+dTL2xl51ScOz3pkcDdjdMPzfXl4xJ
 9zsoAAA==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> Add support for EN7523 driver to configure rate for Airoha EN7581 SoC.
> The SoC expose both base clock selector and clock divisor hence it's
> possible to change the rate.
> 
> This will be especially needed for new SoC AN7583 that require changes
> for the MDIO and the eMMC.
> 
> The clock were assumed correctly configured by the bootloader but this
> goes against the rule of "kernel should not depend on external
> configuration".
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 136 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index aab4306ae037..5ce4dc692ab2 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -777,8 +777,144 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
>  	return rate / en7523_get_div(desc, val);
>  }
>  
> +static int en7581_get_base_val_for_rate(const struct en_clk_desc *desc,
> +					int div, unsigned long rate)
> +{
> +	int i;
> +
> +	/* Single base rate */
> +	if (!desc->base_bits) {
> +		if (rate != desc->base_value / div)
> +			goto err;
> +
> +		return 0;
> +	}
> +
> +	/* Check every base rate with provided divisor */
> +	for (i = 0; i < desc->n_base_values; i++)
> +		if (rate == desc->base_values[i] / div)
> +			return i;
> +
> +err:
> +	return -EINVAL;
> +}

Can this be updated to use the common functions in clk-divider.c like
divider_get_val() rather than rolling this same functionality in this
driver?

> +
> +static int en7581_get_vals_for_rate(const struct en_clk_desc *desc,
> +				    unsigned long rate,
> +				    u32 *base_val, u32 *div_val)
> +{
> +	int tmp_base_val = 0;
> +	int tmp_div_val = 0;
> +
> +	if (!desc->base_bits && !desc->div_bits)
> +		return -EINVAL;
> +
> +	/* Divisor not supported, just search in base rate */
> +	if (!desc->div_bits) {
> +		tmp_base_val = en7581_get_base_val_for_rate(desc, 1, rate);
> +		if (tmp_base_val < 0) {
> +			pr_err("Invalid rate for clock %s\n",
> +			       desc->name);
> +			return -EINVAL;
> +		}
> +
> +		goto exit;
> +	}
> +
> +	/* Check if div0 satisfy the request */
> +	if (desc->div_val0) {
> +		tmp_base_val = en7581_get_base_val_for_rate(desc,
> +							    desc->div_val0,
> +							    rate);
> +		if (tmp_base_val >= 0)
> +			goto exit;
> +
> +		/* Skip checking first divisor val */
> +		tmp_div_val = 1;
> +	}
> +
> +	/* Simulate rate with every divisor supported */
> +	for (; tmp_div_val < BIT(desc->div_bits); tmp_div_val++) {
> +		int div = (tmp_div_val + desc->div_offset) * desc->div_step;
> +
> +		tmp_base_val = en7581_get_base_val_for_rate(desc, div,
> +							    rate);
> +		if (tmp_base_val >= 0)
> +			goto exit;
> +	}
> +
> +	if (tmp_div_val == BIT(desc->div_bits)) {

This is always true, right?

> +		pr_err("Invalid rate for clock %s\n",
> +		       desc->name);
> +		return -EINVAL;
> +	}
> +
> +exit:
> +	*base_val = tmp_base_val;
> +	*div_val = tmp_div_val;
> +
> +	return 0;
> +}
> +
> +static int en7581_determine_rate(struct clk_hw *hw,
> +				 struct clk_rate_request *req)
> +{
> +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> +	u32 div_val, base_val;
> +
> +	/* Just check if the rate is possible */
> +	return en7581_get_vals_for_rate(en_clk->desc, req->rate,
> +					&base_val, &div_val);
> +}
> +
> +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
> +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc = en_clk->desc;
> +	struct regmap *map = en_clk->map;
> +	u32 base_val, div_val;
> +	u32 reg, val, mask;
> +	int err;
> +
> +	err = en7581_get_vals_for_rate(en_clk->desc, rate,
> +				       &base_val, &div_val);
> +	if (err)
> +		return err;
> +
> +	if (desc->div_bits) {
> +		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +
> +		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
> +		val = div_val << desc->div_shift;
> +
> +		err = regmap_update_bits(map, reg, mask, val);
> +		if (err) {
> +			pr_err("Failed to update div reg for clock %s\n",
> +			       desc->name);
> +			return -EINVAL;

return err;

> +		}
> +	}
> +
> +	if (desc->base_bits) {
> +		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
> +		val = base_val << desc->base_shift;
> +
> +		err = regmap_update_bits(map, desc->base_reg, mask, val);
> +		if (err) {
> +			pr_err("Failed to update reg for clock %s\n",
> +			       desc->name);
> +			return -EINVAL;

return err;

Brian

-- 
Brian Masney <masneyb@kernel.org>
