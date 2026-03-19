Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9E3A9DA4;
	Thu, 19 Mar 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908745; cv=none; b=ONQ16BIqWLCTB6KqBiLoyFyzHxA5lQZkS7/lc9p4clJV24g+InRq4jvPnMCwIfVLpU7gkCmSjpqOn6Bb9JvZqIiQs2jLcWQnq6IlBdzSmoRm1WqZqTl+MnnVOiRG9wmiOwzXeNw2ORra0yvtOqxOVxh0ZzGbsL6qzhrdSKsR8TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908745; c=relaxed/simple;
	bh=z+TpFp6nPNBq4Ax+izUKlEte0F/VUwfkflI1noqu3+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCozJSteoKKx0EL8RfQ+06b4HukDwjTonUKnnYCxsdYsxfOMv1zyYEs/X15YKof1xvj3AOwiJZQsSbvSgL8mV6W8FhZME+/ZRUjCQVgMhxYiexS0RJ2R62kagJqN9Qtk2uVUiLk6QfQICFn34+hgj7A2/4Ju9kQpAMgkTw3qcvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSw7W9ZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSw7W9ZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D94C2BCB0;
	Thu, 19 Mar 2026 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773908745;
	bh=z+TpFp6nPNBq4Ax+izUKlEte0F/VUwfkflI1noqu3+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSw7W9ZBGkxkV7OtU+THE13NqQf5fze8xwAoHQspODcTz/JbBnflomepscOdBBEAq
	 ZPzpOtThiDvc33MyTv3TH7n+GqhQeArEwl5WPNVkbrI0OowDo88HENlGfSOTGKWh+T
	 rehUeFXWH/A9YCVy9hdGfe+s0di9ku2drQY6bILA04lYDumaQMQCuM9vdziSWOSLWM
	 Bos+qKhUB/LlAieN8oAKgBd9JS3ih1Nb7jRmEPoalnZ4lJ16yDHYroCsf9k3KDZaAU
	 hqsFsOCa4IusOFBZ61B5QrY5Vyj/RLDH2B9Sr/vmfO6mDQIA1Be62FR1bB6j4nlU5Z
	 tSDYeHxUDnrQQ==
Date: Thu, 19 Mar 2026 09:25:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, mturquette@baylibre.com, sboyd@kernel.org, 
	ardb@kernel.org, martin.petersen@oracle.com, ebiggers@google.com, tytso@mit.edu, 
	cristian.birsan@microchip.com, adrian.hunter@intel.com, jarkko.nikula@linux.intel.com, 
	kees@kernel.org, npitre@baylibre.com, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip
 SAMA7D65 compatible
Message-ID: <20260319-witty-gopher-of-teaching-b8c00e@quoll>
References: <20260318055230.307030-1-manikandan.m@microchip.com>
 <20260318055230.307030-2-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318055230.307030-2-manikandan.m@microchip.com>

On Wed, Mar 18, 2026 at 11:22:26AM +0530, Manikandan Muralidharan wrote:
> Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
> HCI binding. The Microchip SAMA7D65 I3C controller is based on the
> MIPI HCI specification but requires two clocks, so add a conditional
> constraint when this compatible is present.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> Changes in v4:
> - Define and describe the clock in the top-level properties
> ---
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> index 39bb1a1784c9..a946a8920046 100644
> --- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> +++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
> @@ -9,9 +9,6 @@ title: MIPI I3C HCI
>  maintainers:
>    - Nicolas Pitre <npitre@baylibre.com>
>  
> -allOf:
> -  - $ref: /schemas/i3c/i3c.yaml#
> -
>  description: |
>    MIPI I3C Host Controller Interface
>  
> @@ -28,7 +25,13 @@ description: |
>  
>  properties:
>    compatible:
> -    const: mipi-i3c-hci
> +    enum:
> +      - mipi-i3c-hci
> +      - microchip,sama7d65-i3c-hci
> +  clocks:
> +    items:
> +      - description: Peripheral bus clock
> +      - description: System Generic clock

Missing blank lines. Also, clocks go after reg.


>    reg:
>      maxItems: 1
>    interrupts:
> @@ -39,6 +42,21 @@ required:
>    - reg
>    - interrupts
>  
> +allOf:
> +  - $ref: /schemas/i3c/i3c.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sama7d65-i3c-hci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

Drop, pointless. You already said in top-level they are exactly two
items.

> +      required:
> +        - clocks

else - clocks: false. See example schema. Or explain in the commit msg
why existing compatible gets clocks now.

Best regards,
Krzysztof

