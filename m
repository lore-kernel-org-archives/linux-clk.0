Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E29385D79;
	Thu, 21 May 2026 04:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779337008; cv=none; b=qDtEO5s3UwzWXEwpvXJKvifFirJDIm1Uj6Hil1/AqdJDv/0poB+UsDBVva/Ab8T83OAuo//DoHMeFcvnwB9BbNvsoTdIoUlHAi2PhiHmLZmFdS0H2dhtM3FnjNF7JbB80UmSMZfYgwTCai1kE/jpyXWiiM6+i2abqVY6zyrFIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779337008; c=relaxed/simple;
	bh=FABcNe6oskbqqkAjfTtga0oHVgNz5XP1ZsDdWza/99c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxwizHsicp23MIfv+cLmNUKNyeCfxJpZh/7IekrenZluSpD9VCb49giTaAFhbD+q3Pa5qtKocXVVD9uFeGBzxv+ZFkwKzCXfbc90tmCmraih9UFiBbpSeijFQIo/no7AU88CTwa6TFapsDyi5e2WOYuoDiNCiPe7d3768tVrkKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=olNmLvY8; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="olNmLvY8"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=FABcNe6oskbq
	qkAjfTtga0oHVgNz5XP1ZsDdWza/99c=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=olNmLvY85uUrfxAlkyYOI1lRGglL/a1DxB7a/e
	ep65VjsHLETXQiZ0mfh+EG4478+6inqXpAHvLWZd7B66Cq6zhXqxj8QnLEV0/u00d0paAp
	Lk1YcczQfhGb5LSKKgXwbBRFY+FLqDJifb6zdhO8OtplINti12mbuDOGIDZbObJLMMNSTp
	0nJRF1n3GAXct7azIxaBLK3fFkE75hnRpujeO+gaGrr3dG7ZuPbT5k7MxiSqIOV8t4sr77
	mCb9jflzMebHe7uDOSFAUhr0Goc6wNSQTd5B7L8w42wgUl078uIoJBh8xnL5t5eYwzFnCQ
	NAkhj7VTA++l7DbSnOoawBhg==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 81cc9bdb (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 04:16:41 +0000 (UTC)
Message-ID: <cb81262a-5327-41bb-9ef6-9cd91f1be0f7@al2klimov.de>
Date: Thu, 21 May 2026 06:16:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: moxart: fix refcount leak
To: Brian Masney <bmasney@redhat.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>,
 Mike Turquette <mturquette@linaro.org>,
 "moderated list:ARM/MOXA ART SOC" <linux-arm-kernel@lists.infradead.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260520175552.537603-1-grandmaster@al2klimov.de>
 <ag41wJBhdK7-Zynb@redhat.com>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <ag41wJBhdK7-Zynb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 00:29, Brian Masney wrote:
> Hi Alexander,
> 
> On Wed, May 20, 2026 at 07:55:50PM +0200, Alexander A. Klimov wrote:
>> Every value returned from of_clk_get() is supposed to be cleaned up
>> via clk_put() once not needed anymore.
>> The values here are used only for error checking,
>> but weren't cleaned up until now.
>>
>> Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>> ---
>>   drivers/clk/clk-moxart.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
>> index 3786a0153ad1..7e191b1481bb 100644
>> --- a/drivers/clk/clk-moxart.c
>> +++ b/drivers/clk/clk-moxart.c
>> @@ -39,6 +39,7 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
>>   		pr_err("%pOF: of_clk_get failed\n", node);
>>   		return;
>>   	}
>> +	clk_put(ref_clk);
>>   
>>   	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
>>   	if (IS_ERR(hw)) {
>> @@ -83,6 +84,7 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
>>   		pr_err("%pOF: of_clk_get failed\n", node);
>>   		return;
>>   	}
>> +	clk_put(pll_clk);
> 
> So this immediately drops the reference to the clk after of_clk_get() is
> called. Can we just remove these two of_clk_get() calls since they don't
> appear to be used?
Not if their purpose is to... idk...
check whether device_node is a clock at all, maybe?
