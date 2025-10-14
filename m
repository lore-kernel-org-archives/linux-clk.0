Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE2A306B32;
	Tue, 14 Oct 2025 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760476330; cv=none; b=ZAWZ7Nqf5IgQkkE7jC5jDtJODYFvuIQpAM1ua1vnl66iIInVXKAmE+txgI3jzDA9G7XTnEn5h8o8o02jYnWJ9mipjHr48A4yWbzT8GfzsTtH0cc3KBP65Ud/pWXXNT4VO8la4j1skFl1iGvtCEo6RQ9h2Dw6kY52X/7klEbF3+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760476330; c=relaxed/simple;
	bh=C54wNaaIu+uHDYiULR2PYNdHVI7AwK6UwSpIIYAUtlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRnFG9AU+EY5NxGShrma1eG4lel/gE1BwTzLsGWrLnwCqRS+cCmrm+2adwCwzqV31B+8BX/E5ZMsT/4G1Q8sBrGIPYiPwbMS6IpsFSZ8S8WWmm72WJ8qF0LLnn2ogOpkh0wTZaVrJREMVn9zywdul7xNnXWF+MIhF24PNRorp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MLYI2/PH; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MLYI2/PH"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmRjp4WXwz9v66;
	Tue, 14 Oct 2025 23:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760476318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWenJQKHGvTj+n/qgZQIpg+9Ejswl9uucWP6T0h0hpI=;
	b=MLYI2/PHUQ4pCbm9fiLSTZAnUEOdKGjp6Au1B9J53t8M+wbCqm1xlFnvXkFREipJSNM4zV
	Xbbqek71cshVEyb/L9n1iv9eFIQMvPe4oYr4xtI1JeMHWefwaejwgfBp+fT9lAscZxwBn1
	F8Lv3JB9KqBqKSnzBiyx1RkceBK1RjarniMYy72tUZhbRDT0cspNP3imfmUcH5TklObIU0
	KhffzrGnLAbEnb3bhBbN0GzWCpxNljk3ZyMX2T/1EUzgz3xKqfGYe1IQiu5mRPJdfBKFK+
	DDFK9UGzdyTo+omE3G2FEdAAgmdbgwoG64vUo/5q/mZOZkiVX7vYRx3mHek/Cg==
Message-ID: <43e3e005-5d30-4450-8dbc-8c6b5a0fa951@mailbox.org>
Date: Tue, 14 Oct 2025 23:11:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 05/39] drm/imx: dc: Rework dc_subdev_get_id() to drop
 ARRAY_SIZE() use
To: Frank Li <Frank.li@nxp.com>, Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-6-marek.vasut@mailbox.org>
 <aO0vLbkpXejre2Ta@lizhi-Precision-Tower-5810>
 <c7fee270-f3ff-402f-8266-0ffbb5077a61@mailbox.org>
 <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO5oKe14GLp3diGH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8ejmrw47in7jc7eotepxsc5w834h4ob9
X-MBO-RS-ID: 68e0347f68ce8adfa13

On 10/14/25 5:11 PM, Frank Li wrote:
> On Tue, Oct 14, 2025 at 04:03:37PM +0200, Marek Vasut wrote:
>> On 10/13/25 6:56 PM, Frank Li wrote:
>>> On Sat, Oct 11, 2025 at 06:51:20PM +0200, Marek Vasut wrote:
>>>> Rework dc_subdev_get_id() to drop ARRAY_SIZE() use and use empty trailing
>>>> entry in each ID look up array instead. This allows passing of those arrays
>>>> around as OF match data, which will be useful when using this pipeline on
>>>> i.MX95, which has different address-to-ID mapping.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>
>>> This change is okay. but my questions is why need map register to id.
>>
>> This seems to be a recurring pattern in the driver, where some components
>> need to find other components to link with them. The mapping is fixed, and
>> since the DT does not encode link IDs, the resolution of the mapping has to
>> happen by mapping the component base addresses to the IDs first.
> 
> In graphic link, port@<n>, n should be id? why not use it?
I suspect you could model the relationships between the DC blocks using 
OF graph, yes. I also suspect that description would be very complex in 
DT, considering the amount of blocks and links this device contains. I 
suspect this is why there is no such DT description using OF graph.

I think it might also be good to talk to Liu directly about the original 
design decision and why this id mapping was done the way it was done, 
they should know better than me.
