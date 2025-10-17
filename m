Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E842E8882;
	Fri, 17 Oct 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719876; cv=none; b=Sa5kQvLPIL+OaQgEIeQc4jEA+RYmI+BGBf9q298fK596nK2bbChwzp8Mhydino5UCafdS6akZ5wsib4ab29+wJ5TB8FwEzEG0ifBvlBmaS3VYG0PfDY2bPKSrh91xQJPXgSNzhRXEQBPYuVz8TnXN0YmqW39bwA5oMFpmlWMsZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719876; c=relaxed/simple;
	bh=+bx3ZbtK+Njf6yie1UgxB9pNqu+ylqXzsEnvQ5Ki1HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoaMFYVFrxZ75FzIsL/LvFvHeITQD/41X2aHmGnEVWLzPPnqL/OO1wAfAXEVcL/SM8tTknN7QMpZ/WwjPjK5OXDNgSLVGlgQ+PFBHXiXglokc7i6XcnK1EIbowO88gZzy+U+Xl7PhGjaIT/b3kckGAySUkqa1xiyBIh69K7jCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h6Hy5gZc; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h6Hy5gZc"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9nV4j7Lz9t6b;
	Fri, 17 Oct 2025 18:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=57/rHfSQPuGwkuIFvhj50SlUVj/zuEPrhMXR5tNz9rU=;
	b=h6Hy5gZc8o6DNgD1mXzAXa2gc2pWO2hO2Rc0XEtEFWXvNfYFYVGsGNYrMVgeAm9wxZqzhZ
	0ZlA5yB7iVwNsDtXUspThbhJAfTlY3+CwCGBv867qgg89/8MReSrTcO5lShKBwXZ+LtVG2
	gwnEB86TTxV2lXHG6K+wess5+yaqMT1RSfOMfVO0Bxyx3nenlX3oCTH2wdXJnBbq0K10aT
	Ql4nGGu3ZapgUemyfKQv2gZXZgiCZcKBZsthE5mtQJr2BdwNKDdxnN6ozlJ72oLVPnjLBp
	NNEZQ6sLxAOnXTMcCpgaeOa7SMq37N3Zfr0CgO47yMHGwbZwC3sFSoZdZWUz3g==
Message-ID: <809b7867-502b-4c3f-b7c6-f6f7a1226a08@mailbox.org>
Date: Fri, 17 Oct 2025 17:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 35/39] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-36-marek.vasut@mailbox.org>
 <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1RnY4CcKZWqh3s@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e77f929ddf541b74f01
X-MBO-RS-META: q54r3z8wrx1c3jsp977s3wj1c6ik6snj

On 10/13/25 9:23 PM, Frank Li wrote:

Hello Frank,

>> @@ -296,7 +290,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	struct device_node *remote1, *remote2;
>>   	struct drm_panel *panel;
>>   	struct fsl_ldb *fsl_ldb;
>> -	int dual_link;
>> +	int dual_link, idx, ret;
>>
>>   	fsl_ldb = devm_drm_bridge_alloc(dev, struct fsl_ldb, bridge, &funcs);
>>   	if (IS_ERR(fsl_ldb))
>> @@ -309,6 +303,22 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>
>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>> +	if (idx < 0)
>> +		return idx;
> 
> Does this broken compatiblity? If yes, need mention at commit message
Nope, it actually does not, because the binding document used for 
validation was correct and required these entries. So we can now safely 
parse them.
