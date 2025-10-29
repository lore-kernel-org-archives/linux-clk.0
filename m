Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244730CDA9
	for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 20:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771083; cv=none; b=JeXcn6VqvU238jWmBDvyv5giW3QIhbVhYAfkJvfHh6h8cmmlXNsxj4EvJSD2HGkZGoZe84F7bQoVc/hckw1GQS9MqGgK0IL9JrETN+Uvbp+xMs6x0/qKj5z2NSiPslhQ0F3pORutGR4gvQdQkaziN59FRsdWO5bLD1sY0ofQWRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771083; c=relaxed/simple;
	bh=vYGQTNXu/pUrR4RRZ9S3jUSTz+VGSBn4Ky9Tk38U6eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMXmaBzbi3YUPidLssfKuvBF3oO2IW5Vif4q7QdmRQNt5lqGtWmTBT5mBRqtNo8r/jX0pCA2OuUmIicOFCMiB3WOgtr33W4xdObhcALFpDt2t9LUAhZ8UWMeQ9Gc/+xNUU+NyrohLM8NPs2e11vEvFc72pT40FoGJ4DsoKw0U28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBVrC2eb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBVrC2eb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4298a028de6so996915f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Oct 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761771080; x=1762375880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUleLLa8ND574xXra2RGEF6RaI7Xj9xpL5ZJVlCE2lI=;
        b=IBVrC2eb1w7MtVjrZ6o3GEotf2+11RdD9vT++Yt6ABLsDhkGC+uC3QXN4aUgwdHR+7
         c8yTB0YxPb5rnmrmy3fy2+q+/IhZDsNE5GlIUkeEJAs1i6wRYqmDUvlSGKcaeuuWLWv0
         JenSz2kV94IJ73JaOfW3cgqw2+IgtC4BHlypbHyfzxCp2TFbS4JD+O4Y3LSGhvfR1S0t
         63nQ/YgqH0K998DnfN/wtw2HYKSVOnT8T8s1lek3lgrefYWWynThsnZimqyColgf8D+N
         u72rASeyVZj8Qo1S1fMo+Kw/13ip+MonSSr8UMV8Kfaijx8pwvxWCcblm6TFUNPWz02T
         cLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771080; x=1762375880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUleLLa8ND574xXra2RGEF6RaI7Xj9xpL5ZJVlCE2lI=;
        b=AjEsGgN6s73ZMozJeJuxT8muLmaXKRxvv38YdO/OxIwm33WYufV6vbKiFNUKvr2MkL
         K3e/qlWHhYDTlIredlzDRyWFhBeHj4tkepPVt3iKLakrKXDw3JC/msezST0DfPEUhuJV
         D52ssUgVldG1/Im9RiPuQqmwL9xydnhP5tdYOqD/jT8hsuESaBtfQHoOIggxerM3W15k
         P6NgGCuZvXUr/iDXP566sKzX0zuKszDbJ46HPckCoFUQDjZaKS1vbe/54mqNYtWSiBIW
         KlmrkXZ6ebD6UxcT4FEcTRN9FXOH/r/WKZY3fT7VJGtkfmZ4HIkdWUKpDquIJz5y9PIJ
         On1A==
X-Forwarded-Encrypted: i=1; AJvYcCVDapNBGJ4OVAqd3rJqSShvCiuwtubFTquTGeFQvGeEpDM4NZv4njGHQpSWIXhWK13o8HIaPhdyKcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUwuy1JjGiXd658y4H5Y1B3Xne0/+VDx/F8kjaXHez0UIhCYJy
	c+bQwSknTW7nKVkSUtpZIDxGRrzLC5IJTJe552hwu0JnjaPd9pL4TU3D
