Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438CD26F2BB
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 04:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761192414; cv=none; b=gv6S8ZQUy0I7MYzK84lw1BJX9cZhef38nU/7WeyuU6vu/ArLe+pPWXne7FI/a2XSx9I30jaSfGgSBom/mHLXAB4zc6GpQyGp8Q1dHtP7dGhidv6Gqr/XC2kGtA/35JQ+W4gdV7/oruTUug1aoxkrPlzt/eB9r/SVHgcNOqIyvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761192414; c=relaxed/simple;
	bh=neu0sMf02RKmw4o/eH09G0DNJ0J9AWDS6oOm4k1NROs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0yiAps+t2APdk2LAiQrYfbMc+m2rYrEaE22GJbyGO+lOEnWt+ywlJ2VhEeZ956+seLhQuqW/+MF1aeL7WshvpYOP1qQXXFx4VJi8Wt+8KadMs4s8Ha6DoCakefglG5tv7Em24fv8H15sMfjYoGa8VbQNtJPCrF3MIkO4QrVbZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ok4/9Xmw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ok4/9Xmw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso200578f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 21:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761192410; x=1761797210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9LmGzf8lZ8AA4pnml32k/4kEpS62XT9jc9VmDFNvb0=;
        b=Ok4/9XmwJG7tQ0gbEI2lXpwqaT0tlkUcyR/CEu7SYNDUcF99ZVXaybh7ZDA/V15Bt0
         iRUL7mAtB1/ctQuh6exyMzorlQ5CON8d9VB6WePQO0+u0VebNzGuz8rpgkKEUyAg4Y2m
         PaH6iJ3ke9vUQODyaCCqAQ6KlxD2K2kJkoRrzdDz6YS5023DGI4dFhXUgBzqvH+SKziP
         FPNJ9DL+upRzIG3bT+kiKTBMYLYFIdoJy2fP4iEbswoN9XeBRDgWtfxmLyBFYTwvaUjY
         vEjSqqNyAWoZxCAms3HGESC5wvWnLAnC2ChwAkH1c47qdUQhmwrkF6pLPcoJ7QtNi/+z
         +wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761192410; x=1761797210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9LmGzf8lZ8AA4pnml32k/4kEpS62XT9jc9VmDFNvb0=;
        b=bMeWwZuQbbwHfTEiSjvA82hhAqTdFGdqMI795d8J8CVSL74SWTTQDuUpqsD4joxJna
         +CkhaCy0gMfFprrgEgW3s/iHv3bdIFwHUtz8BIajxhNFvQH5W+ktxM9QrYEUsMK+rVju
         56ds1CxuBuwLjkYwcWa6yYP9tDG0cWR7EQgDmcsr2ZdbvlTW5b6EJZcQwK4pkdnRed9j
         qlln2OdSTSe7D9LFY/fQ7RtCR9fJOm0IA26EeaK93hTz4+apPv8rlM7IV/UnCzST9lRJ
         KjaYIBuVYXKiFIkoyl2BMosXVTBauQDBD+/18rxFaYVfSjjDMKTt1cB96mk1kkJyI6FF
         Q2dA==
X-Forwarded-Encrypted: i=1; AJvYcCWu3b/RmfbCgHMNbpY2ZNaTRy7V7rCENd4BxBchi7pEmq9CPqibSJ1Q6ZbSSKDlBFSz9S9yH8+mPaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvCf+bSLhKvsI/c9EOTrUJRG14C46GNToW8L2AAAGucQDNeLM
	rvmzBPMHB+HMqzHZX5O6wzsNunB2clH1+LQUJA+KkIRyDxZiCcTsu4tsM56ikDYExYY=
