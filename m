Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793827336;
	b=jt4jmQuKS9YozoQMj+fD0n8gVbRdPPlRmun+PpH78zfWmDt9FP3liiKWHFx9CK3FSBtp
	 UQkB4K6TQQvvidHC5NvBUZ6pc87CI41gxA3+slW4HXJ6Q2YV94alc6pLaJLnY6E1pVHAB
	 Qc/fbgvU1nEm9gcfpcqvU5b5pwfFLh85BWxJ7SY89SqrZ1O/lQQcrXZiuhzIHHmq7XGkt
	 c89atsu0LCkewLn5OahJyXLTp04vpwkrBG8gF+Qsvj/bvGLkUK0QT/Q+X32xAbXChYwCe
	 iEo0kqVvrIwF+1oktMAYSSg+3dYGOzELTDOAqcoja8uMIQ9GFcYGYZz9o0MaGnOqfvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793827336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
	b=sGre5uYR6jluxqheBnX7D1OoRHwYY4KLQJUgtDC6TjlKnO1zlD3lHa5aaXyF5AO8DWvZ
	 sIBPfF3OPDJM7iubN0zzoDDEQlVF3hAbkYx5nZLN8EREbUwtPKudEhPnks8OR1fHw04JR
	 sqCQ8c7pxZJ3Y8FiVCJrJ7eCkhnC99OZYmFfMyPCKfERjQeyDz/rLsyH28Ub9WfUjIzaH
	 ngMXrpwHThSk2BE64VF2Gnaeev3k75pe8P4SD6EP6nEmP9FN3xIAYd1s5Y2JYVHIQag6i
	 OqpV0+ulYZdieyOSgeVcgV26nNuWqLu8VRv1oiaJpizBSI6wcjqUolf5gSavUHDMqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vik+bbPW;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B550606B2ED
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 21:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B550606B2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Vik+bbPW
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-48ed0b68895so767468fac.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 13:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793827335; x=1794432135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
        b=Vik+bbPWeOqYmogekwytVIn7edS7Ve8UtTXDDbPM4qhCU+uEpvyX6r4OnNFofvtqed
         oLCDV/7+fvtjcGyf1pBp03zjbIKWIfZ8an1Lggv8RwwgGz+qQ7HXB/w855BIU3rbXmEP
         lHBBBjbj82LoE0hCAnh+sgrStnwnn009prYQxFXrsnoyXTJsSoI31IkwSNMHNd81gMve
         xPMV3gkCsQeZJjFIeJzgoJrZlun53gqZJvomjvildZiYmwC5SWXVgbcdG6p9hVIJFemD
         V9iZj3Zi0/dtqMJTHmbN9VtdrouOM/IHbyKiJyI4kbd/11PZSxnsBCKqbtWeL54/q8j6
         9Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793827335; x=1794432135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5/lrUfYBVKtk8LFUOYPI+i/daG7iBFygT1vkGG8Etw=;
        b=GrvG8Qt8Ytmton2q9ccXWKkoAJ9jXZOAjao7voj4m2Y1utfC5R4CLUR8EXvZw3VSys
         oLXwHSmj4U2JBi18JcNM+jEzCUteJaVM73fbrFk3EMKnvmVCAeXMVMjt92oavRcAJo8G
         X2EYhF9yOw0+LoGVDDbiqcfpk3Na98YXTbDWxzjOamJ7gba9/YQmIoPiiu6DD2ixZk1O
         nCR6C/+EKw6xJ5p9hhvAZYM6esK2xWRre6pwC+xXlTjpk8/EuTj8K7idS0CG3GTZm5kZ
         Ur8XRJA3iw3IDTz9qiQDaynjbf8KktKghHsgHv/GJuP806kRqVBq7qlJnJcVw5cVrffL
         C1Dg==
X-Forwarded-Encrypted: i=1; AKwUvBz2HnJp0J9DwHgBZ91jaEelqmB+pnhLNrL1fFURd6e1CIunQW6DI+m8AoYLNlS3SWKgIHybWj3mECk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1eIAE7DmQZsOvzjkRMNbh/MQw+NdW9mYWUuoPGZz/28VnVy5J
	wdn2W1P5PraWh+0QJiy7kWZGhcNb8MTSwF8jy5AQwfiVo+qOVskU3rx2NkHX75Oh8EE=
