Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827713CE0B4
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718072; cv=none; b=CTr78+3Y13sRyIUFlBfRFhB04Z4gR3jL84vI+9E6AzhehuvkGZFUoRDQ7sXEc/v5PPVqjeG49yaA6m3BlGfCj4/ZZMpTjcx3aSHDh+3VYJzLte00q7a888BF/lN1wle4NRI9RPtLqv82WCHc75nA6W1mHCyPKyEQFH/dNkqWx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718072; c=relaxed/simple;
	bh=Y/HfCNCRUg9RLoYb4CuHK8wg90NBmdpKZjXTXnDvd+Y=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjWLeoZn/bTDF/DewfmgnbSxLmyRZYrU4ybUniupoBM9fpRQwPBGjAkb3JxT2ffAF/n1YaLVoM7nEGnamUEnYVmVkNsd6I2YZNl6C55PX1uoO18USBFtSACQN6Wj1fT4LIxvIS0v/D4FdBxtcFJ+WGg7NSrgUISXB8fMD0JGFjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7+xRpGt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7+xRpGt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b1710405so2594725e9.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782718067; x=1783322867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=E7+xRpGtRu7dSjhFPn9FyBhPLhGCoJhqvwq0JPQ05G7Y1BTzKZYoGetL3Y+2Lq+DGT
         iOz3BojVYQ3IUij9omW9xmvfF7pP3V/P9/BsOArE6Sdy0jk4/mxkUK/FI4qUeyZE585v
         rXhCoTAtbAMeF0GVKKW2wW2BpoIkV7ZF4xIuFwpa2aaLPhsQpoMQXnLv3/2uRY4SI3gv
         mMPVdBiDKl6ca3yOmhzHq2KCXT8bcewyuDRqYPBMS2qYruNFjQYLlSysoQBHMm1HiX4D
         m1jVg6EIyUsNv16dKareDhkvjxgCImTqsJgHukAM6hlX9YJe5XIF4gEn05qzainzNoQT
         rqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718067; x=1783322867;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBV8+Lqv6LzBCkekw0TZncRmTA/42jKif/q/Zf74Sfc=;
        b=kxcb439SiZIRNiZqsvCE0ywMbzmls1oJQ21wtX9LoEmqlTo/3GwjwnkzEvo6lGC+L9
         mbOdFXlYYOIWt5KpspL3z050Dq09lwlCM52sItJY82YR/EsMyhz81xHZWDgCtQP0rO9j
         qrToBgoVDpU/47WVFSWi59l720wZJS7dgl2lyyytwKcD/obZ3naMd3asyBMTJQ9qRNmy
         LxUzOaU3TNpgHGQf5FCFYyLNLFnPYwzpKTLPH7oxsySrG3XbvuHqjJydXKPVIDUDBkto
         YrUPoRrAr6fVf6mNmM125SRXCzulYeb9WxDckZT+qh5I21y7/2sQKODl/c5GDcuPBy7O
         GLTA==
X-Forwarded-Encrypted: i=1; AFNElJ+C2bjC+Q+WL9BWoUDMaxbs8zlVBrgFWuP9jRWrAsgIUhUSXM3ERHK5McarzFjw1Y0YVWnvJh7pznc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm21524yKm5KCDrZQ3baGRBR5jXV0N1m2QxyMSllw2vjDxRgvM
	kKCFczi9VywwciOUuusDwVSqXm6Sn+tbnsJaz1D4svxVQl9LF5S8pV+H
X-Gm-Gg: AfdE7cknSh5nrllM3ZB1iyFSgNOf3ioFVDcY5NbiZT5JtQJJRxklSjeqIjqIxcIqvoQ
	2NOLxexIutYURrznx5f+dLb8U3SSPhagRDhELpGMp2n+HZTeTRuApOwK/Npz29jtB6XSIR4mk9n
	rFi6CCMr27Kz5qEiwj+SdedbRmdCZYfqTlsyHxNSXFLHJdekfWlqRl/W6RALQY4nfXhdHeaQ21F
	/LP24i6SH+5vgGeODhoiEe0p2ypRKfT3SjEoyIt3ISw3Kdva46D4yyR/D1iyIDCWn00wvOPrYhN
	V1lqw6WxwcYgRvAZxN2qhejb5j+lte0stYFyhf70nYRdZm4Xns+vq2f4mZF9MqboF5Ec2N5BB5C
	0J+PzG7KnN6uubuh42DA3IVhCjA8cmHXpgFTlPQq9QdsPbkLAxUud+uwaEfmnX4ZzPU9OTXPtVh
	Zs1wYizrL7Io9ieAOcGo0ogW9U0OMw0123bp6R8xCKto5fcWJIABp/TgvKueq0l4/Ph3s=
X-Received: by 2002:a05:600c:8b14:b0:493:b2e8:637c with SMTP id 5b1f17b1804b1-493b2e86404mr14198305e9.1.1782718066323;
        Mon, 29 Jun 2026 00:27:46 -0700 (PDT)
Received: from Ansuel-XPS. (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472c7bec9c2sm12681213f8f.12.2026.06.29.00.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:27:45 -0700 (PDT)
Message-ID: <6a421e71.39c9bec7.1462ca.d6ce@mx.google.com>
X-Google-Original-Message-ID: <akIebr33n_BgDL7X@Ansuel-XPS.>
Date: Mon, 29 Jun 2026 09:27:42 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
 <20260627121450.3529133-3-ansuelsmth@gmail.com>
 <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68b43224e0a124c055fc228b3a254fc7908dbcdd.camel@pengutronix.de>

On Mon, Jun 29, 2026 at 09:07:22AM +0200, Philipp Zabel wrote:
> On Sa, 2026-06-27 at 14:14 +0200, Christian Marangi wrote:
> > Add support for resetting the PCIe lines with the PERSTOUT reset. These
> > special reset are controlled by the PCIC register and are specific to each
> > of the 3 PCIe lines.
> > 
> > Notice that reset logic is inverted for these bit where 0 is assert and 1
> > deassert. This is intenrally handled in the reset function.
>                         ^^
> typo: internally
>

Thanks!
 
> > PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> > reset handling.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
> >  1 file changed, 28 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 1ab0e2eca5d3..c9b21d9bf2f3 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> [...]
> > @@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
> >  			       unsigned long id, bool assert)
> >  {
> >  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> > -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> > +	void __iomem *addr = rst_data->base + offset;
> > +	bool inverted = false;
> >  	u32 val;
> >  
> > +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
> > +	if (offset == REG_NP_SCU_PCIC)
> > +		inverted = true;
> > +
> >  	val = readl(addr);
> > +	val &= ~BIT(id % RST_NR_PER_BANK);
> >  	if (assert)
> > -		val |= BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
> >  	else
> > -		val &= ~BIT(id % RST_NR_PER_BANK);
> > +		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
> 
> You can simplify this into a single (assert ^ inverted) condition.
> 

Yep I know but I feel this would decrease readability of the logic. Do you
think it's worth it?

> regards
> Philipp

-- 
	Ansuel
