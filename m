Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF15421244
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800540; cv=none; b=SCWr11/7UyHNInORVGjxu+f8Ax98vVbTFtwpxXbHEv/ha2QIZQAoyZOFMPszeMdmTGB5us2OSDoK631kF8SsKNg4Zjp4WLhPluSXEAnQ/TgW6KF+wvCFE3BK2qV/UwH4SWTHpNrWSPdBniEmSSwSHl0UcojMw3ncByVHD7w1gBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800540; c=relaxed/simple;
	bh=Rd72MTm5cYisfbd6OpUeCW+uBuiW3AptGjcagTVGE5A=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uiGXFUoJPWb0zo6PzTqWDqpO9Ww2darh+N4OhjUD1gm5OSo9mwyTdckBANNPcn78tnFgLfnC0DvjcjcgfKbyx5H/8wZnPmsAGdLBG4mH6g90Lwpf7pWnwhxkXRYSKc5KNFIk/lNyrg/c2fnP8aVtcnl4pLIHC04vg1MiKj0i/+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NMltR393; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NMltR393"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso7706095e9.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800517; x=1792405317; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EsB47GQF39v+dS1MuWRJgJ5SLdXQgr/WLtFvls6GbAY=;
        b=NMltR3936mX8/FZnzTpoTVixCfLry3LdGuvnV8q5UJ5I7JcTnhUE9XX3fF8YClmTYN
         uHSp5UCC4ey0yesQTRZTmcZcwg3AYbgX7iuOBVfeWSvWGJ0jA+crRAkBeGPgZIEkrHh8
         WcNQLqZNmYpcsIbieqmEMG72hSgjd+g/e4oOAgVEzpJWKoMb+MtmzF+cTkoaaPBXnr0C
         X+FOhL0DBG3po2MSmEakhcdyLNkp3qGnMr4HKap/W5joFY1mHmTU9ChYFkufOrR/Lo15
         degxzkRBWRju8LATQn6I5jJ7ytHQweD/cmvHDJhkmDVheFvEtZHT+OVKt/PZqieq6j2/
         OYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800517; x=1792405317;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EsB47GQF39v+dS1MuWRJgJ5SLdXQgr/WLtFvls6GbAY=;
        b=Zb9NOZd8BuZC9SUJQXPT9r6MBaLZ1/BdxSLzc0j7RoOQne4sxHCqPYnWDhBc8hPL/d
         h9tk+NL84nk2J0ILqxHJwlD4dL3wiCOfu61bS1GTUid4tRQE3P6H2rPnvcmuW4FrAnKS
         hNwoTG/dNzkQqCa+vfraKRBRGwU2lkPOULpIVMY6LQ5cBiVRXKu9maEZMyKOY3i0qBk6
         3/oEwivc1M2xaPpZQ3F9O2nq5UBz1S0295h+8LVh8yDPpd0TmEjBPHbBjg0JzApUrWb/
         Imng3C888TBjHLIpfp9OYr+XWCstr4UJsbAt/MDsJPXMCsyHjZlc8AWjhk9q2Nyh1fXG
         WCJg==
X-Forwarded-Encrypted: i=1; AKwUvBxVUwKR3plaSJ60vp3NQr6MFncFPOyJwbWK240PRDR0OqgsTmyfunSUO1bK9pOmInq/T286okjREhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4CxTRbn/4iW6pJPEDuBaRPi13SUdVH3wrW1JX4ZLMYGFs94RF
	nv2C0LC2TjJ5rEN97HToN/nrhd1rXVR8D2TX3jt0m2DsMHoWoWBz5996c28ybGWd3vY=
X-Gm-Gg: AYBFou3ymqtqHI5SwWO+ixgBim9UUSoLCSEnAPGWoQnjLBy1ALin758wWBKZ2RPS74L
	MrdDvHFbC3JSeJ7fpDSGYDEHU0AxUzwQxW927J2bhCVuaPXXWnQraYwmNsncad5qW6J4WSC6klk
	U6CvmI9JkPLrOsOnsOcpWQ+/sSjKZto1vpA88F4JcxsBwgi9HkTHmFaytVdHyW+cdo7wfALZuYa
	13W1uE3l+NOAEUTLl1om7/CxVMVFbFv5YDZXh/j5WDMKDxd0DqOPnz6mHVIwy9o6GEJ4mXnjD0b
	nmiYpOpaexzq/51H1lS4OBOF5yFFjiypdwwzyGIEYE661jv+y8Txq0E4gnP9Y7zdIX62tKpXGaY
	TuvHCvYgq58NQKkNXYmsRk5MhUq1m4KMKVOSEXqW88c4Oy11sinMcqxSxygcovU9L6fZqGhDSQO
	59FPPBt68hdKkQyTvwG/1gzNBndNBCKu6Lk5fwO6yvWHT5t9VdKSv6DdsUmVKEYY/91/oKOvsIe
	VTzhnFUOxJjaFMlfw==
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a18e4a7839mr185966195e9.25.1791800517139;
        Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm327059615e9.1.2026.10.12.03.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 04/15] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-5-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-5-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.4316344599827794784.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3166; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Rd72MTm5cYisfbd6OpUeCW+uBuiW3AptGjcagTVGE5A=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuw/PPvjhFvJpxmc12UEnT3HkOm3ac1q7RC9rNvPL
 9euEJxZ1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJzHjM8N+1O9790ZfHXFtm
 PM8MERJnmNd8Kbxs/y+1exJKKxeUWjxh+Ke8eFFieFNTw3Sut57XEj+uy5V/J3xiiSp73Neydcc
 e6/ABAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table, external
> clock names and reset auxiliary device name. The reset auxiliary device
> is registered with jh71x0_reset_controller_register().
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 98 +++++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h | 12 +++
>  2 files changed, 107 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 2cc71f49ddee..c5ee82db3c92 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
> @@ -334,10 +336,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
>  	struct jh71x0_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
>  
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
>  
> @@ -391,3 +397,89 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  					jh71x0_reset_unregister_adev, adev);
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> +
> +int jh71x0_crg_probe(struct platform_device *pdev)
> +{
> +	const struct jh71x0_crg_domain_info *info;
> +	struct jh71x0_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	if (info->power_domain) {

At the moment the appears to be dead-code since none of your controller is setting it.
I'd prefer if you drop it for now and introduce it when it actually gets used.

-- 
Jerome

