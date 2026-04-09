Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66D188CC9;
	Thu,  9 Apr 2026 00:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775693629; cv=none; b=gKr1dyTz7+ghpKwXvyBNtvxVIftxFxUMAeh8nGlbIP8Npa1wSZWlOBnajF+aB3Eg8IxXa0aQ3ZDSZiHpK0uyCpSedq6dWTDRllDXWMQzrxgbbkkeZnyqOJeSNwPmyoVRKbZGehSSJxyI2H6IdZ6+heQbYb/zNeKW5Om/IQaw8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775693629; c=relaxed/simple;
	bh=tFddyeuHBskOmlvQMno1pAjKeRqrclwNkVVouOzY4jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ircNoHU4pVMDA/Fc8A7rOYgSe9+2cf4ee77WienShUADjMQY1xmQb4aODpA96zsn/b5LytGWLpivKuTle7nihjVAJxRTMZu1OdrMFh9LNSPiLrok4OlOMe9Y1XzX6XOA9b6WI9qZcnLUUIsd1WsiDUWJyqyX85jpRnv3zGxPHVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=UbalQuVh; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="UbalQuVh"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E8071121FA;
	Thu,  9 Apr 2026 02:13:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775693624;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OmsGBw6BgLXk+GAyH6ZcTog/wUCgwBidowMnEBlKbxI=;
	b=UbalQuVhbNVBQ3fKchRkWJO5uvRu45GdJ2h9nX24/LIQS3RqfTcVlXwlNiyxYMcDuz31VE
	Y1R6PrakJcGSFmHWJlIu205yiFIC3M9VNOP8fGzPwApt6cLaeJmncszkWKt0YAvN4Bgcme
	ogo+mXXUCa/t4WhldLjrbLeLaL4iB0j54JdsIbpeNrl3y4MEFIGd+bDZ4bcfxNIogGVDsu
	OH16kJPubMOeNcePViIZ8xB1vXIbnhW6lBjxGJpjNbjL9dpOF2ABCq3mojHQiiW9nksB2B
	+NM2nQR5ZMjumELX2HUiB9BWGnjQa1igazfwEcXTly/WTnxJrUiSVLAXHnkHDA==
Message-ID: <863f58a2-bfef-475c-8954-531a579ea12c@nabladev.com>
Date: Thu, 9 Apr 2026 02:13:35 +0200
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
 <20260407211123.77602-5-marex@nabladev.com> <adbPlFzI7jrU9pCq@redhat.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <adbPlFzI7jrU9pCq@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/8/26 11:58 PM, Brian Masney wrote:

Hi,

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
> 
> Sashiko has the following feedback:
> https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com
> 
>      Does using of_node_full_name() break debugfs directory creation?
>      
>      The full node name usually contains slashes (e.g., soc/bus@1000/sai@2000),
>      which causes lookup_one_len() to reject the name with -EACCES when the CCF
>      tries to create the directories.

This is nonsense, the node name is clock-controller@12340000 or 
something like that .

>      Also, if the device is instantiated without Device Tree, this evaluates to
>      "<no-node>", potentially causing collisions if multiple instances exist.
>      Would dev_name(dev) be more appropriate here?

This driver is always instantiated from DT.

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
>> +	if (IS_ERR(chw))
>> +		return PTR_ERR(chw);
>> +
>> +	*hw = chw;
>> +
>> +	/* Set clock direction */
>> +	writel(dir_bit, base + div_reg);
> 
> Sashiko also has the following feedback:
> 
>      Is it safe to initialize the hardware register after registering the clock
>      with the CCF?
The BCD/MOE/DIVEN/DIV fields of the CR2/MCR registers are all zeroes, so 
yes, either order is safe.
