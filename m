Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FC837D11A;
	Mon, 15 Jun 2026 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781505582; cv=none; b=V7sf4/oFnes154bSuOQjPjCJBbdlsOPUg15P6z7bxxAlrv7CBfQJbWGUmr/ekQUwS4O+K+AKw1HSr5SivxRGc8X1XzbyruOoeV6CX1MXExktY1K3J6VU/B3LjyjYHopUos+6gfEjHPeIl3DQ//345bzfGXvdZcmRwZtUTBDgrVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781505582; c=relaxed/simple;
	bh=BjVyEJazZBYrHGfeHgzgdcSZi1k4s/Uo3Cm46811Fs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDDiZLdrSGCptL0GBpT2LUWyqIgq1NtuKDRCg/pAqdFhyg22OcEiUUkZlDs51QMSet5w/cuJ6WRtecfJsMEFn7uPSJD4Iy7f/zy7kKbZgFLHiMOD3/OORbHg2xCtVwN3cZrOQbyCuWA4VPgHhMDbHeB0MggsnF4jKz3yJGNo4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p6L8WtsT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p6L8WtsT"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C855757E;
	Mon, 15 Jun 2026 08:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781505546;
	bh=BjVyEJazZBYrHGfeHgzgdcSZi1k4s/Uo3Cm46811Fs0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p6L8WtsTzbEdudkge2s9nkXKlUdAfS5OxcBPyKOxonJn+FMlS9mHO4gID0nWMoAxt
	 KBqIOHzzfvh2HBHWI1bVa5/rojFU+GR0+BqcRDOOOOllvah9vX4k0U5Sdi5r4BB0eJ
	 0IR1TdOFeeva47Pay51BfnXHFm0o/7W8c28+ErLk=
Message-ID: <7e0fc443-62a7-425b-8960-583fbad8aced@ideasonboard.com>
Date: Mon, 15 Jun 2026 09:39:34 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260615-rcar-du-dsc-v4-0-93096a1b56a3@ideasonboard.com>
 <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20260615-rcar-du-dsc-v4-2-93096a1b56a3@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2026 09:28, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s .
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: fix the example]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../bindings/display/bridge/renesas,dsc.yaml       | 99 ++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> new file mode 100644
> index 000000000000..4d2c2c6cb1f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car DSC Display Stream Compression
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +
> +description: |
> +  This binding describes the VESA DSC Display Stream Compression encoder
> +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r8a779g0-dsc
> +      - const: renesas,rcar-dsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: R-Car DU input port
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: R-Car DSI output port
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - power-domains
> +  - resets
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    bridge@feb8d000 {
> +        compatible = "renesas,r8a779g0-dsc";

I missed adding "renesas,rcar-dsc" here.

  Tomi

