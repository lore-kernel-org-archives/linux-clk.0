Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67696303C88;
	Tue, 14 Oct 2025 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760479771; cv=none; b=ZNeZnNpGdNHcv7bwtuPFPq1yxoHSTTx/do4nroNkSwvru1ruf5jKwfQ68i8azrwTpfcOeaJX8Tih7SgSE+o35E1SeNZLmDMLRjeGa/S7wGmn+X/BMBWOnytfduA+nP3Gc/yajTcw76U5mXQfVDWwkEEz1ydiOpJ+sWJ8JTeAz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760479771; c=relaxed/simple;
	bh=oI1abJIFHqXDPS9wXYVnXUtBPXbCwR8ksekULWNMqYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CFcg9lzBbmk6/KJZxVTr7l4xDs7Thn+CIpUMADT6Z0xu0epHksFjHbg5hOJzSuCUd3Kz2sdZ3dqj+RRKwwmJ1xZnI7XUqPxGONMzzIyB+jy18JedPbR0MEGpI7xNitz3A9LTgDhbG81HaB9rlnlFZZoeiyPXBFmLRg0lUS0WVWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wRFL0mRr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wRFL0mRr"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmT063mGpz9stY;
	Wed, 15 Oct 2025 00:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIxf1/4W8b4if0tFBzh4U5BnvAEvdOXSo62yxEFwEXw=;
	b=wRFL0mRrJT2CfJS4ItX0KWMGyP3Gd6aS+1DYz2MHvDq7l3O06LdxC5IfzJXNCA2M51hrbq
	1d6Z9j8iX/LlZhdjawnfU6FkCRo01vWKAqQZ3fzGVq+nWSWF08jMUGuT/3E/G68WDlUHaJ
	trmYmANaird7rtZRuyXC8KEne49qggfwm8AZp4x4MvwYmLM1lkyBOLfsgIIWzIdUG2dZeR
	v8/cIHOXbp/zMIH433gJFELVOTnIsWxeADBs0I6YYAQcr7KnOVmxlWonIjl4pn0i2RdR7L
	LTPsWK8zHA21GJf1mjTDKo3hjdejYGsVkXpSURd1uA4Q54Kc8hIqF2/NmIC15g==
Message-ID: <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
Date: Wed, 15 Oct 2025 00:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
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
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dfgywskta81h96wyddskwwoj8dxm9e8x
X-MBO-RS-ID: 547d559a5ba5a68b3f8

On 10/14/25 11:13 AM, Liu Ying wrote:
> On 10/11/2025, Marek Vasut wrote:
>> DPU is added into DC driver
> 
> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
> prefetch engine).  You probably want to take a look at it, just a heads up.
> 
> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/

Thank you for sharing that.

Would it make sense to send 4 and 5 separately , so the fixes can land 
faster?

Also, could you please try and avoid the SCU dependency on patch 7 , and 
more in that direction , can the PRG be made a bit more optional, so the 
iMX95 can still be supported by the DC driver ?

-- 
Best regards,
Marek Vasut
