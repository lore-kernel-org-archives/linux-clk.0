Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C675808
	for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721287162; cv=none; b=rogS+OLzGpVTK+Grpl8+KcfcT3BHEeNA2TPAdTPEmN7c7raa4JAPWkN2kT3EcI/xCz53kWX1RmGJpJsHBypg0sdrV/dZhSV9ltrWRHMYnEt35D5n0L5bsk9M6VQrK0+WIkn4R6GAyWD9J0kaxuQ1OwZwjuVMGZJMq5Ay9dlvw/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721287162; c=relaxed/simple;
	bh=W4k9qAPO1Rn7slJ3z9bMftBBBhNXa73zVfCFy0eSb2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O+pODg7TIdw+LSBiOGulE440HKjpYJuwPn51/AW7fVMhuIiEeC9SzvTIAV9dEPy/T2tmUzj3LdqY/IlcPrgKCZ2abNcVnfKW7OZLp7RdxKsBilcmGNlP2JqxYPuXLR7wHNxigGHWh1nfoh6ZBg+0/xkZF49OcR5w+D8qbdT+MEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rmjIhPED; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rmjIhPED"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368313809a4so797860f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jul 2024 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721287157; x=1721891957; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ldXwhYdLjCB5OhXChmN89rx5JEnqOucYXmRIj6SqA3k=;
        b=rmjIhPED9DcWSb3TTaHokhG5IBa3/Fv1UZRDFcalbAf9t6EJy16drEL+P7E0LrLmOn
         cuTsPRrRmhM8S3osB6lX30rQfhWUw708PWPBzOxxTLjxl+7+GUt5vfkwESNxXG0SofCu
         Qx8qYFvYteYn4VDL094aNSjeSvvOESWjQpKX/01Sxl61jKMz/z9QX9DtdD5RdIHGaOct
         fsSytJNL54FAYYQL6puOc3a0Bh7rDZ/L+mqK/KYdKwGWPKjLdeYSvWD3/fcCjkWxmSLl
         X4SrS8bIIGvyicIKp8gB4zxCE9qA+FnbgzR3AZ0Wdpt5Y2zihVC0+d5vEqIofL6Qbakb
         WMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721287157; x=1721891957;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldXwhYdLjCB5OhXChmN89rx5JEnqOucYXmRIj6SqA3k=;
        b=psPuyWHgxEBjkERP6kc3lnZOGZIt/2qsZc4RO1Gp74Q7wv6SZw3hoahhM0W0ti3SeD
         bSW6q7f7tUMvmi7+Cmw5afGay+gnVQO2bbVxEFkGAhdDZshAAJy15/F3ky8nEl114j3J
         zBaCKBZEGAglmqwLgVl34YeMQDIFp+HFMR8q3gtbN+esVHiAnq3vw+QSgDlVJSs5BPc5
         PpSz2lLBBOGh5djEEah25KZlDxehHFGlF7vWKUwiWoP9oDktiOEwBY9PIUMzYja3I8K1
         MOS8mugPmuzLqDXl3jxKEj0FZXcBadJf254XDgi+iWMOQIelYSggAIq875luQWFRbEIv
         BIag==
X-Forwarded-Encrypted: i=1; AJvYcCWHVyzKC3lYa6MkspPv197fw5//DhydAns5TrbKzDiBY4PtSiLyE8/2kZ7K0pe/dTtYk1KXwxdhUjAV7xt+/O82D/2bcYqUtlI2
X-Gm-Message-State: AOJu0Ywk5SyQ7w7Eill/iQBVI+uiPnyDOjyyI6/xkP0ejVVS34ySlOf5
	onixGeZRqqMieS3//pNQsgXxnvWPRtY3quwXhCrRbV9ddOgvGWGkds3RNvstDw1iFaRUBQdYAv6
	RaJk=
X-Google-Smtp-Source: AGHT+IHVrdI8ylyGTNYquZxonkwTNks5h1wMUjxX60+yWD44He7AmkFO/vKibReY6DPwE49s7q12fQ==
X-Received: by 2002:a5d:554e:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-3684b378956mr1134875f8f.1.1721287157244;
        Thu, 18 Jul 2024 00:19:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c7792c99sm23110455e9.3.2024.07.18.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:19:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/8] reset: amlogic: convert driver to regmap
