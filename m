Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2471EC018;
	Sun,  2 Nov 2025 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762103737; cv=none; b=iHC9g/G3mVDon043cmOy0aUij2unW61Jft4BN4wsVYeslCGDB1huNks6BURmBJHYZgw1LTJh9jzuXFd6hgnsrXcAmsNXGdjVt/gSfgNdWe5qgBusw4H34Tnl6ocD5vkzgYhpBBp8v7x7Uk5I0S3JDLQFZmTp9n1HiO8wN+4eMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762103737; c=relaxed/simple;
	bh=VsJ5HmXia8ZCsXpoL9mzkkg0CaKKLph3Q+M5l/Hm2z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hG3e4I4yitoZDt0Pr29kxpIqyhGHB1dy95DKHMObXOxPMmTzfs95qB/+QmSp1tM5YkQIMNyIx/IA7QPxU7a6uGekD6VsYM13FPmIi0DkW6M7mexoGGGzAevs9zQm/5QKB4S4pGNWUBvsC32PCXL4KJNRTxXvsdF2W7zkF89kJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v3olOY/+; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v3olOY/+"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d01ZD6v3Tz9slM;
	Sun,  2 Nov 2025 18:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yvcra83KqAtjzan9YfLxcRGbh7hLfnp0iWgeFUv/vLM=;
	b=v3olOY/+S43PgZ9sly6XeJ1t0BL0X1kTGqmKwACZXIjXTLKeL+5+kvcV/OEN4BCDEjlNvd
	XHY//vVJgwf3llsBggueCMWpJUdtplR1Jj9yn2y74Re6lwDIKMhmnMUr0sQSic67IT62yZ
	gTNdo9WnNf1/z6G7oA6OYK2e3n7ieAt6d1V3/uQlllhRbTflMMrB+c1oEQTHtloYE9UDmP
	pu4V6OHmWFLUAKVHqVKLXgGnfcg7nyrhMc/0xY0cXHo24xUPf+MGUXY+vaCUQ+1HcupTnn
	SW0jYPlVjgbRrbjfKpXMFDNP+VPFfE4meoaSfwXjX4fV+FEb1iNBqdp3Q+jQSA==
Message-ID: <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
Date: Sun, 2 Nov 2025 17:59:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: owwnz8df3ensc6z3bmdy7xxp57c41417
X-MBO-RS-ID: 6daf2627d9b070bd268

On 10/20/25 8:21 AM, Liu Ying wrote:

Hello Liu,

>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>   };
>>   
>>   struct fsl_ldb_devdata {
>> -	u32 ldb_ctrl;
>> -	u32 lvds_ctrl;
>>   	bool lvds_en_bit;
>>   	bool single_ctrl_reg;
> 
> single_ctrl_reg can be dropped then, as it can be expressed by failing to
> get the second register.
> 
> Furthermore, with this done, lvds_en_bit is the only member left and hence
> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
> use a structure for device data with only a flag.
I plan to add more bits into the driver match data when adding the MX95, 
so I would like to retain these instead of removing them and the adding 
them back.

The rest is fixed in V2, thanks !
