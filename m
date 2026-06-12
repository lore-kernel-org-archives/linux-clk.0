Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA38390219;
	Fri, 12 Jun 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261035; cv=none; b=gFscue5z28QBLs6FyP874CJdXLmyUHRx6hPhTH8L3BtO3c/yM/iukYPVIL7qJyqMbSJ+kxvHht/fm741CSb65NQSodAc/YRwjmpmuC9UbvU7Qfd+2JgS3JbzH0xCJ6dFkovfLXbiLdAu8YTXeLvAO1+zRkKGnGC5qvFy/N3K8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261035; c=relaxed/simple;
	bh=F5dcDiD4LJuUQlgCPut/E2WG8SDpGWV9olfhiUg5X7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUPlLI3PA0TVZuLq8dOY/fG0ojxjonr0iF9S2krQ5cBVvP59HXfrUvJNadRnrR/O1ID6fFHKgfPj+NPb1/CIxfKVrvcX9jyexSK9tukgolTJI5Bo8YXbTsyjU9O/vD3PwSOLyjEtbI+3H6l2fLw89PdwARd3qUIKnomc8oyOXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UjpMHCvQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UjpMHCvQ"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3749A497;
	Fri, 12 Jun 2026 12:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781260998;
	bh=F5dcDiD4LJuUQlgCPut/E2WG8SDpGWV9olfhiUg5X7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UjpMHCvQ+jzTq1gAsaDygtz+EnTPnHOVkExle/ostJ+/2d0aMvVKqwh10WBcXYRDd
	 mTh38ELH3SJ5Rt3+6mm2fejvDLonRSjWHJiqdyPCOuEAjYEPPU4WZXRIVVoddwtsWH
	 MJcWFBrwmGinqpe+t/9j+gSB2jzTpBz7g2Z/3UHo=
Message-ID: <81f89aa1-84d8-44e1-813b-2bbcafe3687e@ideasonboard.com>
Date: Fri, 12 Jun 2026 13:43:44 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Conor Dooley <conor@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
 <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
 <20260515-fraying-trickle-7511a2eeaf44@spud>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260515-fraying-trickle-7511a2eeaf44@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/05/2026 20:32, Conor Dooley wrote:
> On Fri, May 15, 2026 at 10:56:15AM +0300, Tomi Valkeinen wrote:
>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> The Renesas DSC Display Stream Compression is a bridge embedded in the
>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
>> 8k or 400 Mpixel/s .
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> [tomi.valkeinen: fix the example]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
>> new file mode 100644
>> index 000000000000..2918d592732b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> 
> Filename matching the compatible please.

All the other Documentation/devicetree/bindings/display/bridge/renesas,* 
files follow the same style, where the file name is in a generic format, 
but the actual compat strings are per SoC (and no generic compat string).

So is the fix here to just add "renesas,dsc" compat string (and perhaps 
later fix the other binding files too)? I'd rather not name this file 
"renesas,r8a779g0-dsc.yaml".

> 
> pw-bot: changes-requested
> 
>> @@ -0,0 +1,96 @@
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
>> +    const: renesas,r8a779g0-dsc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: R-Car DU input port
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: R-Car DSI output port
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - interrupts
>> +  - power-domains
>> +  - resets
>> +  - ports
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/r8a779g0-sysc.h>
>> +
>> +    dsc@feb8d000 {
> 
> Speaking of fixing the example, should this not be "decoder" or
> "bridge"?

Indeed, bridge or encoder. Both seem to be used in the existing bindings.

  Tomi

> Not a big deal though.
> With the changed filename
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> 
> Cheers,
> Conor.
> 
>> +        compatible = "renesas,r8a779g0-dsc";
>> +        reg = <0xfeb8d000 0x400>;
>> +        interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
>> +        clocks = <&cpg CPG_MOD 2819>;
>> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
>> +        resets = <&cpg 2819>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dsc_in_dsi1: endpoint {
>> +                    remote-endpoint = <&du_out_dsi1>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dsc_out_dsi1: endpoint {
>> +                    remote-endpoint = <&dsi1_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.43.0
>>

