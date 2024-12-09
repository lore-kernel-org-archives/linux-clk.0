Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816621C2335
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 06:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727116; cv=none; b=Vw8JvRiPC2zUoTzqaBa1BWN/fA6qNSg626hiYKXuXXdV3vPwPQWPBhojNQIJF41dTwwwj2Ev2RxEmk3BbZZLIXsLy6alyfUWL3ECiQdCY9E9cLyYT2iI/GOF0iBczFdPxiVi4gFDo/jVbZzc7kXFhyMEEbFZ2nNvyWl8qjyS2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727116; c=relaxed/simple;
	bh=gjWi9UfQlY8GyExiw+avsaQCZ/mlkQOOqNPCHaN/8Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KpQ93zQryrf00Z5uTOxx//eOcpncLcLPH3KzQEFrtqic/I4PPobocI3XkUj5Qx/jdjyffIr1Y0bnzAJNIp/JBpJ2irqbn4m2HTJgSNKTPSZ0vNzbBl/KS4RvK8mlAfLh8sfdBs7L4KHE7hyWZUOd8UdNlrNTXMvj2pD6o+ba4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yk5NPPTp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yk5NPPTp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso38921675e9.3
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733727113; x=1734331913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=Yk5NPPTpvRMEs+Am6QeodtOC7RlbENcKZ4NxQslc1HWf+Ih2xMUpTE9FWJgQsIbV7V
         OfSsIsmy+1RS27icwWERU1Y/ilHhGCy8n5ra0495gJ4UjsD8YzuBE0AXje8XSO+PMJEk
         lJv9H6Gkskdgqx+6ejLyqRoqrxDh10g0dqBe7FoXyOpwPUujo17fJxOurYB2J+tuVSGJ
         Y2MT73xFspruI/x+Z//arKKzlPUAA1vPmJrIteC9Qm6eXyBucefikrdMHvNBEBc6wxri
         SugJaYEQhB/ag6YncZo4dcthGC4+ARBR0B25N6ZvJahuA5ulyaDxpyi1LbFhpfubggd7
         KbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733727113; x=1734331913;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UU+rFrYBqU+HyZU9fxW7fsHHwD25k+Ib4ntmd1sD3tw=;
        b=fk9zMfm/rN7BSu1YrdcklOQdEO6m57xzHAaTqVWjMCe5Mp49/oHE0Hctdb6+Krd+fY
         wc8QXSF/cM2G2+pRcUCxqF90MKJyCJd09EHb4FbDobOkBnODyolxCw8kR4SHL8R2pUQ+
         IXRtQjKzqBIwFoHmC+FITySkv3uXlZMHvB7+hLe8kqVdfVpWxOVGVTUXO/w1N9yDWbrA
         nnX786Yr+6HxipL5tTIkP1U5Hwdpq+41jmZpN4fmks+f7ULUy/Do44FbEGp2a3Cb6gYZ
         kwCE0yo+HX7vo+wBqNrnOH9OmP5Y5MXdHaupderqnAO7f5hrxUQMEnrlv6TIDvI8jL2d
         av3w==
X-Forwarded-Encrypted: i=1; AJvYcCUJxidB2GydVcDG8z+efOYGdKheFLgw8uKyE2EmZu/6IpydqcwOdkV6clfaJevxxDWf7gLqatevsEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrW75e9U4nWHobnTjWFxWZifhhqZIqCE/SGhCyYKLPOYjDyMTw
	Ax4q7IcWr0JAUpW1XKZVzBH1HFJaUJTTcYlgodmZMXemTSomNWC0Aq43XJgS79w=
X-Gm-Gg: ASbGnctqFXlx4RR+ci65Xluq+aFj7n1q96JOsjo0ppjimy4o0c0RbUBglfMHKv/yBHO
	tcd3OCH+4WA0qQt8gYJo84X4gr7U/NKgDirbRyxOGll9lyMROkaVsnxI7PkTzKI3VZ9UpePfYa3
	EJol2xlQFoFbp16cntZ3eF8WhP3Gna6P6dL5wSeLoLzIto6PEI0lMOId0PShGsnrI9TOuG9fUyF
	a4rjMZa+GUCt3wUiIHGxxEYSvTIMqRvm65y3LoUG9MJYgyWyzRTL/Q=
X-Google-Smtp-Source: AGHT+IGEzc4vwHmaIfvTMIfIV37e15tsohqeHODjPaefoObT5Iz92AFnPqv8LysQYDOG0yI6+qlhwA==
X-Received: by 2002:a05:600c:3155:b0:431:52b7:a499 with SMTP id 5b1f17b1804b1-434dded67b1mr79239335e9.20.1733727112718;
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434eb8f18fcsm72397395e9.24.2024.12.08.22.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 22:51:52 -0800 (PST)
Date: Mon, 9 Dec 2024 09:51:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1
 SoC
Message-ID: <9a3f6975-d99d-430b-9a09-697638667e97@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126143125.9980-7-heylenay@4d2.org>

