Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424890;
	b=HKsy5pldDi+f0mt4nZWW6lbIbKgB3xsXBSg3c5qbh+mPT0OhWDVgTkLWwXdMWXfh1WwY
	 9VMs0R6pRL5Z3fIGKCr+mMoZJ9NFDbVB/krQpO++Ga2CffS1TGVJNYjekvSa+qhoz67f2
	 Mvkn+p8PANl2QPzCXvlo0gjuDc+Gqb549dpbpoVN40DzBXKJjDfhWkKbpyLp6aucgdGgF
	 E+VMBNqarzq9nw+Qh5CjDs70jNS2mZF9sTap7Meww61RZu4EDmhHBDQIRXyybggpxtUiT
	 8sKXqDwuPw538YblomFqE16rue/TnV5+nv615RBvy66vofniS6mM+pz9p1DI7K7FP5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
	b=Gu5ZmXrI1G4c1ZxQ3AxwGeTzoX6xpss7Ta+vsDFsukt+m2YHjSkMCyHh78zmgYR8P7i7
	 AW8Gfw677jpQ0LKN5oFmhqfWrP1qrwmxcgFUNgNNpMA2WWmKN6Q5gH9rjO803+zWVBn0L
	 cn2KoS+eJneCmmxeXcePAmvC5Ir1WUrXm+PTluI+F1mbyWpHNVNUYY0WfJjpFIHjnRyxt
	 6DPuIzhpc38ThVOcyxjnfPqWmFWHhBHTG6PyMtgD5g8ppuDi0+aaniuqIxrxQE07ttrqg
	 4ku0dKHAiTNYS5RnqqT0hqAWFwM9ZmuwUOkd8GkCaw3q09o/TI+nPb/8OCFPQ0vLffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC2606A32D
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 19:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDC2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0aNYUXD
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1877910a91.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424889; x=1795029689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=t0aNYUXDdRAZpqsbOIRoanjkWthLrq9de/FZxXADbekc3TgpX5MGsP0isyhoiLOqHg
         04lnghKOUMfOOHWfuePk6lKRbCLcRBcNrmM7q529KZNdIGKrJNCUQnGo7ndGsSEBf6Rp
         QssCN7HeBGbLIG2BwTcpJ0OtCo0ikqLkYlngBgW0R78Asv2OI1UtWkQ5dNkACWhvPKiQ
         MnF/2AP9lPuNQFQwAR5etpUQ3+GU6/eSb6EkdVxWs4s8DZD+RpgXC6DwpmIUGZ0PT8UN
         TErDiRt59CF6DjrlXofNjc5t/3SiBT7qwPf28HtWRhUTbONWCjDln5BjHvWJOLPKBsr/
         rIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424889; x=1795029689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOz/+k6Rphfauu1mzh1ygpzQgMQ6Co5lqmSQNO16YRU=;
        b=PYWvOOC2AQg1J6o4Ty02csaO2AJV3ypntoNf6x90ta5en0hxfFxTiklNKoy9gSbiqW
         6Q6tz6RxLgUqzv+61cC0ZhgQCxerStgDE52smZf2Gflppt3QW9/Jmq7gcS+U6Igb4s3l
         jrdDAZqCTFBWGDdMqJompOp/xiy0fZ1oCV+vGmNjY619bD0fw4eEIR67W8Xpm/retqJ7
         vjTBYDOzMH+VW+jT1Y/y+sAQRl3qUi30s+twALZIff6kBzXYvEIKnnljKIZ+AUYauswd
         UgjdcDUdycP3ApOzAOsb0o4BK5O6t9k4Pw6fHoz68f2XDuU9AgpCCG1RpqBE1HChHeh+
         vWNQ==
X-Forwarded-Encrypted: i=1; AL+hErGLvj7HU2TUmnmSi/Z05kTbHilXHI9HX4wlUrVxJkQ6O48E0bl3FL7PgVk6Dlvo52Tsb463VvAWiTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9se4lfhJ9QAGz2MvGoejj7mNhchsu2Kgd+sND6yWfmTKl7Zu4x
	IibBF/MEZ1pZdzvbcSuDb4KqnvAhoToI6HE3m+SBjEgafONuosQvKrO8
