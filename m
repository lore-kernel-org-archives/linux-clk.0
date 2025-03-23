Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743AE10A3E
	for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 13:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742736218; cv=none; b=ZzsuyiOkLVdfqvAKurVqdrgDmpbJJH+1Og88eU4DfwOiB5qhgRg/VKpk4azBzo1N1XubN7wGSiraUEmWSS6c3uVnoQWBlpMqgcf1mbeUeiyolgjll926ADQAqn7kHgEd7Vg457nwdsdlBlDhgc70WIUJBYRU3S5pTlo/AiSMO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742736218; c=relaxed/simple;
	bh=J6WnXBloPgbeRESCQgIumXIdlxMfgQK65gk/b5pcqGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DW9CEGtv5rshcPaCLXc8XTsHZuO/VC+tV/nN5whyOT1WyACBWfXYaTpxRB0tMFnMqtkFdA6mjDhf/1uSpjjmBjPG2Ng4trGfzrCxN8l5B35Ud1jSesss9ECjA0Og82qlAU8XqwTturz683SteKGJ7CZ20jFf+trwLCHIqDmUbdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=yfIuDTtn; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="yfIuDTtn"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85b42db7b69so34114639f.0
        for <linux-clk@vger.kernel.org>; Sun, 23 Mar 2025 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742736215; x=1743341015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MF1iVT3Gp1JCkjbWX7zYULPkp8dzcYyXF+RzM+PeslQ=;
        b=yfIuDTtnkRvtFFOxT4hMP0etJI0ZhcW4B7oq07SScaIKGfNzYUZ/x62YDql6m+70rk
         TUa0jPQjhQOsOLTwZ6vJrQg91IrbBA2Am44pJKufmgndWcp2IpEZGYOicLX4BJWnVX9S
         DGhPjJ2P5A5vVXLJVsv0HnX+nUkXV/4ZhDn4WgGUTbDF8SEy9mFSHGnRRxblGujaW1mo
         dkdKGJfbedvZQ5VadBXcG/VcH41TF1KlfKR0KwRpsPadO0l9qpCr+8nA/1yNO6jsXNzW
         eKDSr/LYvb0whE8i/pY+erlvVBNQ3G8hQkT72Lz1avq+kL06r8VsyOTkUS50gkQ1tWkP
         kNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742736215; x=1743341015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MF1iVT3Gp1JCkjbWX7zYULPkp8dzcYyXF+RzM+PeslQ=;
        b=RF6vN+tvZJZY7Zm2f9WjQzeNS8KCCQBY3w8UU/40e+atjhF6TZs0+zrKhtkz5vOwlk
         TBZJ5hSicbOEDJC9fMS7Ce1iMt+SQqxyERdRoJgvPqpF+zR23eyQOVjGuKuK9ivq2tGT
         slh+X6CPbwVCmmfZ+YzwvEs0sTgVhAjhG3EvzGk5x9uJ6ryH0su83YC9yWzk0wlGzKVR
         huXlJUMM3ITtIE6SlU+5aK9HyPJOvFcfQwxV1feLzSzOWL3s+9ri6fDwbhZEiL/56fCe
         zaCMGNXllG5a3i2lVDiQ8A4CiPobSQ2u1cQTFTl+Vp93LiceImJc2Y2MSjAYvz0u/hDn
         6OVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBSt47v9wlSWJC5b3hQsxd4URCH2V4EU4MGCZ8dwt25Gqja0+bi8v/5Eh94qqMtBayaT7AXvVA+ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpMn5Y93bQFZ4OjhRsVtjvJInHw2ZMPB54dqFBmWLv2qo27iXY
	z49LBl/Njoj7bCTjelRVNWWRzzMHbgjbJh7p9h1QHBQGORZ8omFNRpCpaDtorSk=
