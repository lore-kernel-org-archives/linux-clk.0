Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4CC3644A3;
	Thu, 11 Jun 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781163627; cv=none; b=VtmvD0oN62pgAvEDLwIJHymofhyXPbFrfWDTXiODM7nra6gklw3o1QayF5ZBBHqrHewmU8Qc0oRpJbkGOmvrQ6KDK7MYvzJThLt6teJkIVpfH+r8hVQuKFhsV0g27Am93UphtjFT9LPTMonL1L9v6zD7U5moKcNbU09DL4uCe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781163627; c=relaxed/simple;
	bh=PgEzUnA04DEO3gqxBHObPbISQG8xWThEFhuGgAxGFKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d++oquunsF3rEyz7dwr/fzmEYwx7MFiP0CElLoi573noh6STAnbusYc22WBg/pfr16Q7N50aRde1LwFj6s3rm3NN8xqqgadE95wGJjfOOAPRNhqR3ENdprmG3ijrOUgwgeBdOnCZg/N3zvJzUTqnPdAdiNrlDcvunwb/Eae3Qfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf5jT1qW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf5jT1qW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA871F00893;
	Thu, 11 Jun 2026 07:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163625;
	bh=UdnqG6HuOV9OtKkF5ww4O5HMNFK+JDqxC6oYIJO1qR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pf5jT1qWShYnBKo7WlrpSjwNa0q6F3mWdYLMT30kYYaP72XCVK29bzLIBBySlxlql
	 8ItQlvep2nIykpVJryzcBXZyb51YPXOc5ITEKeB1BELHHKURLmSH7t0Vx+72QocsVj
	 D3mXwcAzH5Ojx06ZePiiIyM9H03JCnjo1ZQAPvun2sE76dP+p4u2oeE8QmaDwRZWU9
	 6/x0hyxH6iXyFkiPOqMkRlpxw2tKZIAZE8gVriYNm7jo84x6oIX+5hqRuebk1GmeoU
	 0sQMycH516IoEmHKtykK4CX+WR412dUwuV4k/u/5Ih+UCG69gl2WL6wk/JdL++x8WI
	 QJuuu7EW82qmw==
Date: Thu, 11 Jun 2026 09:40:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Message-ID: <20260611-gorgeous-macho-cricket-f1b78c@quoll>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-2-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610075645.3581145-2-joakim.zhang@cixtech.com>

On Wed, Jun 10, 2026 at 03:56:41PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> and control registers in a dedicated CRU block. Software reset lines are
> exposed on the syscon parent via #reset-cells, following the same model
> as the existing Sky1 FCH and S5 system control bindings.
> 
> Add the cix,sky1-audss-system-control compatible to
> cix,sky1-system-control.yaml for the MFD/syscon parent node, and define
> AUDSS software reset indices in
> include/dt-bindings/reset/cix,sky1-audss-system-control.h for I2S, HDA,
> DMAC, mailbox, watchdog and timer blocks.

All this is pretty pointless - you explained the binding, which answers
nothing why you did it that way. Instead you must explain the hardware
design.

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      | 52 +++++++++++++++++--
>  .../reset/cix,sky1-audss-system-control.h     | 25 +++++++++
>  2 files changed, 72 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> index a01a515222c6..61d26a69fd44 100644
> --- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> @@ -15,11 +15,16 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - cix,sky1-system-control
> -          - cix,sky1-s5-system-control
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - cix,sky1-system-control
> +              - cix,sky1-s5-system-control
> +          - const: syscon
> +      - items:
> +          - const: cix,sky1-audss-system-control
> +          - const: simple-mfd

Just so you are aware - this means children do not depend on the parent
for operation. You will not be able to fix it later, if it turns out
that children do depend...

> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -27,6 +32,28 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  clock-controller:
> +    type: object
> +    properties:
> +      compatible:
> +        const: cix,sky1-audss-clock
> +    required:
> +      - compatible
> +    additionalProperties: true
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-audss-system-control
> +    then:
> +      required:
> +        - clock-controller
> +    else:
> +      properties:
> +        clock-controller: false
> +
>  required:
>    - compatible
>    - reg
> @@ -40,3 +67,18 @@ examples:
>        reg = <0x4160000 0x100>;
>        #reset-cells = <1>;
>      };
> +  - |
> +    audss_syscon: system-controller@7110000 {
> +        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
> +        reg = <0x7110000 0x10000>;
> +        #reset-cells = <1>;
> +
> +        clock-controller {
> +            compatible = "cix,sky1-audss-clock";
> +            power-domains = <&smc_devpd 0>;

My questions from v2 from the other patch are still valid - why audss
system clock controller is outside of the power domain? Why the audss
reset is outside, but audss clock not?

This does not feel like correct hardware representation.

Best regards,
Krzysztof

