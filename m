Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934316;
	b=tv4SEQXT300MQU5qX+87e34L3dYY376YwYYDljKz7sCCPPabf2LJ3jMNHKyxZuh8x0e6
	 cbmWWXHKc8Qt2AumZm0QfLcIzldKRnKFAHV9KF+boZm7L5I26aZqqfQabBpXdhvgI8pM+
	 RZ/gFK8aAgEInPOATBYX4gZShJBe/TNnWNn3MbibK0oW+nRO0uSlenVes/0o6+wMEG6s5
	 i9EMWaSAs9jhID2lTdnrp9iIbTfZlujMmA2wQ8BAZdPyBKiesNRgka/msLmORRP/AKXb8
	 unkUAvpNl0HDGL5ATQ2cAcuSficHyKCCjeBHrr4dCPuB4c8KTzlhe5FjxM+VM0WBeCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
	b=B6tx45rYiMSOsmdZeyVy+5ZBOXXiXcLRintf9t+S/difVRzRRydac93EqiW+TUiXp1HV
	 IoaVxHkySMqqs0VtT0VdFqcTuXcgEeqSbcloOl5Rg7EoDvgeFmX66MGt5fJGbUoT1ovp/
	 IypdHqDXoz1F2QFUaGx774AIvP1h8IRX2osRn8U1JpBuMcE2Depw2kW9HUGMmxdQm6Wqp
	 TSphDvEIV8Fp5op4aidAAE1v1QmL57sZFZMPos0QjAQnxZtBZEKhFTYL85hYr2j6kLw4x
	 Zf57mHI+Eb3pI08CZIpv1NlVEVyQazb6tc/EEGH7/tjTIBrAjmRJRC1EkWL8AeEw/yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3lm6A1h;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910D606A339
	for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 16:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0910D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3lm6A1h
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3601314f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934314; x=1795539114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
        b=m3lm6A1h/g3+iQL8eExyC3I2hvkQjMSCtoivGEv+A9rz1CMkEeXo11qkgi9C56129d
         ZStkj+u9+4oTRYLOAA8H7gU2VpyjrTPUY8HcH1+n+EBixlFu7+OKzuA8dfuUBNiJIp7b
         3wnhZtAT54lSxLGIn7U1R6tfV/yy9tgRv67KljQsVJZ+QCPBw8rhAx8xIFenF68UTLKz
         sGRlQfnKcOiP0p9ndB+7ZGpmwOK/EUyfrI5hs5ahw0EGcMWju81ysSZqNtxncPnQ0giY
         WjfamWL6wndgQq8BMtYB385J0v5z+5NVWwNaEa4R6E/QvoatGc8X0NUKxrdVvA0HW/wB
         fwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934314; x=1795539114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
        b=WFHEQitcCg3wGLfHpc/YG7voY72IMnjwe4Je1dIIosevlL3wFM43jfAZnwngNU8rvk
         AfSQiveA8qjTNQ7GWSBuCSSQl7XsMPNuV5ymvqqqNdFFEg8VO1Je/8cHME2ocmIQqtbb
         8C3L2KWXFsAmGkTIKgZEVfNG5uyfAO/wieDpOE/p/CdDCkfZz4mD84y+vz4yGIvwKZOW
         /JbOLX0Q4JTUAZy9wBUiQWeQ6ahxk9Cqx0zlYR+/77sFBtt8bqSnmgrgO0ZGgmJD8N6Y
         vHoE+xmBWv3B+0zwslBbnPhLIN16M85TWzVesAp1NgTOWmsAd3BONSFSHzBu+zOAUDCg
         SwYA==
X-Forwarded-Encrypted: i=1; AL+hErGT1elLhBGz172Wcz9kmMHedUwU+ZopcrxqHIXSBUJ/T21Qu5AtCARV+rusFNqA4b5pmCNYjvr9vpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yEyOUeg3+lI1bOMSATi4PiZfthkNr7D7qF80epkhclQnzaCdD
	1VJxMbbZhcNQ+WuNRO+4XL37kuoP4gSEWCtjyHMYJeLrXueepDAF9DE5
