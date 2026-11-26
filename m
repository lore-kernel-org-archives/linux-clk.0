Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697998;
	b=I3U/lZp1GGYUACsDEMBUYhoE9yI4pvk9cRdJSrHISMikkJJWoh2UZJ/zv89eGARQ30y5
	 w7DTB4QWNIYsNR9qwuQQ2MVTp28crtd3Ev4OPM2E5pKVywoqsaBQnqK44vUSsMT7Rw+Ai
	 ybptJ0PCX8P+AXWo/d6jf2uiO/D+pvbdlR9JlSa0zrqtoN4AvmSNjJz+8NDm2RAuA495O
	 UAD127+GGJNftf86cxsRQFNr1G12+3HN7EdQXh0MOo/vQ7vdp9fUH6BPLdqTWLFtnSxUL
	 q7VGxeE7Mt6eNe7tjlxOxcW3dAVQvYBfqp2CZQws8Si5M8nLGbvIfnLF5b4dYiQl92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
	b=Fhh+HpcsxjgDEY3CUFWxvaWYkOT1WfUnnrcbprf456mJPyp3gAHjMgJQdwhoSzvzbV2j
	 NUO5bqR5UFKCv+QWlMVfkSl7piZ4olwUwd9c9q38e1HUFhsuxK8aHUm6rUNAgr5T+J6Ea
	 sUkQGRek9M1tk4zG7sIAMgpmqK9cJSC/5pv1Pj4KlnLF3eepWMhw43xGStx0ex/GcbbGl
	 EDvj6eniOqDVfPA/PilBeWTYwZ44ygrtCGV1dSGlO5YBnKx2EiRTP8SttWUi+2QW7xnFC
	 E4RPQ3YVt9P2FZugcs4aEj9zwf3DfvWEABJOQyxQdLxoOhjTELd4qMv183JOr6HIIeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADD2606A32C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 12:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADD2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=Ni5icM2E
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d290b10a35so2949306eaf.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 04:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795697997; x=1796302797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=Ni5icM2E74nNCK1kkhfleyOOlHVlks2ELVDV8SF+XLnFb2IkGSG86FphXdWme0o72F
         Ee5/PKGCxCll00Nx4gF6NK3jsUFm8/g2R6kV0CBuFOR9+qyfXgzICNnocGA1YS2vOBoe
         vWTxmTShzmkVYayLKrpWJ/z+XJW7tJ85GBfdGNgYWt+pd/IwgecaLttZfz8qHQtNN62s
         fmWP5SvnQIC65/yZKKAeKbBDKCINV1ANPBHCIAZheOe1ulVuoDIanWFoIxaie5fJpTTd
         PI7NMFULQDRzaOzLQawMaDir7XHQL0E1oFHvzTtUBcQ6WZzRcDNRP/GV3rtV5oHBPwBM
         CnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697997; x=1796302797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBf/pzK+uJDQxotO7zZtnUx0PFHSi9S3B+LhgAk65HA=;
        b=2LoX2r+o6uYXSU99R5SFbRe8urcjk2dNuMql3qQ2pe2YLSenuDVN7THDBTPXIyijgI
         r5dO7Q9bcCkwD8Z6C9B4Jg+ug5aKvOd7r/92I/aAyEzx28TFeEeQZBP4oixUEALkbSxS
         O4zpR17JewfKr92X0sgHzmb3dfCgaWYESE64oMFBdvPCrbWGQf47TgcKmU2sxiow4fcY
         qlAKONc0D77BysRmVM6pgq9UIyWKQl8WtrG9PMV9V2457f4bzXFi7busePyzufRPQDZZ
         Wu6lBH+g9DT/DHd9cFBB1G4nYAFPGY8xO85itqn7jYcr4XzTTwZDhBmJNjSYhQgmAH+j
         X5VA==
X-Forwarded-Encrypted: i=1; AL+hErF+RyrrZxNnGducP79RNlzn5eT8ufiXwE2Hv3qW2rdGpzgFaumhlAWzb4OLN19vkex7JxnZ3ABWlAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+983KZmPYs51mNgFWX59JV/98Yroa2KNX1/UFn93j7yzh+fhvl
	n0EgbKk/o3b2w/73wpmCot3S9eFURdhtMC0eT5cWg7sPuXjahDAa1553yadrfT1Tyic=
