Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03DD4C8FE6
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790283272; cv=none; b=g/ADUtfutAdsMlEKhtfYfQu1S97690fdhni56XGICgeIScUn8gYGnWEjBZ3Hg6+f7uIUnIn4BcI8UZmBZ2fkhxG9NKlmoid31Nn9YPKAabDPznLNu0rXxDsnrWM9aZfHctqanBv61nZb9W6vA7DrHx6RUNBLASOSOunP8Ak1FQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790283272; c=relaxed/simple;
	bh=n9OW7KEXkiRgfqu0G+pIWrnWOu/6BP3T67ecthF7jdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NURtphMSZtO0BeNwvXda8c0lA8p0vj7fzX5X6y3weraSXC/SJ1j1jdvkS0c/j3BUxTNDHFMTOQLnT40CVrEJKaTzs+h5Z58/gBMVY/2ebb+N+HIIFLm/hDZT7RBvHrBqIeE0XP7OxaFn++Zr4wkvpV3ldrIHVOrHhRloZLShI/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fAXc3VkG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjriFxqc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fAXc3VkG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjriFxqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790283268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J1Ruv7QR3JU5W4c/F55bFjGnAtccgp4onaUH4lZCnqo=;
	b=fAXc3VkG11lHM72C0UkxvfHyQ0TPFcqhXEzOTb00/mJJ7sVBxVRbJ/+XwKpjem/IKOb/9Z
	uQaRhFmJ4fnlRMZltEA/t9ded3Pl54RVZYVfhBT7jVatkf86ER5h2RZwGiC1ld6O7GmeF3
	jY5E6GmjfyXpH8UjCgTusukFXkt2jWM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-ZKVe1gLpOIavize2i3MBoA-1; Thu, 24 Sep 2026 16:54:27 -0400
X-MC-Unique: ZKVe1gLpOIavize2i3MBoA-1
X-Mimecast-MFC-AGG-ID: ZKVe1gLpOIavize2i3MBoA_1790283267
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d912b923so4668161cf.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 13:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790283267; x=1790888067; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J1Ruv7QR3JU5W4c/F55bFjGnAtccgp4onaUH4lZCnqo=;
        b=gjriFxqcIYDSE9TYydee551taNwkpTDp49LcAnplesVLuoDe8tHvyxnD9BozUKMAV1
         CPS8pAh2LNFQugDhoYIx8R04tKeyE2V5ILT3Oo6UbUysXp777/bXAMtIlrrBbGvNermd
         3DQew2OvQYG4a/iHUoQ3wo7853RNJikP/W6IVjxMjwO8H2ZQ9EKa6D7h7YU2cK53RIf2
         gjeUyFngHA3R/kN4UfoG94Xin0HwgH71tRmnrOenbEG3M5XrZ6tBeJLDvjGPWTbXpWVK
         Ui5R3rr79UVkO38tOAIW/0S0YMB/3QxOOOFj9+KP7J4s4GE9xPwDkmCkQmIHqRXGOQD1
         4b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790283267; x=1790888067;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1Ruv7QR3JU5W4c/F55bFjGnAtccgp4onaUH4lZCnqo=;
        b=qCMd+qh8YM7Qcn5rxl+rLcothKEd4wulDCpCtDfojutS0qL+xTocaaG2j6rNtY6s1M
         qmJZ9711POrn/FDGc1IaL8EPKWUUAxqniJwIebqY4kRpOGb02z6Xz/WfWEkNhWjStPQD
         ys/UKzMDuPMiwfTn56Cdw280z/2pUeSf2uK54Y2EsfNkWsb0XEsiKrLx2CcF4d3osjzI
         HC1jy3jJMtgSRiyLGp7QDcfADHmVMGqkTbQF35x4wSdAfa7HAdJ1Rq1GnZkYcaw9UnMP
         otcpj9Vel8kj7cX1tL9LBwIm+WgrcFvpAnzDHdCZCBQSzGaq585us0Rn94AVN2IMCmQM
         ojEA==
X-Forwarded-Encrypted: i=1; AKwUvBwjdzGgNulPI/Zgp6mOqA9SVpBxxy9hMuqe6zOAW2f3XbTTgi7/ZpcaFYhPaaC3Q2rYSGc8YV0wzQU=@vger.kernel.org
X-Gm-Message-State: AFuF++nB5xg+W7PsJvAGzDyLXRMv6idFaMlHy2wNwuc+306rmy8TxZoe
	J0ykgf4zf5/hm6BpvYV72+61vdgFRWD1tuj3QDZbjknTUV1mRA3wDUFKv8oBN11thVe58b/PYkM
	OUUsNe/wCuFFas8HOfRAYj2qxqDCZWFtN3bJSjBVe7B4IPhYupLywoN8ed4+QVQ==
