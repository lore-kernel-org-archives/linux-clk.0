Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F052FB0BD
	for <linux-clk@vger.kernel.org>; Thu,  6 Nov 2025 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762460879; cv=none; b=pmGjbe2wmePZzwhCO/joiztBZYZaeby+65uReDpahgwV0TofEhn16FN1neKpH6h5JcvdOCyHqG+kqsQlsayq90oNWRGpcZakiMowGehfyArevKK8mrxIkrgYMFlKXx5xO5kd3Zjfk1BFlkDSq+CCGNOF254vmD4W3WZpabKdTxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762460879; c=relaxed/simple;
	bh=0t6MlGhVM0XL2fZZuOAF1ghwnWWRlF6HQII+byj8QnE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2SQek6L17cyJOthYIdTLD8hyCopMchp0aFnzYrhPJEg+THrK/x/cDZKG02LiE2sU7eNXEbx7gCFLeyrdVJz4mwiv9WzbV+gM+o8Agyi0fZ505quUNoH0lnDaBT/bSIeO8M7NHNR515o59f+Pxbc0O6GvvfYNW2HV2N1R9H42YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3Cblq2R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3Cblq2R"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632b0621so177415e9.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 12:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762460876; x=1763065676; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1z2wjiHhvsejiQn/+tOEpXB/N3K2BinmsJSUyaKjfEc=;
        b=R3Cblq2Rgj4Z5SJ5m5pLvvpB01wYiiu1oGpnbvR1GiSq7p0R3aa9+bkVF0b5p+aIfn
         kEa7Bw59OcJ0+2rXR+rNywOL9rgkb2gsJQlOv0cRMzb2pD0QXZeGL2va+wjAGDwOS4e7
         Mb54PQeZjRsNbs2H8CdKGEOyaj6b4eKPa+kiNUfdrd7d/CCuRTFbP5S+I1mBw0Eyhnzx
         6jFmGs/SMDPPOtzH0c+6GbSdD0YokzbEJVUx3ZX/23ErKK5CfmxToQi1hrFqU5jySmfq
         /rh/sOS++A8xI1MymlGzAb0s/GNe5Mw9U3VEY/uEfUZh22WRFYxlFhqz2OfQXmAMLT4Y
         0IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762460876; x=1763065676;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z2wjiHhvsejiQn/+tOEpXB/N3K2BinmsJSUyaKjfEc=;
        b=DRgvIygqAv/f6aEmS87NKD0vPL5tlcbu9W/50zbnUjrzzD8rHUHlGdtF523ojyZ1mj
         ffdecraU6inm6U4zJICubuRcPP9J4dFSjIKe4vh8oyAOOOo9Wcoxvw/3gfI5eC8b42LR
         MA0FsL/dHyH47K9RSMhScVVuwIXHZOWQx/RYF2cLs/BsOvEIH1kC6fS3yF/mtcOUKnfc
         i00LvhNRaW/HK3eyZIYgvTbahM1I6CTTuT1Q718mGxH3UERYKg8g+1SVtd1l3r76IEvk
         kNuQHgdGcSiCCejjO79c7fC3I5j4YQEMIBGV+OEQWkcSuvg6PrCoV8Fk/cSq/iOqd84N
         vP2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmwjW77GivWN2cWLxfJ0LRUZyRx1OiSlD0sg+8HIz5To4yUjpEXY/8FIloyyHDoCW9K5v+IwHL8nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytR/uOgw4mg6gs2nENp7hV6uWyEVtyPt70dWbrSgtHHn+qJDz3
	TWUVCT60RojEXQ8p1NvPXbhbhKzjkzpKTrBpI3oOjXzo4ybsG3cRjG0a
X-Gm-Gg: ASbGncsSs0VgUo29plyvh1IPaU3os4hTMLxqpfKm1+t7cbOYbUSwzxxHMy81aEmHJpT
	G5mDzVmUS/i1dombkFG58VFNpiNjBb2b33ewqWv5Gl4dW6oKHiI4UqBy2jn9b0FmwA23O5zgod3
	6PLKtEtwTZmRosmjNk8Xapg1ZesMDQktfqgqwkOv+AtSVI91cmJ/A0+gd8Qm7AhJPZxq/sr1mFL
	luxbX+hKr2sa9SEPW38svmvHqtXexD0Uem2f6r2rrtKYulEOOlYppoIZ/33vSci1mY2nhSDx49x
	RLqE7ttwrxC31OIVuPJUMkRmX2JcSEtLrSHHsKDpLbVR6lmE1EdaSZY7heT7esLybVxjmQ7Btmm
	wP0fGfFFOrDaLmqCRP8b2VxjITW1N33Y+hfLaMR+8Epy/CJyZtcYZE3Q0AHVd36MZ5ndUVTO8Uj
	Spg+YYsTHHs5tvTjwlEEjCSHVnmPr1
