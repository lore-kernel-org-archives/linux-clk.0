Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116930;
	b=vS+OTim4UpuapBeMYX9n0ZBzQpIQBRuW3XuErx+9dE/U/U7irYv2554TCH5E4/VdfVOq
	 2PHbtXJCUV8xRV7QFTU/AmTaGCvwYukZpB8+RpCng/pykghKMF1t7eoFEyg/HgwdOZSGs
	 98bj5kcj7kAxZE1W6VXIoCzj1clrHtWkpMPeuTroaoPAaikKLulDTWjdrcLRTgWUwZrU8
	 LjUNBFGaVwlOeGmFljyOYlLIXdLgtQrkeG+NXRbUPDbt6sNzzpHfn1EDfeTfI7z0y4rT1
	 MDA0t9/MwxrBFLEu1ALzAd/FYd1JD4pkEfaU0bZUBG/OMAXgn5kNxmCEhY6HK9NE31A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116930;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=XKkr8NiBSfAxaPY+xmJ+lmd22XwqR6e5oteLmwQ0jc4=;
	b=EPkOKhuVoDfq2fVsPi/smWTfv8mvr39fRH6WXDuUkyi1pCDCECCHjRkLPE3o8wCmnIAD
	 g3HfNXR/x1cFmxFfZKaVZZwKwQEZvZ8UfGIDXJxc1zWZ0llNVHGOyldw7oloNVku58ULU
	 S1W+C6dT36l0JG/Y2xxpWD+94Ra/h1xWMJk+4YHLeq2alLZozDJ4v4anAtMBitY7Oibmc
	 jx/ZYFMo5M7pjFagO0a+8vb44NDCXPmcR0dOZ6oQXVLpKGBiJ3Nq0stzN0yTYSy5OhUCs
	 Lz1kER22NqE5fx9qudmC36Bz3FfYZeNalWSokCMpa+uDukeVZhE9Pg7yGphreCVTkow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLBmGYo5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24E606A330;
	Thu, 19 Nov 2026 19:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLBmGYo5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740E1F000C5;
	Thu, 19 Nov 2026 19:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795116930;
	bh=XKkr8NiBSfAxaPY+xmJ+lmd22XwqR6e5oteLmwQ0jc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TLBmGYo5ak00zcdtdDmARhL65KF/0mgK42lYCvBTVNRxq8Ar2HJ81SIE/9GiJsv+a
	 rtzLqtoqA9DG6De6jfFrDLAxz556XX2xDetpNeFDOK1EjBMNAxwR9BmY0YnYiBNrt8
	 HP8rLPUUdACSH/eTiw2cArBwzQ65gfKKyCybIHVLUcwO05Nt81TwPDZq0ACtcve4wf
	 hSlt1oNu8MIVN5QT4JKN+weM2JPC58G3hIqRD7fJ4flnXrxRlwEZdyGynBB+9Lk+Ie
	 DYJFLl/x2XjP9Jm7XRMzkRD/xfSHY1s5aoEJ5NkDGJCnRPkDazjj0jqUAJ6MHhoYkt
	 wAKkWbb7igOJg==
Date: Thu, 19 Nov 2026 14:35:28 -0500
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
Message-ID: <av9PgKqFIjNPSkTt@x1g10>
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-2-ansuelsmth@gmail.com>
 <179444135864.1126566.17591616173966524369.b4-review@b4>
 <6afc8629.c6df0648.3437b8.c961@mx.google.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6afc8629.c6df0648.3437b8.c961@mx.google.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Christian,

On Tue, Nov 17, 2026 at 05:51:50PM +0100, Christian Marangi wrote:
> On Wed, Nov 11, 2026 at 06:55:58PM -0500, Brian Masney wrote:
> > > In preparation for support of .set_rate, convert the clock register
> > > logic from fixed clock implementation to full clk_hw implementation with
> > > dedicated OPs for Airoha EN7581 SoC.
> > > 
> > > This is just a rework and no behaviour change is expected.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
> > >  1 file changed, 55 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > > index 24fdec2e6198..6640e814d36a 100644
> > > --- a/drivers/clk/clk-en7523.c
> > > +++ b/drivers/clk/clk-en7523.c
> > > @@ -126,6 +126,12 @@ struct en_clk_gate {
> > >  	struct clk_hw hw;
> > >  };
> > >  
> > > +struct en_clk {
> > > +	struct regmap *map;
> > > +	const struct en_clk_desc *desc;
> > > +	struct clk_hw hw;
> > > +};
> > > +
> > >  struct en_rst_data {
> > >  	const u16 *bank_ofs;
> > >  	const u16 *idx_map;
> > > @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> > >  				     en7581_rst_ofs);
> > >  }
> > >  
> > > +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> > > +					unsigned long parent_rate)
> > > +{
> > > +	struct en_clk *c = container_of(hw, struct en_clk, hw);
> > > +	const struct en_clk_desc *desc = c->desc;
> > > +	struct device *dev = clk_hw_get_dev(hw);
> > > +	struct regmap *map = c->map;
> > > +	u32 val, reg;
> > > +	u32 rate;
> > > +	int err;
> > > +
> > > +	err = regmap_read(map, desc->base_reg, &val);
> > > +	if (err) {
> > > +		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> > > +			desc->name, err);
> > > +		return 0;
> > > +	}
> > > +	rate = en7523_get_base_rate(desc, val);
> > > +
> > > +	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > +	err = regmap_read(map, reg, &val);
> > > +	if (err) {
> > > +		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> > > +			desc->name, err);
> > > +		return 0;
> > > +	}
> > > +
> > > +	return rate / en7523_get_div(desc, val);
> > > +}
> > > +
> > > +static const struct clk_ops en7581_clk_ops = {
> > > +	.recalc_rate = en7581_recalc_rate,
> > > +};
> > > +
> > >  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> > >  				   struct regmap *map, void __iomem *base)
> > >  {
> > >  	struct clk_hw *hw;
> > > -	u32 rate;
> > >  	int i;
> > >  
> > >  	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> > >  		const struct en_clk_desc *desc = &en7581_base_clks[i];
> > > -		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > > +		struct clk_init_data init = {
> > > +			.ops = &en7581_clk_ops,
> > > +		};
> > > +		struct en_clk *en_clk;
> > >  		int err;
> > >  
> > > -		err = regmap_read(map, desc->base_reg, &val);
> > > +		en_clk = devm_kzalloc_obj(dev, *en_clk);
> > > +		if (!en_clk)
> > > +			continue;
> >
> > return -ENOMEM;
> 
> Hi Brain,
> 
> as you pointed out in the previous revision, returning would change the
> behaviour so I currently skip the clock in such case...

It's ok if it changes the behavior to make things interact with the
framework correctly. I just pointed out that the commit message says
there is no behavior change. You can drop that sentence and just
describe the behavior change in the commit message.

Brian
