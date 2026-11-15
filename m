Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752320;
	b=f64rFMt72ueYyLqQoycSDokxRAcNdEPuT4bI/eEdnLJ9lMbpokZhIdXa0wk2HYeyYWsu
	 Kfer9KY0acq0pVZCFKY93F+HeENM8YtNx1z1hsCIc5SRClTHeDGRa3zZziJapVWzp00vP
	 gwsAFaOiyLZ29WsiSifgQxD5SCwvtlkw0nG+oyXzN0rGf8FMqq5xX9Np09JMR67r58lQo
	 WVQxVQCVH3kyq5W9Fak4ZCx7+RA7XSx281+JnRbjTUN7UM4FjDQVq0uFG8CEkIf4JZ6Is
	 o9VzIGtQYnxZbhOHH6w2kpXkOWbyj8ANK4+TS1ljm+0EqSruaaMPwsmTJCZhlmQew4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
	b=jK8jFP6TyvOs2kzXDG1Sh/Lj/OEeosoRRHWze5DYxGNHZ08Xa8U/BCYoIiabHBZJoirg
	 QO+rzujPN6LRsrlcOwQhVvYSAOW1waS95vMmbrPycQNqusE4pC31UDmB5xWLCY/cPdDd1
	 3MLklPjsAnWI5SLlIW/XdHpUBKSot3aqF0jeEo6o3YMELfuKMAYgpIiSzDx9qsrGEJH+9
	 Ma9YCtwqCmL5zt+5sf/58WQPyhtg7z/I54teO1H3p/lZlPQVTNvaMt5gNBSbwzzzLsRfP
	 HvfQNbb8E40gPayefZvKOW7ysJqHJO/GqywrlwC5WQmxFqrs6+KgiuSfspjnyx/WooQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gW+UEver;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50019606A335
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 14:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50019606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gW+UEver
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17149195e9.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752319; x=1795357119; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=gW+UEverPAXmC6oIURdYJlfAKErMs7CF1AW/xdC4nI7JaYGof0yCbINrs6iEBMvebi
         hW52obgFr1UdgBvjvXqiIHKrApoyZ+bRPybMEGIStyyvZtBAQDbdkINujEf2wvDbIr5N
         D9xmLFHRS+5S5976Y2G/P678ercEczQatNQ59HFHWRGLkV3Gwpltt9SzDZZ3hh9sL8f3
         KXW4SZ8PJaCLCqtx8Vl8VyjPJXQ7W5jyhioN6/pqdp2td/TYH5LNGbb1C/YBnRPPtpmy
         XYr2hs2VP626XBdgj+C/ZqLvMx/Gq6X0WCaQwlSL1X0tyf6NYJskzOUda2yoJ8G1/wWm
         g/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752319; x=1795357119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=VRyxn90wpkTBcXe8ZjqbS8JpA28c4LIjE5WRx6SEyoRmSSG36Mr5LuDnDHw8sMoI/D
         H0CFRqAsczQGlIQLeoFQBtB4PUtpsYv6CaFbo0N1iloMcFITBNnlOA7WaurkcjCML6Am
         FDc4qcNyhZ9zsP2IgZ8tRCoUv/OFgd52em9eQ/Y/aN1h5Q4fjkU0UZeRFYY+4+cPhGOD
         LN6KKpADAR90Sk4cjPCW993/5/H9e+KU4vfaS0lgAFQKlDx/EqhHejjSH7/3DcAbORmv
         wVAhdRFkuDFGitJsC0Z/XDDg1aOBVU4YsmHSYHG/GmmUKef52Q0Ci6ToHfQHU2rP8V9U
         7t7w==
X-Forwarded-Encrypted: i=1; AL+hErG+ItGcBKF0dZICy9cRyJ9bqiqzpgYUcnZ/5OsPDkKrA4Lr6AcyXKnOgwFZ1ZoEGg7cl/rKnrc1Dbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MgH9qujHyLsPVVA1LHrqJmG/tYOQi0WMK8hGvHxYDJceij90n
	rgWKbjuZl4k305H7EunoHTavM8+yJpblyfqxoblQCVEpbEg8gDz3girNHIkyi4NOmVwR0UyM/Fr
	lnXdD
