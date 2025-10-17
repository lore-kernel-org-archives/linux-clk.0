Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9F52E8E04;
	Fri, 17 Oct 2025 16:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719878; cv=none; b=LIdUaC+WNuNZIEcXMc+f5DipEeRxx54MR7BfAnT+Utup4x+peX+QFGdX4VrveIvhnnRveX1FGEA/FBEzBx7DS2dKS6lJqmGJ9F53xPiBBUtNu6o8G1+VYOrgikpvhXundhFT3TbhqXiyA7XgCpM6jV7MWBFRZD6P7Yoj/klrTWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719878; c=relaxed/simple;
	bh=d4VscTSyxB30ZdJhGVzdeUzVIqF+bADfGB9QKwg88VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJxoSn3dvjyogDkegojOJqvdip1t9/x6a5tNsxHJuZzgSj+MI2ycS98ZPeIgChxdPe3J/UVgt9AJDVvs6dk4Zi3jGxvfbAVBbkEHL77h+B4C/r0pxct9dBfuuJFs5KFw+UjjdfKdIWtUb+qFxRs4kY6V2mrSxThbAwn1h8/u0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VzJzrDRZ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VzJzrDRZ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cp9nY4kYTz9t0n;
	Fri, 17 Oct 2025 18:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+vA4VA3wcmg6yTImrxLCggMqdpiPLMzpNBuNEaeZ7I=;
	b=VzJzrDRZkioCyWM9BTCDR/H+WlVp/vuSwErX3QlP53vW+pcPv1ngnvKDufQRqOrCS+bGKP
	dcOxAWGAcpEeb7twE8JxHQTpeJne8uX0Snb3jtzoTO9FngTUjgIpxZJ56Uj6HRL04QWMFP
	TPhIj2CWfzeJdoPHO1yjpphm41zMf2BFTUds9NZDCkaDTAgz2AAZ/ATdKpfiDEEPKsAZr/
	xYfLuuBy9bB18Oyvd4EDXc+S7rd+DT5S1McuAXHJdMgnyp5nGuddSR9stu7/6tsacRHfvX
	MA1nBX6svQ13G0q/TGeJkt9tArCx2jmSRMqg/o6CoNcIreyc7BxRWFW7NWV7Iw==
Message-ID: <14e7e6e2-c4d8-4d8f-bfdf-81d78c4a4a9f@mailbox.org>
Date: Fri, 17 Oct 2025 17:49:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 31/39] dt-bindings: clock: Split support for i.MX95 LVDS
 CSR
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
 <20251011170213.128907-32-marek.vasut@mailbox.org>
 <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1QMD6e1Wx+/hFP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b1cbc6cd40a0cc186ef
X-MBO-RS-META: fxhqboiagin4cddoh4t8gtmp8shoygpn

On 10/13/25 9:17 PM, Frank Li wrote:

Hello Frank,

[...]

>> +  "^phy@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
> 
> Is it standard phy interface? need phy-cells

It is drivers/gpu/drm/bridge/fsl-ldb.c .

It is LVDS PHY, but modeled as a bridge driver.

The rest is fixed, thanks !
