Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C030F94E
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502488; cv=none; b=KDIKRtVquroVygrzdmDAQoLYK2OOTvWQ+jY715c/vUudRa3O4g5NvJgPT8czTH8xKTeSOYe7Ghf+Ff5J+tEsmvuZ+xltrtA3HfBi0/9RSq5A6rQ1i5tRs0/kBsOsCIXUfp+B/4WOyeSbMzfDoOt43EBPxdAj3Tqvs9nc5+r8OUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502488; c=relaxed/simple;
	bh=RcXBtDck6KBjcXruX7jv8Jnj3yRxU66tLdV0Hp8iIIY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNRpyNKrvs9ZbZkH/fkypRofB/K83umNxeXueybwwQ6RYEDVqeYuzR56yxSVer/0TeuLbSJFUNQhaHruVRYJquthJdtl2x3PISeC1Ld/4XnUXW92Z9w30tnQmsUXruFO6uOXPTQfqchVgCpYadWfiJx3b3ac90PfFkujYs8ojws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGMGIgAd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGMGIgAd"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429b7eecf7cso275656f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Nov 2025 00:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762502485; x=1763107285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XH3e0FMtRqniqAC/JVU+RFDrXdAf6djMDK3MFCP8upM=;
        b=LGMGIgAdqEe/xgGjf4+4aFrX2Otxab790NzNIU3aB73BZYGwyTIKiMkGkSe8NjLAwJ
         hq4BdUFZJ8Ii+OIPfcLpJuM4CP+TxQrU/oXneA68QbTbzgQ1CPJF2gBDDaG6MXvMulPi
         RYfmroIvWArXTU+3Y36I5oLrK5SdS3Bn5t67G6AoXk0TuPLl84GwYJZBAVYtf9S5QfRB
         TcmotlvuWZlf7RW19sGq6NSsSgaKuzo1kztPjaWqz7Y0S/JJN8BoS4tth6bmGG+o9hGz
         D/KM5Of8WaEoYiCZLu9uCfHcQQVaM8SL7EWJTkbSWcU3BeK7BKYGvseWV+dLQvq4zQMu
         Feow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502485; x=1763107285;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XH3e0FMtRqniqAC/JVU+RFDrXdAf6djMDK3MFCP8upM=;
        b=c0o+D7q3MpXbrno3nKfV2umiHuaF4pawKdiZ6TQcVXwgKd/eP0Q+/lN4kr35mR2EwG
         sEC8K6gfZ9ZtH/d6lIKLmRBGr0koVJcOXU27PS6xUru/FLJszwK6CAS9MOag7/ByGKDX
         sDcZJLj1LBAnVfb1FaOsR/JUjocyA6yOfLuoX4HAKXoZhn7NwBvgP2oV/s/3kcQo2N45
         UV968+JTxk+L1LVBQEgBjdNlBC8kJipwVOqnFtw5ZfSH5Z6Oad92U934ZTE4B2LLdv+O
         T91EIcbEXQ+LiozRsP7TmoMvVtmPSvqZd8wG8tvpJtVkezj5fcu+b5XFlIXkbBKpfdwZ
         1uaA==
X-Forwarded-Encrypted: i=1; AJvYcCUNLbe+zPNjcqXCiA/SAw2pzoH6+bEFd/ZxIYmBO86FX/RWxn3QvAAq/XP8u07JkO9GtdIFZzC+Y60=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzWqcWRVH+kyHDlqkRM+vtT7LyWinMQnj5eRlSsIWFsdAD+BA
	/Vk4lqcm1ybm3sUDKDlJFF9BfI3cblIySOLpD9+QOcASVmb4HtwoHq4J
X-Gm-Gg: ASbGnctaQTo4n1YEqZrsyNdUdrE+azNGxFTcuLwtTd/xRYvspDtSMxyJBY+VWPs7go8
	xfynH3U+xoIEYRFOcQzhruGq1puGZnLgFw8GEe/gdqXFGAoDwVoB9LtOPFtj9oWmBuwMbL8MXEP
	6e7wz3kHzXQGqlkLw4I0UXqCcfuqWvBPzxVKSDYPeVlvY2DUntjHd4oJxsIjv5/g2iUHBG+mrui
	u5H9duOJCOuhZI5HrezFS9jG198xAp1OvV70LBvlyhRfH38K/NfpNf0lQ4vmn/q/ykSwTT8TAOW
	KXEWvrP2AkwW0J5CB35uO2o5LfZjGpKBDIOjTWw9ndb0ZpKL1hvIhK8PQl0Xi9/ksfOJtqA9ZXk
	L/iJgDMpyU5gbo6V6/LjnLj4OTdqGfOSyyXmxZnnicDQgHtrzncjWMbBGdKUAOJZJNWNAsczN2n
	hrdTmRkq6qJX6rRfJA0asFs9jMCUItruJGGfmGmHw=
X-Google-Smtp-Source: AGHT+IGjhguXVafyIF03qGRod41P+M5CzC6bL9w38i5cp56iczkE/ksJNNNmhdEHALvIdVe6z6XaRQ==
X-Received: by 2002:a05:6000:2c04:b0:429:cf03:8b2e with SMTP id ffacd0b85a97d-42b26f82e39mr638126f8f.13.1762502485388;
        Fri, 07 Nov 2025 00:01:25 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b1e3sm3742116f8f.4.2025.11.07.00.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 00:01:25 -0800 (PST)
Message-ID: <690da755.df0a0220.2a944.8896@mx.google.com>
X-Google-Original-Message-ID: <aQ2nU_UVY2fdSrRA@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 09:01:23 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] clk: en7523: add support for Airoha AN7583 clock
References: <20251106195935.1767696-1-ansuelsmth@gmail.com>
 <20251106195935.1767696-6-ansuelsmth@gmail.com>
 <20251107-dramatic-puzzling-cockle-cb9781@kuoka>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-dramatic-puzzling-cockle-cb9781@kuoka>

On Fri, Nov 07, 2025 at 08:44:14AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Nov 06, 2025 at 08:59:32PM +0100, Christian Marangi wrote:
> > +
> > +static int an7583_clk_hw_init(struct platform_device *pdev,
> > +			      const struct en_clk_soc_data *soc_data,
> > +			      struct clk_hw_onecell_data *clk_data)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct regmap *map, *clk_map;
> > +	void __iomem *base;
> > +	int err;
> > +
> > +	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
> 
> NAK, undocumented ABI.
> 
> We talked about this last time and you just ignored entire discussion.
> Nothing in the changelog explains why this stayed, why our discussion
> was resolved like this.
> 
> I already complained about very poor changelog and lack of lore links
> and this just adds on top of it.
> 
>

Hi Krzysztof,

profoundly sorry for this, the old patch slipped in for this commit and
I already have the new revision ready.

This will change following how it's done with an7581 that doesn't use
this airoha-chip.

	map = syscon_regmap_lookup_by_compatible("airoha,an7583-chip-scu");
	if (IS_ERR(map))
		return PTR_ERR(map);

After better analyzing the structure is almost the same of an7581 with
only the thermal a bit different.

I hope this clarify the concern we had long time ago, not trying to
ignore stuff, just trying to respin and make progress.

-- 
	Ansuel
