Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210439;
	b=djxRY/Zw1v1EDa7Umjf+XMkG1g1qiUIP0glkpgcN96ZSTwtxR4Nr9odx6orq1wrN1HIO
	 3QHKPxbHq9JIf//4baM1GkC7lGSi1OhKv0akG8q+7kkCs0NHI3ROXQpJTnKVPreKjX8EU
	 xl/wK6IEmTSfCd/101Gm9n26HROuNVbcFlpfw8qFStskwvtDP6oX+kbhjA1xO7/Bfi3Oc
	 tFb3vBIHFMYCRqM0RcaAHoOZILolDKWse2JormuFFPFagaTY2Wq6HlNlFJuodqSwOOy/J
	 jHyil1+VqF0e0NKImtg6eLAYd6oIGJ5WfXg09uugh45IaoJXl9wInP3U3fWID3jMhXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
	b=wdVXKwVrXiixwfqhYM0dCYMMo8ziqsru/KABVyYGdgG1OTx7+nCROHNjmJQzonoND2l0
	 3rD75LSQGK2ZNLfYoO9Uz0PyehbRi8xRG12sFX8e2YQiM16Y9ZueyWz2cjGMSCIkVv14J
	 fy+jvs0Q7VUxjk4rei8EP9IG2VxsdobbBF2rAWaHYv0/SAjW5AtNcD1B6H3llqDak/LhH
	 BBHKBUlaTjVn04aFyCv7fB+A7EsIcSlhfKS3ZCYDZQ+BQFQ6vpPpEr9C7R3jwUqmgGnKi
	 s11jBQAFqpm/hfeCvqjjfNTfmb5D5TY66eKNa93dSIUxxwTpt5rPK3xpi+fMKW5mfPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OQlWJhIi;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BCC606A337
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 21:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BCC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OQlWJhIi
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-483d290f398so837502fac.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 13:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795210433; x=1795815233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
        b=OQlWJhIiC0XRKcfjw1tTmgnegt6YqqTE3g+iJ4Ayb7FIkwAHpLEpusjQ+NfGO9GkEl
         IW76A+xSYfA8FCRG0kFLhM3ITqYlBBm0S+PNPUyry9CTZH5VnAxrqqrklckXGdHABVg8
         Hcf9oklA7XaPUfXXLcTe32DI8lFcRwWMaeu/DGejsunMfqlM8YOO1oP9jDm2IKYdeadH
         cqbLXpbjEi05gqbH3mMBYrQH2EQgqpAz71BAh/z8ER8rtNI3vnoxgKwskgmyi89SyCR0
         rKzuOueS4+ZReoB8/Z4wtE3L4alN4Z48MsNka63ucJcdsn8Ku3QCb/3jFZb4x7qH952U
         XDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210433; x=1795815233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQI7dFtW45SJmVgRHVzx21Zyb7CXJ48fgy5qE9osfjQ=;
        b=pETuiYNYqAl1Ix1+7FCcQuo5HnTn2SucuQWPYLWvOW/J4/w8P2zvbE+I57q5htZqua
         LK/8nlWU74oh0SSypX6eAd3SBM5hsO5Yr11lwgjjUTfw7NUmesJBt0VVqhA6TcU0w5t8
         Ikv8rfgqYgbnjmUcp5QrYAFhrQrHLV+BYgQ67pnAhCSMB41M1sRN5KAP1DA3Lt7Fa3WU
         LD1LeUJUhI87OozOR2yejVPfV+4IByi+IYY6DZDto5edMGU88S7kOsMvYOJnjjsGbL92
         p6UpFD2LlFTz33l8IpPWnwOSVQFuypdCaPNiYdeRg+9wRiBOzG7bKVJ176EIKyhs+Qyz
         TJLw==
X-Forwarded-Encrypted: i=1; AL+hErGmgc8JW0x1JXZ9l9L67M9lh0ymfoM7W344Q64kXA00k6tyXnrWm6pZeJOKDVyi9xFONm/wYjSVE2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z99A3xi1hBNxyLF9RJ5hklT2B4wcSGSvqrT2SV781KXGV6tOwG1
	apzJbWQkwnaYjFXw3bj1lhEyu3E7DNMNWKuZM1tn7L8pH8rwBf5EP9XJ2jhU1+HK9yE=
