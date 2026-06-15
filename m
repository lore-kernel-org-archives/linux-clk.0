Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC5371D02;
	Mon, 15 Jun 2026 11:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521578; cv=none; b=BVz+CLgytrEwxm4auEhcDHXs0bEmcl+PEqZ91MGDUO0dDgBR1gnbyCn5LUG+P2Rv1c8O25DmPGmeN8pVinA6aUEigcDtmfvLvqsHhO2eJTUSI99vF0LHsba4AWL3Jxvqk3MNmjNIXznBpU3/7UvrPqIcV7X5aiJv8bzgKC12jgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521578; c=relaxed/simple;
	bh=ZKByL8sIB9khjZZ1TUk0OL6t+PRiVXvN+5s/ImffJBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAwxVAg3YKM1NV7qpHA+dQsbF6pMV/vQQFlhBrVaUdU4jxfjzwU3BWm/bS4OINwCBRWlRdETlkNwIi4IYmND1Bxq4i4dcc5wmCGo2jS894EQz8WPMh3sivv796zQB1cp5qrdkuDgGjqi/jciClzatCXANAF6NxUzVgt+RlYves0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FthRFMEl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FthRFMEl"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B80A119DC;
	Mon, 15 Jun 2026 13:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781521540;
	bh=ZKByL8sIB9khjZZ1TUk0OL6t+PRiVXvN+5s/ImffJBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FthRFMElHZZvDVqh9YrWQfdOKxPN0jbC5Ad1wKd/HyHknKZGFaY2xX065HhvIshJG
	 3QrnGmwXybKHKzN1LdB9JTRVuAcKI4rqSqAojMUkE1DGHzhe5qbCwWYtXTMOpQiIPO
	 Q0RgNvA+8m0+T5g2k/X9jYGppdtNbG+gE+5rAlTQ=
Message-ID: <27ff2472-5e71-4af1-98fd-7b8142ad14c5@ideasonboard.com>
Date: Mon, 15 Jun 2026 14:06:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
 <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
 <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <CAMuHMdVxwvDmRqsdbA_ReCnnaDWbzzTKGCXw-64U-bSJfgiy7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

On 15/06/2026 12:24, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Mon, 15 Jun 2026 at 08:28, Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> The Renesas DSC Display Stream Compression is a bridge embedded in the
>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
>> 8k or 400 Mpixel/s .
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> [tomi.valkeinen: fix the example]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for the update!
> 
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Renesas R-Car DSC Display Stream Compression
>> +
>> +maintainers:
>> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
>> +
>> +description: |
>> +  This binding describes the VESA DSC Display Stream Compression encoder
>> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
>> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - renesas,r8a779g0-dsc
>> +      - const: renesas,rcar-dsc
> 
> Please do not introduce new "renesas,rcar" fallback compatible values,
> unless you are adding new support for a hardware block that is present
> in SoCs belonging to multiple (nowadays I would say at least three)
> R-Car generations.  The DSC is only found in R-Car Gen4 SoCs, so
> "renesas,rcar-gen4-dsc" sounds more appropriate.

Ok.

> However, so far R-Car V4H is the only R-Car Gen4 SoC that has a DSC.

Right. Even "renesas,rcar-gen4-dsc" feels a bit too wide.

None of the other rcar du related bindings define fallback compatibles. 
So maybe we can just keep "renesas,r8a779g0-dsc" and name the file 
"renesas,r8a779g0-dsc.yaml" (which was the review comment I'm trying to 
resolve with this change).

> Even the very similar R-Car V4M does not seem to have it.
> R-Car X5H has DSC-functionality integrated in its DisplayPort TX
> controller, so that seems to be a different implementation?
I'm not that familiar with DSC functionality, but my understanding is 
that it's not DSI or DP specific, it just outputs packed parallel video. 
I couldn't find details about X5H's DSC, it could even be the same block 
(or not).

  Tomi

