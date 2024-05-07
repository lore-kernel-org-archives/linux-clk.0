Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB613BAC3
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715076679; cv=none; b=bDlPxLA5qcyKS+R9D9jQtQRji6Zs3m8TSUmxx44c8sOJjGAt2p40cyOGtHGyoG/pjG0/decORx+owaD7UY+ORUZ+3Xh1ka7fOq/h8oDjVXp+bKRo8hXu5GYN15Hi6ZaJDI7tkXJ0u9FoVSiT8PEqgeybxUx/19VFv+gYMwDgI1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715076679; c=relaxed/simple;
	bh=s86jj/APKflYyOaCwacoP71XuO9wXKQ22Yv4nmuWEsg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VMoaQJ5uxGAEAmCmXurWb1ZBLG18xkVuvp1FiQ6Ergs2SYAjwtRvRLrRJeVSSaKsf8ynbE47ut+3HbSM1s0a5akGxNTH6k4zX+XD4iOCcYv7tdkSk7UyJQgUU1Gb4dPJbbuCBqvr9ywlEplS9la5iUa6Qp5g04/lnGVjd7CsjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Rpme5GpO; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Rpme5GpO"
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C06B5400F4
	for <linux-clk@vger.kernel.org>; Tue,  7 May 2024 10:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715076674;
	bh=tN0TsnKRXwG6A84l3wPnbSYJqqWrPLAk8v9HABeeBQo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Rpme5GpOhYN36GUp4qTgC0aP065BWwUMVYKvR2qBGQKAt5mLo6vwwCIRWRxVzPSmF
	 roA0KVycBSQg3ygYyUUIMBz6YYXiWEZZ8stoKSiOgyEKULfMT7EoUOV+WhpPfQLRu3
	 6AAbqehhljK54YWOmeXgrynFikt9ZSVXMzMeUzZT9DZH8zUCXX+1lnIo+eyUT4t/ca
	 icEXX8GkkSvrTdWDRCD2AGGfHS+baaExnBjq+eFNlI27WmuDMvyVVuvOoOeTIBkxJL
	 b3P9UcAVb+2sUiLuup/Rdsy9v+oTRY5l/bnBqzxAHh35g+wdWSCTFGHxXMq5oTugxl
	 OR3jjS6CXCscQ==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-43ad0f16513so33452251cf.0
        for <linux-clk@vger.kernel.org>; Tue, 07 May 2024 03:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076671; x=1715681471;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tN0TsnKRXwG6A84l3wPnbSYJqqWrPLAk8v9HABeeBQo=;
        b=PkTG9YSZkjxSxdxmU+TNxK4pAIby31EqC2F9rGEwCJpcaeoTJOaA+0RXlk0J7sN+SK
         iagZKiwR2ju2YrPTa5I0dVrWtEAnLetvjtpY8w5cyPYC0e/7nUj4bsBJWKM0+NWn3CqC
         mvaTz2FND6zlFPA+sWVIk9VdiCB7ERpvrKCP/5c0+N1aF7wjjEyjw15yb1pST1SNb7G0
         2V8e7vmeV5WVXUXXxGjOL1cHdoay7tpfGQqeyBsqb3P0Jd3VraheT2wRCDcbDDqe4cD5
         TdCyE2IK3hr4V3mH223VdvAre/SvWDR9Ch4LAyIH5xfK5YNtttMtg8idPEATTOTylzQj
         GJBg==
X-Forwarded-Encrypted: i=1; AJvYcCXX29i9U18uHyIU07QswYVogG/AWpAylXpBaAXWn1UlHhv8RZrcMxgmUEWYFsCgiYEc2xrzFz1ROCRIUJHGgHFnyr7BzyNd9bvK
X-Gm-Message-State: AOJu0YzvQR+s6PLQSGqusMdSrTwpPTq4eV8eVfaCIOHo+XKOb00LjEq+
	PNg4OvM0kLaiwICwSF1kLc7/5F56PprCER9sdWtQvApCDlebYQbp9ig1Jc+Z7N8H3SplcptmQ2e
	HBOVX0AqC/H0BjkI/4TjyC/c9uE1WRpvqetSjf1u+FzRNxrQdEQ/YRxvi1sqFSO+iQDLhhc4HQN
	d0AlAKksbPzvjmDDJ8Z+T9v7ILwy14xzoEte2jCxiqd4ZU9oR2