X-Gm-Gg: ASbGncsiukSrqUILzuk2SUbALqgrgQgC4igUCA0yDt6UJ+Y/9SjNEN1e3L+lDLsfKwB
	EsqIzSyQ8r5KaruZkSwaElcf22nN5TPc8t8mm0yH/qnuWsq0J2rwRTxPMROvdCA5y6bfxjNgo5K
	8sfyUpVfp2g3uk6rfzjU5uQMup5MVjK20KXlEZ3khsEdDSnri7vYmTmCnoIO5lpGc2UAD3x2Lsu
	kb+/Aro6V4FI/DfHpW1q/D2mBGDwESDtrP4fuOEnybG/9PRTkhHYGY7SR6Gt3+I56p8nkmVmdRu
	odlDhteonRKCLwYpwgv/Cs4rQUR4kbwchTGPX7PZDyRUnkvOQIwgg+LE/yNTRKVmUvwxxYeEOJa
	xf+hinGhhugq2e+4Q4Q==
X-Google-Smtp-Source: AGHT+IFR0CjPJdYQFsJ+qkfXY8PeJzk1jrSY+MFWWSTv2UJlux3/unLE6GBpx2aJu492yAFXoDeX/Q==
X-Received: by 2002:a05:6602:a117:b0:85e:2e8b:602 with SMTP id ca18e2360f4ac-85e2e8b0d55mr578692239f.2.1742736215295;
        Sun, 23 Mar 2025 06:23:35 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc13d74sm125798039f.11.2025.03.23.06.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 06:23:34 -0700 (PDT)
Message-ID: <4ad5dc64-c6e5-476f-8674-bbedb8df5f8d@riscstar.com>
Date: Sun, 23 Mar 2025 08:23:33 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com> <20250322161945-GYC11633@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250322161945-GYC11633@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/25 11:19 AM, Yixun Lan wrote:
> Hi Alex:
> 
> On 10:18 Fri 21 Mar     , Alex Elder wrote:
>> Define ccu_reset_data as a structure that contains the constant
>> register offset and bitmasks used to assert and deassert a reset
>> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
>> a structure that contains the address of an array of those structures
>> and a count of the number of elements in the array.
>>
>> Add a pointer to a ccu_reset_controller_data structure to the
>> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
>> the new pointer field will be null for CCUs without any resets.
>>
>> Finally, define a new ccu_reset_controller structure, which (for
>> a CCU with resets) contains a pointer to the constant reset data,
>> the regmap to be used for the controller, and an embedded a reset
>> controller structure.
>>
>> Each reset control is asserted or deasserted by updating bits in
>> a register.  The bits used are defined by an assert mask and a
>> deassert mask.  In some cases, one (non-zero) mask asserts reset
>> and a different (non-zero) mask deasserts it.  Otherwise one mask
>> is nonzero, and the other is zero.  Either way, the bits in
>> both masks are cleared, then either the assert mask or the deassert
>> mask is set in a register to affect the state of a reset control.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index f7367271396a0..6d879411c6c05 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/minmax.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>>   
>>   #include "ccu_common.h"
>>   #include "ccu_pll.h"
>> @@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
>>   	struct clk_hw *hw;
>>   };
>>   
>> +struct ccu_reset_data {
>> +	u32 offset;
>> +	u32 assert_mask;
>> +	u32 deassert_mask;
>> +};
>> +
>> +struct ccu_reset_controller_data {
>> +	u32 count;
>> +	const struct ccu_reset_data *data;	/* array */
>> +};
>> +
>>   struct k1_ccu_data {
>>   	struct spacemit_ccu_clk *clk;		/* array with sentinel */
>> +	const struct ccu_reset_controller_data *rst_data;
>> +};
>> +
>> +struct ccu_reset_controller {
>> +	struct regmap *regmap;
>> +	const struct ccu_reset_controller_data *data;
>> +	struct reset_controller_dev rcdev;
>>   };
>>   
>>   /*	APBS clocks start	*/
>> @@ -1630,6 +1649,48 @@ static const struct k1_ccu_data k1_ccu_apmu_data = {
>>   	.clk		= k1_ccu_apmu_clks,
>>   };
>>   
>> +static struct ccu_reset_controller *
>> +rcdev_to_controller(struct reset_controller_dev *rcdev)
> I'd suggest to avoid the line break to make it slightly more readable, intuitive
> as the 80 column limit isn't hard rule
> 
> there are maybe more place similar to this, I won't add more comments
> https://github.com/torvalds/linux/commit/bdc48fa11e46f867ea4d75fa59ee87a7f48be144