Hi Haylen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Haylen-Chu/dt-bindings-clock-spacemit-Add-clock-controllers-of-Spacemit-K1-SoC/20241128-101248
base:   2d5404caa8c7bb5c4e0435f94b28834ae5456623
patch link:    https://lore.kernel.org/r/20241126143125.9980-7-heylenay%404d2.org
patch subject: [PATCH v3 3/3] clk: spacemit: Add clock support for Spacemit K1 SoC
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241207/202412072123.ne7GnRyJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412072123.ne7GnRyJ-lkp@intel.com/

smatch warnings:
drivers/clk/spacemit/ccu-k1.c:1686 k1_ccu_probe() error: uninitialized symbol 'lock_map'.

vim +/lock_map +1686 drivers/clk/spacemit/ccu-k1.c

e71e4621b06cd42 Haylen Chu 2024-11-26  1651  static int k1_ccu_probe(struct platform_device *pdev)
e71e4621b06cd42 Haylen Chu 2024-11-26  1652  {
e71e4621b06cd42 Haylen Chu 2024-11-26  1653  	const struct spacemit_ccu_data *data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1654  	struct regmap *base_map, *lock_map;
e71e4621b06cd42 Haylen Chu 2024-11-26  1655  	struct device *dev = &pdev->dev;
e71e4621b06cd42 Haylen Chu 2024-11-26  1656  	struct spacemit_ccu_priv *priv;
e71e4621b06cd42 Haylen Chu 2024-11-26  1657  	struct device_node *parent;
e71e4621b06cd42 Haylen Chu 2024-11-26  1658  	int ret;
e71e4621b06cd42 Haylen Chu 2024-11-26  1659  
e71e4621b06cd42 Haylen Chu 2024-11-26  1660  	data = of_device_get_match_data(dev);
e71e4621b06cd42 Haylen Chu 2024-11-26  1661  	if (WARN_ON(!data))
e71e4621b06cd42 Haylen Chu 2024-11-26  1662  		return -EINVAL;
e71e4621b06cd42 Haylen Chu 2024-11-26  1663  
e71e4621b06cd42 Haylen Chu 2024-11-26  1664  	parent   = of_get_parent(dev->of_node);
e71e4621b06cd42 Haylen Chu 2024-11-26  1665  	base_map = syscon_node_to_regmap(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1666  	of_node_put(parent);
e71e4621b06cd42 Haylen Chu 2024-11-26  1667  
e71e4621b06cd42 Haylen Chu 2024-11-26  1668  	if (IS_ERR(base_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1669  		return dev_err_probe(dev, PTR_ERR(base_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1670  				     "failed to get regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1671  
e71e4621b06cd42 Haylen Chu 2024-11-26  1672  	if (data->need_pll_lock) {
e71e4621b06cd42 Haylen Chu 2024-11-26  1673  		lock_map = syscon_regmap_lookup_by_phandle(dev->of_node,
e71e4621b06cd42 Haylen Chu 2024-11-26  1674  							   "spacemit,mpmu");
e71e4621b06cd42 Haylen Chu 2024-11-26  1675  		if (IS_ERR(lock_map))
e71e4621b06cd42 Haylen Chu 2024-11-26  1676  			return dev_err_probe(dev, PTR_ERR(lock_map),
e71e4621b06cd42 Haylen Chu 2024-11-26  1677  					     "failed to get lock regmap\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1678  	}

lock_map not initialized on else path.

e71e4621b06cd42 Haylen Chu 2024-11-26  1679  
e71e4621b06cd42 Haylen Chu 2024-11-26  1680  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
e71e4621b06cd42 Haylen Chu 2024-11-26  1681  	if (!priv)
e71e4621b06cd42 Haylen Chu 2024-11-26  1682  		return -ENOMEM;
e71e4621b06cd42 Haylen Chu 2024-11-26  1683  
e71e4621b06cd42 Haylen Chu 2024-11-26  1684  	priv->data	= data;
e71e4621b06cd42 Haylen Chu 2024-11-26  1685  	priv->base	= base_map;
e71e4621b06cd42 Haylen Chu 2024-11-26 @1686  	priv->lock_base	= lock_map;
                                                                  ^^^^^^^^^

e71e4621b06cd42 Haylen Chu 2024-11-26  1687  
e71e4621b06cd42 Haylen Chu 2024-11-26  1688  	ret = spacemit_ccu_register(dev, priv);
e71e4621b06cd42 Haylen Chu 2024-11-26  1689  	if (ret)
e71e4621b06cd42 Haylen Chu 2024-11-26  1690  		return dev_err_probe(dev, ret, "failed to register clocks\n");
e71e4621b06cd42 Haylen Chu 2024-11-26  1691  
e71e4621b06cd42 Haylen Chu 2024-11-26  1692  	return 0;
e71e4621b06cd42 Haylen Chu 2024-11-26  1693  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

