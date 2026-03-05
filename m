Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD77239A7F9
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 13:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716380; cv=none; b=rdTqTGB24pxE/TVtQXLeuvsW1fSOhSKppey6NZgVAUrNdE1QfQ0bvq0dJPymLra97E3QsyEnkNtbBMF9ea7BvmlxvX2UY/vg3uFBCxI2+azjzvsuRA9wEgCrECZjSBlDapBRMhul9qLDC3xdSElf2TMQ7LUUyOgwlKzpjb9zDcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716380; c=relaxed/simple;
	bh=FjfD/aPpArJ7WVrUmY7sC3SNZdc1CwIxsnWRlmvhR6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zo6syP7RgHAX9BQqy2S3Ys7kNUJl7zn7jg5kF7GtKNVC1pENxFrUglFTLi6qjc7ouzfa5W7ZFxonlfFmVP00Gv9go2ObfLmX/rdFSHlVxWHRJd190KB0VCNqiAol1Z2urHBcVfTbYqoydlRx2x2v0wxMaZZQxfX0l7ukT/rdjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ssBxrRfZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ssBxrRfZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5VBMGygrn7J3QqoRIgoU7F3m2wdmnelaXdnoZHrs2Pk=; b=ssBxrRfZPkBPDOdA8GZ1IqQ9hn
	LIPhIKaDruhJL+BXgB4gGbFZRYYVQIzkfCx03Vdfqbs8wvSKeVtfHP3wxvWsZxNuJnqxd50kzeR7i
	i6LGJLONyFCGp+S2bECjhmv3OR6A6f1VnDMj8kfoDV8rk4784/Bl3IJqCveOwznx88vyvy3EDsgNB
	CSuhsP5iszxf+J8HFCyCFxKfQrN6eN+43VoPLSFwW5dRnkywqkUEeCL2zH+WvhCLz01kjqNSsO5Wn
	bZofdgx/CLuFbbc5axl87clAryCQgSCWw37Gp+JeSFdxKyLT+09Bqx0aVyc8Kn9l2eFOjsw2dcIZ4
	dRAMtsyw==;
Received: from [189.7.87.203] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vy7xP-009MPz-2G; Thu, 05 Mar 2026 13:37:35 +0100
Message-ID: <ffa09e98-8b28-48b2-875e-804b56eafb4b@igalia.com>
Date: Thu, 5 Mar 2026 09:37:28 -0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
 <20260224-curvy-shiny-dodo-e50cef@houat>
 <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>
 <20260305-unyielding-sponge-of-efficiency-07218c@houat>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260305-unyielding-sponge-of-efficiency-07218c@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 05/03/26 05:53, Maxime Ripard wrote:
> On Wed, Feb 25, 2026 at 10:57:11AM -0300, Maíra Canal wrote:
>> Hi Maxime,
>>
>> On 24/02/26 11:11, Maxime Ripard wrote:
>>> Hi Maira,
>>>
>>

[...]

>>>> @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
>>>>    static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>>>>    {
>>>>    	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
>>>> +	struct raspberrypi_clk_variant *variant = data->variant;
>>>>    	struct raspberrypi_clk *rpi = data->rpi;
>>>>    	u32 state = 0;
>>>>    	int ret;
>>>> +	/*
>>>> +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
>>>> +	 * actually power off the clock. To achieve meaningful power consumption
>>>> +	 * reduction, the driver needs to set the clock rate to minimum before
>>>> +	 * disabling it.
>>>> +	 */
>>>> +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
>>>
>>> I'm not sure setting it to variant->min_rate would work directly either,
>>> since it would break consumers expectations. Also, can we guard it with
>>
>> The clock is being unprepared, which means that any consumer that wants
>> to use it again must call clk_prepare() first, at which point the rate
>> gets restored (for maximize clocks) or re-established by the consumer
>> via clk_set_rate(). Considering that no consumer should be relying on
>> the rate of an unprepared clock, I understand that there are no
>> expectations to break here.
> 
> For both of those, I still feel like it's a pretty strong deviation from
> the general expected behaviour of the CCF API. From what you're saying,
> we shouldn't notice it too much, but at the very least we should
> document it explicitly, both what the deviation is, and why we think
> it's ok.
> 

I'll make sure to add such comment in the next version.

>>> a version check if we know that there's some good and bad firmwares?
>>
>> So far, all firmware versions have this issue. For future firmware
>> releases, it might change, but so far, all firmware versions have this
>> issue.
> 
> ack :)
> 
>>>
>>>>    	ret = raspberrypi_clock_property(rpi->firmware, data,
>>>>    					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>>>>    	if (ret)
>>>> @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>>>    {
>>>>    	struct raspberrypi_clk_data *data;
>>>>    	struct clk_init_data init = {};
>>>> -	u32 min_rate, max_rate;
>>>> +	unsigned long rate;
>>>>    	int ret;
>>>>    	data = devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
>>>> @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
>>>>    	data->hw.init = &init;
>>>> -	ret = raspberrypi_clock_property(rpi->firmware, data,
>>>> -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
>>>> -					 &min_rate);
>>>> -	if (ret) {
>>>> -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
>>>> -			id, ret);
>>>> -		return ERR_PTR(ret);
>>>> +	if (!variant->min_rate) {
>>>> +		ret = raspberrypi_clock_property(rpi->firmware, data,
>>>> +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
>>>> +						 &variant->min_rate);
>>>> +		if (ret) {
>>>> +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
>>>> +				id, ret);
>>>> +			return ERR_PTR(ret);
>>>> +		}
>>>>    	}
>>>
>>> It feels to me like it would need to be a separate patch. Why do you
>>> need to override the minimum clock rate reported by the firmware?
>>
>> This change is needed because the prepare/unprepare callbacks need
>> access to the min/max rates. In the current code, these are local
>> variables in raspberrypi_clk_register(). Storing them in the variant
>> struct makes them available to the callbacks. The `if (!variant-
>>> min_rate)` guard only preserves the existing behavior for clocks like
>> M2MC that have a hard-coded minimum rate.
> 
> min_rate itself is indeed available only in raspberrypi_clk_register(),
> but its main use is to call clk_hw_set_rate_range to use it as the
> minimum clock rate.
 > > In prepare/unprepare, you should be able to use clk_hw_get_rate_range()
> to retrieve it, or am I missing something?

Okay, I got now, I didn't know about the function
clk_hw_get_rate_range(). Thanks for your feedback! I'd address it in the
next version.

Best regards,
- Maíra

> 
> Maxime

