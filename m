Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749F2690EC;
	Thu,  9 Apr 2026 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694303; cv=none; b=PcZA2eGUi2OJhkBokO53HqwtufEFNcQVWZJoUxyV+sGlUXmNmuXwKBo/wZulZDXAhIGz9DKpbV7E10uFykF9bSIADIT8kDHWQJ81FNeb2at/4fTxq67uGm85CJEm/nQtuIjh4t3hqTp8m0wnpN2oT4DqjcT59/I3d1WTE7OSgGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694303; c=relaxed/simple;
	bh=0a35ekGXa8HIEZAo+fN6rsMEPj38HKv70x+i1c1R4xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zh+8pgsOaYEP6DVOsUFn6/TGCXQZH1Ss8DNV+0Dwe8UiBx79hOV7mVY1JV/dI7MAP4THIyK6Cxwb7559iuExxKUS4VrWsR9T5o7tDrMScxxcbNP1wdBfOjFmQlNBK6s5Q50U+6l58UU+UnO8iOlgbccFh3LypW/lizFu4HQkQq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=IU0jPpBN; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="IU0jPpBN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B68F112B6E;
	Thu,  9 Apr 2026 02:24:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775694298;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NaIpO2aC4v67bXzTzkoQId/L8iEQDl9MlfTwmPAhWA8=;
	b=IU0jPpBNZuni/0BwA8/XNrpcMZzY7QKfjjl4EWDpA5SWr3IhIpCRR6T1N54Q290VARVC21
	IfsPt6uONQigGj4xZhCrfmgrUZtkozpZJE39fHTcV3mbRcBXUpGaQPp5aOjx2NcIS/L8jQ
	dD7EbDUoiGDwVA0iKFdUq2m0UUwCk5Z+t0KdKSkGDQfkaY/l7bKDVDXb3SRnmEKB4h+5jn
	6SWtN8qiMCux+Pi2uoHFFnUxh9TWVWFLqKrGNB+G3dekCedz5IMdJVniJnPJDX53oplz1X
	lsefl0XlGtq2y9uk2c0Yb/EvATmYE3w+NiMwN7zgjpVmJev6TcJfC7nOwOzPXQ==
Message-ID: <30942755-885c-4ecd-a719-c78f91c5abd4@nabladev.com>
Date: Thu, 9 Apr 2026 02:24:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Michael Walle
 <michael@walle.cc>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407211123.77602-1-marex@nabladev.com>
 <20260407211123.77602-5-marex@nabladev.com> <adbSxmeJDf14EtS0@redhat.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <adbSxmeJDf14EtS0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/9/26 12:12 AM, Brian Masney wrote:

Hi,

>> -	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
>> -						  &pdata, 1, NULL, NULL,
>> -						  &sai_clk->div.hw,
>> -						  &clk_divider_ops,
>> -						  &sai_clk->gate.hw,
>> -						  &clk_gate_ops,
>> -						  CLK_SET_RATE_GATE);
>> -	if (IS_ERR(hw))
>> -		return PTR_ERR(hw);
>> -
>> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
>> +	ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
>> +				   &sai_clk->bclk_div, &sai_clk->bclk_gate,
>> +				   &sai_clk->bclk_hw, CSR_BCE_BIT, CR2_BCD,
>> +				   data->offset + I2S_CR2, "BCLK");
>                                     ^^^^^^^^^^^^^^^^^^^^^^
> Sashiko reports the following:
> https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com
> 
>      For MCLK, this evaluates to writel(MCR_MOE, base + I2S_MCR). Does this
>      overwrite the entire register and clear all other bits to 0? This could zero
>      out fields like the MCLK Divider Enable and Clock Source Select, breaking
>      the MCLK hardware divider.
> 
> It's the same behavior as what was there previously. There's a lot more
> to the comment. Can you look and see if there's anything else valid in
> Sashiko's comment that should be addressed while changes are being made
> here?
> 
> Otherwise, based on what was there previously, this looks good to me.
I'll move the writel() before devm_clk_hw_register_composite_pdata() 
even if it makes no difference in this particular case.