X-Gm-Gg: AZFdTZeRbVCjMaS6kFTH3oibdAXmVdqqaE1u24OJeF+k+NEDSnjgfbeytPUlez9lnFr
	DUM95H/VbvAg2LEpRGi9mpZkwHvqklWI3MsNeQHezee0NwIVIxXTjtOfc2C6WHxg745hWm9MUKe
	U2+wy8SZNBJIPyk2hvrJt0W5tqVfFdFUL/CkxsELX312bRBNlQhUvT76j7Z0rFR9hIzH5cRYxus
	TEe/BtyhIycGJOr6r0VhHSmAKt6NKK5TgvL3dyZ+cWjraX0n6JVneiCECh9yvBJ8GvEVtm5bLW3
	i5qLrBqBhfp0u41cmcCZZldp2rY1AqS1j3HpOedKr9WzRBZWgWYRxgRIUhseC4NdRa54P6SmCND
	yLNDXGMnRXRpmC4CJHgUKJ2YXlU5RF3h/Q3x/Me/JyvbR1UVyZcwnZP3quGvKKtSjRXcjhznET4
	OiYNI1dBXsJv0HH5dDxfhpVzI5XfZ1u/kBMAJOyM8joIMvFv/KlZDwOlfjwic2I75tUBzs4JnR+
	meakn5XFwgHinhNIKNcWaBU1q6/ggi2+AyinydqU3zifgFZmy6TM5s1Q+xfbKw0YNPeWcBxYK3o
	21HffrSUJu1+7s4keyeXABX/scCJ1Rjngg==
X-Received: by 2002:a05:6870:3d8b:b0:483:cb42:3979 with SMTP id 586e51a60fabf-4bc8289cfbamr4568358fac.17.1795210433325;
        Fri, 20 Nov 2026 13:33:53 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bd3008160dsm3072987fac.16.2026.11.20.13.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:33:53 -0800 (PST)
Message-ID: <51e8f08c-623f-44ad-a2ce-d7905984a6ee@riscstar.com>
Date: Fri, 20 Nov 2026 15:33:52 -0600
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
Subject: Re: [PATCH v2 2/2] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-3-elder@riscstar.com>
 <sashiko-outbox-225862@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-225862@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 12:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [Medium] clk: tc9564: unlocked register read-modify-write in
>    reset_manage()
> - [Medium] clk: tc9564: missing select RESET_CONTROLLER in
>    COMMON_CLK_TC9564
> - [Low] clk: tc9564: stale v1 and dt-binding text in commit message
> - [Low] clk: tc9564: duplicate clk_gate implementation in
>    gate_register()
> --

Quick summary (more below):  I will act on all of the observed
issues mentioned here.

> commit c8a057c6e9911108f130ae1447d0fae1c9ba8eff
> Author: Alex Elder <elder@kernel.org>
> 
> clk: toshiba: introduce a TC9564 clock/reset driver
> 
> This commit adds a platform driver for the clock and reset controllers on
> the Toshiba TC9564 SoC.
> 
>> Define a new platform driver that manages clocks implemented by the
>> Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon
>> be) used are defined to be controllable.
>>
>> Two registers manage the state of the clocks.  The registers are
>> accessed via a regmap supplied by a system controller.  Access to
>> the memory region is provided via a BAR on a PCIe endpoint function
>> embedded in the TC9564 SoC.
>>
>> Define the binding for the clock and reset controller that present in
>> the Toshiba TC9564 SoC.
> 
> [Severity: Low]
> These first three paragraphs appear to be leftover text from v1 and the
> devicetree binding patch: the driver now maps the platform MMIO resource
> directly via devm_platform_ioremap_resource() instead of using a syscon
> regmap, and the description restarts in the fourth paragraph.

This is correct, I neglected to update the text that talked about
regmaps.  I will fix this.

I will also fix the e-mail addresses provided for Daniel and me.
I'll use the our @kernel.org addresses, to be consistent with
what's in the MAINTAINERS file.


> 
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index 6bfa2c8fffe1b..b27807ee93863 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -185,6 +185,14 @@ config COMMON_CLK_CDCE706
>>   	help
>>   	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>>   
>> +config COMMON_CLK_TC9564
>> +	tristate "Toshiba TC9564 clock and reset support"
>> +	depends on TC9564_PCI || COMPILE_TEST
>> +	default TC9564_PCI
>> +	help
>> +	  This enables support for the clock and reset controllers embedded
>> +	  in the Toshiba TC9564 SoC.
> 
> [Severity: Medium]
> Should COMMON_CLK_TC9564 select RESET_CONTROLLER?  Because TC9564 is a
> PCIe endpoint device, this driver can be enabled on host architectures
> that do not select ARCH_HAS_RESET_CONTROLLER.  When
> CONFIG_RESET_CONTROLLER is disabled, devm_reset_controller_register()
> compiles to a no-op stub returning 0, silently omitting the reset
> controller functionality and causing non-optional reset consumers to fail
> with -ENOTSUPP.

Yes, it should.  It passed COMPILE_TEST checks, but this
code sits outside drivers/reset so this should be selected.

