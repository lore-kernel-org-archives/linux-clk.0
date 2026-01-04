Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51A231A23;
	Sun,  4 Jan 2026 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562824; cv=none; b=kyRl9J5w+cu61aXHUe2viRvvttbnfs417WKK5KVQVnb98i6pUz/Ok3NeOEoFCnkHFf1ozDvBvl/zrBN7paC0rXEynvr8EX00Ugw7yMBFfc6tZJBYprUjwzHFLQqevT4lAgnpl8Tl1P3Rm+4G0eAK8ON0i2QY6E3M7soXTYzJOTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562824; c=relaxed/simple;
	bh=Gsnw34my1PvdRzpDMLFQBJTrOOnt4eNJvpKW7PiEFCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLGIqmlVEeVTNGNOjX9r4GzppF0SfbsdvhmGByh1zEhUPjfPoqDxi+vuggPyQ91NOfViAOeELAwpio+lWYS4Q5gDVw9IArzWQtT4oLMQNO43w8M1yxD0KhotS3g9G0NYox27QiOXKh5iL3aLcSDyGx4qGT0Vaotnm14ENVzoRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Msu6Gk2u; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Msu6Gk2u"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dkrSg0v8tz9ssn;
	Sun,  4 Jan 2026 22:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767562819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gcJ4qySzjY0KVAwHFonFKf4MTj/0gwZsfwoy4TTth9c=;
	b=Msu6Gk2uRTh5Wq0JBpm6P79Un8o0EIiWk7gZyzhdv1eu7gjtktlm0JfFbc5Mru1GIjkcfm
	MSuBQ/6/odPVQ5sR9YsFCVD7dv+F5jq5STFexwJX3ae2hwQmh4J9bcEnJXf43Ak5KOuH5e
	CoJ5u5JHO6Nju1m8shUA/9tD/0WskxcnsFyMzo7B71D83LSFLg+bUlKBB02HfQm8JnzCZy
	sc7BoxXDNU806d5wxTCkSgWK6t4IQ5hEakURlxbah3WuTOzjSltSV26Z4zCeW9/2KABVUD
	FklBU0Nhat3neYUY6xLBuqDIUop6f8E/q3PIxutPe30bgGl67nbHIut9AA9yyg==
Message-ID: <e4504a0b-65af-4749-8702-7b51dc933059@mailbox.org>
Date: Sun, 4 Jan 2026 22:09:18 +0100
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
 <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
 <ac21053f-21d9-4844-9049-09deb3708a6d@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ac21053f-21d9-4844-9049-09deb3708a6d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 4ef6ba8cb8fdf258150
X-MBO-RS-META: 376wawhc1tkcnnz9scobhr58t5iu3ewg

On 11/4/25 6:25 AM, Liu Ying wrote:

Hello Liu,

sorry for my late reply.

>>>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>>>>     };
>>>>>>       struct fsl_ldb_devdata {
>>>>>> -    u32 ldb_ctrl;
>>>>>> -    u32 lvds_ctrl;
>>>>>>         bool lvds_en_bit;
>>>>>>         bool single_ctrl_reg;
>>>>>
>>>>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>>>>> get the second register.
>>>>>
>>>>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>>>>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>>>>> use a structure for device data with only a flag.
>>>> I plan to add more bits into the driver match data when adding the MX95,
>>>> so I would like to retain these instead of removing them and the adding
>>>> them back.
>>>
>>> i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
>>> or separate LDB mode, while one DRM bridge is needed in split LDB mode.
>>
>> What do you refer to by "split LDB mode" , some interleaving or some such
>> thing ?
> 
> I mean "Split Channel DI0" and "Split Channel DI1" use cases in the below
> table in i.MX95 TRM.
> 
> +------------------------------------------------------------+
> |Table: Channel Mapping                                      |
> |------------------------------------------------------------|
> |Use Case           |  LVDS Channel 0   |  LVDS Channel 1    |
> |------------------------------------------------------------|
> |Single Channel DI0 | DI0               | Disabled           |
> |------------------------------------------------------------|
> |Single Channel DI1 | Disabled          | DI1                |
> |------------------------------------------------------------|
> |Separate Channels  | DI0               | DI1                |
> |------------------------------------------------------------|
> |Dual Channels DI0  | DI0               | DI0                |
> |------------------------------------------------------------|
> |Dual Channels DI1  | DI1               | DI1                |
> |------------------------------------------------------------|
> |Split Channel DI0  | DI0 (first pixel) | DI0 (second pixel) |
> |------------------------------------------------------------|
> |Split Channel DI1  | DI1 (first pixel) | DI1 (second pixel) |
> +------------------------------------------------------------+
So yes, split mode is effectively interleaving. But that should only be 
a matter of syscon configuration.