I disagree with this suggestion.  I personally find this
more readable.  As the first line of the patch you link to,
"80 columns is still preferred".  And regardless, it is my
(strong) preference to work within 80 columns in almost all
cases.

>> +{
>> +	return container_of(rcdev, struct ccu_reset_controller, rcdev);
>> +}
> since this function is only used once, open-code it?
> but I'd fine with either way if you prefer to keep it

The "to_<containing_type>()" function pattern is extremely
common, but I like this suggestion, given it's used only
once.  I'll implement it in v2.

> 
>> +
>> +static int
>> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
> s/k1_rst_update/k1_reset_update/g
> this is a taste change, but I found more people follow this when grep driver/reset

I actually had reset (not rst) before, throughout.  But it made
a few lines too long, leading to line wraps, so I did this.

In addition, there was a sort of consistency with the use of
"clk" instead of "clock", though I do recognize that abbreviation
goes way back to when Mike implemented the common clock framework.

I'll switch back to "reset" (and "RESET") in names, but be warned
I'll add some line breaks to fit within 80 columns.

>> +{
>> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
>> +	struct regmap *regmap = controller->regmap;
>> +	const struct ccu_reset_data *data;
>> +	u32 val;
>> +	int ret;
>> +
>> +	data = &controller->data->data[id];
>> +
>> +	ret = regmap_read(regmap, data->offset, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val &= ~(data->assert_mask | data->deassert_mask);
>> +	val |= assert ? data->assert_mask : data->deassert_mask;
>> +
>> +	return regmap_write(regmap, data->offset, val);
>> +}
>> +
>> +static int k1_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
> same reason, rst -> reset, more below
>> +{
>> +	return k1_rst_update(rcdev, id, true);
>> +}
>> +
>> +static int k1_rst_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +	return k1_rst_update(rcdev, id, false);
>> +}
>> +
>> +static const struct reset_control_ops k1_reset_control_ops = {
>> +	.assert		= k1_rst_assert,
>> +	.deassert	= k1_rst_deassert,
>> +};
>> +
>>   static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>>   			   struct regmap *lock_regmap,
>>   			   struct spacemit_ccu_clk *clks)
>> @@ -1675,6 +1736,33 @@ static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>>   	return ret;
>>   }
>>   
>> +static int
>> +k1_reset_controller_register(struct device *dev, struct regmap *regmap,
>> +			     const struct ccu_reset_controller_data *data)
>> +{
>> +	struct ccu_reset_controller *controller;
>> +	struct reset_controller_dev *rcdev;
>> +
>> +	/* Resets are optional */
>> +	if (!data)
>> +		return 0;
>> +
>> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
>> +	if (!controller)
>> +		return -ENOMEM;
>> +
>> +	controller->regmap = regmap;
>> +	controller->data = data;
>> +
>> +	rcdev = &controller->rcdev;
> ..
>> +	rcdev->owner = THIS_MODULE;
> move to last?

You mean move nr_resets to last?  I'll do that.  I'll
order the assignments in the order they're defined in
"reset-controller.h".

>> +	rcdev->nr_resets = data->count;
>> +	rcdev->ops = &k1_reset_control_ops;
>> +	rcdev->of_node = dev->of_node;
>> +
>> +	return devm_reset_controller_register(dev, rcdev);
>> +}
>> +
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>> @@ -1710,6 +1798,11 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
>>   
>> +	ret = k1_reset_controller_register(dev, base_regmap, data->rst_data);
> ..
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "failed to register reset controller\n");
> same 100 column reason

This one I might go beyond columns, because it's only a few characters.

					-Alex

>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.43.0
>>
> 