X-Gm-Gg: AZFdTZdyJaHmo7FKSQdgTczP0LTKkytaKLbXEbKYjl7p90+Rv6Rwjk0uuWx1YMx6pZ/
	ak22yUsOeGlalVeUhG+GlpA/0rZ7lL7wPQEfEoEYKpo8Jvkp2TXL1JMuR9pAa9C3zVo+sdgx/on
	xg38DfusvYU083/nVpatlKPjMP5M1mb0w6vA0PkvFB85F0sAMlT/jtkTOg+8/tCpSD6eJZY3J92
	SMJqtsy4IPotmzCn3Z1ELBJcehCbW2ZVIRIIYQddcsaotjqmlMt9FwV5kPnqBXTu/g3J+yj6rvn
	jVlZqAW5fDHc+zsWI1SwlfY3vTyYbsLrbM6jF6gbwznzk4C1s1bnuX4Ef9e6RB0F+4P9SUoytAQ
	C4xpzgsC94yhmbpXi3tIUxtsYqudqAdBwPJt2wbZ4XC5t8x3ViHosIi41UUpGrtXieX6vwM9pnI
	aQPu5b5r3ZRsBKkEpB4CR4x361h0fetHSumqrhInRkkwC6o6B9hQP3+45FtHH3w9MJOciE0ZGMP
	ssivU+oPdeo9d58TmzlukYzOhYleFShCgYlQDqaO0+3NRZ+meeU5lnVF+HXbADSYkvOH19aS7SL
	XFxW+VyoUOufcOGkYgneoKQRWXgGE72L
X-Received: by 2002:a05:6820:809:b0:71b:40c:9d86 with SMTP id 006d021491bc7-71b394b3c12mr14780581eaf.44.1795697996937;
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380c6815sm13831517eaf.12.2026.11.26.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:59:56 -0800 (PST)
Message-ID: <e20fde6a-3389-4084-a2de-fee5426a74e6@riscstar.com>
Date: Thu, 26 Nov 2026 06:59:54 -0600
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
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
To: Philipp Zabel <p.zabel@pengutronix.de>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, abelvesa@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
 <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <579859f0e1b53aa6506492a2e5d073f3f991014c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 3:42 AM, Philipp Zabel wrote:
> On Mi, 2026-11-25 at 14:21 -0600, Alex Elder wrote:
>> Define a new platform driver that manages clocks and resets implemented
>> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
>> and disabled, but currently only the clocks that are (or will soon be)
>> used are defined to be controllable.  There are also 13 resets that can
>> be asserted or deasserted, but support for some of these is omitted as
>> well.
>>
>> Two registers manage the state of the clocks, and two others manage
>> the state of the resets.  All four registers are found in a region
>> mapped for MMIO.  The region is provided via a BAR on one of the PCI
>> functions embedded in the TC9564 SoC.
>>
>> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
>> state should never be changed (and a warning is issued if changing their
>> state is attempted).
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v3: - Fixed problems/garbage in the patch header
>>      - The Kconfig option now depends on RESET_CONTROLLER, and can now
>>        be enabled if COMPILE_TEST is enabled
>>      - The generic gate clock controller code is now used rather than
>>        implementing a custom one
>>      - The PLL and internal fixed clocks IDs are no longer available
>>        outside "clk-tc9564.c"
>>      - The PLL is initialialized, followed by all fixed rate clocks,
>>        followed by the gate clocks, to ensure each clock's parent is
>>        initialized before the clock is
>>      - Updating the reset registers (read/modify/write) is now protected
>>        by a spinlock
>>      - "Unnecessary newlines" have been removed
>>
>>   MAINTAINERS              |   1 +
>>   drivers/clk/Kconfig      |   9 +
>>   drivers/clk/Makefile     |   1 +
>>   drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 467 insertions(+)
>>   create mode 100644 drivers/clk/clk-tc9564.c
>>
> [...]
>> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
>> new file mode 100644
>> index 0000000000000..306781e2f7b4f
>> --- /dev/null
>> +++ b/drivers/clk/clk-tc9564.c
>> @@ -0,0 +1,456 @@
> [...]
>> +
>> +static int reset_update(struct reset_controller_dev *rcdev,
>> +			unsigned long id, bool assert)
>> +{
>> +	const struct reset_init *reset;
>> +	struct tc9564_clock *clock;
>> +	unsigned long flags;
>> +	void __iomem *reg;
>> +	u32 mask;
>> +	u32 val;
>> +
>> +	/* Warn on any attempt to change state of a critical reset */
>> +	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
>> +		return 0;
> 
> Can't this be checked at reset_control_get() time (in fwnode_xlate) so
> that critical reset controls aren't given out to consumers in the first
> place?

So I'd pass in a slightly modified fwnode_reset_simple_xlate()
as the fwnode_xlate pointer?  I hadn't thought about that, but
it's a good suggestion.

>> +	clock = dev_get_drvdata(rcdev->dev);
>> +	reset = &reset_init[id];
>> +	reg = clock->ioaddr + reset->offset;
>> +	mask = BIT(reset->bit);
>> +
>> +	spin_lock_irqsave(&clock->lock, flags);
> 
> Consider using guard(spinlock).

OK I'll do that.  This will be the first time I've used this...

Thanks.

					-Alex

> regards
> Philipp

