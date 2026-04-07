Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BD126C17;
	Tue,  7 Apr 2026 20:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594639; cv=none; b=gTqNarSf4KKjDK/ZHVK+bg/ErxV2d6Xrq6soI4w7tYJeJdoMHuTfQZHzKmAiEEMSdgcuvY5qRwk/RNi04DtR+d41f6vQRjj+Ce4phuX6bjuts4gsaOZEXW5A89HpTypgAzCmb+i8/okVl1JYzv8Ngn1d1hpslvPBG2+CfKZEoc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594639; c=relaxed/simple;
	bh=YhCoOesFESnyP2eXXEBOGVFxil+4mp0wWKUKVMGuzvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7rIiLJ/zZ2lbNeJzzrYY3VbcSkgYtciuFuvOljOdzfq6nQm2LNFk+48EWAAX90vEj818LsUDSBU9yQLKaxb0JIveNkMQtFcU83haD0WswXS47y7V6qOTFE73uVdEc/qmZVX3myAK/walpZ4baYahfwLkPpDsm32sswKSDB9bk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XoqEXqCS; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XoqEXqCS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A44C71133A1;
	Tue,  7 Apr 2026 22:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775594635;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0qDMvEa0Jw+oL6gpJC9BWCEzvy6EY33JpQ3Z5WgQZlM=;
	b=XoqEXqCSh8OBtAjLkoTyqIo0TD3AH9zsMs/bDH36roCN6J6Gjr9bf7yi9Jay6r8Ny4bQsG
	tMW0pjrl17wS+7iaOWqdZi0xPFk7LqaKqm4wqVoVRigtCXlSB5ksuFrpbvlGee9T9ti7mW
	xlRoLPx6W1iAauy0zHBhNLR4IdTTK/AvJFqSG5xb/2HfyaIY5dHBQrphEab10s3nse3ZyN
	RrMp3g8Og/dsWajMIK53rYZyh3uBItP3tvMhVgvP609W9e30xScWGdWnAft1nQbTCoDUAq
	joTU1xN2Xmf3Y6SK5gaJjbtg9zOaPM/t0QFKGNRMiyL2LslD5VxWJTyO6/9p9g==
Message-ID: <31043295-d026-4219-b72f-d6daa9a32c01@nabladev.com>
Date: Tue, 7 Apr 2026 22:43:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Michael Walle
 <michael@walle.cc>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-5-marex@nabladev.com> <adVU-VgLI0MCIjz7@redhat.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <adVU-VgLI0MCIjz7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/7/26 9:03 PM, Brian Masney wrote:

[...]

>> +static int fsl_sai_clk_register(struct device *dev, void __iomem *base,
>> +				spinlock_t *lock, struct clk_divider *div,
>> +				struct clk_gate *gate, struct clk_hw **hw,
>> +				const int gate_bit, const int dir_bit,
>> +				const int div_reg, char *name)
>> +{
>> +	const struct fsl_sai_data *data = device_get_match_data(dev);
>> +	struct clk_parent_data pdata = { .index = 0 };
>> +	struct clk_hw *chw;
>> +	char *cname;
>> +
>> +	gate->reg = base + data->offset + I2S_CSR;
>> +	gate->bit_idx = gate_bit;
>> +	gate->lock = lock;
>> +
>> +	div->reg = base + div_reg;
>> +	div->shift = CR2_DIV_SHIFT;
>> +	div->width = CR2_DIV_WIDTH;
>> +	div->lock = lock;
>> +
>> +	cname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
>> +			       of_node_full_name(dev->of_node), name);
>> +	if (!cname)
>> +		return -ENOMEM;
>> +
>> +	chw = devm_clk_hw_register_composite_pdata(dev, cname,
>> +						   &pdata, 1, NULL, NULL,
>> +						   &div->hw,
>> +						   &clk_divider_ops,
>> +						   &gate->hw,
>> +						   &clk_gate_ops,
>> +						   CLK_SET_RATE_GATE);
>> +	if (IS_ERR(hw))
>> +		return PTR_ERR(hw);
> 
> s/hw/chw/ on the two lines above.
> 
>> +
>> +	*hw = chw;
>> +
>> +	/* Set clock direction */
>> +	writel(dir_bit, base + div_reg);
> 
> The previous behavior of the code was to call writel() and then register
> the clk. This flips it. Just to be sure no regressions are introduced,
> should we keep the old behavior?
I believe this is the correct ordering -- if the clock registration 
fails, the clock direction is not going to be configured into hardware. 
The clock driver does not operate the clock direction bit after this 
write, so whether this write happens before or after the clock 
registration has no other impact.

The rest of the items are addressed in V5, thanks !