X-Gm-Gg: AZFdTZeP8r11yCPwbgWrOa3aGdnuseJlLT2gaNru21Mion1lFXYxHoUjDkIJ7mnEAf2
	m0pk5ePfgxMQ5ue6JIB9N4ZUBxubqSbeRqwAyOSLHJ0WQPrGOyeXT63j/Rr8AqdBCduuQ/PdXAK
	b/6AGm1ORMLjoSE1FwveXxA+EhLtGwL5GmTUHbvkGDUgCBXNRXhSiaLV7a1n+04zUoAK6aIK7TF
	k1D1UYQZFgS7aSBPEvyHD6zBZJQjmNtWReXB1uAODIinu+/hNPdTHsmAs/O6EQiysdoyIhgEoxA
	pUDWKvgWyLfunZIzszbEKmtecyk4tgj3E/Tc+TELORfRdNnWzCofJBwz8c2r6N15/lyhEjN3mfb
	imGMZ18sQIHthqaYN690D9bb7KZtHYZ9RMZVLxRZaC4nKoqs1emFZulB1HxfVgxM3mT+omM08y0
	8y91D7GO58BcQYebgjQfQEUz8hwpH/ik7JEYNyqB7u0rbBan5SZDqV+oStteeOJvnCeUfeKylL3
	Tkdq5/BgJoGEjUZtqs1Ggj5PTOce2YRMd/6l30dFrqGldRd+L+of4rVjMOYngJJ8D1BqA2dtZjv
	W+sayKpIsZ41f63Kmoy6Uh+0hBLG3jnE/F6DxMrVgQ3ajyjJNcHhXF6zT9f7Eqo2aeY7RvnBo+L
	oUPKsLloIFoI7Uhj1
X-Received: by 2002:a5d:5888:0:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-4a638058303mr43112f8f.9.1794934314251;
        Tue, 17 Nov 2026 08:51:54 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm30846431f8f.40.2026.11.17.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:51:53 -0800 (PST)
Message-ID: <6afc8629.c6df0648.3437b8.c961@mx.google.com>
X-Google-Original-Message-ID: <avyGJqEgNXfFXb8s@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 17:51:50 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-2-ansuelsmth@gmail.com>
 <179444135864.1126566.17591616173966524369.b4-review@b4>
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
In-Reply-To: <179444135864.1126566.17591616173966524369.b4-review@b4>

On Wed, Nov 11, 2026 at 06:55:58PM -0500, Brian Masney wrote:
> Hi Christian,
> 
> > In preparation for support of .set_rate, convert the clock register
> > logic from fixed clock implementation to full clk_hw implementation with
> > dedicated OPs for Airoha EN7581 SoC.
> > 
> > This is just a rework and no behaviour change is expected.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
> >  1 file changed, 55 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 24fdec2e6198..6640e814d36a 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -126,6 +126,12 @@ struct en_clk_gate {
> >  	struct clk_hw hw;
> >  };
> >  
> > +struct en_clk {
> > +	struct regmap *map;
> > +	const struct en_clk_desc *desc;
> > +	struct clk_hw hw;
> > +};
> > +
> >  struct en_rst_data {
> >  	const u16 *bank_ofs;
> >  	const u16 *idx_map;
> > @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> >  				     en7581_rst_ofs);
> >  }
> >  
> > +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct en_clk *c = container_of(hw, struct en_clk, hw);
> > +	const struct en_clk_desc *desc = c->desc;
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	struct regmap *map = c->map;
> > +	u32 val, reg;
> > +	u32 rate;
> > +	int err;
> > +
> > +	err = regmap_read(map, desc->base_reg, &val);
> > +	if (err) {
> > +		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> > +			desc->name, err);
> > +		return 0;
> > +	}
> > +	rate = en7523_get_base_rate(desc, val);
> > +
> > +	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +	err = regmap_read(map, reg, &val);
> > +	if (err) {
> > +		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> > +			desc->name, err);
> > +		return 0;
> > +	}
> > +
> > +	return rate / en7523_get_div(desc, val);
> > +}
> > +
> > +static const struct clk_ops en7581_clk_ops = {
> > +	.recalc_rate = en7581_recalc_rate,
> > +};
> > +
> >  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> >  				   struct regmap *map, void __iomem *base)
> >  {
> >  	struct clk_hw *hw;
> > -	u32 rate;
> >  	int i;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> >  		const struct en_clk_desc *desc = &en7581_base_clks[i];
> > -		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +		struct clk_init_data init = {
> > +			.ops = &en7581_clk_ops,
> > +		};
> > +		struct en_clk *en_clk;
> >  		int err;
> >  
> > -		err = regmap_read(map, desc->base_reg, &val);
> > +		en_clk = devm_kzalloc_obj(dev, *en_clk);
> > +		if (!en_clk)
> > +			continue;
>
> return -ENOMEM;

Hi Brain,

as you pointed out in the previous revision, returning would change the
behaviour so I currently skip the clock in such case...
 
-- 
	Ansuel
