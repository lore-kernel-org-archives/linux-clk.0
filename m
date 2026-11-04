Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826149;
	b=K9iJDMnlD7rXIHiXKygNYItvzMWk2x2facTEmSFktct3due38hYD5E5kdCyoFg6+KuTi
	 2XC4rquewEm2faJrmMvudR5FK3D9/jqK51Fk2YC/WHmrMA65fEDQYNgC5GYesDwOI5BDT
	 PG6KY3kRFA2qdvD/0FOkxcE3289T8zHsLciqK5f4rgTiVghVPy2rLhKlM9yKrQl67FFOO
	 9mR23XgLL7n8VT4haAlxGX4Tmb599WzmNulPVdkWDooStqC0hzA8nI6eJPkAg1DjLNVpl
	 guhJ+pi7tg1o96STv2hEig977c7rpRlhk2COMqT+rvgu8PqsbbWLSGS2n78alaaP/UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826149;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RWQaJx7o1r9T3C4HT9jQSAnvNhpydGKzP/mY7ruS46w=;
	b=OMsYf+nAY/jeFGfQX33suc8JFQYEOUarpaEnV1GU4Fd1G4nEmDqCaWiVo/4QftAEYRCG
	 4wrcstA2/y8pwpjg1G+ZxrKx0w0B8H6L4BorXnrfnKETcOzP/t6oWQUz/g/1J5toSavOY
	 FGBHGDeHasDEyvwInrFp2f26B8OLlucPVs0K5dkhU3Ifg1zFggTvVSF40tN/GbEVF6xLx
	 s83Ui2lCyTtCXjEKW8HNFZybDtFvYcg2PwjliFzLm5xtepP3TT3BSxhchx44ctj6m/Lit
	 D0noPWzeXq6XxmKjB298EDqxI+t5EFjItnco2NA/4a5T5p6C8JP/YZ8i+axvXRTyq2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+rYZ2qd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD2606D4CC;
	Wed,  4 Nov 2026 21:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K+rYZ2qd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4E51F0093A;
	Wed,  4 Nov 2026 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793826148;
	bh=RWQaJx7o1r9T3C4HT9jQSAnvNhpydGKzP/mY7ruS46w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=K+rYZ2qdeYyHQWL45e7EGdqPSGvwm/bZ9KxAh5/axd/XSCRBrqSWRK1mmJBWjjf+Q
	 U/7/iMefA5qB/Y9WOAJFgZ2yV+2LoiZrJJNFCKG6zJ2slrifiGz0Ue/chQ+5mxSXv3
	 MIaz4QTBzGdxy+hKfsqtmbym1NmtHrRwDnTrSMPhbBQeqcfFc+B/NkEjbvPpfkbseO
	 4EW5jeog1HoHtAArzKzjkmFk87PKcDgPbXLj9J0qbkGTAmAM9g2bgqUzLWDb/9FYa5
	 Isc+0SFsSbpLrltuTrqpPPH6xQ8RU1ThpC0QJP1kZBWCplKTwzz1nRqGytjqUQkADK
	 q8mIdwYVp2lpQ==
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
Subject: Re: [PATCH v2 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261103205500.14974-2-ansuelsmth@gmail.com>
References: <20261103205500.14974-1-ansuelsmth@gmail.com>
 <20261103205500.14974-2-ansuelsmth@gmail.com>
Date: Wed, 04 Nov 2026 16:02:12 -0500
Message-Id: <179382613235.620422.16434713665930629800.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=4096; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=dHa7rXu7wgdSwh0CPTWp3CoGJ6of+1H/SUSA3chwwqY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJezw13ON+1WPd7iOI/Yb7Lix47MPY2Ms3lcA9+zRkbv
 vHHmbypHSUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzE7DTDfw9FnaOrJ84/Yj1b
 XnXepoLX2q5XGyYua1JkPXHxqZPmqXcM32NqHhZO36D40HOZ5LWpB/mcdfP1OPbvnmoqGM3z5/V
 vRgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Christian,

> In preparation for support of .set_rate, convert the clock register
> logic from fixed clock implementation to full clk_hw implementation with
> dedicated OPs for Airoha EN7581 SoC.
> 
> This is just a rework and no behaviour change is expected.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 86 +++++++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 24fdec2e6198..aab4306ae037 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -126,6 +126,12 @@ struct en_clk_gate {
>  	struct clk_hw hw;
>  };
>  
> +struct en_clk {
> +	struct regmap *map;
> +	const struct en_clk_desc *desc;
> +	struct clk_hw hw;
> +};
> +
>  struct en_rst_data {
>  	const u16 *bank_ofs;
>  	const u16 *idx_map;
> @@ -742,46 +748,76 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
>  				     en7581_rst_ofs);
>  }
>  
> -static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> -				   struct regmap *map, void __iomem *base)
> +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct en_clk *c = container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc = c->desc;
> +	struct regmap *map = c->map;
> +	u32 val, reg;
> +	u32 rate;
> +	int err;
> +
> +	err = regmap_read(map, desc->base_reg, &val);
> +	if (err) {
> +		pr_err("Failed reading fixed clk rate %s: %d\n",
> +		       desc->name, err);

Use dev_err() and elsewhere in this driver since a struct dev is
available here.

> +		return 0;
> +	}
> +	rate = en7523_get_base_rate(desc, val);
> +
> +	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +	err = regmap_read(map, reg, &val);
> +	if (err) {
> +		pr_err("Failed reading fixed clk div %s: %d\n",
> +		       desc->name, err);
> +		return 0;
> +	}
> +
> +	return rate / en7523_get_div(desc, val);
> +}
> +
> +static const struct clk_ops en7581_clk_ops = {
> +	.recalc_rate = en7581_recalc_rate,
> +};
> +
> +static int en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> +				  struct regmap *map, void __iomem *base)
>  {
>  	struct clk_hw *hw;
> -	u32 rate;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
>  		const struct en_clk_desc *desc = &en7581_base_clks[i];
> -		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +		struct clk_init_data init = {
> +			.ops = &en7581_clk_ops,
> +		};
> +		struct en_clk *en_clk;
>  		int err;
>  
> -		err = regmap_read(map, desc->base_reg, &val);
> +		en_clk = devm_kzalloc(dev, sizeof(*en_clk), GFP_KERNEL);

devm_kzalloc_obj() is now available in the tree.

> +		if (!en_clk)
> +			return -ENOMEM;
> +
> +		init.name = desc->name;
> +		en_clk->map = map;
> +		en_clk->desc = desc;
> +		en_clk->hw.init = &init;
> +
> +		err = devm_clk_hw_register(dev, &en_clk->hw);
>  		if (err) {
> -			pr_err("Failed reading fixed clk rate %s: %d\n",
> +			pr_err("Failed to register clk %s: %d\n",

Use dev_err_probe()

>  			       desc->name, err);
> -			continue;
> -		}
> -		rate = en7523_get_base_rate(desc, val);
> -
> -		err = regmap_read(map, reg, &val);
> -		if (err) {
> -			pr_err("Failed reading fixed clk div %s: %d\n",
> -			       desc->name, err);
> -			continue;
> -		}
> -		rate /= en7523_get_div(desc, val);
> -
> -		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
> -		if (IS_ERR(hw)) {
> -			pr_err("Failed to register clk %s: %ld\n",
> -			       desc->name, PTR_ERR(hw));
> -			continue;
> +			return err;

Prior to this patch, a registration failure was logged, and the other
clocks were tried. Now the probe fails. This is fine, however the commit
message says there is no behavior change. This change should be called
out in the commit message.

Brian

-- 
Brian Masney <masneyb@kernel.org>
