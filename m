Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4DE17B50F;
	Wed, 15 Oct 2025 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538802; cv=none; b=sZAQHzSwHVe3uiqq8kem+zkq6gR3SuT/lbe/QYGgYp8P13rmyJZcRpP4rh1r+3FsrmzSgTUS5zEVVXB0iOHGWG/58JoAaaeu3zrXZtOt3rYJulIVOWwK3Wz6xeJf/aSqlojalHt3gz+71KPJrWb3KYpQHV4cI2HFa5HFSs7FSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538802; c=relaxed/simple;
	bh=tDM0kU0b+a0XNq9PsdHCsruV9hc1JDceI75DKsbQfjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMNvx3I4kYKzjafMDbGDKSfusi1MlYwgSwEndHukru2jugZVEAlHiuxmK03zJhzd80sGF3SgR2DKqBNAS0uKl/W8vmsaD3ziC+LdseWqkhXqr4z2nMFgO32Ex8L4pXs6A5jJfWEBRzOp8UkhhaJDh64tRJoAhZ08NyyVFYmZu50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wN7lqxX9; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wN7lqxX9"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmtqJ5ghsz9v66;
	Wed, 15 Oct 2025 16:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+0AAq5p9n3CYb0eN2KQBzPDtI3LpH6hBvgSrfcGzKs=;
	b=wN7lqxX9ujyaZAtI3oFJQBPbEbCEMBGULGgOFLBCY8XqGfDEy4VEj5OTv3D4U7tGelWb9+
	StMm8aoZZcvrm9F7FXK+h/dd87S4E6C0WFcCWzepB33sy+b1zj6nhGPnXO82dXsPTsYosY
	Ud7bD3DHde2xmx+/bZrhYtSKMC8zU9dnKaiJDxWRPUPpBILy98OUUUa5ep2h2dF9VVcwkk
	wAX+kTD0D090Sy7/0bIEJZArrFjR9fB9m6/3c5fgSzAghzEkE9EzMcKYN34SBzaZnjFI6N
	WUAq+FAHm7mc4pGvhu15vOKy85e1gZt88Aer8pMJnVjgGGNfjhXIup6L4LHINw==
Message-ID: <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
Date: Wed, 15 Oct 2025 12:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
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
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3bfifor4uba8rjg7sfrfhsxrmksew5w3
X-MBO-RS-ID: f82c0904535502d82ca

On 10/15/25 10:59 AM, Liu Ying wrote:

Hello Liu,

>>>> @@ -90,13 +102,15 @@ patternProperties:
>>>>          compatible:
>>>>            const: fsl,imx8qxp-dc-signature
>>>>
>>>> -  "^tcon@[0-9a-f]+$":
>>>> +  "^tcon(@[0-9a-f]+)?$":
>>>
>>> why here allow no address unit tcon?
>> This might be something Liu can clarify too.
>>
>> TCON on iMX95 DPU does not seem to exist at all, or at least has no control registers. Hence no address.
> 
> i.MX95 DC hasn't got TCON so it should not be documented for i.MX95 DC.

What DT node do I attach the pixel-mapper/pixel-interleaver to then ?

-- 
Best regards,
Marek Vasut
