Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464392594A1;
	Mon, 30 Dec 2024 00:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735519682; cv=none; b=HFlx8UfCXb7zw9OSg1cFmhHQPArHT9eJkgt7mo75dK9FNQbVelqZEUyHeYKe5Aj3QLCNvCulWyWSd7kCV7qe3MW03ILdn2DRVgTIsMfPiohDk/5gYYZfUOgC7Wdt3XTl/8/lcaBmoe5FHwIsyQzjsYUU37rkx1EcNppBrSuUqHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735519682; c=relaxed/simple;
	bh=no5hqzWMn8ftg2a5req3wQPVF8V+AMbNmvoGrSm43g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4zanMYGb4K9An02jpWDH+9ak7fIx9pLuoVB1zuSELsPqtEOZvjRbJtLFFM+KsGQ8fOWZRlp+VDegTS3a4ZU/shdN+rnOKs2yIsd+Suodu7rzuucxu0KF+mIJIiPe8V3zpGjB8Wq8k9kXehjUNVllsfkMjc7wI/9AiH0jwVAR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Dlm8Wokf; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Dlm8Wokf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C97D1047DC25;
	Mon, 30 Dec 2024 01:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735519677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJR8Y7m6DOBcK3sHYWbPjYuIk6OUIad6AvPRqayiA/k=;
	b=Dlm8WokfLoUlxOdhYv+kJttrSzsIQ31nzDZBLPTyBdFN+prO+GL8XIbdNoznA/+EzMe6t7
	B3BipUOXeu3un4zA+SEYIM+rNd45FLdZYOrf1XqBmpO9ZsbaOa7D1R6F9W8U7gpLQ+yiR0
	F8PSHAvmIHtXUCDizzlPSSIPQ5xQ0nL1y8cho+YVBsxtl2PCt+eUQQ4evuSC5QAfljnjyZ
	XXmvvG0BGm9uGjuKJ7kIJCmJb4YFLC8zc75JWYb/oDH9KzBqo5Xrp9Zgi5DqUpKw+hnLhw
	oPcp53ZRVmixPEh3PikTIvnR+LVg+3vk28RhFp+FKkezP/A2KbhrE+KQzGrZbQ==
Message-ID: <842e5043-13d4-4e9a-b306-7319c187b5e8@denx.de>
Date: Mon, 30 Dec 2024 01:47:16 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Michael Walle
 <michael@walle.cc>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de>
 <20241230012836.GC28662@localhost.localdomain>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241230012836.GC28662@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/30/24 2:28 AM, Peng Fan wrote:

[...]

>> static int fsl_sai_clk_probe(struct platform_device *pdev)
>> {
>> 	struct device *dev = &pdev->dev;
>> 	const struct fsl_sai_data *data = device_get_match_data(dev);
>> -	struct fsl_sai_clk *sai_clk;
>> 	struct clk_parent_data pdata = { .index = 0 };
>> +	struct fsl_sai_clk *sai_clk;
>> +	struct clk *clk_bus;
>> 	void __iomem *base;
>> 	struct clk_hw *hw;
>>
>> @@ -47,39 +65,74 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>> 	if (IS_ERR(base))
>> 		return PTR_ERR(base);
>>
>> +	clk_bus = devm_clk_get_enabled(dev, "bus");
>> +	if (IS_ERR(clk_bus))
>> +		return PTR_ERR(clk_bus);
>> +
> 
> This only applies to i.MX?
I think so ... what am I missing , some Vybrid / Layerscape detail ?