> 
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..65ed524bf2ee7
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
> 
> [ ... ]
> 
>> +static const struct reset_init reset_init[] = {
>> +	[RESET_I2C] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(12),
>> +	},
>> +	[RESET_PCIE] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(9),
>> +	},
>> +	[RESET_MSIGEN] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(18),
>> +	},
>> +
>> +	[RESET_MAC0_MAC] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC0_PMA] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC0_XPCS] = {
>> +		.offset = RESET0_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +
>> +	[RESET_MAC1_MAC] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(7),
>> +	},
>> +	[RESET_MAC1_PMA] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(30),
>> +	},
>> +	[RESET_MAC1_XPCS] = {
>> +		.offset = RESET1_OFFSET,
>> +		.mask = BIT(31),
>> +	},
>> +};
>> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
> 
> [ ... ]
> 
>> +static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
>> +{
>> +	return container_of_const(hw, struct gate_clock, hw);
>> +}
>> +
>> +static int gate_clk_manage(struct clk_hw *hw, bool enable)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	u32 mask = clock->init->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	val = readl(ioaddr);
>> +	if (enable)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
>> +
>> +static int gate_clk_enable(struct clk_hw *hw)
>> +{
>> +	return gate_clk_manage(hw, true);
>> +}
>> +
>> +static void gate_clk_disable(struct clk_hw *hw)
>> +{
>> +	(void)gate_clk_manage(hw, false);
>> +}
>> +
>> +static int gate_clk_is_enabled(struct clk_hw *hw)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
>> +	const struct gate_clock *clock = hw_to_gate_clock(hw);
>> +	void __iomem *ioaddr;
>> +
>> +	ioaddr = tc9564_clock->ioaddr + clock->init->offset;
>> +
>> +	return readl(ioaddr) & clock->init->mask ? 1 : 0;
>> +}
>> +
>> +static const struct clk_ops gate_clk_ops = {
>> +	.enable = gate_clk_enable,
>> +	.disable = gate_clk_disable,
>> +	.is_enabled = gate_clk_is_enabled,
>> +};
>> +
>> +static struct clk_hw *gate_register(struct device *dev, const char *name,
>> +				    const struct clock_init *init)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
>> +	struct clk_init_data clk_init = { };
>> +	const struct clk_hw *parent_hw;
>> +	struct gate_clock *clock;
>> +	int ret;
>> +
>> +	clock = devm_kzalloc_obj(dev, *clock);
>> +	if (!clock)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	parent_hw = tc9564_clock->clk_data->hws[init->parent];
>> +
>> +	clk_init.name = name;
>> +	clk_init.ops = &gate_clk_ops;
>> +	clk_init.parent_hws = &parent_hw;
>> +	clk_init.num_parents = 1;
>> +	if (init->type == CRITICAL_GATE)
>> +		clk_init.flags = CLK_IS_CRITICAL;
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
> 
> [Severity: Low]
> This isn't a bug, but now that the driver accesses MMIO registers directly
> rather than through regmap, gate_register() and gate_clk_ops duplicate the
> standard single-bit MMIO gate implementation.  Using
> devm_clk_hw_register_gate_parent_hw() (as pll_register() and
> fixed_register() do with the fixed-factor helpers) would allow dropping
> struct gate_clock and the custom gate callbacks.

This is a very good point.  Previously I avoided the standard
gate clocks *because* we were using regmap.  I will review this
but I expect to be able to use the existing code instead.

> 
>> +
>> +/* Warn on requests to assert or deassert critical resets */
>> +static bool reset_is_critical(unsigned long id)
>> +{
>> +	return WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE);
>> +}
>> +
>> +static int reset_manage(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	struct tc9564_clock *tc9564_clock = dev_get_drvdata(rcdev->dev);
>> +	const struct reset_init *reset = &reset_init[id];
>> +	u32 mask = reset->mask;
>> +	void __iomem *ioaddr;
>> +	u32 val;
>> +
>> +	if (reset_is_critical(id))
>> +		return 0;		/* Just ignore the request */
>> +
>> +	ioaddr = tc9564_clock->ioaddr + reset->offset;
>> +
>> +	val = readl(ioaddr);
>> +	if (assert)
>> +		val |= mask;
>> +	else
>> +		val &= ~mask;
>> +	writel(val, ioaddr);
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Can concurrent reset operations on lines sharing RESET0_OFFSET or
> RESET1_OFFSET race in reset_manage()?

I hadn't considered that, but yes, we could be exercising this
code concurrently, so a spin lock should be used.

Great review feedback!

					-Alex

> 
> Unlike the clock framework (which holds enable_lock across enable and
> disable callbacks), the reset controller core only acquires a
> per-reset-control SRCU read lock in reset_control_assert() and
> reset_control_deassert().  Two consumers asserting or deasserting
> different resets in the same register (such as RESET_MSIGEN and
> RESET_MAC0_MAC in RESET0_OFFSET) can perform concurrent read-modify-write
> sequences and overwrite each other's bit changes.  A spinlock in struct
> tc9564_clock around the readl()/writel() sequence in reset_manage() would
> prevent this.

