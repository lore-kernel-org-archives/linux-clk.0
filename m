Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BB279DAE;
	Mon,  3 Nov 2025 23:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762211316; cv=none; b=sG02m4zsb9i1iHBiZpDMUWSlJwYbD74eBQYHwTt7/GXZcZs4FPmHHKQ4ffC2bgmIlqbhP8FJD3fu3ADD/MGmruEejR6PXAmBokJNdfxFUEQ0qXtqKhIdlE/6eATPkQmo1pKhA0BuhyjEjdWnqUBmcZ1Qv2u0bTHefJfgMWgQoiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762211316; c=relaxed/simple;
	bh=56OooW9cX3cU4rjhJdGg1WlkNumvlqOytuXETKcq6nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZu0q6LJ5pQkfC8ZXkjlUdAWDDqtYVraxKdYBNzlCl5U8fR4OJVYcMzWaKhv8txx/owPPjp2ta+07GAcxslOhMCLUYlf+pjy6g+QZT57w3ETQh374fSJ8jYkrzrgBCFaCSCutf+cx3ea5Naf+5JH6QwbihQTTpD8dTicwzSo3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mR83v1DW; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mR83v1DW"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0nM20TShz9t8t;
	Tue,  4 Nov 2025 00:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762211310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SKZoc/t0PE0oCMMYE9oz7Kdp/2JdHrUYbcnC4UFkaB8=;
	b=mR83v1DWriew9VA6CcS7tSK/+AP1IWL1aBt1E65A2HXo9X43fmU3Nm49MJDWrlLQBl+WuL
	SGRZkKJTgyLFpIJMUh3BSXZdW6qUI4k8sJEtDUKix1AIItiN9355NiSJ71ybcy/69TBdzC
	Zfm2N25O40+Z9klqYcqGV2Ugh5Rg1hWMWuSbsayChAwBgsqLNIEsv3zMBMxGx8ig4I4yEw
	UtBhUR4Ff71Q8zx6k8bXVjmWYCskhSfIt2d5414AdcWw82zO+5zmU1ppU+6aqwJjCpn4uc
	U1YnoqWjWZRAeNvDefitM1HOmnLG8P1AY7vYiQoadqGGxZYUC8d2KODnnAoJIQ==
Message-ID: <25cd3b11-8417-44d3-af28-fa73419c713b@mailbox.org>
Date: Tue, 4 Nov 2025 00:08:25 +0100
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <DDZ6KCUVYB55.330X4X5ETRXR3@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e65bffa8f787aa60cf0
X-MBO-RS-META: ou9okzkmkj3oek4quigbzefj9mhbi5k1

On 11/3/25 4:55 PM, Luca Ceresoli wrote:

Hello Luca,

> On Sun Nov 2, 2025 at 6:02 PM CET, Marek Vasut wrote:
>> The DT binding for this bridge describe register offsets for the LDB,
>> parse the register offsets from DT instead of hard-coding them in the
>> driver. No functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> 
> I was initially a bit skeptical because normally register offsets are
> derived from the compatible string, not from device tree. But then I
> realized this is about the LDB which has its two registers in the
> MEDIA_BLK. This means all in all this looks somewhat like an integration
> aspect (the LDB component uses two resources of the MEDIA_CLK component)
> and your patch mekse sense.
> 
> So my only remark is that the above may be in the commit message, to make
> the "why" clear from the beginning. It took a bit of research for me to
> find out.

Actually, the LDB was always meant to parse the 'reg' offsets out of the 
DT, it then went somewhat ... wrong ... and we ended up with hard-coded 
reg<->compatible mapping. It was never intended to be that way. That is 
all there is to it, there isn't any deeper reason behind it.

What would you add into the commit message ?

> Laurentiu's patch adding i.MX94 support will conflict with this
> one. Whichever gets applied after the other will have to be adapted
> accordingly.

It would be good to clean this driver up before we add more functionality.

> [0] https://lore.kernel.org/dri-devel/20251103-dcif-upstreaming-v6-3-76fcecfda919@oss.nxp.com/
> 
>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>
>> +	/* No "reg-names" property likely means single-register LDB */
> 
> Uh? If it is "likely" it means we are not sure this code is not introducing
> regressions, and that would be bad.

I can drop the 'likely' part.

>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
>> +	if (idx < 0) {
>> +		fsl_ldb->single_ctrl_reg = true;
>> +		idx = 0;
>> +	}
> 
>  From the bindings I understand that having two 'reg' values and no
> 'reg-names' at all is legal. Your patch implies differently. Who's right
> here?
I think if you have two two reg values, you should have reg-names , so 
the binding should be updated ?
