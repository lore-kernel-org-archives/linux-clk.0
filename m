Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797492E8DEE;
	Fri, 17 Oct 2025 16:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719869; cv=none; b=dkSc5iyZeXLU14SoLFlRmkpY23AvcXOohJCOwGuOnL/15O4Zj9/snLZ/omJQ2U/+p/VtLXEqNH4SsfYV90YXt777E1opca3zzB8DdLZvvEzFVBZM2hs3f6cL4vR1flJJkNhd8Ibl1tgwVmAqQoDsfzUptRil9KcLd0odZt9sCUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719869; c=relaxed/simple;
	bh=66toKUayRMWner6CrI2BOzMa2JyG/MpMWtEk6oD9pD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d140JUFp9atsaJ5wGuvgxUFs7tI0t69/gOHLJiqa7vWu03akdHa9mB1GR+P8GynLxQ8YZzzSA2Mr/OizfRSaaYB2eku1VHcpENPMOPA/b9olaoNeU2wpiMdTa3vWEA6ufXKiYhW+M7Zhw64Aive2uImuWbU19XcDdhoUAkbjWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KlzpCtN7; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KlzpCtN7"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cp9nF6NMLz9tRR;
	Fri, 17 Oct 2025 18:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTfWmnLQ6ukMdEbgfBMNWGOo7KjRgWEeSGa22YoD+80=;
	b=KlzpCtN7V0epBRmPwHiyo4tjl0KakccxsblOcYYkMP3qUvr3HC6kMRrRo8KK+aW7dqVhJH
	jmciNwC5gtkHsA3YxnTDDVtGrI2cGpAELXQDfXsXP7kArwVkEz5bncWkMg37XJMeQcMwVe
	ORLIIw4qn4FucHm440UjqPXe9PWmqhntt/beNEL2j9CfaHU8BVDuum3Ov3LiQxTP/Jdnd5
	WnryxYoyr8TCOeIlSWrFes9pDNy+cWxde7a0G/YHgbwrehOEuFAUeBXxt1Hd/YzM9pW8nC
	ShxQ5ahm4wcfyaTLT8wUKMMmga8Uohqtx4G16YbxD2nNrG3I7AW8zV2JZ2Kl0w==
Message-ID: <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
Date: Fri, 17 Oct 2025 17:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e9bf3970d21c759542
X-MBO-RS-META: xtxht9rdhwbcun9qqmd7dk9na8uqmrzb

On 10/16/25 4:07 AM, Liu Ying wrote:

Hello Liu,

>>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Freescale i.MX95 Display Controller Domain Blend Unit
>>> +
>>> +description: Combines two input frames to a single output frame.
> 
> I'd like to comment on patches in split patch serieses(to be sent if needed).
> But, since I provide the below interrupt information, anyway I take the chance
> to comment more:
> 
> Add more description about the unit according to i.MX95 DC IP spec:
> The unit operates in four modes:
> - Primary mode: The primary input is used for output.
> - Secondary mode: The secondary input is used for output.
> - Blend mode: Primary and secondary inputs are blended, according to the
>                programmed blending functions.
> - SidebySide mode: Primary and secondary streams are projected side by side,
>                     i.e., primary video on the left side and secondary on the
> 		   right.
> 
> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they don't
> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
> modes, this would impact how an OS implements a display driver a lot, especially
> Blend mode and SidebySide mode.

There is one thing which specifically concerns me about the DB, it seems 
to be capable of blending two inputs from different security domains, is 
that correct ?

>>> +maintainers:
>>> +  - Marek Vasut <marek.vasut@mailbox.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: fsl,imx95-dc-domainblend
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
It seems we currently do not use either clock or interrupts on either 
domainblend or layerblend IPs, but maybe DB and LB are different and LB 
really has no clock/interrupts ?
