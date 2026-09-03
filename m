Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165423839BA
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411633; cv=none; b=QAqNnIMYucUVeFVF2IjZbnFAl2aFw1lNJq53gkOmYQy6l/zMc405tAF8X17ZBgEuYRnONRDCQz8GnMk+b+7bOV0DP7GjQeEPY2vZhcXQYInfzUpf05e9U71hTb79ULW+3JTmavaIGeYKwcHsRf/EUNhHm7MCAv0p42hCXjl1dC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411633; c=relaxed/simple;
	bh=Do6DIyYheb72ubQenuc39X/h+3c0RITXfqxUusCBwQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfQDJuo7AYAKoSK3vsLVAPXiq5ezalnhDbO/i/2SQvGX3Inx+oeAnb2So39SxTnqbagB8e95xHCVQY0HoXVBiJzXZjOGJ4daJ9t5LcEurG19xcppSWqpnEKDFEFZZeqD2x8UbXZViOYCZPx1IruRyCg3ShAjzEyVHao85S+zVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My0FBi5E; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My0FBi5E"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2918841e87.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411629; x=1789016429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aw9gpVGru8xiZcUq3dSpmW3TOUrgw1owBT+0w2fdvGo=;
        b=My0FBi5E6ceep2eAoKtxAwze+bPhLRYCaPXTsjOaQqVZ8ryTz+lRaxOnfXEt+284B5
         U7n/U6MzfdDFFohQTuaH0IOnEuwciKck08RiW19oW1b9BbQxqqS+7CLNBg0NJRQV66KZ
         GeT8bgS69DdHa2eUqXBtwS4eQfnQVXIpjhYBo05l4bk72Nfb/8ZoDr6n/bLRDXc45xgY
         qh2ywezmDvFCQu6Lkai2TZfZyOs1dXf9V1w4uXKnoQ6/emjl8zpf0utEcJMl6ZLavcXa
         85arZA43rRRHYxcYZIrOIo0a7VQVgrEQMlURageYQiagMm0G74u2ih509vZuKvL/Fede
         jaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411629; x=1789016429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aw9gpVGru8xiZcUq3dSpmW3TOUrgw1owBT+0w2fdvGo=;
        b=IBOuNLnUjc69FiSwS3wlgvX/2/d63CXQ5LxMfOji+jrSnWgbYvCFm4MU8V/RxJ95Zp
         NVHLojPlZSCfn6eOgeizFf2RhjQDfFOruvehy/CyAQwJB/2VYlecc+NvAJGbCi5WGZfp
         2vleTUcV0orLyqpo0RXp8WJVaz42aDVXSZwVTDF4NPj58db7qlmYtgN/zpWlatShOe6U
         dOQORSKmzj4hfyiIF/f2CZv5JXlgBSlAZcW5XED7e4OLCTD6m+5TYX506C0foSrxcOuR
         GwXG3WE3BEZ6sY5hjiokfTFlVkBHjwoHCKcuzoko8BoEpLwwXc56ukpQkUt8Y7/n9jKn
         TS8Q==
X-Forwarded-Encrypted: i=1; AKwUvByzkdbfiGKzSk/ynFaLqKG6mB3RCwbEO96WAS3jCHOzBKJj8M75wPOGQrfUQw0dtMS2G3qRFZxTMVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++knbO2cHBRack8/mhlKTim0JVb8Dj0EYHyuM5wJ3MrTLYo7cNqx
	rbDx/mFq2Uf2MuwdI1wLRkTMdw6DODbXSCIVotXUy1WDTCsdtOtBwvvP
X-Gm-Gg: AYBFou23ziNYP/FWj8x2O1p3Cx30/HX5MExKEsVtVR5Bf6DRZM2GMrq/FU3ueVD4f/Z
	eDMwqz/aqiTWAX1q9OUI2yYi9uUj4aOTczyaQy5yMCi6oqtacT3mgBlwH9obj9rQhNmQGgdl4Sj
	KTjyAvUp7lh1EZD4Txb6r6YXdudYTAXuFJBASo3x7F9RJfnS6WRTbDFezdtCIsyhA87vvGcbBaX
	0KT5bbtjiT4sA1npKyiS47yoMP5SNQ8kC6XBkRi8MUhsPwo0ceD9pUNkP/hgjrEQyfrUd0yxziv
	xrAhHk4dJxGJEshfe6AiTWvpN6suMF3t+Q6DHXjZcbBdbUqYdno3Zoa/qYAQAdpIhzwku9i5a6g
	dfbjPSqjy2nZc2IYI6o6U+D4MWLcWRm3dhD5Vd1FKxpRbrSp9b+O8A58mllA7w2/Edb5HnUdycM
	ohwqleyRhgZh2ye1vQf6OKrYvxuC5TCD661mnCB8gs2zXxKkYrFWDH7+RF6gmHYlOmq5ab/TO8y
	C8qeC4+y5vMsRLYBhoD314QI51sPUYgVFcTSgdnpoPY
