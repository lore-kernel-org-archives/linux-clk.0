Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658423C4F7
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064096; cv=none; b=guONBslGHsGtohD6RQf00jlD5IP4oJCDTj145qkd+d0gJ1UJTLUrMTP7b0VPv6UzYrBQmvqmVQjsjkdIfoznneKoAFmY/2q29hUMsy4F3rRa1d/HRBpcgmt1vZKr+QqOlt3TCjRYJUpDhNBBF1oNwx9elGGbxQSTTyxk/CKJ4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064096; c=relaxed/simple;
	bh=pv78F9stsJ8G3bZB63UkFBcvn8rAZ1R9f12eL6IUMao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nj82UVE+2US3nW0hfjqJdk0wsDPidMS/A7sFbhSyHgBOY4mRp12GRNAXKXaMqkl7LpzVat7N6Tjn8s0ogwu4cCWDrdUOG7wH7wP8hwDzi6QiT51x5vRM1ZHu+sxAlWfJtk4NsQRxR+2hgdhQctFkZOvle9ZXIPf50j11g8qbXaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bqXCYsgA; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bqXCYsgA"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so157463339f.2
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747064092; x=1747668892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lYJaGZXZUyw5dmv6C4SZsZQfI6bTO70Cjj2nmUvqWrc=;
        b=bqXCYsgAGSH15OPeC9/2Sjd7vlz+0DP06PBgoe6rV8oMSSNBvAxIr4+acYol0IUXZC
         S6asXE4dKPa6B6wxclr3X8f4L+DTuRFkroIxjR6mQIewQCjsrO6pUVPOBitqPO6haWSp
         RSXbiQqF5UxCrsGfD7H0v7ozAqZ5XrjOKFeyVmpbip1LeoGAJ5aCOuzbhP0dbjgV8hWT
         yCOvra/zUGWNOXF3+ACrd1LQSenI76wZm/jTsNK/LrVXtZURdbPYP1D4X3nBh5h0A+Pt
         pTXlcxtDMHnp/cuCoGXaLwnabqg9+hNaa8fTOLhJYMMDMGLk81OSqa3cUPXuWIjNH1FI
         9a2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064092; x=1747668892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYJaGZXZUyw5dmv6C4SZsZQfI6bTO70Cjj2nmUvqWrc=;
        b=N+3g1LaWeTz822Bho04o10dg2E3eX3/5uVoFCXMEeGkTuYJMylNyhxEau+5D8PwgQ4
         LkGthS9BghtlIqH7t8idY94+oSJEx+BGvtkGaR5frEMYDQ7Ishs6NFcQiCR8MqYECG9P
         jnkfjC8zbkzhhJkXyiViE8j5Wu73sDPkE0lRFkOmRiz/DGCM/3N1Elo9Q70EeMzXmJLZ
         VorRYTrNVxZWrzVjPYA9JZgd5gdqKYOlcmc9GZlryNjqC8FqPXN9d5Huxx8QToDUYO2B
         QBxSWw3THW5couEEdRISAOJl8Hz118ymNMMWX335fVKBfiUJYKomkNMx00cjnRgxyd6a
         SuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8nClbxi3HVNXywRk3M+dK5XsGUgpKJnpknEyrR1Oyn+kSluijboPcNUKDYLzJ5vI7rYJwhZ511tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TmY9c2hDKdN+qOxIcej7Q8eZYoLKLrfqXWCAznqqPaJXflsO
	A2JeJj8V71idq2v4nvHtxcUdSGQE08pBtfe4wELKnSA3MHpbPVXO+pyFIL0neXo=
X-Gm-Gg: ASbGncv1FprynwtEYDgdZnIIHVi2cn8IePab2sKhWlL6+reEWZ+HIH58EQH4R1F/bWk
	mLtaK0b7KfP+/I1xQJ4Tlk6Y9ZMKOXlPjSrqOzv98lxjI5xENI00K/04PZoAHsvB60nr4Wkw90i
	Lq+hYkOYFeyAUVGNpPV50cRoL5/YB8NvePbFfpA67gMkEoNgMID0Lljd3jz0EPMSV8lgO+xp/3t
	C2jCGfJp4eyGNpGtrGx1EhsvYnvEow/l8jfj44Dodx+yVBVUK+PMnYwY6UG0YzIZGV3iLCtDV83
	WQFbBKGw8Ke0EQCJA1xyYGN0x+g8uT19q6zyC8qsy8m3sgfbbrKL4qzC4/CyPW+GMa8pYtwCqvE
	LBoBf7vPPjdiEmh4=
