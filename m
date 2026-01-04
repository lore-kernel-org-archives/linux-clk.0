Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC59231A23;
	Sun,  4 Jan 2026 21:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767562827; cv=none; b=Wz8QnipHJoIU3MZzn3JlqlYhCdL1HO2gb4OgaSbpie7HKGn4SnI7YsRa4YyOIQxx7//HlA7AYKvmCW0ZFrjjhoyK/p/yYoyeHCfRSGe9uUnU8lUWa5F5LBOGnhO74cv3sdFoG8h83EMysGPph0fSE3n1+QrvZPecmpheRQlgdBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767562827; c=relaxed/simple;
	bh=mP1ULe+Mxr0y+dHfipheVHsGaVeVka21qNvUbJpQzk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=azCrS+C/i9Mbzj7Hrhy9S0hy1UoNuCKJi3syxucZl5tvrO8bJvj5tTYfnjqZLAVyaSJuZV1x2HEhk8MwRIoQvajKfaPDPGE70RyHp1+ODQV3U/PqedryEEEbX1I3Hn3OEfpZ/yb+SAN5+47mhGMuYmFnNeQnMJiJAhKLmbOlrrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WZMBlF/p; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WZMBlF/p"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dkrSk3cqZz9tS0;
	Sun,  4 Jan 2026 22:40:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767562822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+gEUJyRQxX9zRoXvtfQn/geVRqVRcr9TfoOgFU3GM4=;
	b=WZMBlF/p+hA2xPvmB8qCL4fj16BobTkngZIXAz74BDUxJPhu+Dr2q+GHsc+5yp7c1y1I9V
	FU9CvQQnUIdLWKR0OfX0WvfksmDmKJW7Z+fYkNk+hv+inmwgkGl827+Gniufj3rab0SUPk
	fgg0mv/bpPEJphNwkwnt3L3jE/cyVbPqXinBhz1gikP71aP2spQdd0v4ez9954Harfptre
	dV8qSvS0L/r5LnENlIcBRtsaAhKdmjr9Ioci3Fy6eXw5d4javSHc1Be53pzlNsSrCHspqk
	nIy8TmlelypxzbBgFT+OD5W/1YuoU7F4YfZ+3/QAJKMJRlRPdCbq0tiRMUYuMQ==
Message-ID: <11e63b0a-57fe-40ce-b211-e502e8e20329@mailbox.org>
Date: Sun, 4 Jan 2026 22:39:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
 <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
 <DE0YJPERKME9.2CYGFAPULFMZV@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DE0YJPERKME9.2CYGFAPULFMZV@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: xe6tfc41bu8yafn454ox53nyfw7mrfmg
X-MBO-RS-ID: 474479228642215823a

On 11/5/25 7:03 PM, Luca Ceresoli wrote:

Hello Luca,

sorry for the late reply.

>>> On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
>>>> The DT binding for this bridge describe register offsets for the LDB,
>>>> parse the register offsets from DT instead of hard-coding them in the
>>>> driver. No functional change.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>
>>> I was initially a bit skeptical because normally register offsets are
>>> derived from the compatible string, not from device tree. But then I
>>> realized this is about the LDB which has its two registers in the
>>> MEDIA_BLK. This means all in all this looks somewhat like an integration
>>> aspect (the LDB component uses two resources of the MEDIA_CLK component)
>>> and your patch mekse sense.
>>>
>>> So my only remark is that the above may be in the commit message, to make
>>> the "why" clear from the beginning. It took a bit of research for me to
>>> find out.
>>
>> Actually, the LDB was always meant to parse the 'reg' offsets out of the
>> DT, it then went somewhat ... wrong ... and we ended up with hard-coded
>> reg<->compatible mapping. It was never intended to be that way. That is
>> all there is to it, there isn't any deeper reason behind it.
>>
>> What would you add into the commit message ?
> 
> The above paragraph is a good draft of what I woudl add.
> 
>>> [0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76fcecfda919@oss.nxp.com/
>>>
>>>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>>>    	fsl_ldb->dev = &pdev->dev;
>>>>    	fsl_ldb->bridge.of_node = dev->of_node;
>>>>
>>>> +	/* No "reg-names" property likely means single-register LDB */
>>>
>>> Uh? If it is "likely" it means we are not sure this code is not introducing
>>> regressions, and that would be bad.
>>
>> I can drop the 'likely' part.
> 
> If you are sure it's not "likely" but "sure", then OK. However it all
> depends on the bindings, which leads to the below question.

Fixed in V3

>>>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>>>> +	if (idx < 0) {
>>>> +		fsl_ldb->single_ctrl_reg = true;
>>>> +		idx = 0;
>>>> +	}
>>>
>>>   From the bindings I understand that having two 'reg' values and no
>>> 'reg-names' at all is legal. Your patch implies differently. Who's right
>>> here?
>> I think if you have two two reg values, you should have reg-names , so
>> the binding should be updated ?
> 
> If the bindings are unclear or ambiguous (or wrong) then they should be
> fixed in the first place. With bad bindings we can either have a bad but
> compliant implementation or a good but non-compliant implementation.
Binding update sent:

https://lore.kernel.org/dri-devel/20260104213457.128734-1-marek.vasut@mailbox.org/
