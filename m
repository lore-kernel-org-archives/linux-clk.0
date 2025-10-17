Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF60B2E8B7E;
	Fri, 17 Oct 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760719854; cv=none; b=pINI8T0TcEh6pHlelebOOq8RdGoBxq8NuZT3hVOAKHTMcFeYwrHiMoRydM0/FyrU9bdcVPWmjfcApT+PeTC3lfjMgCEaQ/kvApxvCIKweocFHXgfHly6m+E17ejqQiM//TKVYsrZYw5qH5xRqra54leeq+r6/wd4lQCa46zQECs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760719854; c=relaxed/simple;
	bh=NAr79tIjrQnJIo4OKFg4GdEQ3pjizJQXJK3DET5Lrz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvGjzrflGBrgAKuqHcAM+itmzD8qBlEWYJpM5X9DVFcTyPgqw5tSQHWi3xisC+J19HRUE6oiROt1Fh16p7jArI2DgOsHo2jBx4CIJNbQ9cC3gf+OHFwjL2iVvokoDAkgO6op3HTHJ6/++kW2Sevuj7/4Bg4vgcxNntpicP5dPVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p7BzawF8; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p7BzawF8"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cp9n526C3z9sr6;
	Fri, 17 Oct 2025 18:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760719849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mW/HzZ3gW1VojRmfulxz/q3LPA7ybA89Muj9W/fDTPY=;
	b=p7BzawF8M8QCK6v4CTLnkyHlWvhCxa5QXUljUyQErxSPSp7PWc+zy+UDhxCegUcrku92l3
	vOKM2xepz5l8LPThpvffyZJEhwQgTUzu9Lr6VJNjiaayMZBMQNWAp/COPtjwNGK4VRK9o4
	glv1spDZqP15qe6XJXaSynjVn1OKskW1UmogBtG/DljndEGn1H5tGTkj18JCbVSjRKieDR
	0jd3u3gDiTc6Xpl0olBv90PSPAlfruVMgBd+qEbKOJusXCtWEcpRtXCcrBShjfi8aOIyX8
	qP4Dzm3OuPTqWeeJHmORAb1kOfdCEwCIuAfI4gp+E6GGXzu7a8HKOfDA1VjaWw==
Message-ID: <cbfb1076-6a23-4b93-9ac4-4401b5b4a0eb@mailbox.org>
Date: Fri, 17 Oct 2025 17:04:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS
 display bridge binding
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
 <20251011170213.128907-33-marek.vasut@mailbox.org>
 <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 009385e66b48b358479
X-MBO-RS-META: 78us17p5xfqwgitsrb49mw8bgn1heybj

On 10/13/25 9:20 PM, Frank Li wrote:

Hello Frank,

[...]

>> +patternProperties:
>> +  "^channel@[0-1]$":
>> +    type: object
>> +    description: Represents a channel of LDB.

...

>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Input port of the channel.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output port of the channel.
> 
> most likely port@<n> should be under ports.

The topology here is a bit different, the ports are directly under 
channel, just like (usually) endpoints would be under port . I think 
this is correct, even if I agree it does look odd.

The rest is fixed, thanks !
