Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA881A23B1;
	Thu,  9 Apr 2026 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775705569; cv=none; b=Uz6YlNfX1mFI+A/LviZCZz/BxsAeJ3lLxBW6XDCCxqy9vQotR3BoMjdBciwmSswfDzeSiHEmQT4amenpd+6joUC0Hsyg8Vet7pWis8ujqPT4bdDiEOuM9yzh5RMMNywMfRe9iDXLhxKiVWzjOWtRBQGGsboAqd0QmWZB/eVNFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775705569; c=relaxed/simple;
	bh=HYXxuDQ723ABDQyPj00uTiG12kI8ouqjTgcYE4SLtps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZTixwCSReiNBnouy3aPnt9vHPnGIFlOG8krdcHt1dnMAnJvqAloVg8/gs0UogJ8uXKzrm5/5EJOIJSzwfWD2Ai9JI7O9l2fgkTfBv1tTRe8bvj+RimRpBU+ukF57JKkq9h3mN90qcdsuB0bL1oFEVUqw+RkrR8oxoPj32VAlq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz1t1775705551t2319c7ad
X-QQ-Originating-IP: iPdQQC9dXO4BSlTU8vQld8nhoyJkadYCcNxTYOwmP78=
Received: from [127.0.0.1] ( [116.234.85.158])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 11:32:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11463198670806814864
Message-ID: <FF86F4EE9CC46323+193f23fc-e72a-4171-aa4b-e13bc3465c5e@radxa.com>
Date: Thu, 9 Apr 2026 11:32:28 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on clock
 frequency
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Dzmitry Sankouski <dsankouski@gmail.com>,
 Taniya Das <quic_tdas@quicinc.com>, Mike Turquette <mturquette@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Mike Tipton <quic_mdtipton@quicinc.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
 <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>
 <adcGdXeqltQVwPLz@baldur>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <adcGdXeqltQVwPLz@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MeS9sFIMWcUQocrzHanEk5p5iDeoq9arv3ln7PZtmgXEuNZzwac38qT0
	k+nFLLGHjna8VgQRwvf0bILbR2jQWm+0l7lP9XOeDKFmqS4TkxY6CvyDZ7NWETM/kwJoT89
	Xpth11HVpidFL/bVChMZYrKA9IYOMcxZBe51nRxQ76Vk0f71njtFacrlyfxtNFeMtYsK+bc
	WXI4ARgLMczTAkWY98A3TAYrdDEGRoLVeV3qr+Nn4pz872BhDL7FS5FLvR2JNGcp+vEXwQn
	+2QS91J7Onhbki7Mp7PFW5rGPZ9YZg4Vdy6gnlnHyOY1JPsiYm890fFEoUakt6DyKa8Iupr
	2n9M5wPOXuPCmDVqb0DqYmorORRIld1nXSP9cxdE2wjWjs+MA4GgSWXzNC4/On0FeXYNkUD
	v+ZTIb/2eURPDRQoYg7w9rPvsOTQo14sDZDCUScyL2XJsQa2KbqfDaOtfC8NElgg7tTHvEY
	mVD+xuVYag+GBztjn6BgorYihyaSPBtiUzgANTH8uLF4YrslZ6j84TW7yHVXAA4Sk8teRig
	7BMPztzBO7gpVFlsyBaB39neE2FeCpP4P5hASd7FhnlWQmFmHIkHpSfFTyWcWzzKwo/FryH
	WtTz7KQY0O3y/WPCv4XE7fb5n+68Egahjfe1JX17qMMmiiu4a0/KFUNzBgMVfhT3hVPozF0
	5l4oRSgnXgVYjGT1uf0Jsn+cJxc929RRQ+F7XkqZ0GnMTENGL/wDkJeMtnrKrFD1sagcfYi
	QyHs/L9O0VDVltCu6+n8NERw+5sr5aEKOLYDdSCz/AcodFyFwvKfipC+l7elIgcssHxUhwb
	NQMNdc8fciXMQ25jRFF3AUpBH9S1oMxwxXM9arhbw/4APcFY1EmxAT/S1LVOpdPLQCAxgs9
	hWr+8AiMocTPh0moNyy5KbswNWrJv6ssHKFWDtJ//aDr5foP45kb18y0qdWW5YtaGeUTIKh
	FkoPRY9vlZzGZdu6QIAfHdFPy4WVWQe5j5bGkoNbM8gjgdeLdZPbTIhOF5ki4vi6sA/086G
	gy8boLwrN4nn3+X+8mREW0Y1LC7t5EV8kxMk+wO1GnK6x2qhjTa1SyZ3EbPKhD4QoBFNlP2
	+lcIPpUrpok
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

On 4/9/2026 9:55 AM, Bjorn Andersson wrote:
> On Tue, Apr 07, 2026 at 12:13:09PM +0200, Konrad Dybcio wrote:
>> On 4/6/26 5:54 PM, Xilin Wu wrote:
>>> RCGs with extremely low rates (tens of Hz to low kHz) take much longer
>>> to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
>>> least 3 ms (3 cycles) for the configuration handshake.
>>>
>>> Instead of increasing the timeout to a huge fixed value for all clocks,
>>> dynamically compute the required timeout based on both the old and new
>>> clock rates, accounting for 3 cycles at each rate.
>>>
>>> Based on a downstream patch by Mike Tipton:
>>> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901
>>>
>>> Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
>>> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
>>
>> Having Mike's s-o-b here is odd, given you've decided to go forward
>> without his "From:"
>>
> 
> s/odd/wrong/ Please correct the author of the commit.
> 
> Note thought that it's good etiquette to document the changes you make
> to Mike's original patch, by adding a line "[Xilin: changed x, y, z]"
> between Mike's s-o-b and yours...until you end up having more changes
> than the original author, then you're the author of the patch.
> 

Thanks for pointing this out. I'll correct the author of the commit in v2.

> Regards,
> Bjorn
> 
>> [...]
>>> +static int get_update_timeout(const struct clk_rcg2 *rcg)
>>
>> Let's tack on a '_us'
>>
>>> +{
>>> +	int timeout = 0;
>>> +	unsigned long current_freq;
>>> +
>>> +	/*
>>> +	 * The time it takes an RCG to update is roughly 3 clock cycles of the
>>> +	 * old and new clock rates.
>>> +	 */
>>> +	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
>>> +	if (current_freq)
>>> +		timeout += 3 * (USEC_PER_SEC / current_freq);
>>> +	if (rcg->configured_freq)
>>> +		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);
>>
>> I suppose both are nonzero if we end up in this path but a check for zerodiv
>> is always welcome
>>
>>> +
>>> +	return max(timeout, 500);
>>> +}
>>> +
>>>   static int update_config(struct clk_rcg2 *rcg)
>>>   {
>>> -	int count, ret;
>>> +	int timeout, count, ret;
>>>   	u32 cmd;
>>>   	struct clk_hw *hw = &rcg->clkr.hw;
>>>   	const char *name = clk_hw_get_name(hw);
>>> @@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
>>>   	if (ret)
>>>   		return ret;
>>>   
>>> +	timeout = get_update_timeout(rcg);
>>
>> You can just assign count = get_update_timeout() below since you're not
>> reusing this value
>>
>> Konrad
> 


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

