Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAE325DCFA
	for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818643; cv=none; b=H2/Mox+R/R+6R6Y0eR4eHeqljsOa+pbqswXJvKqIxLgHJDoWPd5zwAxD0vhEa4Um1qUBwDrWYocJGl+xa2DD76yhckNbwTr8ndngrJaR2YUlwrlyFRUOfDoLbglFqdpJLePXcjS+akHMMxzV2FH+zY0dO4QH+8H2SdGM85u0Xsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818643; c=relaxed/simple;
	bh=EoiGMOryV4mIY4EbvcMo7ArzQaAHcSCytklybxuMWPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F92vfrcc4RIPamGgpVEUxnQTqQps3fiB08HJkfu/aUWnrgK/CLvvJKoksIFb+fu9h0/Xxdu5WKUcY/1M+M/Yowk1rQm3pfcOtdsVL1ygyZRhE2zobqZZ5YGRLiuuBs9QYCgN9HFjvgn8tneD6tqVHfiHcaPqKOuBCqToYxQ0yso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=MpAoxs/a; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="MpAoxs/a"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso136990639f.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Mar 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742818640; x=1743423440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=MpAoxs/azJJ4uDlUjhS0mWI+IJ666ZsACIbSigtQPSwjkGzzOIca5dfrLJRGMjOdHM
         rvS0g8Kk9ieWaEWwuADY/woqUyABGBYA5jkek8/fqGndLAlXI+EqxPrMbLWVpaqyVdKs
         WvdXXHuqvF5Tzt0mXfJQnjVcZBVY5L0dRu5UIm3VK1i0DW4mHi9nKqg2RfDq4aRXmCbB
         7uX6E+raly6t0IvZx/EkYQnQPPLaenOCX2Uy5+LKTb09/S0yG6N1pVHNTTmGSSnseu46
         NUlmeX630of9h31BWZqF+gnNAM16KsyF1PWnC5pMrQ7F5wKfiP8asYNzeGy0ocSAyisE
         kCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818640; x=1743423440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQjy7+DZqFOo8SThpv8muVN+XmMk5JDMXBX8K79zwoY=;
        b=EYja9aFLALSMfgdH+JznnX8fuuK2yb+ADLWA4PKY4g+9ycHobss/5sCZCuK4ddSw5N
         W66BD17prAK27sXU6x8ByobVpXYxH2xT1H/r98//15rhlA9hot3PFtxqeV/tP/LnwBiV
         dsHOZobWr9jLRIFXga7urgXJGYWroqH8t0jvcJbVOTvTaFdDklfLGPaBoxnWxj4IaUdS
         9AuBwsLM3tRKlFGoSNyrqzHSIrs2bKIzd/brfv4WdJxmke/jZXOwGIHo5HOIVupFffOU
         ZU0K2Nl2eieHqdl0wh0lkTI9rwSeIongRFBsd7gJM0nNQuRfwHr41WR01JpFUIFJEMGM
         C5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03sP41JC2S5Z/WwODHtnWEpZ0Ez6C4GeAPg9bYjjk8uPdyMxW7bjfZmYWC/sbXeqXnCH8P2YY5F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHTV3jMezs3kkY7BKdr1gKjufrRIVQpvOkYarqqu9jBdrpslU
	Qtqekddz9/LDY6LAwjIh8iD2nFZMFkoV7VqxGIOIyScUrTUsKL+xrcIz6oMOU0I=
X-Gm-Gg: ASbGnctO6E1wN6RI5zqbp2kFBbHw4CjaowIVGOl+0ByBMf+vXmvCxSvbFoYAq0PL3+C
	Hx0c1iHyX+JxDPRAHq0zevlo1/lP0jRGiotWSsruNccqvtmZErinDfvbENU2EC725iO+folnLAE
	4/0PPAxCTgP/4DF2IVOA0tNFA50hkjcZipFm6l26QGRvJcr8VaiEbv5TWR8+DmiW/fKZn9j0H4C
	JYlurDIkhzbuDksqdI3BfVUfvwS0S6lXd1jdPEZPsFS9jy64VxyMcFKx8sOSKo7GhnE4INIpm7E
	WME4c0IYn6qAnVJFfYLxjsAmMcH9xmKtUU5IC34HPgM+ofhRmBJhKPRwOlSm1nKCPQc9Vu4T3qy
	fOTBeIp7oF+MEdeFj5vZlumb49ast
