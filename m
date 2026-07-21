Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5D37268F;
	Tue, 21 Jul 2026 13:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641668; cv=none; b=PXV8l0++oTIF5KDcgo5lck2NyREGLIM/hXx+Rnd3hOwBmSsTuBa+2ch5KMtp/HOGJMchLECZr/jbUFmYU+cMt0tAuLUStJuxTWuOGdvZgEl+zMZnpIdUqLd46uPn9YmNHXyJdmDPLOJzYZBaf6wRnWqjEjLaFmeO2NMS2/6g0T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641668; c=relaxed/simple;
	bh=vMbWJVznoe6uZpU43wj2TirPlLRYOx0D28LBSbpbEyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVpE0cSllXhJgAysi1+WFDkahf0hYHCg24v3M2IJOm0F9ui1y3r0goSR86Au9qGJLz5RaQV7L66+a1LqbwsKq8PzGd6UBP/TgVwDcuBAWkOl222dMV/ff64TFAWsfQPmV6FROlr4l8ybVpmarSaEJnPsPc5EoYkijjg9RrC9zrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTOSxOXG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTOSxOXG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41121F000E9;
	Tue, 21 Jul 2026 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641666;
	bh=awtcumx2hZ91mIrvxY6WxUWD+fwAIYe36IoQhSo0aOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTOSxOXGdkgAqhutec7VIdAZjafZkEqwjQqcQ0gfok/K0MaxyGdsLvfdOcuebbyK9
	 wfCTZi9acda5OE+huyyF0Q4skJ2mDk9a5i5zgkRxCSU6IQP5jH61EPdAdsrGEY0Ugm
	 wwti5M7wdkN8BQZ1Rwt5vhmIOGanFH7BU1ebr2z/E8fGh6d24r9Wy7Suxht/YX9Fkl
	 zoHlaK4hsN+TPVyVpjw/6dFne4Bf4PzU+rHP44exNw+lp8hhIOyxMOhn627uEHCIFi
	 EwkF9hRzlmxpzOm1cB48NnAExZ1TmfFOuEpLjVnIwoHX4OfD9efxw9eFWzWS8fwAd+
	 jUteJ6lloJGVg==
Date: Tue, 21 Jul 2026 08:47:46 -0500
From: Rob Herring <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, goledhruva@gmail.com,
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
Subject: Re: [PATCH] dt-bindings: clock: ti,dm816-fapll-clock: Convert to DT
 schema
Message-ID: <20260721134746.GA3401192-robh@kernel.org>
References: <20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-ti-fapll-clock-v1-1-1b684cb2543b@gmail.com>

On Fri, Jul 17, 2026 at 11:43:37PM +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments DM816 FAPLL clock binding from plain text
> to YAML DT schema.
> 
> The text documented #clock-cells to be set as 0, while the example and
> existing dt and driver require it to be 1. The schema now strictly
> enforces #clock-cells = <1>.
> 
> Properties clock-indices and clock-output-names are documented in the
> binding and added as required as driver strictly requires it and existing
> dt already use this property.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/clock/ti/fapll.txt         | 31 ----------
>  .../bindings/clock/ti/ti,dm816-fapll-clock.yaml    | 72 ++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 31 deletions(-)


> diff --git a/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
> new file mode 100644
> index 000000000000..9b6b824faa30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ti/ti,dm816-fapll-clock.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ti/ti,dm816-fapll-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments FAPLL clock
> +
> +maintainers:
> +  - Tony Lindgren <tony@atomide.com>
> +  - Tero Kristo <kristo@kernel.org>
> +
> +description:
> +  This binding uses the common clock binding. It assumes a register-mapped

Drop the first sentence.

> +  FAPLL with usually two selectable input clocks (reference clock and bypass
> +  clock), and one or more child synthesizers.
> +
> +properties:
> +  compatible:
> +    const: ti,dm816-fapll-clock
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: phandle for parent clock clk-ref
> +      - description: phandle for parent clock clk-bypass

Drop 'phandle for'

Rob