X-Received: by 2002:ac2:5685:0:b0:5b5:e393:2284 with SMTP id 2adb3069b0e04-5b60832fcfemr3051273e87.3.1788411628714;
        Wed, 02 Sep 2026 22:00:28 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a350e4caacsm7622581fa.21.2026.09.02.22.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 22:00:26 -0700 (PDT)
Message-ID: <57832670-6066-424d-a75f-4eb1f1f0cf73@gmail.com>
Date: Thu, 3 Sep 2026 08:00:24 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAMRc=MchpaOib+jgMniG7=BBYwB1yqLvJG1sMkjXfRaMFPodgA@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAMRc=MchpaOib+jgMniG7=BBYwB1yqLvJG1sMkjXfRaMFPodgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi dee Ho Bartosz,

Thanks for the reviews!

On 02/09/2026 15:58, Bartosz Golaszewski wrote:
> On Wed, 2 Sep 2026 13:07:32 +0200, Matti Vaittinen
> <matti.vaittinen@linux.dev> said:
>> From: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
>> EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
>> (One Time Programmable memory) is written at device manufacturing.
>> Support the GPI/GPO use-case via GPIO framework.
>>
>> The default OTP for these pins is to not use any of them as GPI or GPO.
>> (The GPIO1 defaults as an ADC input regardless the naming). Hence the
>> driver assumes none of these pins is a GPI/GPO unless explicitly pointed
>> as GPI or GPO via device tree.
>>
>> Furthermore, pin's direction can't be changed after OTP configuration is
>> done. Also the default drive type for a GPO (CMOS / Open Drain) is set
>> by the OTP configuration. The BD73800 has a set of undocumented test
>> registers which should allow changing the drive type. Access to the test
>> register area or the test registers aren't documented and so this driver
>> does not support configuring the drive type even though it might be
>> doable.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>

//snip

>> +
>> +static const char * const bd73800_gpio_properties[BD73800_GPIO_MAX_PINS] = {
>> +	"rohm,pin-gpio1", "rohm,pin-clkout", "rohm,pin-fault_b", "rohm,pin-exten"
> 
> Can you put the properties on separate lines?

Sure, no problem, thanks. I just wonder if I should re-spin the whole 
series for this. I suppose I'll wait until the next week, to see if I'll 
get any other comments.
>> +};
>> +

//snip

>> +
>> +static int gpo_bd73800_probe(struct platform_device *pdev)
>> +{
>> +	struct gpio_regmap_config config = { };
>> +	struct bd73800_gpio *data;
>> +	struct device *parent, *dev;
>> +	struct gpio_regmap *gpio;
>> +	int ret;
>> +
>> +	dev = &pdev->dev;
>> +	/* The device-tree and regmap come from MFD => use parent for that */
>> +	parent = dev->parent;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->dev = dev;
>> +	data->regmap = dev_get_regmap(parent, NULL);
>> +	if (!data->regmap)
>> +		return dev_err_probe(dev, -ENODEV, "no parent regmap\n");
>> +
>> +	ret = bd73800_gpio_get_pins(data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (bitmap_empty(data->valid_mask, BD73800_GPIO_MAX_PINS)) {
>> +		/*
>> +		 * The BD73800 may or may not have pins allocated for GPIO
>> +		 * depending on the OTP used at manufacturing.
>> +		 * If there are no pins, then we have nothing to do.
>> +		 */
>> +		dev_dbg(dev, "no GPIO pins\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	config.parent = parent;
>> +	config.regmap = data->regmap;
>> +	config.label = "bd73800";
>> +	config.ngpio = BD73800_GPIO_MAX_PINS;
>> +	config.reg_dat_base = BD73800_REG_INT_5_SRC;
>> +	config.reg_set_base = BD73800_REG_GPO_OUT;
>> +	config.reg_mask_xlate = bd73800_gpio_reg_mask_xlate;
>> +	config.init_valid_mask = bd73800_gpio_init_valid_mask;
>> +	/* All pins that are valid GPIO lines also have a fixed direction */
>> +	config.fixed_direction_mask = data->valid_mask;
>> +	config.fixed_direction_output = data->output_mask;
>> +	config.drvdata = data;
>> +
>> +	gpio = devm_gpio_regmap_register(dev, &config);
>> +
>> +	return PTR_ERR_OR_ZERO(gpio);
> 
> Why not return PTR_ERR_OR_ZERO(devm_gpio_regmap_register())?

How strongly do you feel about it? It's not a big deal, but I always 
find it a bit harder to read when functions / macros are called inside a 
parameter list. Thus I'd rather keep it like this, just for the sake of 
my own eyes :)

>> +}
>> +

> 
> With that:
> 
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