X-Google-Smtp-Source: AGHT+IFRMWJu8cQwf/wCsj/90WfTQghFt/WjaXKq/fnbgU/ftzK6xeINV2Af8c2Selfxs/zF8TcQyA==
X-Received: by 2002:a05:6602:7410:b0:85d:ad56:af88 with SMTP id ca18e2360f4ac-85e1ee299f1mr1629181439f.1.1742818639889;
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bd8c42esm160016039f.30.2025.03.24.05.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:17:19 -0700 (PDT)
Message-ID: <b8edc46b-bc99-47c1-8900-0e08c97de9d6@riscstar.com>
Date: Mon, 24 Mar 2025 07:17:17 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Haylen Chu <heylenay@4d2.org>, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <Z-FHt3mDyEBKpa8O@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-FHt3mDyEBKpa8O@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 6:53 AM, Haylen Chu wrote:
> On Fri, Mar 21, 2025 at 10:18:25AM -0500, Alex Elder wrote:
>> Define a new structure type to be used for describing the OF match data.
>> Rather than using the array of spacemit_ccu_clk structures for match
>> data, we use this structure instead.
>>
>> Move the definition of the spacemit_ccu_clk structure closer to the top
>> of the source file, and add the new structure definition below it.
>>
>> Shorten the name of spacemit_ccu_register() to be k1_ccu_register().
> 
> I've read your conversation about moving parts of the patch into the
> clock series, I'm of course willing to :)
> 
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 58 ++++++++++++++++++++++++++---------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 44db48ae71313..f7367271396a0 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
>> @@ -129,6 +129,15 @@
>>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>>   
>> +struct spacemit_ccu_clk {
>> +	int id;
>> +	struct clk_hw *hw;
>> +};
>> +
>> +struct k1_ccu_data {
>> +	struct spacemit_ccu_clk *clk;		/* array with sentinel */
>> +};
> 
> This is something like what I've dropped in v5 of the clock series so I
> doubt whether it should be added back in clock series again, as at that
> point there's no reason for an extra structure: Alex, is it okay for you
> to keep the change in reset series?

That's perfectly fine with me.  It's not necessary yet, so it's
just fine for you to do things the way you did, and I'll add this
in as part of the reset series.

> ...
> 
>> +static int k1_ccu_register(struct device *dev, struct regmap *regmap,
>> +			   struct regmap *lock_regmap,
>> +			   struct spacemit_ccu_clk *clks)
>>   {
>>   	const struct spacemit_ccu_clk *clk;
>>   	int i, ret, max_id = 0;
>> @@ -1648,15 +1668,24 @@ static int spacemit_ccu_register(struct device *dev,
>>   
>>   	clk_data->num = max_id + 1;
>>   
>> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>> +	if (ret)
>> +		dev_err(dev, "error %d adding clock hardware provider\n", ret);
> 
> This error message definitely should go in the clock series.
> 
>> +	return ret;
>>   }
> 
>>   static int k1_ccu_probe(struct platform_device *pdev)
>>   {
>>   	struct regmap *base_regmap, *lock_regmap = NULL;
>>   	struct device *dev = &pdev->dev;
>> +	const struct k1_ccu_data *data;
>>   	int ret;
>>   
>> +	data = of_device_get_match_data(dev);
>> +	if (!data)
>> +		return -EINVAL;
> 
> Looking through the reset series, I don't see a reason that
> of_device_get_match_data() could return NULL. This is also something
> you've asked me to drop in v4 of the clock series, so I guess it isn't
> necessary.

You are correct.  I'll drop it.  I contemplated this and thought
it's useful to tell the reader it's necessary to not be null, but
you can tell it has to be by inspection.


>>   	base_regmap = device_node_to_regmap(dev->of_node);
>>   	if (IS_ERR(base_regmap))
>>   		return dev_err_probe(dev, PTR_ERR(base_regmap),
>> @@ -1677,8 +1706,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
>>   					     "failed to get lock regmap\n");
>>   	}
>>   
>> -	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
>> -				    of_device_get_match_data(dev));
>> +	ret = k1_ccu_register(dev, base_regmap, lock_regmap, data->clk);
>>   	if (ret)
>>   		return dev_err_probe(dev, ret, "failed to register clocks\n");
> 
> For using ARRAY_SIZE() to simplify runtime code, it's mostly okay since
> binding IDs are continuous 0-based integers. But I split the handling of
> TWSI8 into another patch, which creates a hole in the range and breaks
> the assumption. Do you think the TWSI8 commit should be merged back in
> the clock driver one?

I didn't understand the reason why you separated the TWSI8 into a
separate commit.  Now I know.  The hole in the range doesn't really
matter much; you already initialize your ->hws[] array of pointers
with ERR_PTR(-ENOENT), so any holes are handled properly.

					-Alex
> 
> Best regards,
> Haylen Chu