X-Received: by 2002:ac8:5796:0:b0:43a:ee30:c554 with SMTP id v22-20020ac85796000000b0043aee30c554mr14429953qta.19.1715076671596;
        Tue, 07 May 2024 03:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC7lED7C0+ygdXPmMOe7xhSHbvQ874n3CyLpSpLWzJYqBxzPH9DjYI8NhKtEuhH+DJaKvyqnKZq7GeBNuznjs=
X-Received: by 2002:ac8:5796:0:b0:43a:ee30:c554 with SMTP id
 v22-20020ac85796000000b0043aee30c554mr14429943qta.19.1715076671316; Tue, 07
 May 2024 03:11:11 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 May 2024 03:11:10 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240507065319.274976-2-xingyu.wu@starfivetech.com>
References: <20240507065319.274976-1-xingyu.wu@starfivetech.com> <20240507065319.274976-2-xingyu.wu@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Tue, 7 May 2024 03:11:10 -0700
Message-ID: <CAJM55Z9nJKOEawvxHwUt5w0FKYGw9pBN9_YtOCHjzFGTQ_HvAA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: starfive: jh7110-sys: Add notifier for PLL0 clock
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Xingyu Wu wrote:
> Add notifier function for PLL0 clock. In the function, the cpu_root clock
> should be operated by saving its current parent and setting a new safe
> parent (osc clock) before setting the PLL0 clock rate. After setting PLL0
> rate, it should be switched back to the original parent clock.
>
> Fixes: e2c510d6d630 ("riscv: dts: starfive: Add cpu scaling for JH7110 SoC")
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

This looks much better, thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../clk/starfive/clk-starfive-jh7110-sys.c    | 31 ++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 ++
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 8f5e5abfa178..dafa3ae71751 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -385,6 +385,32 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>
> +/*
> + * This clock notifier is called when the rate of PLL0 clock is to be changed.
> + * The cpu_root clock should save the curent parent clock and swicth its parent
> + * clock to osc before PLL0 rate will be changed. Then swicth its parent clock
> + * back after the PLL0 rate is completed.
> + */
> +static int jh7110_pll0_clk_notifier_cb(struct notifier_block *nb,
> +				       unsigned long action, void *data)
> +{
> +	struct jh71x0_clk_priv *priv = container_of(nb, struct jh71x0_clk_priv, pll_clk_nb);
> +	struct clk *cpu_root = priv->reg[JH7110_SYSCLK_CPU_ROOT].hw.clk;
> +	int ret = 0;
> +
> +	if (action == PRE_RATE_CHANGE) {
> +		struct clk *osc = clk_get(priv->dev, "osc");
> +
> +		priv->original_clk = clk_get_parent(cpu_root);
> +		ret = clk_set_parent(cpu_root, osc);
> +		clk_put(osc);
> +	} else if (action == POST_RATE_CHANGE) {
> +		ret = clk_set_parent(cpu_root, priv->original_clk);
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
>  static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  {
>  	struct jh71x0_clk_priv *priv;
> @@ -413,7 +439,10 @@ static int __init jh7110_syscrg_probe(struct platform_device *pdev)
>  		if (IS_ERR(priv->pll[0]))
>  			return PTR_ERR(priv->pll[0]);
>  	} else {
> -		clk_put(pllclk);
> +		priv->pll_clk_nb.notifier_call = jh7110_pll0_clk_notifier_cb;
> +		ret = clk_notifier_register(pllclk, &priv->pll_clk_nb);
> +		if (ret)
> +			return ret;
>  		priv->pll[0] = NULL;
>  	}
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index 23e052fc1549..e3f441393e48 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -114,6 +114,8 @@ struct jh71x0_clk_priv {
>  	spinlock_t rmw_lock;
>  	struct device *dev;
>  	void __iomem *base;
> +	struct clk *original_clk;
> +	struct notifier_block pll_clk_nb;
>  	struct clk_hw *pll[3];
>  	struct jh71x0_clk reg[];
>  };
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