X-Gm-Gg: AYBFou15t13XZci7fNvdm9W9PmBAjggH0EtYaPHNOS/I8n1FeR/brlOvVM7O12tBH7V
	fYCpBSEjf8VDDWOKJ9cdEQCh78KOk/C2h5ogZA/2aEpy9/i4zCYSRTsrLHsXh73O6Nrju6oTPU5
	4PBXIXQg5M/Jb/MLQrQBH51FDLaIP8WqLRIcezZKYCOEomLPnBfAgJS6bjvqMmCDdWLJXlSzaUL
	SBU/c7i94ycoq7YTDei713C6PK+3J8V32VdOtAEBGmj9JidNEmCm0n+t4QhRpr7RlKNrObRW/3J
	mg+dUFVLgLV38sCRnWmbu9ISIDzBNeXQg6fWpFV5S17+QWkPkJrI/P9+GItFcCk5te+I/fvvJDE
	ywDOBwgfy+2TQvfurcr5y3sAB6wwL1sliTZcsFloPchHSBf5Z1Mzh8Smb4sr+AGmKq3U5hnWBEC
	pWSqdGoPH6ErOEQTy2zNddtI/lDKe83+Ld52WF7YXHqwj/qoxy68NCwAExn44/lkD8qXaqNaBCR
	+UYxhrKq42S0DZjsXCNvidUSKTrV4rlK9/5pklXfL/bWZOGPjcFjmTpS0Ctm6+go2WB8lNeBwWg
	IDYG4v/GZ18RfjymkF8IREkkrWwvK2cUk225bBhpftr303H7wvezm8HubjieR4/upvv8bw==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr181804715e9.28.1794752318812;
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm30018475e9.13.2026.11.15.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
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
In-Reply-To: <20261013102707.9207-6-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-6-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.11095887430765466229.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4YSHPxWGTuc3EuidS03239lOVJ2/QKGIZgU/mBp8vys=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95szbVDuXvm6sc7DoW66jeWS1j17l/HIL1h27lLXm
 U9Hlycf6ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEnk9k+GfuPzvb4vsF2aOr
 3hle709gauBg5IqbHv9x9kcrHoXnW84y/M8y7fu6sUw8ITh8/sKcFzcV26emdsqFrVv41fDoL2/
 GCG4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
> 
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for discontiguous controllers, a
> table mapping reset IDs to hardware bits. Add
> reset_starfive_jh71x0_register_with_info() to register such a
> controller, and translate the reset ID in the update and status
> callbacks when a map is provided.
> 
> Existing users of reset_starfive_jh71x0_register() are unaffected.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
>  .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
>  2 files changed, 107 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> index 29ce3486752f..fd1c755a0017 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> @@ -14,6 +14,8 @@
>  
>  #include "reset-starfive-jh71x0.h"
>  
> +#define JH71X0_RESET_ID_INVALID	ULONG_MAX
> +
>  struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
> @@ -21,6 +23,11 @@ struct jh71x0_reset {
>  	void __iomem *assert;
>  	void __iomem *status;
>  	const u32 *asserted;
> +
> +	/* Only exists in reset controllers that use the
> +	 * reset_starfive_jh71x0_register_with_info helper.
> +	 */
> +	const struct jh71x0_reset_info *info;
>  };
>  
>  static inline struct jh71x0_reset *
> @@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
>  	return container_of(rcdev, struct jh71x0_reset, rcdev);
>  }
>  
> +static unsigned long
> +jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned int nr_resets,
> +			 unsigned long reset_id)
> +{
> +	for (u32 i = 0; i < nr_resets; i++) {
> +		if (map[i].reset_id == reset_id)
> +			return map[i].hw_id;
> +	}
> +
> +	return JH71X0_RESET_ID_INVALID;
> +}
> +
>  static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
> -	u32 value;
> -	unsigned long flags;
> +	unsigned long offset, flags;
> +	void __iomem *reg_assert;
> +	void __iomem *reg_status;
> +	u32 mask, done, value;
>  	int ret;
>  
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_assert = data->assert + offset * sizeof(u32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	done = data->asserted ? data->asserted[offset] & mask : 0;
> +
>  	if (!assert)
>  		done ^= mask;
>  
> @@ -89,10 +117,20 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 value = readl(reg_status);
> +	void __iomem *reg_status;
> +	unsigned long offset;
> +	u32 mask, value;
> +
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	value = readl(reg_status);
>  
>  	if (!data->asserted)
>  		return !(value & mask);
> @@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +
> +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> +					     void __iomem *assert, void __iomem *status,
> +					     const u32 *asserted,
> +					     const struct jh71x0_reset_info *info,
> +					     struct module *owner)
> +{
> +	struct jh71x0_reset *data;
> +	int ret;
> +
> +	if (info->discontiguous && (!info->map || !info->nr_resets))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "discontiguous controller without a valid ID map\n");
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.owner = owner;
> +	data->rcdev.nr_resets = info->nr_resets;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = of_node;
> +
> +	spin_lock_init(&data->lock);
> +	data->assert = assert;
> +	data->status = status;
> +	data->asserted = asserted;
> +	data->info = info;
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..36f198139602 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,9 +6,28 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>  
> +struct jh71x0_reset_map {
> +	unsigned long reset_id;

you don't really need the reset_id, it could just be the entry index in your table ...

> +	unsigned long hw_id;
> +};
> +
> +struct jh71x0_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;


... and this would not be necessary, as Philipp already noted on the previous version.

-- 
Jerome