X-Google-Smtp-Source: AGHT+IH16NsP5SQEwuJ4If2aiYvLrNSPMhqtNtOBoBzqL+qXeoZ6Dn+0ikRgSmuBULdjkG/IsIjvIw==
X-Received: by 2002:a05:6e02:154e:b0:3d6:d18b:868c with SMTP id e9e14a558f8ab-3da7e1e71a0mr134648155ab.10.1747064092279;
        Mon, 12 May 2025 08:34:52 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10477csm23785295ab.27.2025.05.12.08.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 08:34:51 -0700 (PDT)
Message-ID: <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
Date: Mon, 12 May 2025 10:34:50 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
 <20250512135429-GYA517867@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250512135429-GYA517867@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 8:54 AM, Yixun Lan wrote:
> On 06:20 Fri 09 May     , Alex Elder wrote:
>> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
>> non-null, the CCU implements a reset controller, and the name will be
>> used in the name for the auxiliary device that implements it.
>>
>> Define a new type to hold an auxiliary device as well as the regmap
>> pointer that will be needed by CCU reset controllers.  Set up code to
>> initialize and add an auxiliary device for any CCU that implements reset
>> functionality.
>>
>> Make it optional for a CCU to implement a clock controller.  This
>> doesn't apply to any of the existing CCUs but will for some new ones
>> that will be added soon.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v8: Allocate the auxiliary device using kzalloc(), not devm_kzalloc()
>>
>>   drivers/clk/spacemit/Kconfig     |  1 +
>>   drivers/clk/spacemit/ccu-k1.c    | 90 ++++++++++++++++++++++++++++----
>>   include/soc/spacemit/k1-syscon.h | 12 +++++
>>   3 files changed, 93 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>> index 4c4df845b3cb2..3854f6ae6d0ea 100644
>> --- a/drivers/clk/spacemit/Kconfig
>> +++ b/drivers/clk/spacemit/Kconfig
>> @@ -3,6 +3,7 @@
>>   config SPACEMIT_CCU
>>   	tristate "Clock support for SpacemiT SoCs"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	select AUXILIARY_BUS
>>   	select MFD_SYSCON
>>   	help
>>   	  Say Y to enable clock controller unit support for SpacemiT SoCs.
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 801150f4ff0f5..551df9d076859 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -5,12 +5,14 @@
>>    */
>>   
>>   #include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>>   #include <linux/clk-provider.h>
>>   #include <linux/delay.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/slab.h>
>>   #include <soc/spacemit/k1-syscon.h>
>>   
>>   #include "ccu_common.h"
>> @@ -21,6 +23,7 @@
>>   #include <dt-bindings/clock/spacemit,k1-syscon.h>
>>   
>>   struct spacemit_ccu_data {
>> +	const char *reset_name;
> see my comment below..
> 
>>   	struct clk_hw **hws;
>>   	size_t num;
>>   };
>> @@ -710,8 +713,9 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
>>   };
>>   
>>   static const struct spacemit_ccu_data k1_ccu_pll_data = {
>> -	.hws	= k1_ccu_pll_hws,
>> -	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
>> +	/* The PLL CCU implements no resets */
>> +	.hws		= k1_ccu_pll_hws,
>> +	.num		= ARRAY_SIZE(k1_ccu_pll_hws),
>>   };
>>   
>>   static struct clk_hw *k1_ccu_mpmu_hws[] = {
>> @@ -751,8 +755,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>>   };
>>   
>>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
>> -	.hws	= k1_ccu_mpmu_hws,
>> -	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
>> +	.reset_name	= "mpmu-reset",
>> +	.hws		= k1_ccu_mpmu_hws,
>> +	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>>   };
>>   
>>   static struct clk_hw *k1_ccu_apbc_hws[] = {
>> @@ -859,8 +864,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>>   };
>>   
>>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
>> -	.hws	= k1_ccu_apbc_hws,
>> -	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
>> +	.reset_name	= "apbc-reset",
>> +	.hws		= k1_ccu_apbc_hws,
>> +	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>>   };
>>   
>>   static struct clk_hw *k1_ccu_apmu_hws[] = {
>> @@ -929,8 +935,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>>   };
>>   
>>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
>> -	.hws	= k1_ccu_apmu_hws,
>> -	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
>> +	.reset_name	= "apmu-reset",
>> +	.hws		= k1_ccu_apmu_hws,
>> +	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>>   };
>>   
>>   static int spacemit_ccu_register(struct device *dev,
>> @@ -941,6 +948,10 @@ static int spacemit_ccu_register(struct device *dev,
>>   	struct clk_hw_onecell_data *clk_data;
>>   	int i, ret;
>>   
>> +	/* Nothing to do if the CCU does not implement any clocks */
>> +	if (!data->hws)
>> +		return 0;
>> +
>>   	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
>>   				GFP_KERNEL);
>>   	if (!clk_data)
>> @@ -981,9 +992,63 @@ static int spacemit_ccu_register(struct device *dev,
>>   	return ret;
>>   }
>>   
>> +static void spacemit_cadev_release(struct device *dev)
> why this function define as _cadev_ prefix, while below as _adev_
> is it a typo? or c short for ccu, I just feel it isn't consistent..

It is not a typo.  Yes, it was intended to represent CCU
Auxiliary device, while "adev" represents just Auxiliary
Device.  It is releasing (freeing) a spacemit_ccu_adev
structure.

>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(to_spacemit_ccu_adev(adev));
>> +}
>> +