X-Gm-Gg: AYBFou3e6FLpqXsSXn/HiH3rRj50UTCMl5t2/i6IyTBKvJgYUkuJL1L4bLt2RfSWP9E
	JrMZfO0A8t1ywgVSCZG5K8snM4ZVt9x3Iu9Lzz1cFBfquA6KxPXwHh/6raQgB9PjjWEsHBPgHJx
	1+5h6WeidNO3BoNMB7Tjv/+x/GI8YINW2NpyBiwDJIgAkDPRW/EU8KXt3c4j51T8LR6+9nUqqnt
	E5mQJaidrq1iyAlJB5BkEMazaI3Z1R2XnvnWe3G8GIGSa/ZY3hf6LJe7m/rwK6H+TQKXQMCUMSP
	JEioPiIz/d6NqbJFXapG/+xuFqEb5YkODsprmzHv1hrprVd4MaGo6f04ogDhWSAoCaImnKrahUv
	I/USXdsiS+WDHlabKOjuSsMp+1ukKCIlhR5o=
X-Received: by 2002:a05:622a:1e0c:b0:530:7bd0:72a7 with SMTP id d75a77b69052e-5330b5b7abbmr8326921cf.14.1790283266722;
        Thu, 24 Sep 2026 13:54:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0c:b0:530:7bd0:72a7 with SMTP id d75a77b69052e-5330b5b7abbmr8326551cf.14.1790283266190;
        Thu, 24 Sep 2026 13:54:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5330bb99592sm2198971cf.4.2026.09.24.13.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:54:25 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:54:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: x86: fch: validate registrations and manage their
 lifetime
Message-ID: <arWN_5_Vkby6_dpQ@redhat.com>
References: <20260913125239.110113-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913125239.110113-1-bolin.liu@seu.edu.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Slavin,

On Sun, Sep 13, 2026 at 08:52:39PM +0800, Slavin Liu wrote:
> Fixed-rate and mux registration can fail before clk_set_parent()
> evaluates their clk members. Check each registration and the later
> parent/clkdev operations. Use managed clock registration so every new
> error exit unwinds only successfully registered clocks in reverse order.
> Keep the hardware-clock array local and drop the manual remove callback
> to avoid unregistering managed clocks twice.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 421bf6a1f061 ("clk: x86: Add ST oscout platform clock")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/clk/x86/clk-fch.c | 109 ++++++++++++++++++++++----------------
>  1 file changed, 62 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/clk/x86/clk-fch.c b/drivers/clk/x86/clk-fch.c
> index cf5cd3ad4647..b66ede14fc22 100644
> --- a/drivers/clk/x86/clk-fch.c
> +++ b/drivers/clk/x86/clk-fch.c
> @@ -35,7 +35,6 @@
>  #define AMD_CPU_ID_ST                  0x1576
>  
>  static const char * const clk_oscout1_parents[] = { "clk48MHz", "clk25MHz" };
> -static struct clk_hw *hws[ST_MAX_CLKS];
>  
>  static const struct pci_device_id fch_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_ST) },
> @@ -44,8 +43,10 @@ static const struct pci_device_id fch_pci_ids[] = {
>  
>  static int fch_clk_probe(struct platform_device *pdev)
>  {
> +	struct clk_hw *hws[ST_MAX_CLKS];
>  	struct fch_clk_data *fch_data;
>  	struct pci_dev *rdev;
> +	int ret;
>  
>  	fch_data = dev_get_platdata(&pdev->dev);
>  	if (!fch_data || !fch_data->base)
> @@ -58,55 +59,70 @@ static int fch_clk_probe(struct platform_device *pdev)
>  	}
>  
>  	if (pci_match_id(fch_pci_ids, rdev)) {
> -		hws[ST_CLK_48M] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
> -			NULL, 0, 48000000);
> -		hws[ST_CLK_25M] = clk_hw_register_fixed_rate(NULL, "clk25MHz",
> -			NULL, 0, 25000000);
> -
> -		hws[ST_CLK_MUX] = clk_hw_register_mux(NULL, "oscout1_mux",
> -			clk_oscout1_parents, ARRAY_SIZE(clk_oscout1_parents),
> -			0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3, 0,
> -			NULL);
> -
> -		clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
> -
> -		hws[ST_CLK_GATE] = clk_hw_register_gate(NULL, "oscout1",
> -			"oscout1_mux", 0, fch_data->base + MISCCLKCNTL1,
> -			OSCCLKENB, CLK_GATE_SET_TO_DISABLE, NULL);
> -
> -		devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
> -					    fch_data->name, NULL);
> +		hws[ST_CLK_48M] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk48MHz",
> +								  NULL, 0, 48000000);
> +		if (IS_ERR(hws[ST_CLK_48M])) {
> +			ret = PTR_ERR(hws[ST_CLK_48M]);
> +			goto out_put;
> +		}
> +		hws[ST_CLK_25M] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk25MHz",