X-Gm-Gg: AYBFou277TK0emC6Dk8C2B//zPnfBR3NDclf0/u2qArhHLh8tY9yA0aBTozd6Wk57JA
	owhLnPLKtQnpmq5C2dOyXLQ/XEJ+CGu8mJ/quvAXHbompKN5pq/8fqlUhQ8FfJShMhzv7kMavHl
	BstZwx5LJAQMB/lmeWetSsi95zdUIbDOsKtP1Gf9W9TRv2OG8DMmh1ySkoXZJATcT53YA3y7NPI
	li2CFpyUNlLXgDAHQ2LMlNVUFQMnoVxlbwAQaOWooaTNVB2lNhu/H2FGaJrI0qFfAW7p9kqalKQ
	scudlgMnTKn5VN7lK2d8V8gYi+aodR8TQJZNo+udvj4+sICBU2uzfEQK8DQRFwSujd1bSVdZkpt
	SpsH1ziJcKeV/Bhgp3mSzbHtuAXcGu+c2Xrga6xsskw/7gG+hZWy07upXh05oUwWc436y04/2sx
	sSOGbl031lmncj7nZGioVZasoj7GW4CXikRV+0jJAQ8JPkK0q7DUk5miJtEvTEnN5FVUUlsHYlf
	fDo3hLs6faAylBbm6oEwaF4J2M22qiinOEvSzquMnjTMkE0ZXnO0afwKKS+wsRuecFNBOvdxbwh
	AmGY37p00RZYB0cMNttmQgIoch73
X-Received: by 2002:a05:6870:899d:b0:4a7:6dc:af65 with SMTP id 586e51a60fabf-4a90761c954mr10824894fac.10.1793827335301;
        Wed, 04 Nov 2026 13:22:15 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61d382sm2928188fac.13.2026.11.04.13.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 13:22:15 -0800 (PST)
Message-ID: <de25cd14-dc54-41e8-a49d-d3da588bb0d2@riscstar.com>
Date: Wed, 4 Nov 2026 15:22:14 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-4-elder@riscstar.com>
 <sashiko-outbox-196325@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-196325@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 6:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] clk: tc9564: duplicate clock names across chips due to using dev->id

I will address this issue by ensuring the name gets formatted using
the TC9564 instance number, to ensure the names are unique.

Separately, I'll use PLATFORM_DEVID_NONE rather than PLATFORM_DEVID_AUTO
when adding MFD devices.  There is only clock and one reset per TC9564
instance.

> - [High] clk: tc9564: uninitialized clk_data->num in tc9564_clk_probe()

I didn't realize I couldn't count on devm_kzalloc_flex() to assign
the flex array counter in a structure.  I will fix this.