This function is operating on an auxiliary_device structure,
so "adev" is used in its name.

>> +static void spacemit_adev_unregister(void *data)
>> +{
>> +	struct auxiliary_device *adev = data;
>> +
>> +	auxiliary_device_delete(adev);
>> +	auxiliary_device_uninit(adev);
>> +}
>> +
>> +static int spacemit_ccu_reset_register(struct device *dev,
>> +				       struct regmap *regmap,
>> +				       const char *reset_name)
>> +{
>> +	struct spacemit_ccu_adev *cadev;
>> +	struct auxiliary_device *adev;
>> +	static u32 next_id;
>> +	int ret;
>> +
>> +	/* Nothing to do if the CCU does not implement a reset controller */
>> +	if (!reset_name)
>> +		return 0;
>> +
>> +	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
>> +	if (!cadev)
>> +		return -ENOMEM;
> add one blank line here?

If I do a new version that's easy but this was intentional.

>> +	cadev->regmap = regmap;
>> +
>> +	adev = &cadev->adev;
>> +	adev->name = reset_name;
>> +	adev->dev.parent = dev;
>> +	adev->dev.release = spacemit_cadev_release;
>> +	adev->dev.of_node = dev->of_node;
> [..]
>> +	adev->id = next_id++;
> so I'd assume the underlying device doesn't really care the id?
> but with different order of registration, it will result random id for the device

These things are identified in DTS files by their index values
defined in "spacemit,k1-syscon.h".  If there is a need for the
assigned device ID to be consistent, I'm not aware of it.  Can
you think of one?  I think all that matters is that they're
unique, and this ensures that (for up to 2^32 PMICs).

> how about define a reset struct, and group reset_name and next_id together,
> then we can intialize them with fixed value
> (this will also let us dropping 'static next_id' variable)

I don't see why isolating the visibility of the next_id variable
inside here is a problem.

> with this change, it's more easy to extend in the future (a weak reason)..

How does this make it easier to extend?  How do you anticipate
it will need to be extended?


If you can explain why it's necessary to use fixed IDs for the
auxiliary devices I'll gladly post a new version.  But outside
that I would really prefer to just leave this code as-is.

					-Alex

>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>> +}
>> +
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>> +	const struct spacemit_ccu_data *data;
>>   	struct device *dev = &pdev->dev;
>>   	int ret;
>>   
>> @@ -1012,11 +1077,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   					     "failed to get lock regmap\n");
>>   	}
>>   
>> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
>> -				    of_device_get_match_data(dev));
>> +	data = of_device_get_match_data(dev);
>> +
>> +	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
>>   
>> +	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to register resets\n");
>> +
>>   	return 0;
>>   }
>>   
>> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
>> index 039a448c51a07..53eff7691f33d 100644
>> --- a/include/soc/spacemit/k1-syscon.h
>> +++ b/include/soc/spacemit/k1-syscon.h
>> @@ -5,6 +5,18 @@
>>   #ifndef __SOC_K1_SYSCON_H__
>>   #define __SOC_K1_SYSCON_H__
>>   
>> +/* Auxiliary device used to represent a CCU reset controller */
>> +struct spacemit_ccu_adev {
>> +	struct auxiliary_device adev;
>> +	struct regmap *regmap;
>> +};
>> +
>> +static inline struct spacemit_ccu_adev *
>> +to_spacemit_ccu_adev(struct auxiliary_device *adev)
>> +{
>> +	return container_of(adev, struct spacemit_ccu_adev, adev);
>> +}
>> +
>>   /* APBS register offset */
>>   #define APBS_PLL1_SWCR1			0x100
>>   #define APBS_PLL1_SWCR2			0x104
>> -- 
>> 2.45.2
>>
>>
> 

