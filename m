Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC1653
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720688481; cv=none; b=Da+Yen1PoimPg8kp+3zs4F6fMAib16c6TWy+x2A/DLRPmdyCHg1Svbg94I4TZz+5bheOD4Ot/xkiWkqFL0AOhOcK2RGUQqWmF38UA/OQvyGS5WdzkualGRHG+Too6XMOgy0DdHHbvnZZVrPAuVdtVyE1CfdJzlYs3YVfaJuHy8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720688481; c=relaxed/simple;
	bh=py/S5YhDTfUOlw/+tXf9jV6Hv7YWRbSfk7va1FaCeWw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UUq0moVq4w1HTMRyXpNpCMMuS0le8714pMi9ZU6r2cAm9ZdPIby5aWLTyklLN1VDL5uzq/w5d7Xb9BSulgfimsoCsL/BA241PZ5jrg8rH8sjGUue+C8/BAl7GnvExAbNcg/WN4zLF2eQkwHYKOTLYkAKx/L3GnVho6Ca93puM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IprCWz9x; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IprCWz9x"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so4121005e9.2
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720688478; x=1721293278; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O76Wd1xdw6NT3rqbN+Mq89J6tI9yqcUKeCRTu1LWxmk=;
        b=IprCWz9xcgirnEPFCwyAbA3nriCVul6nNQni0MtRqkWJkhflYVvIwrdXTtGsDO0JjH
         PZkdR92h2+ynAusM8WkdTSz3gn02lQ2cawGv0rLBvtDuMk0MpE1u3kbpiRNyy9dERwbT
         fSJfsHMjrSb4wjvhJ/mx5IkGQWENo4m7yeMh2TqM9UeHwVwvRGj+mSzCsvaNfnRJ9tQZ
         CdBpXboC8ZCCNQba5L5+Y+helrwmJCGBXZwRyXRIzM+HY7wc+JMpGPKkcXtQQDHgm93s
         Riy/2xRxPgGQx7CFHiTYae+apOPUilA6WBxc8wW34+F5UUEAWFmg2cC1YjJ/hNUB1l6D
         1Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688478; x=1721293278;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O76Wd1xdw6NT3rqbN+Mq89J6tI9yqcUKeCRTu1LWxmk=;
        b=eUvZyKf257xAYjCkFF1BgmDFUPwMjtNQFT+rJk1+kzk4vV3l70UEMLRHM0z1zUt07v
         iBSYiBwjE63XBYztzp1adBq32Q9UO7uSYF9b9lsywIKRDSIiPUvEfpjz+SQTlGAUh9ea
         yxQ2Vio2/Qs95StPNQ53a1PTYHIPglF8X23Y4KXesSkvHZL01D9licCx3C6mbjq9hjyX
         fWCqAIL9mbHZCUslIIu9tFGNdv3HB3/XCtYCcBreNcXoI5B0DmJiFrJ7duVB4AUmNabb
         TehE5jBiD43RmhrKSlLtwByfl6ZRdTiiNftcbOtU5Ygnv5jP5jBOZhDyP3cbjC56Ju4W
         qQyg==
X-Forwarded-Encrypted: i=1; AJvYcCUoYSMLY1TzEYD0n4sEHBbTXfYHFsJ9Sp1e/uNaUIATIl1+V5EHqSNy+SEHc7nD/lr+GOrun0laXLDiJK+RUDjWMSt6ERWapFhi
X-Gm-Message-State: AOJu0YzqbHtHW3g1sKpxk/dC6ge3y4wHu/RxNgDs8jCO8QxQukovQLDK
	BG6BJemuWlzWHdeJJ9o74yTMpBv+aUp5bH5ueqHewt7KwEqsZmbQUzMudGjRFao=