In-Reply-To: <b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com> (Jan
	Dakinevich's message of "Thu, 18 Jul 2024 05:39:39 +0300")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-2-jbrunet@baylibre.com>
	<b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com>
Date: Thu, 18 Jul 2024 09:19:16 +0200
Message-ID: <1jv813makr.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 18 Jul 2024 at 05:39, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 7/10/24 19:25, Jerome Brunet wrote:
>> To allow using the same driver for the main reset controller and the
>> auxiliary ones embedded in the clock controllers, convert the
>> the Amlogic reset driver to regmap.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
>>  1 file changed, 44 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index f78be97898bc..8f3d6e9df235 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -11,36 +11,44 @@
>>  #include <linux/of.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>  
>> -#define BITS_PER_REG	32
>> -
>>  struct meson_reset_param {
>>  	int reg_count;
>>  	int level_offset;
>>  };
>>  
>>  struct meson_reset {
>> -	void __iomem *reg_base;
>>  	const struct meson_reset_param *param;
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock;
>> +	struct regmap *map;
>>  };
>>  
>> +static void meson_reset_offset_and_bit(struct meson_reset *data,
>> +				       unsigned long id,
>> +				       unsigned int *offset,
>> +				       unsigned int *bit)
>> +{
>> +	unsigned int stride = regmap_get_reg_stride(data->map);
>> +
>> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
>> +	*bit = id % (stride * BITS_PER_BYTE);
>> +}
>> +
>>  static int meson_reset_reset(struct reset_controller_dev *rcdev,
>> -			      unsigned long id)
>> +			     unsigned long id)
>>  {
>>  	struct meson_reset *data =
>>  		container_of(rcdev, struct meson_reset, rcdev);
>> -	unsigned int bank = id / BITS_PER_REG;
>> -	unsigned int offset = id % BITS_PER_REG;
>> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
>> +	unsigned int offset, bit;
>>  
>> -	writel(BIT(offset), reg_addr);
>> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>>  
>> -	return 0;
>> +	return regmap_update_bits(data->map, offset,
>> +				  BIT(bit), BIT(bit));
>
> regmap_update_bits() is not equal to writel(), I suppose regmap_write()
> should be here.
>
> I'm still under testing, but I see unexpected behavior on A1 SoC:
>
> [    1.482446] Call trace:
> [    1.484860]  dump_backtrace+0x94/0xec
> [    1.488482]  show_stack+0x18/0x24
> [    1.491754]  dump_stack_lvl+0x78/0x90
> [    1.495377]  dump_stack+0x18/0x24
> [    1.498654]  __report_bad_irq+0x38/0xe4
> [    1.502453]  note_interrupt+0x324/0x374
> [    1.506244]  handle_irq_event+0x9c/0xac
> [    1.510039]  handle_fasteoi_irq+0xa4/0x238
> [    1.514093]  generic_handle_domain_irq+0x2c/0x44
> [    1.518664]  gic_handle_irq+0x40/0xc4
> [    1.522287]  call_on_irq_stack+0x24/0x4c
> [    1.526168]  do_interrupt_handler+0x80/0x84
> [    1.530308]  el1_interrupt+0x34/0x68
> [    1.533844]  el1h_64_irq_handler+0x18/0x24
> [    1.537898]  el1h_64_irq+0x64/0x68
> [    1.541262]  default_idle_call+0x28/0x3c
> [    1.545143]  do_idle+0x208/0x260
> [    1.548334]  cpu_startup_entry+0x38/0x3c
> [    1.552220]  kernel_init+0x0/0x1dc
> [    1.555579]  start_kernel+0x5ac/0x6f0
> [    1.559206]  __primary_switched+0x80/0x88

That stack trace is not helping

>
>
> and using of regmap_write() (apparently) fixes it.

Nor does that conclusion.

It is perfectly possible I have made mistake somewhere (I have already
fixed one in v2), but sending incomplete report like this, with
unargumented conclusion is just noise in the end.

No, there is no situation in which `regmap_write` would solve a problem
with `regmap_update_bits`.

Either send a full analysis of the problem you found, if you did one, or
at least send the full dump, explaining that you don't know what is
happening.

I'll also point that I did not send g12 clock along with v1 and that a1
support is not upstream or even reviewed. So this 'tests' obviously rely
on an integration of v1, rfc and your custom develpment. That is hardly a
reference at this point.

This patches address g12 and sm1. If you want to contribute with tests,
please test on these platforms. a1 will be addressed in due time.

Testing is good but making complete report (trace and environment
details) is equally important, especially for maintainers who might not
be following Amlogic development as much as you do.

>
>>  }
>>  
>>  static int meson_reset_level(struct reset_controller_dev *rcdev,
>> @@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>>  {
>>  	struct meson_reset *data =
>>  		container_of(rcdev, struct meson_reset, rcdev);
>> -	unsigned int bank = id / BITS_PER_REG;
>> -	unsigned int offset = id % BITS_PER_REG;
>> -	void __iomem *reg_addr;
>> -	unsigned long flags;
>> -	u32 reg;
>> +	unsigned int offset, bit;
>>  
>> -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
>> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>> +	offset += data->param->level_offset;
>>  
>> -	spin_lock_irqsave(&data->lock, flags);
>> -
>> -	reg = readl(reg_addr);
>> -	if (assert)
>> -		writel(reg & ~BIT(offset), reg_addr);
>> -	else
>> -		writel(reg | BIT(offset), reg_addr);
>> -
>> -	spin_unlock_irqrestore(&data->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(data->map, offset,
>> +				  BIT(bit), assert ? 0 : BIT(bit));
>>  }
>>  
>>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>>  
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits   = 32,
>> +	.val_bits   = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>>  static int meson_reset_probe(struct platform_device *pdev)
>>  {
>> +	struct device *dev = &pdev->dev;
>>  	struct meson_reset *data;
>> +	void __iomem *base;
>>  
>> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>  	if (!data)
>>  		return -ENOMEM;
>>  
>> -	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(data->reg_base))
>> -		return PTR_ERR(data->reg_base);
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>>  
>> -	data->param = of_device_get_match_data(&pdev->dev);
>> +	data->param = of_device_get_match_data(dev);
>>  	if (!data->param)
>>  		return -ENODEV;
>>  
>> -	spin_lock_init(&data->lock);
>> +	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(data->map))
>> +		return dev_err_probe(dev, PTR_ERR(data->map),
>> +				     "can't init regmap mmio region\n");
>>  
>>  	data->rcdev.owner = THIS_MODULE;
>> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
>> +	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
>> +		* regmap_config.reg_stride;
>>  	data->rcdev.ops = &meson_reset_ops;
>> -	data->rcdev.of_node = pdev->dev.of_node;
>> +	data->rcdev.of_node = dev->of_node;
>>  
>> -	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
>> +	return devm_reset_controller_register(dev, &data->rcdev);
>>  }
>>  
>>  static struct platform_driver meson_reset_driver = {

-- 
Jerome
