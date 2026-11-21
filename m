Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795262090;
	b=PeArnhphaF5R93xcPlYHDAWtn7Elo0TrKKGHGCe3PljiTX+/ONNcuC1fminADGpdLxok
	 8xZS2DhzT0GZ8TZj0q01TXmrETM0qcNx4w3/CTX/EFpwGqMCgy6XV2pUc+MeofSsv8c+r
	 ZiO07tts7P/X17nCFYhgLqNvdfcYm0ZQjSlvruCfua/6hcWXYq2GEt6MGQivAUiIF7d/Y
	 6OW8LIRUFnTTFffGswOqwjGCapHDL83Umfv8qJd+Wf0I4OD/xKOJFG0WIaFmAfttZTyfd
	 0umoTboZK+UvHGLua9zq8FuS5/VnRTonF91JkoxzXZDUpk4Sdj4G5zKtHjuZ4Of7lIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795262090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
	b=tP5ckClzfc2JEs+DhqvpgQ5ucVLjEbuho+Vf1iPCVk9xaVejsYIINErugGeLxvAxj0LG
	 GywVEKj5zTBXfSdRR7R8X8St+wWaHWLgzpG4hbq1DNV6aCC9kIlj5vtj3cax2yHOYMCDU
	 zUqCAF9JJGyIW2DiVH6rKdmmKkS7g789n5rTqDhyJ0BLZg3CXi6KvlsFEwCUZpE3TMyGa
	 6TV9ewQ5KN+O5E8EV216fy10Z3w07zhHq39qlTgMqxP2RpG0BiMJUhQcuKcsBgDqdG0mp
	 wvyh6ZLYai5Brjx+FwCpC/e//kbkOKOrrXEU4ZA9sfvuTH4B7munHO0uC/pKs+e0vgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B39606A320
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 11:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B39606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W6l+kx5d
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso810197f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795262089; x=1795866889; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=W6l+kx5dMX2mdJt7T6QMcJ0hI8ZEeVOKDih7eGXKn9qesUeVUO7ThUMVP1kKGuXcft
         VK7V+W6z5oRF9qG3c7Wjxb/2O6i0YdvIXxAaIz9bPP/J0V506KHJefwQgHgob+tHIwAF
         CiMiwsOGnYflWizEn8hD11X7/1dzTgSfKYa0shHOJaOclRQQOQDnsazObS2sNUv+Ab5v
         yg9vk2JQ8X19FlI0CraWD40SuQic4MS3t57KPYNuWhCfYbkJ+4W1zglAXSZQwx+xgxlm
         4fLPgZyDLm+UgTBpoKfSSkt9GZQ1sZHr11Bhyy6p328gfI9XPo1n8y6mn3y2zSLtdDkT
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795262089; x=1795866889;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szGjatEGvzumenIGoDmUhGP3PBi4OJXA+JaILrJyq7Y=;
        b=02GAZtTojE835PtEr6LddpdZX2CO9YXgNBrHASvaaQ3iedBRjN03lXMPdkzXd/H3UT
         d6kyDoTb5cJDV94BuWe4jQYMAumMm5X69IY1rIgdfamILRMwbmMt1VrKFnmPORnohVI+
         XPjRye91laz4O5Ct+hs4XMA2ugfu/9z7X6yqSZNbZqmDDPcw+XibkE7w6RQRSjI2+kaV
         h8ajqv55SyT+wNvl0plkU0E8NNqYv1uQANiCBupiQ/l/ik32FEViQ4o+h1vHU32ZCVaU
         2Tp/zNkWuE8U3RBMefBTBsgpUZzUzWtUMPaTocZxmNYClReb1aQ7qNpc0eMNJhsYrJQ/
         kdJg==
X-Forwarded-Encrypted: i=1; AL+hErH6O7hJqnK1K4HBBFcfN0r6cX7Nm9IWZreh7+LcEY61sdDeIgoBPxpy/r8WI8T2k8zYY+3NSvC4kMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GTg50g+bQfDpvfeInA1DiLsRQnkOf+U++wNxAllSrYnnIdHrG
	D2kB06NxweWdRggn7Q4gw2h8sp1J6Ioze1Hh+kBQkz7N5Vgf3ajI8fLo