X-Gm-Gg: ASbGncsRlAWgKn6nM2EkbFlrZpjVUrsBGX12GessKeT4TTMnEmzbgENzy3oGsF3QIA7
	Y9dXDHq7gzTCM6va9apGDFNPwS5KjASDCG+ePItl1vhHeoY3k0MZTmbGZAS5eXw1gNDSBAoVGMI
	5QPxYDLIzEuRwOTIBkn5m8o4Czdg0xB98tMKUtM5/GfTTL0Uo3YvsWHG35MIlRjbuB58xBKSosQ
	Q86WjOz114jMC4pqptEV+hm1PmZ9LqsEjAc02u4dxKx/gPtMywMtvHpMR3/+AaPfcsbH8sSj1kk
	Y4o4SxuPh86l+Dea4EoM0U+AYiKMUD6mxHK+82qTJoEE/oKwwVv7G7jjYjKz3Mid72hK/eu2HKT
	2/9o8I3QBjULdKaOfyf7ypH4iLRVBaDx5JnaqvMaE88x3RP4e12600uiH04GABk06fXdGoiDkCR
	So575VjX1a
X-Google-Smtp-Source: AGHT+IHLzTiBpHfQjhvlWTJj5VKysMH/PyHRD3J5uwhQAkstbuvehGbVgVMmpZfM+iZPn2D+iNdjkA==
X-Received: by 2002:a05:6000:3113:b0:427:7ad:466f with SMTP id ffacd0b85a97d-42707ad4680mr15906098f8f.39.1761192410406;
        Wed, 22 Oct 2025 21:06:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccc60sm1657768f8f.34.2025.10.22.21.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 21:06:49 -0700 (PDT)
Message-ID: <60544429-3eeb-41df-b42c-613da651b4a1@tuxon.dev>
Date: Thu, 23 Oct 2025 07:06:48 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] reset: mpfs: add non-auxiliary bus probing
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-crane-utilize-cff9298291a4@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251013-crane-utilize-cff9298291a4@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Conor,

On 10/13/25 20:45, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While the auxiliary bus was a nice bandaid, and meant that re-writing
> the representation of the clock regions in devicetree was not required,
> it has run its course. The "mss_top_sysreg" region that contains the
> clock and reset regions, also contains pinctrl and an interrupt
> controller, so the time has come rewrite the devicetree and probe the
> reset controller from an mfd devicetree node, rather than implement
> those drivers using the auxiliary bus. Wanting to avoid propagating this
> naive/incorrect description of the hardware to the new pic64gx SoC is a
> major motivating factor here.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v4:
> - Only use driver specific lock for non-regmap writes
> 
> v2:
> - Implement the request to use regmap_update_bits(). I found that I then
>   hated the read/write helpers since they were just bloat, so I ripped
>   them out. I replaced the regular spin_lock_irqsave() stuff with a
>   guard(spinlock_irqsave), since that's a simpler way of handling the two
>   different paths through such a trivial pair of functions.
> ---
>  drivers/reset/reset-mpfs.c | 83 ++++++++++++++++++++++++++++++--------
>  1 file changed, 66 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
> index f6fa10e03ea8..8e5ed4deecf3 100644
> --- a/drivers/reset/reset-mpfs.c
> +++ b/drivers/reset/reset-mpfs.c
> @@ -7,13 +7,16 @@
>   *
>   */
>  #include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>

Should you add a depends on MFD_SYSCON ?

>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> -#include <linux/slab.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <dt-bindings/clock/microchip,mpfs-clock.h>
>  #include <soc/microchip/mpfs.h>
>  
> @@ -27,11 +30,14 @@
>  #define MPFS_SLEEP_MIN_US	100
>  #define MPFS_SLEEP_MAX_US	200
>  
> +#define REG_SUBBLK_RESET_CR	0x88u
> +
>  /* block concurrent access to the soft reset register */
>  static DEFINE_SPINLOCK(mpfs_reset_lock);
>  
>  struct mpfs_reset {
>  	void __iomem *base;
> +	struct regmap *regmap;
>  	struct reset_controller_dev rcdev;
>  };
>  
> @@ -46,41 +52,50 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
>  static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));
> +		return 0;

