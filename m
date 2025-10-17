Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170D2E7BA7;
	Fri, 17 Oct 2025 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719848; cv=none; b=Bg3mn2wtXtOFaGxFPJrvAiKcAbVPpfXYImqBcuRkvHOGAoHh7DiaE+9JGddwMstpjdyCrZ4cWpMVhXSgIwoQtKV9kFdCQwB7gx2YLfV6sgMqD/EGoULD0QnU/KbRw+5xjeMK/aF31Z99BsFY5174xCyrRaScUdsmFr0qKQ/WIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719848; c=relaxed/simple;
	bh=MMgFnY44lYLvFWaAHAhHw8Fg4sVOR5puzdhO0HV5r+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uzo6aUfb7krvf4JyH33pKpVHW02UMRZklYUhJTsoEH1GH/O3LnyXNdItMn/Sk1jtD1bRLegUtK9YS2nN0eId1vCXKc6hUL247UQaXzHkfLE2p6BZnc5IKIBVWsjrIIwGdAOOM001Weti7Av69hymCko5bpdcpG1c1/hbBRvimM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eyYDDBza; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eyYDDBza"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9mz25xwz9tJG;
	Fri, 17 Oct 2025 18:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KKALYDlBuq3AApm7hJUER0vvZlNv/1hPEVn7ARgUxR4=;
	b=eyYDDBzaOLfNdca2I7KQdT7e1NK2NXZIZWRlguf6SJej6B3274WlX3ZqqSl9TQ9NfnXzZk
	Pb7rR3iY1xOHKd1YsBZPleTaH7i5VwHRX/hwXHoygO2Uw13PIaOmiWcP3NzaZZqFsCoJNR
	7CzPI/jIEEBOM6EJW3QfRZb+x4pWNlqXpzzZNVPlrmRBGAdr8NZJ7KLL3hAcoBFbcu+cZC
	zcTMsaRupUE4lrEZwZPSfG6id4vATlg/djF3w76VmcjMCA7efgt5IfGwOF0V8rjF/zyVfV
	YBpveuObA970laZ4iSSs7vCrqQHj93OZNBsIRS1wsm0BquPOrUCiX8tf6oLZJQ==
Message-ID: <96850d24-8b38-4437-bbde-2b4aede3fdae@mailbox.org>
Date: Fri, 17 Oct 2025 16:55:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 25/39] dt-bindings: display: bridge: Document NXP i.MX95
 pixel interleaver support
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-26-marek.vasut@mailbox.org>
 <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1LkIAfErQhQ58j@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 63emeuje8d1fpppi7rferinsd6qqt4yc
X-MBO-RS-ID: 7c53f1497155dd64e06

On 10/13/25 8:57 PM, Frank Li wrote:

Hello Frank,

>> +  fsl,syscon:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: |
>> +      A phandle which points to Control and Status Registers (CSR) module.
> 
> Need justify why not standard interface such as clock, phy, reset ...

Because this is neither clock, nor reset nor anything else. This is 
really only a remote register which controls the pixel interleaving. 
Therefore, syscon.

>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
> 
> video-interfaces.yaml?
No, because none of the properties in video-interfaces.yaml are 
applicable to this port as far as I can tell.

The rest is fixed, thanks !
