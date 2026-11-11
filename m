Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441377;
	b=n3kvStbJF1OtXRMqeuPPMOxR0FMbaHU6fT1ESL8lxkW/8lj5vCP5BKB1x6Qu/ifMP37R
	 3G1gP4jgY+IfuFkqxLbLqDFza3nh0OjhGq/iOihqATWmLqj0gO51kjhTC/Z5VX6wCPLXl
	 R0ORO3eoWgIiQC1kpxsv7PrnR2aO/xIrwpbc12bhOq6wUGzf2srS7NWIpi05WgHHUTXva
	 kHXVi66UivTr3dfbmTrZnkhogcwTcaPrgTvqg/ygG5nXvbfkrvnV382ywU52m8xqs+d4o
	 RFnJm5utjK4VhDUU3YYa264ihu7S0U2F4+2tvdS1M7ZKBpl/2th5a6sPiJlFjfXL9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441377;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zSN2mPLgznkZ66dQirA9k9L0Cg5yiiaQYqMBSEH74VI=;
	b=MV0yrj1NOT7xKmDivVYB8Z6IXiQP6s3S4cDSDXglgl0lzjIa5GxEa5sbxR69cM0lIC9M
	 oIfsVBW8WVJKURIoi/2XuCKqoi82wUxk+PTIx67ru7lcvfGlKYFVYUZI0OKO0o3o75fb/
	 oRNha7+8AE+A/UdKdsATmbdWRO3B0R4XuDFedmJos1ECTpedcSxZW6G480GAXbRdY8gzV
	 LJrYldS9iXAVdwGrpEjIvipkb3dq+66UP7/ll4GeUAQ7KnxgYXzVbS1QRYmd1wfUgyOJx
	 fUB7XHurkigo3PWlnn/yRvYwzc/4GKo74cbjIvef/fbPBRDgMW/4JLSaAfAq1X/bKvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qo00FCtC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41396606A32E;
	Wed, 11 Nov 2026 23:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qo00FCtC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E841F00A08;
	Wed, 11 Nov 2026 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794441377;
	bh=zSN2mPLgznkZ66dQirA9k9L0Cg5yiiaQYqMBSEH74VI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Qo00FCtCb8jjWRdidwiP6IMRKE4/8ExdeQrfAu0yG23GRDLU8kubbgju8xh9GOGki
	 VIxFpbLhS2vnJWtcdqPdzqZ5yGumyzAlxWOHTN6MU9Dztq5w8dOHwdzvMoqG74pS0B
	 9er6mkF8Ee1isVwC05koYFQhXabxaMiCUiusaWneqL71sUyj9GuDa6TRPmA6TTiYQ0
	 VymkgoL5ejrLcmvDfhY6TB8IknpDojUJFRMOcd8t/XRr44uI20bayzYGVzVVV8IK0Y
	 vRxlN5Qw4gTjyPOj8qLg6TjvesppsxJfNHKUCzI7wUnJafXLJJY3nVXobT4vtnCZtP
	 JGwfCpuf8IuRQ==
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
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261110001128.1041-2-ansuelsmth@gmail.com>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-2-ansuelsmth@gmail.com>
Date: Wed, 11 Nov 2026 18:55:58 -0500
Message-Id: <179444135864.1126566.17591616173966524369.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=2738; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=jwQckfXaCmlBmUGH1WPfWJxlOZVOEYZrCJA4Fa9puOs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+MkzenlEftSLL7cXKbGPu4D0Cfe2X7T8dXJUksDo9Z
 2mXywW7jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZiI8nIsGTDhAWL56a/UJeo
 u2rYW/WLWWPblvcWmw7Mnna8umxO31pGhpfzvuUbW7DIsYR6BlltncK8wu/LEbMV8mHl1laOfwX
 K2AA=
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
> index 24fdec2e6198..6640e814d36a 100644
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
> @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
