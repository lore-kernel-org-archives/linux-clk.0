Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03693254B1
	for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 11:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911624; cv=none; b=hJv2EUY2zEq5Rl8aKgTDF2GLe24XTtwc4DvFPdpwqVgpVJdfMYsWHMjlE2+feG4gLRfBwEf9o8tUo1q4wnsywZLfKwDCvJyQojaC2GQHnNS7CzSANil1DQ5VLWzRCpmi1HiPxkeqfDK7+uVJ/M+sEsCh3P0J0ycmMYcHQRg1eBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911624; c=relaxed/simple;
	bh=O35spgqehOrZR2tvQvdo7EUbG49QpK95STsTyry3mOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWcyltZxrQwQHz4QhdIhpfKEReuUnS7KTkfsWPStHE1iQ1sMWZMeFEhiQcb9hJbHbqz2rr/JScpQDbqMZcCqAstyjZ5G/RxSMZ8hE2ReC9hSXZk0tmY81xYeuDWqk4FHrftaQ47D6nRN+u8cdFcmW23DRWS8B4VkH6+P9abpgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4My4cDk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4My4cDk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6406f3dcc66so3327367a12.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Oct 2025 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761911620; x=1762516420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=k4My4cDkzU6RIL1T67MQWjY5HiDr6FpFLl+wvrIap6ex/NowBUl/lO8geU9VOyUwiv
         fEwM0IRAjNYDctj53hMCK2h4I+1b91PYoNE7GdkDJGzXNIxzfgfB/hC9rxhI/RUFR41C
         EyG8gwo7Q0+P5Sfj2WmFpONhDouFjnK6Sin9RFBn46i5E42HY2xySb7IK37cKeMwaODT
         0ZnhCK6ctCp37v+0xlABZiUrQjo9VsfJBJtjumxDjXATrXzRfd8zgZBSiHYrcGCQvuXQ
         R9T+z++2jvL8VVeBK9t7A/edlqsum3MLfAqbejg/iWl6pHhCDKm/c5UOifGsyFx5ynX7
         xF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911620; x=1762516420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OCQNcQncDV0pig2wQUB4eR+mXGNrWHfstydWTHE+XYM=;
        b=PuimhEB1vU3SXf2fOMhSLCcJd/jhH5lTswcNCrYntLrVLZkgMiFa11npe0HZUOs+0u
         K440b9sJZS5Vhn6KTwCoUfdQtt5fAn2oZQEHjnfBCLoeiTHuo//S4S6Y6zNBoUtZXSXp
         /gbjkxum1sAjfhthbl/GlbW1/kfQxWhyCfdzKd2LQ4oMSUX54NenwiwwGkc9feuG9cEE
         zwM3f3xX2caiRMBVGMVMCcx4JQuztVgLQigNRqPsX89IgQ29tSLV/JtQHyynxIbDy9Kp
         V1jj5/mOdBRoFYwjHu2bxLeQT8sM1ib1XEZVyfXPiNg6TEp8GQu+Qh/KtW/kzikc7Zv5
         8jCw==
X-Gm-Message-State: AOJu0YydzpH1Gyvh0EJ3K9cZY/gabfsrzLaeIsNZ59sx5EG9VATmny8u
	G9WDHf5ngpEJSCwlIlYmkzmWgPy1DhYl9kDgFP2wtsuMsOU2GxbPccl+
X-Gm-Gg: ASbGncvFyNABDuuzd+EEfCZxmQ+1T8TvB/zgZ4EkyEE+GypiJfwcFAx7p+ftcuhWr31
	y5uPkER5hSeYbtBiA/I9v6CVDnJ7vqqmIW+M+nqIr1Dgedb+I5JSWTCHRMqQlXccX7Xxm4NbKHT
	uoeh6bHH/guctK9IDwnFhVCWZNnlY09I6C697kScu5BvpWXR3O4ZTb6Ie0KDbM/viMePq/V/ceY
	eCOMBYbcycVcZbsWnLFYLEwkFPfLSTbC3uO2ZuDO6rHX975y0/dZqUchlAKiOy6eNPODuWluEXf
	0wYzW4ToYeV5ybg23YoTPvAArev8hO5uqQ7LQyFNi1P7EGLCPbcueSh/XyWadwg6Z+2U6O4AUVx
	ipL3dFretiqmABtxWNOFtTP5CTB7H+aBKlxnlb+DsiQSFXE8ecngd/Vidld7IBdKJxKLnEwxnw9
	mMA7rwFTxUD8+amD1kx8XhWYglTH7ZIMb8dAHUcwp7pzg=
X-Google-Smtp-Source: AGHT+IGxIlFPS8hS595Xkfumk9wGbCOJQPHRYRtPAuDqD8SnR4VGwjFq2oqrDoT+nBuHOhjxEg9Krw==
X-Received: by 2002:a05:6402:1e94:b0:640:7529:b8b9 with SMTP id 4fb4d7f45d1cf-640770820e2mr2209238a12.30.1761911620065;
        Fri, 31 Oct 2025 04:53:40 -0700 (PDT)
Received: from [10.25.210.164] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b448ed9sm1418859a12.35.2025.10.31.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:53:39 -0700 (PDT)
Message-ID: <19ef0124-9a61-455d-8402-70e840309cf5@gmail.com>
Date: Fri, 31 Oct 2025 04:53:37 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
To: Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
 <20251029135229.890-6-laurentiumihalcea111@gmail.com>
 <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <105ed81ed67d8e4cacb63a83a606e206a4d6f310.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/30/2025 6:06 AM, Philipp Zabel wrote:
> On Mi, 2025-10-29 at 06:52 -0700, Laurentiu Mihalcea wrote:
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
>>
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
> Drop base as well, better let devres handle this.
>
> [...]
>
>> +/* assumption: registered only if not using parent regmap */
>> +static void imx8mp_audiomix_reset_iounmap(void *data)
> Pass base instead of dev.


ACK. Will need some extra casts/annotations though as sparse will definitely

not be happy with this.


>
>> +{
>> +	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
>> +
>> +	iounmap(priv->base);
> 	void __iomem *base = data;
>
> 	iounmap(base);
>
>> +}
>> +
>> +/* assumption: dev_set_drvdata() is called before this */
> Why not just pass priv instead of dev?
>
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
> Make base a local variable ...
>
>> +	if (!priv->base)
>> +		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
> ... and pass it as data instead of dev.
>
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
> Not needed if priv is passed to it directly.


right, somehow I forgot that rcdev holds a pointer to our "struct device" even though it's right there....

will make the change, thanks!


>
> regards
> Philipp