X-Gm-Gg: ASbGncudlNdboaz0Ag4TSWBmMc6yYweFRP2mYCodIcAILGW0S6iO9efNAR2EC3t1rah
	DpJeNzyURciO0Dg2Ui17UJh+oetncWUAFGayo/SUlQ5CWb8hur/DTrHK0x2Cuw1I70DbW6/Kv72
	BjyepocOn4xql39TRBpUJl9a4CStRkQSHMscyC949vedb8kn7AoqenbcfPKeOkfjT9fcv2nngd9
	MsimbjM5NmV3fWFxgQqHm7LCE6J6VpUPIphcxwA54hteIhASgekMe+F2Mx2e/8xGDPaPiuTunwd
	DzPM7SOaU1EHougyGm2Ox1nU4rAI3XMOjA6Hu8vnLD1p+l7EgMKjF5oD+aFat6gyDxCmXy6+EAE
	1tC3dsJFT3HCT5Mb4nWQ6oqFoAHN1CgyEOWWbUOqv4VIHkxluXDgFEYCvKP0ucAw1cqFrjSHshO
	RC2Sk9A38iZnodQ7EIbmAY8jFBf2720WQ=
X-Google-Smtp-Source: AGHT+IFeQbHeDjZUFHA43UkkMBSaS+cIVCuepwH/xR58asrUxhv9+gT0KhY234gaLSA+Vobfb3QPkw==
X-Received: by 2002:a05:6000:3110:b0:426:ff91:2f25 with SMTP id ffacd0b85a97d-429b4c81d13mr953533f8f.21.1761771079656;
        Wed, 29 Oct 2025 13:51:19 -0700 (PDT)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289b3956sm2680805e9.10.2025.10.29.13.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:51:19 -0700 (PDT)
Message-ID: <c8fdbb57-d152-4c85-be06-cfbc7e0b1550@gmail.com>
Date: Wed, 29 Oct 2025 22:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
 <aQJCtZjAGiQdzfDz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aQJCtZjAGiQdzfDz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/29/2025 6:37 PM, Frank Li wrote:
> On Wed, Oct 29, 2025 at 06:52:26AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> As far as the Linux kernel is concerned, block devices such as i.MX8MP's
>> AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
>> clock controllers, reset controllers or mux controllers. Since these IPs
>> offer different functionalities through different subsystem APIs, it's
>> important to make sure that the register R-M-W cycles are performed under
>> the same lock across all subsystem APIs. This will ensure that registers
>> will not end up with the wrong values because of race conditions (e.g.
>> clock consumer tries to update block control register A, while, at the
>> same time, reset consumer tries to update the same block control register).
>>
>> However, the aforementioned race conditions will only impact block control
>> IPs which use the same register for multiple functionalities. For example,
>> i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
>> and reset control functionalities through different registers. This is why
>> the current approach (i.e. clock control and reset control work using
>> different locks) has worked well so far.
>>
>> Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
>> block control IP, we need to make sure that clock control, reset control,
>> and mux control APIs use the same lock since all of these functionalities
>> are performed using the SYSCTRL0 register.
>>
>> To do so, we need to switch to the regmap API and, if possible, use the
>> parent device's regmap, which, in the case of i.MX8ULP, will be the clock
>> controller. This way, we can make sure that the clock gates and the reset
>> controller will use the same lock to perform the register R-M-W cycles.
>>
>> This change will also work fine for cases where we don't really need to
>> share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
>> control) since regmap will take care of the locking we were previously
>> explicitly performing in the driver.
>>
>> The transition to the regmap API also involves some cleanup. Specifically,
>> we can make use of devres to unmap the device's memory and get rid of the
>> memory mapping-related error paths and the remove() function altogether.
> Can you simpifly commit message? The key points are 1: lock, 2: nice API.
> like regmap_update_bits().
>
> Switch to using the regmap API to simplify register access. The regmap
> infrastructure provides synchronized register access and richer helpers
> such as regmap_update_bits().


this change isn't about simplifying the register access, nor is it about synchronizing

the register access. Previous version was already doing that.


the key takeaway here is we want to have the SAME lock used across different APIs.

regmap is a way to do that.