X-Gm-Gg: AYBFou0Tehd8r3pHtfIm1jYk8ZAuIjVvzCS0io8y8ttpBxKx2eUK8ZAG+fsOx6inFIv
	kPsr7f9N4NqUsP5cYxbPQcd7flWNHPgDGDm/CSSvqaYwkv7BoE4l6xFey6cmA2rwuIFD3YMMqXr
	ohjAY2Zb8Cjo/3rfhXedq+g5uxmSCRXdSGdPdzHQSXDBx6KloJkTDoX7m7wLVq7+RM4jCbxruWS
	eeUNkWbHu6HVlToLBrJ4gz6snkru6n8zO9rzHXtFF6hWAWbhAN3LivcsOuH1A26Eepc3W1bj+hM
	jRiGrCtLRpmI123XolBUz7Xdchn4OfaFIXj5ajvqqMiPD3nZ7xLo0ExihzaPqugXk00u0Rbmp+9
	Z+//Qp8QQ71A8E0er8qK0LVeHr8TSL/DdqJeWfMy6vbUkoemFpCRjHGleqmBIk1Ox1/4WwhanhE
	SWVPdXHjYPe3xaFHczoDnCaxqyy8RBFLLYaud1eylxlq/R2cMeVp14HVU9qrGqXvOQ850s40vv+
	nLEBD+d1EvQhyyOzRlen2QBt9PMpsCugu7zw+B5ydHJvBn9tPTTEalJ6BjkLXKGdWSC4ukcXEgD
	b/LdPQAERns71mgoshs5GGm76/TUPoLDX/cheva2giEl9tZP58Uhq4C3TSNWE4vf5yFl1TPreGA
	NYA==
X-Received: by 2002:a17:90b:57cb:b0:3ac:7872:d1b7 with SMTP id 98e67ed59e1d1-3b182eec0f1mr3136688a91.32.1794424889401;
        Wed, 11 Nov 2026 11:21:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42a4csm596583a91.4.2026.11.11.11.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:21:28 -0800 (PST)
Message-ID: <dd549ba7-8c19-4c77-aef4-b3607298f6b0@gmail.com>
Date: Wed, 11 Nov 2026 11:21:27 -0800
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
Subject: Re: [PATCH v2 1/3] clk: ingenic: Poll JZ4780 CPU1 power status
 atomically
To: Brian Masney <masneyb@kernel.org>
Cc: linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <20261110043131.1985993-2-f.fainelli@gmail.com>
 <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179442247882.1131744.13316822371180932611.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:41, Brian Masney wrote:
> Hi Florian,
> 
>> The CPU1 clock enable callback runs under the clock framework's spinlock
>> with interrupts disabled. Its readl_poll_timeout() can sleep between
>> reads, which is invalid in this context when SMP powers up CPU1.
>>
>> Use readl_poll_timeout_atomic() with the existing interval and timeout.
>> This is a prerequisite for the JZ4780 SMP bring-up path. The original
>> CPU1 clock implementation by Zhou Yanjie is already upstream.
>>
>> Cross-built for CI20; the subsequent SMP-enabled image brought up both
>> CPU cores. Development and validation used Codex assistance.
>>
>> Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second core.")
>> Link: https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@wanyeetech.com
> 
> Cc: stable

OK, I will add that, thanks!

> 
>> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>   drivers/clk/ingenic/jz4780-cgu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
>> index 1e88aef7ac0f..f5983033583a 100644
>> --- a/drivers/clk/ingenic/jz4780-cgu.c
>> +++ b/drivers/clk/ingenic/jz4780-cgu.c
>> @@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
>>   	spin_unlock_irqrestore(&cgu->lock, flags);
>>   
>>   	/* wait for the CPU to be powered up */
>> -	retval = readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
>> +	retval = readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
>>   				 !(lcr & LCR_SCPUS), 10, timeout);
> 
> Since you are making changes here, please fix the alignment of the
> next line with (.

Certainly, will submit a newer version shortly.
-- 
Florian
