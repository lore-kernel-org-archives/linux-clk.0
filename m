Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC021D596;
	Tue,  4 Nov 2025 03:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762226168; cv=none; b=mTJp6OQOWErffYNqzJSO0+RpM3cZ+rtkGhNdvV3mHDyhy6or+uxSgeO4UzzNH+Vv3iMo9BipjMaa2pvK7Z7uaQG6momnvFsSJ43RRVEavv5C3edV4DTKtgGL1nZXbJOzDr0sr2+T5bYm602PjVhnCQTSN+x8S/eCGUO9VK52vmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762226168; c=relaxed/simple;
	bh=4RE/hSwBZ+Dxo4S8eYrxinHnC/8NEAhvPCLzWp82ph8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs7GFQcpiBsfkEPmv7jFaiuhShsuFdqj2LPXb03Cq7NkDdwI5JFZIOVPJtncNrWdbe7azNWs7otRa0XGicseunFBMiPXiKq/muGZ0gEGIbZvQ5IGXzzd1kJsjxNCWqldYThZh6cVH9qViS/12B7+jDAo1XPYkChwGdONQNCEEvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oVpSfSU6; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oVpSfSU6"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d0trg01jkz9t7v;
	Tue,  4 Nov 2025 04:16:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762226163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iUWrGCIw/Zv/GiBWLpRt2ws57Kzc9dYmqq3QLQpmDF0=;
	b=oVpSfSU6aBjiyCMFJCNiSJAYhCK/qIKz2+5F9D3Q6FPRvG6MFF25OZG2peWBVcVjOK79BI
	tHEnnZR3FBlsu/bFebgxtqt2is3u3/5r5pbqqhffMBp9dvT8OnMaYnZ8UR45Qa1ioo48AX
	KeL47JJyZmjQxXDSk7IIW4IFniiaDptn3qqRnKQcItpwSoETVzsDuvBGMzZjmFAcny/yXL
	fAFfxPt4ISSOPcXxgZwQayiJSF03C/wc8gMnRIuKFshp5cYkN3AN5T+3UrK2yOzPEGm5p9
	4opGreAxNbSre/FKzOjEa+4HXzbOH/8CU238yCkJ5LXzlVocKZ9HRADAKGSFmg==
Message-ID: <0c4bb240-6f5d-46c2-8a0d-7446ad3a9d31@mailbox.org>
Date: Tue, 4 Nov 2025 04:13:14 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/bridge: fsl-ldb: Parse register offsets from DT
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
References: <20251102170257.65491-1-marek.vasut@mailbox.org>
 <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4beeffe0-6ae4-4039-9904-3ec318533a1d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 34add6b3791a6021810
X-MBO-RS-META: ntjcfwefoenphcqto837dnsga9k76u5n

On 11/4/25 3:39 AM, Liu Ying wrote:

Hello Liu,

>> @@ -61,24 +62,13 @@ enum fsl_ldb_devtype {
>>   };
>>   
>>   struct fsl_ldb_devdata {
>> -	u32 ldb_ctrl;
>> -	u32 lvds_ctrl;
>>   	bool lvds_en_bit;
>> -	bool single_ctrl_reg;
>>   };
>>   
>>   static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
> 
> As I pointed out in v1 comment, this patch should remove struct
> fsl_ldb_devdata.

The lvds_en_bit is still needed , and I plan to add MX95 support here, 
which would extend this again. Going back and forth makes little sense.

[...]

>> @@ -309,6 +302,27 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>>   	fsl_ldb->dev = &pdev->dev;
>>   	fsl_ldb->bridge.of_node = dev->of_node;
>>   
>> +	/* No "reg-names" property likely means single-register LDB */
>> +	idx = of_property_match_string(dev->of_node, "reg-names", "ldb");
> 
> You don't need to match reg-names.  Instead, just call of_property_read_reg()
> twice to get the first reg and the second reg by passing indexes 0 and 1 to it.
> If the second reg is not found, then set fsl_ldb->single_ctrl_reg to true.

This wouldn't work if the two entries were ordered the other way around 
in DT, i.e. first "ldb" second "lvds" and vice-versa. That's why 
properties with multiple values also have the -names property that goes 
with them.
