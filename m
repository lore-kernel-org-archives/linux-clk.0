Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6528727D;
	Fri, 17 Oct 2025 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719881; cv=none; b=M1QbI2gOvW5WIoZmAZhG77a7oOcGVwtBJMnkyT58h18RfGbFY3F/nbfFOpPkbNPMmLe1oxp6TqocWh3X8fd/yV8ARP6AYIRSOW5vEkvlYem97E+Mzms83Hag3k7eyTlAhpCYDfvlAY3HZ+7sVLfXRrOROrQyZB+8lGe4umXt65Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719881; c=relaxed/simple;
	bh=hBS7zXpwgc06YApPZakDHwkP5KDcqLK2xOOP5lYVbh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uzKLVSgQkQwwfVluGjXjDTLkzzV1EUp2LzAJbS3/APN7JlLIS9aSfBagUvIp1DejfnluCd1kUsqe8avSt2s/1PhR1t9v/AdEF197Gj5qFPjkHD3K0C8hIGsU2CaQuc41MCfwVa4sxaTQZWW93Iqj4b8nflfCWHY9zI7nd7fnKKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F9oG5Aad; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="F9oG5Aad"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nc4Zdtz9sSq;
	Fri, 17 Oct 2025 18:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnyRJyBxqqT6Z/vke/OGUHeBh7T7CM9FTOlPeQxkIbU=;
	b=F9oG5AadMHujS4rxilXnq9aHT15NPwRYd0bRa+jQjBORkZi2yiwZRFiq7dMLwqrbEgtGnF
	uVhQIpmLzP6MgJi2cdKVxACJC+lgTawa2grTfcPCTE74t1YJ3aC07XY1cLofvD7JL8HGlR
	nEP4xvjIqp+KSA1RKCDRBwm2tvHLT7AkpWoudVKprnU5DQOt4dNGoR/02HOKlT5vGX7whu
	5bYZetKhuYhZgGKCsGgQZzZLg6GR9J05mwTWHj7BK8Mw9Fi2xnkQ8B7UBiEy31GB+g55OL
	XxzpVRn74A3h2UUBT39eg38rQ1yrGrICQKFpBHU/PesyL2D7HzyJZo6KXDDN+A==
Message-ID: <85a35703-fc75-4fde-b9ca-a2ceb1214327@mailbox.org>
Date: Fri, 17 Oct 2025 17:54:41 +0200
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
 <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
 <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <182271f2-4986-4401-a4c5-ca379a02e69b@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 21f322bb393c42677d5
X-MBO-RS-META: xow3qztriop681daecnza1kueomurrys

On 10/15/25 12:09 PM, Liu Ying wrote:

Hello Liu,

>>> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
>>> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
>>> prefetch engine).  You probably want to take a look at it, just a heads up.
>>>
>>> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/
>>
>> Thank you for sharing that.
>>
>> Would it make sense to send 4 and 5 separately , so the fixes can land faster?
> 
> Maybe not, since there is no user(DT node is not enabled) so far.
> But I'd like to have more review/ack for that patch series(it's kind of
> hard to get sufficient review...).

I could test on the MX95 if we can somehow ... figure this out. Then I 
can provide RB/TB easily. I don't have MX8qxp device.

>> Also, could you please try and avoid the SCU dependency on patch 7 ,
>> and more in that direction , can the PRG be made a bit more optional, so the
> 
> Don't think there is any way to address them.
> 
>> iMX95 can still be supported by the DC driver ?
> 
> SCU dependency and PRG(even more other reasons) make me opt to separate
> modules for i.MX95/8qxp DCs.
SCU is only a register accessor, PRG is another block in the DC, I think 
those can be isolated. It seems the whole DC is a composition of 
multiple reusable blocks, so we can compose them for both MX8qxp and 
MX95 the right way and reuse most of the code, right ?
