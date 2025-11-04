Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F5714EC73;
	Tue,  4 Nov 2025 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226167; cv=none; b=JiXWntX/S1qMgiez/xY2fQ5KEVZbzHvEsO7Q3NHEnOKly6gRGw3w8vRA40iVcCpdV3eJk9iXFPhZyrUGXiEN9xUuLgGIFWEL9gADG7sqH+JkLqAdpwqxU80DaYoKsntUjN3rykQUHRr7tXscjD6HEJcUE4RHQGR9+6qvGtC3WsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226167; c=relaxed/simple;
	bh=Q4F/VQo9TKI8YMJ3QZZtO+J4F74Qfj3BEcr40NIyu+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRUZ0zXXRr9FwE0CSuhAoL8Av7FIeTCsr7tlN9XeaB7DLVqbeNNH/BtMfIeqhZZAHPEUYlCOytQ62g2LXrHqYqnqMB9XLBeLvSvFxFkHAQ/EQkCd8OhkwLY9rb0z+pSf09uryb7vRY9MivJRiYr087ptpb18VS1nvkZMLV4Gb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bz/Sz5G8; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bz/Sz5G8"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0trb68f1z9tp6;
	Tue,  4 Nov 2025 04:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762226159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVRVU1wb4ki3KWvhjOwWIYph+e4orXiwLs8iLuRhYs=;
	b=bz/Sz5G8bDTmcs8MxDKW4GltYYSQcPT2kwltLV72ozxSYKorHJ6pdUKASScZlcbdRoFCM2
	+7Jeezt4eCpWWGH3Qb4y2RGeYLhwPKOlEL2QJ/jSua12nB+hF4SgfY2UW7QCY0NGNglDgd
	yIAItR7wjisn+gU69yYQaJYsOCS4gwJOStdU3IEWLPzRCu+ALZsOlWi5a9yFgUBC6oRHz4
	LdylWetW3JFdrmXR6WVwlaz0impWKUT4Lsn04B96gBH1p53vhSDXKRkUaZqrqhSLehXQSL
	n4xVKjRpMZdTgdg5ublAxVhue9ALk4uIxmX2cTeWiwiY4qtW53gOZIN6AoYg4w==
Message-ID: <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
Date: Tue, 4 Nov 2025 04:07:26 +0100
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
 <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
 <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2b6b09f05eb987a5cbe
X-MBO-RS-META: m56ydbxsgw89ewsit8a191x7o38ki4um

On 11/4/25 3:26 AM, Liu Ying wrote:

Hello Liu,

>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>>    };
>>>>      struct fsl_ldb_devdata {
>>>> -    u32 ldb_ctrl;
>>>> -    u32 lvds_ctrl;
>>>>        bool lvds_en_bit;
>>>>        bool single_ctrl_reg;
>>>
>>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>>> get the second register.
>>>
>>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>>> use a structure for device data with only a flag.
>> I plan to add more bits into the driver match data when adding the MX95,
>> so I would like to retain these instead of removing them and the adding
>> them back.
> 
> i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
> or separate LDB mode, while one DRM bridge is needed in split LDB mode.

What do you refer to by "split LDB mode" , some interleaving or some 
such thing ?

> Also, each channel connects to a standalone LVDS PHY.  All these could make
> it intrusive to support i.MX95 LDB in fsl-ldb.c.  Maybe, we could discuss
> about this later, but IMO this patch should remove struct fsl_ldb_devdata.
> It doesn't hurt if we really need to add it back.
OK. The current integration seems to be working fine. Which exact case 
are you concerned about, do you have an example ?