>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
>>  1 file changed, 57 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>> index e9643365a62c..3f6d11270918 100644
>> --- a/drivers/reset/reset-imx8mp-audiomix.c
>> +++ b/drivers/reset/reset-imx8mp-audiomix.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/of_address.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>
>>  #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
>> @@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
>>
>>  struct imx8mp_audiomix_reset {
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock; /* protect register read-modify-write cycle */
>>  	void __iomem *base;
>> +	struct regmap *regmap;
>>  };
>>
>>  static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
>> @@ -55,26 +56,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
>>  				  unsigned long id, bool assert)
>>  {
>>  	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
>> -	void __iomem *reg_addr = priv->base;
>> -	unsigned int mask, offset, active_low;
>> -	unsigned long reg, flags;
>> +	unsigned int mask, offset, active_low, shift, val;
>>
>>  	mask = reset_map[id].mask;
>>  	offset = reset_map[id].offset;
>>  	active_low = reset_map[id].active_low;
>> +	shift = ffs(mask) - 1;
>> +	val = (active_low ^ assert) << shift;
>>
>> -	spin_lock_irqsave(&priv->lock, flags);
>> -
>> -	reg = readl(reg_addr + offset);
>> -	if (active_low ^ assert)
>> -		reg |= mask;
>> -	else
>> -		reg &= ~mask;
>> -	writel(reg, reg_addr + offset);
>> -
>> -	spin_unlock_irqrestore(&priv->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(priv->regmap, offset, mask, val);
>>  }
>>
>>  static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -94,6 +84,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
>>  	.deassert = imx8mp_audiomix_reset_deassert,
>>  };
>>
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
>> +static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
>> +{
>> +	struct imx8mp_audiomix_reset *priv;
>> +	int ret;
>> +
>> +	priv = dev_get_drvdata(dev);
>> +
>> +	/* try to use the parent's regmap */
>> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
>> +	if (priv->regmap)
>> +		return 0;
>> +
>> +	/* ... if that's not possible then initialize the regmap right now */
>> +	priv->base = of_iomap(dev->parent->of_node, 0);
> Not sure why need map parent devices's ioresource here. You'd better use
> regmap_attach_dev() at parent devices, so dev_get_regmap() will get it.


why would we want to force the parent device to use regmap if it doesn't need to?


>
> Frank
>
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register action\n");
>> +
>> +	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
>> +	if (IS_ERR(priv->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
>> +				     "failed to initialize regmap\n");
>> +
>> +	return 0;
>> +}
>> +
>>  static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  				       const struct auxiliary_device_id *id)
>>  {
>> @@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
>>  	if (!priv)
>>  		return -ENOMEM;
>>
>> -	spin_lock_init(&priv->lock);
>> -
>>  	priv->rcdev.owner     = THIS_MODULE;
>>  	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
>>  	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
>>  	priv->rcdev.of_node   = dev->parent->of_node;
>>  	priv->rcdev.dev	      = dev;
>>  	priv->rcdev.of_reset_n_cells = 1;
>> -	priv->base            = of_iomap(dev->parent->of_node, 0);
>> -	if (!priv->base)
>> -		return -ENOMEM;
>>
>> +	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
>>  	dev_set_drvdata(dev, priv);
>>
>> +	ret = imx8mp_audiomix_reset_get_regmap(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to get regmap\n");
>> +
>>  	ret = devm_reset_controller_register(dev, &priv->rcdev);
>>  	if (ret)
>> -		goto out_unmap;
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
>>
>>  	return 0;
>> -
>> -out_unmap:
>> -	iounmap(priv->base);
>> -	return ret;
>> -}
>> -
>> -static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
>> -{
>> -	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
>> -
>> -	iounmap(priv->base);
>>  }
>>
>>  static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
>> @@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
>>
>>  static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
>>  	.probe		= imx8mp_audiomix_reset_probe,
>> -	.remove		= imx8mp_audiomix_reset_remove,
>>  	.id_table	= imx8mp_audiomix_reset_ids,
>>  };
>>
>> --
>> 2.43.0
>>