> --
> 
> commit d0d52063b982041aca91451199195cd79995784b
> Author: Alex Elder <elder@riscstar.com>
> 
> clk: toshiba: introduce a TC9564 SoC clock driver
> 
> This commit adds a platform clock driver for the Toshiba TC9564 SoC,
> registering its PLL, fixed-factor, and gate clocks via a syscon regmap.
> 
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..8eeba85919703
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,288 @@
> 
> [ ... ]
> 
>> +/*
>> + * The full name of every clock has a prefix "tc9564" followed by a single
>> + * character ('a', 'b', etc.) that differs for each chip/device number.
>> + * Each clock's "name" defines the unique portion of the clock's full name.
>> + */
>> +#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
>> +#define NAME_SIZE	12	/* Unique portion of the clock name */
>> +#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
>> +	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
>> +		'a' + (_id), NAME_SIZE, _name)
> 
> [ ... ]
> 
>> +/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
>> +static struct clk_hw *pll_register(struct device *dev,
>> +				   const struct clock_init *init)
>> +{
>> +	char full_name[FULL_NAME_SIZE];
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
>> +
>> +	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
>> +						       init->mult, 1);
>> +}
>> +
>> +/* The PLL is the parent of all fixed clocks */
>> +static struct clk_hw *fixed_register(struct device *dev,
>> +				     const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct clk_hw *pll_hw;
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> 
> [ ... ]
> 
>> +static struct clk_hw *gate_register(struct device *dev,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	char full_name[FULL_NAME_SIZE];
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	FORMAT_FULL_NAME(full_name, dev->id, init->name);
> 
> [Severity: High]
> Will passing dev->id to FORMAT_FULL_NAME() in pll_register(),
> fixed_register(), and gate_register() cause clock registration to fail with
> -EEXIST when more than one TC9564 device is present?

Maybe.  I have no machine (yet) with which to check this.

> The clock MFD cell is registered as a platform device in
> tc9564_config_syscon_probe():
> 
> drivers/soc/toshiba/tc9564-syscon.c:tc9564_config_syscon_probe() {
> 	...
> 	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> 				    tc9564_config_syscon_cells,
> 				    ARRAY_SIZE(tc9564_config_syscon_cells),
> 				    NULL, 0, NULL);
> }
> 
> For platform devices, the platform bus stores the instance ID in pdev->id
> (struct platform_device::id), while dev->id (struct device::id) is never set
> and remains 0 for every instance. As a result, every TC9564 device formats
> its clocks with the "tc9564a_" prefix (such as "tc9564a_PLL"), so probing a
> second TC9564 device collides in __clk_core_init() when registering its
> clocks in the global clock namespace.

OK this is something I hadn't taken into account.

My intention is clear, but the code seems not to be doing what I want.
What I really want is for the "a" in "tc9564a_" to correspond to the 
TC9564 instance number (basically 0 or 1, though some future system
could have more).

I will investigate this further and will find a solution that
generates the names in the way I intend.

> 
> Note that pdev->id cannot be passed directly to 'a' + (_id) either, because
> PLATFORM_DEVID_AUTO allocates IDs from the system-wide platform_devid_ida
> shared across all auto-numbered platform devices rather than a 0-based
> per-chip index.

This actually highlights a different thing that I plan to change in
the next version.  I think PLATFORM_DEVID_NONE should be used rather
than PLATFORM_ID_AUTO when adding the MFD devices, because there is
exactly one instance of the clock and one instance of the reset for
each TC9564 chip.

And based on my plan to have the "a" represent TC9564 instance 0
and "b" represent TC9564 instance 1, the (correct) statement from
Sashiko about it being wrong to use pdev->id this way will be moot.
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = full_name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +
>> +	clock->hw.init = &clk_init;
>> +	clock->init = init;
>> +
>> +	ret = devm_clk_hw_register(dev, &clock->hw);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	return &clock->hw;
>> +}
>> +
>> +static int tc9564_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct clk_hw_onecell_data *clk_data;
>> +	struct tc9564_clock *tc9564_clock;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *parent_np;
>> +	int ret;
>> +
>> +	parent_np = dev_of_node(dev->parent);
>> +	if (!parent_np)
>> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
>> +
>> +	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
>> +	if (!tc9564_clock)
>> +		return -ENOMEM;
>> +
>> +	/* Note: MMIO regmap (no error checking needed when used) */
>> +	tc9564_clock->regmap = device_node_to_regmap(parent_np);
>> +	if (IS_ERR(tc9564_clock->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
>> +				     "failed to get config regmap\n");
>> +
>> +	clk_data = devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
>> +				     CLOCK_COUNT);
>> +	if (!clk_data)
>> +		return -ENOMEM;
>> +	tc9564_clock->clk_data = clk_data;
>> +
>> +	dev_set_drvdata(dev, tc9564_clock);
>> +
>> +	/* Initialize all the clocks */
>> +	for (u32 i = 0; i < clk_data->num; i++) {
> 
> [Severity: High]
> Does clk_data->num remain 0 in tc9564_clk_probe() when building with
> compilers that do not support __builtin_counted_by_ref?

I did not expect this particular feature to work differently on
different compilers.

> 
> devm_kzalloc_flex() populates the __counted_by counter via
> __set_flex_counter():
> 
> include/linux/compiler_types.h:
> #if __has_builtin(__builtin_counted_by_ref) && \
>      !defined(CONFIG_CC_HAS_BROKEN_COUNTED_BY_REF)
> #define __flex_counter(FAM)	__builtin_counted_by_ref(FAM)
> #else
> #define __flex_counter(FAM)	((void *)NULL)
> #endif
> 
> include/linux/overflow.h:
> #define __set_flex_counter(FAM, COUNT)				\
> ({								\
> 	*_Generic(__flex_counter(FAM),				\
> 		  void *:  &(size_t){ 0 },			\
> 		  default: __flex_counter(FAM)) = (COUNT);	\
> })
> 
> On compilers without a working __builtin_counted_by_ref (such as GCC < 15.1
> or Clang < 22.1), __set_flex_counter() writes COUNT into a temporary compound
> literal and leaves clk_data->num as 0. Without an explicit
> clk_data->num = CLOCK_COUNT assignment, the loop in tc9564_clk_probe()
> registers zero clocks and of_clk_hw_onecell_get() rejects all clock lookups
> with -EINVAL.
Given this report, I will assign the counted-by field after
allocation.

					-Alex