You can:
		return regmap_update_bits();

> +	}
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>  
>  	reg = readl(rst->base);
>  	reg |= BIT(id);
>  	writel(reg, rst->base);
>  
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
>  
>  static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	unsigned long flags;
>  	u32 reg;
>  
> -	spin_lock_irqsave(&mpfs_reset_lock, flags);
> +	if (rst->regmap) {
> +		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);
> +		return 0;
> +	}
> +
> +	guard(spinlock_irqsave)(&mpfs_reset_lock);
>  
>  	reg = readl(rst->base);
>  	reg &= ~BIT(id);
>  	writel(reg, rst->base);
>  
> -	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
> -
>  	return 0;
>  }
>  
>  static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
>  {
>  	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
> -	u32 reg = readl(rst->base);
> +	u32 reg;
> +
> +	if (rst->regmap)
> +		regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
> +	else
> +		reg = readl(rst->base);
>  
>  	/*
>  	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
> @@ -130,11 +145,45 @@ static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
>  	return index - MPFS_PERIPH_OFFSET;
>  }
>  
> -static int mpfs_reset_probe(struct auxiliary_device *adev,
> -			    const struct auxiliary_device_id *id)
> +static int mpfs_reset_mfd_probe(struct platform_device *pdev)
>  {
> -	struct device *dev = &adev->dev;
>  	struct reset_controller_dev *rcdev;
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_reset *rst;
> +
> +	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> +	if (!rst)
> +		return -ENOMEM;
> +
> +	rcdev = &rst->rcdev;
> +	rcdev->dev = dev;
> +	rcdev->ops = &mpfs_reset_ops;
> +
> +	rcdev->of_node = pdev->dev.parent->of_node;
> +	rcdev->of_reset_n_cells = 1;
> +	rcdev->of_xlate = mpfs_reset_xlate;
> +	rcdev->nr_resets = MPFS_NUM_RESETS;
> +
> +	rst->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
> +	if (IS_ERR(rst->regmap))
> +		dev_err_probe(dev, PTR_ERR(rst->regmap), "Failed to find syscon regmap\n");
> +
> +	return devm_reset_controller_register(dev, rcdev);
> +}
> +
> +static struct platform_driver mpfs_reset_mfd_driver = {
> +	.probe		= mpfs_reset_mfd_probe,
> +	.driver = {
> +		.name = "mpfs-reset",
> +	},
> +};
> +module_platform_driver(mpfs_reset_mfd_driver);
> +
> +static int mpfs_reset_adev_probe(struct auxiliary_device *adev,
> +				 const struct auxiliary_device_id *id)
> +{
> +	struct reset_controller_dev *rcdev;
> +	struct device *dev = &adev->dev;
>  	struct mpfs_reset *rst;
>  
>  	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
> @@ -145,8 +194,8 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>  
>  	rcdev = &rst->rcdev;
>  	rcdev->dev = dev;
> -	rcdev->dev->parent = dev->parent;
>  	rcdev->ops = &mpfs_reset_ops;
> +
>  	rcdev->of_node = dev->parent->of_node;
>  	rcdev->of_reset_n_cells = 1;
>  	rcdev->of_xlate = mpfs_reset_xlate;
> @@ -176,12 +225,12 @@ static const struct auxiliary_device_id mpfs_reset_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
>  
> -static struct auxiliary_driver mpfs_reset_driver = {
> -	.probe		= mpfs_reset_probe,
> +static struct auxiliary_driver mpfs_reset_aux_driver = {
> +	.probe		= mpfs_reset_adev_probe,
>  	.id_table	= mpfs_reset_ids,
>  };
>  
> -module_auxiliary_driver(mpfs_reset_driver);
> +module_auxiliary_driver(mpfs_reset_aux_driver);
>  
>  MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>  MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");

