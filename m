Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117949;
	b=yeTk0KaYAn3+oxbnvv88czTztLGIQXTTIulci09++qLW2bxmx5dWIj4gcmM/WVbzofYi
	 MKXooIGTB1B8wcm2HkmVUGwXGL2Km+Nx9kQC6RXW7The1+Ufzj0MFEFoVW/zdkqxho8m6
	 ZivPECTxsCQUtyyf4vz4nkOEEtzdacOe3R8cKhbo00oZTnMFOEHw0vX4jTXCwy405KPwq
	 w6l1pR1WqMm/JwAK2mA4VNPFdROPZd9MlfzNFCxsQjYh6V9cD+Gg38vIT4w+vj7q0GlPD
	 17yLxY/02wvv1AAI1P36LduAj31+zO/BBNF6HzKzKrDQQ0BhLIlur4evcCAL4rLjyZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117949;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=X2FvG0ad5eCUYCLKQwToE2PJoUCfL1c541yWsdz/YTo=;
	b=Vfwd6rZCbh95SfUsq8aZqcx02ZGMiN023u3PyTC8Tm4il3fkS6e0YH4qT0gXEHKviAbb
	 0N8kRCarOovJcAACbFjnblaKRJHcZRQuSvR2NhvUeFQkTITgVKq82PWMlvcQ3xlMkxM04
	 XoUSht5ZSV4xjoUsQBDg2qLqPQgdCdo1ifcm+nV80dOiCfLmpttv5l5QpysF2qpKmccao
	 vf54w4+/l8uNYDsg1XWJqXzrDRiPHY4875M5MkLkTtzt+oUyNrPL04XCjYdWpV+7GDs7N
	 O20C1LIyoQZQcVVRB5lGdEHsh4wSil27CelzopcFU04G1iEjMjepIeyhLNd1+2Tpt8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H86DdZ5a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97C606A325
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 19:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H86DdZ5a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D329E1F000C6;
	Thu, 19 Nov 2026 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117949;
	bh=X2FvG0ad5eCUYCLKQwToE2PJoUCfL1c541yWsdz/YTo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=H86DdZ5ag7p7gvJW9oHcN//MdWrkb4euq+isSu2c7DcM+6wC1m9ZuZdGYOCU0IPSm
	 RdXmkIH/udGgVFJFFmYCMeIzYW6feM/JC4WUbujTDVZBWdiMn7NMEcE8iZdbvYt9BK
	 aDEGQWmXCjpx16JSTCCG+Fg7NyqX5jVMmp8/RMXJNtyFBl6FlyEsDK+DtTBP2d6Gs1
	 7IZUtPAarWJlZGPvktvq3/wbUgmg4z/hRsL/jpq7Xo/FhZTBR1JFm3YIronbpFEqdj
	 pGgvyNTJLDtqparaB3nxVJkyIfErp7W0cylN5/1HoyQXZqofOlpucg8ZFN6At9U+Y8
	 2Tie+wfq4PeYQ==
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
Subject: Re: [PATCH v6 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117180213.88046-2-ansuelsmth@gmail.com>
References: <20261117180213.88046-1-ansuelsmth@gmail.com>
 <20261117180213.88046-2-ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 14:52:23 -0500
Message-Id: <179511794323.284394.6522107183623644996.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=2774; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=tQRLcRbFPyh5z2MGY/JRZ+BkE+GDOTjgxRdJqdC2X+s=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+B1c4LtvXX1b9aPKlKaenh91m3BhjIL9Q69Sy46rXp
 5rduBW9tKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJiIkwMtx82RfvkaH0b9mH
 D1d9jSb37jReemmzVMHPd7xppqdnKZ9gZJjYGboqYemJh8K6P4Wv7DpjOPO2gySPZb6IrbLz2f7
 8y/wA
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
>  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 8f63482cbb7b..634e75348c71 100644
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
> @@ -741,42 +747,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
>  				     en7581_rst_ofs);
>  }
>  
> +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct en_clk *c = container_of(hw, struct en_clk, hw);
> +	const struct en_clk_desc *desc = c->desc;
> +	struct device *dev = clk_hw_get_dev(hw);
> +	struct regmap *map = c->map;
> +	u32 val, reg;
> +	u32 rate;

The u32 lines can be combined.

> +	int err;
> +
> +	err = regmap_read(map, desc->base_reg, &val);
> +	if (err) {
> +		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> +			desc->name, err);
> +		return 0;
> +	}
> +	rate = en7523_get_base_rate(desc, val);
> +
> +	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> +	err = regmap_read(map, reg, &val);
> +	if (err) {
> +		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> +			desc->name, err);
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
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
>  				   struct regmap *map, void __iomem *base)
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
> +		en_clk = devm_kzalloc_obj(dev, *en_clk);
> +		if (!en_clk)
> +			continue;

return -ENOMEM;

Brian

-- 
Brian Masney <masneyb@kernel.org>