Should the new IS_ERR() checks be it's own separate commit with the
Fixes tag? Then put the devm conversion in a separate commit without the
Fixes tag? I'm just thinking about ways to make these patches smaller so
that there's less to backport into the stable kernels.

> +								  NULL, 0, 25000000);
> +		if (IS_ERR(hws[ST_CLK_25M])) {
> +			ret = PTR_ERR(hws[ST_CLK_25M]);
> +			goto out_put;
> +		}
> +
> +		hws[ST_CLK_MUX] =
> +			devm_clk_hw_register_mux(&pdev->dev, "oscout1_mux",
> +						 clk_oscout1_parents,
> +						 ARRAY_SIZE(clk_oscout1_parents),
> +						 0, fch_data->base + CLKDRVSTR2, OSCOUT1CLK25MHZ, 3,
> +						 0,
> +						 NULL);
> +		if (IS_ERR(hws[ST_CLK_MUX])) {
> +			ret = PTR_ERR(hws[ST_CLK_MUX]);
> +			goto out_put;
> +		}
> +
> +		ret = clk_set_parent(hws[ST_CLK_MUX]->clk, hws[ST_CLK_48M]->clk);
> +		if (ret)
> +			goto out_put;

It's worth noting in the commit log that if clk_set_parent fails, then
probing will fail. This is fine but it's a behavior change that's worth
calling out.

> +
> +		hws[ST_CLK_GATE] =
> +			devm_clk_hw_register_gate(&pdev->dev, "oscout1",
> +						  "oscout1_mux", 0, fch_data->base + MISCCLKCNTL1,
> +						  OSCCLKENB, CLK_GATE_SET_TO_DISABLE, NULL);
> +		if (IS_ERR(hws[ST_CLK_GATE])) {
> +			ret = PTR_ERR(hws[ST_CLK_GATE]);
> +			goto out_put;
> +		}
> +
> +		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[ST_CLK_GATE],
> +						  fch_data->name, NULL);
>  	} else {
> -		hws[CLK_48M_FIXED] = clk_hw_register_fixed_rate(NULL, "clk48MHz",
> -			NULL, 0, 48000000);
> -
> -		hws[CLK_GATE_FIXED] = clk_hw_register_gate(NULL, "oscout1",
> -			"clk48MHz", 0, fch_data->base + MISCCLKCNTL1,
> -			OSCCLKENB, 0, NULL);
> -
> -		devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
> -					    fch_data->name, NULL);
> +		hws[CLK_48M_FIXED] = devm_clk_hw_register_fixed_rate(&pdev->dev, "clk48MHz",
> +								     NULL, 0, 48000000);
> +		if (IS_ERR(hws[CLK_48M_FIXED])) {
> +			ret = PTR_ERR(hws[CLK_48M_FIXED]);
> +			goto out_put;
> +		}
> +
> +		hws[CLK_GATE_FIXED] =
> +			devm_clk_hw_register_gate(&pdev->dev, "oscout1",
> +						  "clk48MHz", 0, fch_data->base + MISCCLKCNTL1,
> +						  OSCCLKENB, 0, NULL);
> +		if (IS_ERR(hws[CLK_GATE_FIXED])) {
> +			ret = PTR_ERR(hws[CLK_GATE_FIXED]);
> +			goto out_put;
> +		}
> +
> +		ret = devm_clk_hw_register_clkdev(&pdev->dev, hws[CLK_GATE_FIXED],
> +						  fch_data->name, NULL);
>  	}
>  
> +out_put:
>  	pci_dev_put(rdev);
> -	return 0;
> -}
> -
> -static void fch_clk_remove(struct platform_device *pdev)
> -{
> -	int i, clks;
> -	struct pci_dev *rdev;
> -
> -	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> -	if (!rdev)
> -		return;
> -
> -	clks = pci_match_id(fch_pci_ids, rdev) ? CLK_MAX_FIXED : ST_MAX_CLKS;

CLK_MAX_FIXED should be dropped now that it's unused.

Brian


> -
> -	for (i = 0; i < clks; i++)
> -		clk_hw_unregister(hws[i]);
> -
> -	pci_dev_put(rdev);
> +	return ret;
>  }
>  
>  static struct platform_driver fch_clk_driver = {
> @@ -115,6 +131,5 @@ static struct platform_driver fch_clk_driver = {
>  		.suppress_bind_attrs = true,
>  	},
>  	.probe = fch_clk_probe,
> -	.remove = fch_clk_remove,
>  };
>  builtin_platform_driver(fch_clk_driver);