X-Gm-Gg: AZFdTZeywghLN4Xgh5JXlVrKfltAzp8sbgPVAlUQRgK6s5wPqKkMpRBiftjFBwzTDbj
	jAuhW3XxJDiIPeuPIMEDwXuxWBZWHT8S1ehuNsSgUipksg+GpwZSj5kuHdy/kYuQuQ5WfD7XgkW
	W9Zuh6bH08/Y6WO7PlPjNS+FdmRIV6/z8+PWx6T76pqQj1BHwabYa0kmLZeYH+Z5NZAlh3ooJyx
	8c/DEvejmZgEn8ZLBZFf4Ft8wZCCaPRDxxEfo95Yl0MSRb33KD2Blj0E+kNgIXQFDFvwm9dw8RE
	KsVYnU16ALH98w3m2NS3UFQVhslGM3Hj2wPLuWI1Hf/uzAwOunbKOodByKDi00mvp3ZhryABshj
	nzfKlrbz5c/WnbuttZyt/c2gUOUmBmMo+VbsKi8aaZI3/TZjGR20Ss7u2s/EcWP4El0BYxOi2r6
	pyO5s9yuEaRSDlNDUwBeacJBPBtM/mXAeNjME0mRlcYn34iY4bOsMZaFZ+E2Sg8hlPs4RP+0R+2
	y5PAUIaZTV3EL3+/PjuIHI6tr5UhYWUuUKrxHDkYgc1wsRrg6E/xduabGeRZoLzCLXOLYGH/78h
	F/84HRnxLXnran5vRSVhpoppq0yWzV7tvcxFAW5N8hYuF7igc14b/NiGMBsAbPJm7RcN
X-Received: by 2002:a05:600c:848d:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb88811da9mr136119295e9.13.1795262088516;
        Sat, 21 Nov 2026 03:54:48 -0800 (PST)
Received: from [10.50.139.243] ([23.90.153.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm42471545e9.1.2026.11.21.03.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:54:47 -0800 (PST)
Message-ID: <7b96eb55-d357-4289-85ff-c0eaab53e8c5@gmail.com>
Date: Sat, 21 Nov 2026 12:54:46 +0100
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
Subject: Re: [PATCH v9 2/2] clk: Add gpio-enabled clock driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261015-feature-clock-guard-v9-0-c1c05a498d9a@bruker.com>
 <20261015-feature-clock-guard-v9-2-c1c05a498d9a@bruker.com>
 <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <179519084929.3795820.7180605641448271689.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.2026 17:07, Jerome Brunet wrote:

> This comment has been carried since v5, where the reasoning was already
> answered: returning an error from .prepare()/.enable() when the clock isn't
> running is simply how a provider reports failure, not a workaround for the
> framework. The claim is also wrong: the framework does call .is_prepared()
> (clk_unprepare_unused_subtree(), clk_hw_is_prepared()). The rest describes return
> conventions. Something like this would be enough:
> 
> 	/* The clock cannot be turned on, only waited for. */
> 

Perhaps the claim is not clear enough then, the .is_prepared() is not 
called _before_ prepare. I didn't mean it's not called at all.

>> +static int clk_gpio_enabled_enable(struct clk_hw *hw)
>> +{
>> +	struct clk_gpio_enabled *clk = to_clk_gpio_enabled(hw);
>> +	int value = 0;
>> +
>> +	readx_poll_timeout_atomic(gpiod_get_value, clk->gpiod, value,
>> +			value != 0, 10, clk->timeout_us);
> 
> Same error handling as in the prepare variant above.
> 
> Also looking at it more closely, the binding allow 1ms max. It is lot of
> time holding a spinlock without IRQ. If you don't stricly need this variant
> please drop it for now.
> 
> 
>> +
>> +	device_property_read_u32(dev, "poll-timeout-us", &timeout_us);
>> +	if (timeout_us < GPIO_ENABLED_TIMEOUT_MIN ||
>> +	    timeout_us > GPIO_ENABLED_TIMEOUT_MAX)
>> +		return dev_err_probe(dev, -EINVAL,
>> +				     "poll-timeout-us is out of range [%u, %u]\n",
>> +				     GPIO_ENABLED_TIMEOUT_MIN,
>> +				     GPIO_ENABLED_TIMEOUT_MAX);
>> +	clk->timeout_us = timeout_us;
>> +
>> +	if (gpiod_cansleep(clk->gpiod))
>> +		ops = &clk_gpio_enabled_sleeping_ops;
>> +	else
>> +		ops = &clk_gpio_enabled_ops;
> 
> As I noted above, I prefer if you dropped the enabled variant that run with
> irq off, unless you scrictly need it. Return -ENOTSUPP if the gpio can't sleep.

I would rather keep only 1 variant in general, because my GPIO 
controller can't sleep, but gpiod_get_value_cansleep works for both type 
of controllers.

Slava