X-Google-Smtp-Source: AGHT+IF8lHe9Es5HF0Ko8Tr5R/zHyd6BopakSB0f7nBr2KdNcKTrn7lbuxyBJzEVMvldK1lXJtcgrA==
X-Received: by 2002:a05:600c:358f:b0:426:8ee5:5d24 with SMTP id 5b1f17b1804b1-4268ef4a0b6mr39316115e9.20.1720688477752;
        Thu, 11 Jul 2024 02:01:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a9e9:c71a:10d8:7f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e9666sm108670895e9.9.2024.07.11.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:01:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 10 Jul 2024 15:49:38 -0700")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-8-jbrunet@baylibre.com>
	<88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org>
Date: Thu, 11 Jul 2024 11:01:16 +0200
Message-ID: <1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 10 Jul 2024 at 15:49, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-07-10 09:25:16)
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index e34a10b15593..5cc767d50e8f 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
> [...]
>> +
>> +int devm_meson_rst_aux_register(struct device *dev,
>> +                               struct regmap *map,
>> +                               const char *adev_name)
>> +{
>> +       struct meson_reset_adev *raux;
>> +       struct auxiliary_device *adev;
>> +       int ret;
>> +
>> +       raux = kzalloc(sizeof(*raux), GFP_KERNEL);
>> +       if (!raux)
>> +               return -ENOMEM;
>> +
>> +       ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
>
> Do we expect more than one device with the same name? I wonder if the
> IDA can be skipped.

I've wondered about that too.

I don't think it is the case right now but I'm not 100% sure.
Since I spent time thinking about it, I thought it would just be safer (and
relatively cheap) to put in and enough annoying debugging the
expectation does not hold true.

I don't have a strong opinion on this. What do you prefer ?

>
>> +       if (ret < 0)
>> +               goto raux_free;
>> +
>> +       raux->map = map;
>> +
>> +       adev = &raux->adev;
>> +       adev->id = ret;
>> +       adev->name = adev_name;
>> +       adev->dev.parent = dev;
>> +       adev->dev.release = meson_rst_aux_release;
>> +       device_set_of_node_from_dev(&adev->dev, dev);
>> +
>> +       ret = auxiliary_device_init(adev);
>> +       if (ret)
>> +               goto ida_free;
>> +
>> +       ret = __auxiliary_device_add(adev, dev->driver->name);
>> +       if (ret) {
>> +               auxiliary_device_uninit(adev);
>> +               return ret;
>> +       }
>> +
>> +       return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
>> +                                       adev);
>> +
>> +ida_free:
>> +       ida_free(&meson_rst_aux_ida, adev->id);
>> +raux_free:
>> +       kfree(raux);
>> +       return ret;
>> +
>
> Nitpick: Drop extra newline?
>
>> +}
>> +EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
>> +
>> +MODULE_DESCRIPTION("Amlogic Meson Reset driver");
>>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>>  MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
>> new file mode 100644
>> index 000000000000..8fdb02b18d8c
>> --- /dev/null
>> +++ b/include/soc/amlogic/meson-auxiliary-reset.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
>> +#define __SOC_AMLOGIC_MESON_AUX_RESET_H
>> +
>> +#include <linux/err.h>
>> +
>> +struct device;
>> +struct regmap;
>> +
>> +#ifdef CONFIG_RESET_MESON
>> +int devm_meson_rst_aux_register(struct device *dev,
>> +                               struct regmap *map,
>> +                               const char *adev_name);
>> +#else
>> +static inline int devm_meson_rst_aux_register(struct device *dev,
>> +                                             struct regmap *map,
>> +                                             const char *adev_name)
>> +{
>> +       return -EOPNOTSUPP;
>
> Shouldn't this be 'return 0' so that the clk driver doesn't have to care
> about the config?

I don't think the system (in general) would be able function without the reset
driver, so the question is rather phylosophical.

Let's say it could, if this returns 0, consumers of the reset controller
will defer indefinitely ... which is always a bit more difficult to sort
out.

If it returns an error, the problem is pretty obvious, helping people
solve it quickly.

Also the actual device we trying to register provides clocks and reset.
It is not like the reset is an optional part we don't care about.

On this instance it starts from clock, but it could have been the other
way around. Both are equally important.

I'd prefer if it returns an error when the registration can't even start.

-- 
Jerome