X-Google-Smtp-Source: AGHT+IHdBsgSQPK7gktxEdVBPh+hNOGF+tzMsBrl2JJsqB6qaGdVHc6sEdU0SVSxEKKOa2H7wzBBRg==
X-Received: by 2002:a05:600c:4e88:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-4776bcc34d8mr5465515e9.31.1762460875637;
        Thu, 06 Nov 2025 12:27:55 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce32653sm125100735e9.13.2025.11.06.12.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:27:55 -0800 (PST)
Message-ID: <690d04cb.050a0220.1f914.57e6@mx.google.com>
X-Google-Original-Message-ID: <aQ0EyPS8NmP2gehc@Ansuel-XPS.>
Date: Thu, 6 Nov 2025 21:27:52 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: en7523: generalize register clocks function
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
 <20251106195935.1767696-3-ansuelsmth@gmail.com>
 <bc9074b9-27b5-4a31-ab85-ef7fcc309523@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9074b9-27b5-4a31-ab85-ef7fcc309523@wanadoo.fr>

On Thu, Nov 06, 2025 at 09:25:23PM +0100, Christophe JAILLET wrote:
> Le 06/11/2025 à 20:59, Christian Marangi a écrit :
> > Generalize register clocks function for Airoha EN7523 and EN7581 clocks
> > driver. The same logic is applied for both clock hence code can be
> > reduced and simplified by putting the base_clocks struct in the soc_data
> > and passing that to a generic register clocks function.
> > 
> > While at it rework some function to return error and use devm variant
> > for clk_hw_regiser.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >   drivers/clk/clk-en7523.c | 148 +++++++++++++++++----------------------
> >   1 file changed, 66 insertions(+), 82 deletions(-)
> 
> ...
> 
> > +static int en75xx_register_clocks(struct device *dev,
> > +				  const struct en_clk_soc_data *soc_data,
> > +				  struct clk_hw_onecell_data *clk_data,
> > +				  struct regmap *map, struct regmap *clk_map)
> > +{
> > +	struct clk_hw *hw;
> > +	u32 rate;
> > +	int i;
> > +
> > +	for (i = 0; i < soc_data->num_clocks - 1; i++) {
> > +		const struct en_clk_desc *desc = &soc_data->base_clks[i];
> > +		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +		int err;
> > +
> > +		err = regmap_read(map, desc->base_reg, &val);
> > +		if (err) {
> > +			pr_err("Failed reading fixed clk rate %s: %d\n",
> 
> Would it be better to use dev_err()? (here and in other places)
>

Yes but I wanted to limit the changes. Is it possible to do it later?

> > +			       desc->name, err);
> > +			return err;
> > +		}
> > +		rate = en7523_get_base_rate(desc, val);
> > +
> > +		err = regmap_read(map, reg, &val);
> > +		if (err) {
> > +			pr_err("Failed reading fixed clk div %s: %d\n",
> > +			       desc->name, err);
> > +			return err;
> > +		}
> > +		rate /= en7523_get_div(desc, val);
> > +
> > +		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
> 
> I think that the issue was already there before, but should we have a
> corresponding clk_hw_unregister_fixed_rate() somewhere in this driver?
> 
> I've not seen any.
> 
> Or use devm_clk_hw_register_fixed_rate()?
> 

Well yes, I didn't move to devm as it's already planned to move to full
clk with .set_rate and realtime .get_rate. Is it possible to also delay
this in a later series?

(thanks for the review)

> > +		if (IS_ERR(hw)) {
> > +			pr_err("Failed to register clk %s: %ld\n",
> > +			       desc->name, PTR_ERR(hw));
> > +			return PTR_ERR(hw);
> > +		}
> > +
> > +		clk_data->hws[desc->id] = hw;
> > +	}
> > +
> > +	hw = en7523_register_pcie_clk(dev, clk_map);
> > +	if (IS_ERR(hw))
> > +		return PTR_ERR(hw);
> > +
> > +	clk_data->hws[EN7523_CLK_PCIE] = hw;
> > +
> > +	return 0;
> > +}
> > +
> >   static int en7581_pci_is_enabled(struct clk_hw *hw)
> >   {
> >   	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
> 
> ...
> 
> CJ

-- 
	Ansuel
