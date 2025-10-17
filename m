Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F81D2E8B85;
	Fri, 17 Oct 2025 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719872; cv=none; b=oN/lInxbt0OB97N5IDIgKwQ0Sqww/I2AJRZdG2Rfv9ZXWPP6m0CUaen+dPc63xPe5dM3Ep1QPwntfvzzbiR99YKr5a88gQCbD4plqdvgiQw76r0HJSaB4JUuqb1M2sr0iM5VFIccp0U7vlRq2F1fRrYRLbP/MWpto1XXbnxtpj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719872; c=relaxed/simple;
	bh=9IJlnZMkcKtTB1As0fPiRcfCqll2bxXUFzBHdGl57hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mHiTv/lbZxW4+5fpG9fKsXoQpHGRX/mX5tRPr1w5AoPAHgPaZWn58zHLP/WB+3duoAKZhiAwrlMjZvL9UOHqAiUv1PS6m0K8F6TfgPfM9E/pyC1yg/ryhatT6bCYTXSmj72gloh8vllcvEaNY8g1GBdFZ5PVtO5cO27IA8X6/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Jw3J8SIS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Jw3J8SIS"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cp9nR3rnfz9sSq;
	Fri, 17 Oct 2025 18:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=83oU0Nq5xnzMAjUkw90tTt3G6GepsINo4gg9dQdexT0=;
	b=Jw3J8SISIni0bCg4/v9AwVeE1UpeeKVWJcpg85mRTFP1MGZQ5MYCcOT/+h5iaSVGnZDmwm
	h6jXiQV7dC7DBtlGmfwNEHe1PGe+AabvPVH+5zszpTlv+h71y/B5AaG3ChalIBP7EtFyxK
	j0RsFTEFjuQKA060wQ5h0TiBcmIYFmn+1SrQyX59JXaN/iCWrVGeV0dNdv0+lQqT6E5PvH
	1MVoMdr5lEK59FFCpm1QmdUvYOIr+J9faQ78jkmF8Ozuc4FkFOujo+aN1st4eh0ErRTMtC
	QoSA11k2vcxsVeB4+ZPtTLWI4kfIyHYM08CpXgmz/cRSsYqW5uaandpJpQuOHg==
Message-ID: <94e3984d-9bda-4fd5-aad6-61157c23657d@mailbox.org>
Date: Fri, 17 Oct 2025 17:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale
 i.MX95 MIPI DSI
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
 <20251011170213.128907-30-marek.vasut@mailbox.org>
 <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1PUWA8CxEN9mHp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a5560825f52d16d9234
X-MBO-RS-META: pu6rccg5i194n7adfs18zjzuqp64mx16

On 10/13/25 9:13 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:44PM +0200, Marek Vasut wrote:
>> Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
>> controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
>> PHY, the i.MX95 PHY uses more syscon interfaces to configure the
>> PHY.
> 
> Any common driver for Synopsys Designware MIPI DSI, suppose many vendor
> use this IP?

Sure, the IP is common, the "glue logic" is SoC-specific.

>>   properties:
>>     compatible:
>> -    const: fsl,imx93-mipi-dsi
>> +    enum:
>> +      - fsl,imx93-mipi-dsi
>> +      - fsl,imx95-mipi-dsi
>>
>>     clocks:
>>       items:
>> @@ -46,13 +45,52 @@ properties:
>>         controller and MIPI DPHY PLL related configurations through PLL SoC
>>         interface.
>>
>> +  fsl,disp-master-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Master CSR is a syscon which includes registers to
>> +      control DSI clock settings, clock gating, and pixel link select.
> 
> why not go through standard phy interface?
> 
>> +
>> +  fsl,disp-stream-csr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      i.MX95 Display Stream CSR is a syscon which includes configuration
>> +      and status registers for the DSI host.
> 
> why not go through standard phy interface?
These are aux control signals , these registers are not PHY .
