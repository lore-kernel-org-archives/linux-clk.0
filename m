Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C59224245;
	Tue, 21 Oct 2025 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761029565; cv=none; b=dN5AQXQkv6dIDR7BkSJH0QOZI7IKY7s7VJAp866CgmnWwIUEAcCWqlZLISoAExLReGp/gU+KigA23GMSI8hgNHNlkSynfHEx9l7t80ZlmX9hsbpOeiLl+2NUCmlE5TCv6AbBQ/4THfMSGvJ+axl/ptuSiBddbZgP4PqFpHIY4PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761029565; c=relaxed/simple;
	bh=kEveI288R5aLgEy1LfWmXLzg1vJMJmJhDW/u+SLA3ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0We3WHs/T8x44wN3TvWV1GUXKs2FOsuNhtKqweQrtYTXX8Ee+QPyL1D85Ho+UXmbP82tIJQytqSg8h+sUl5hc1nU0go7gNnHZRCzgDCXzeI0mRO4m1IfufzJUHNhe6qC9AxRgIR0LDI+r4NPg5odeX1G+0NQFXHi+KtEFDBaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufgJENoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufgJENoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119D9C4CEF5;
	Tue, 21 Oct 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761029564;
	bh=kEveI288R5aLgEy1LfWmXLzg1vJMJmJhDW/u+SLA3ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufgJENoWaQrbt1LbWl7US2kpvPAXm6hP4SYC0sBEkppguWvqx4odoeREOZ1hzvcGH
	 T9puAiLpk8ER0bHDe+9wfqX+bS1+J00ibNQc5Q34vqQUr2Z/VbZaiNtXT5b7nPfxE9
	 x3thfr7qGTtlUbZ/qk+m0cjtv6PT/V+URbn6Ar+0wMPpOtKABk2ZHCO4ISJUlIxFIl
	 sBujnreUL9haT+U2tsiifPloDnhX93Helsh60Bhwd484BroWUlphn78V/HSabn7DSR
	 nEpicEoTQiKy2nsGxdymT+5neEkdjAHbVQW6Df7K3aQe7y0lwCaNsBw10mJ7voRV9f
	 al5JbcNESGw/g==
Date: Tue, 21 Oct 2025 08:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
	dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251021-mighty-artichoke-crayfish-dc85b7@kuoka>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>

On Thu, Oct 16, 2025 at 10:07:26AM +0800, Liu Ying wrote:
> On 10/15/2025, Rob Herring wrote:
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx95-dc-domainblend
> >> +
> >> +  reg:
> >> +    maxItems: 1
> > 
> > No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.

So they should be here. Just like all other resources, because bindings
should be complete (see writing-bindings doc).

Best regards,
Krzysztof

