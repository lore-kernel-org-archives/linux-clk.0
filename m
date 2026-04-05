Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456DC70818;
	Sun,  5 Apr 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775373445; cv=none; b=He1pC+rm+lD9eq46WvqwwNehK9sDsKxdyyEgFMwXnG90tCvkYDvM1XaH6s7vng/sXE8LnZnITEiWwkVsXnfaiU1AEb8WLvDUrC48RNXE/G5INuen7hgMhln0PDSVJ6omZJkD0TsFDK43UhFvNfKaktWjP/jCTaoozumN504uykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775373445; c=relaxed/simple;
	bh=wWVjiZ46vIhCchV+sjr+BuLIv1/1R6Hepr051NIy+LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAReN61xBo1gzRMIwJeXizcXeJrWvL8qOwCKz/HKjTy3WXy06TdwHUhB6ObMqALXYX3C7EkU5HVJj/1m9GnJK4CWqVsRrm09oGqew4ts/AE7So1Mct+QY6/zcOeKQCR7caTGdycd6nLG/h5UPnG1Naunxol0XgcUr0gCy0KzsYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux1v6AYP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux1v6AYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1C3C116C6;
	Sun,  5 Apr 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373444;
	bh=wWVjiZ46vIhCchV+sjr+BuLIv1/1R6Hepr051NIy+LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux1v6AYPau6DTdBRtCesO1g7LN5uT0pm54bF0gEmbysruFmliBle6DUIYvfCA4EKh
	 Mmq5+ZHN3Ob/pKWuezskeTkEm3ELJl9XCBZDG+vgfzGkA9m0WWjbL1Vdbr+N+t9SpF
	 ma0cezgRY3tS3+lyA3JOQQbiIGmlFLspD3MykchTJCEqmAWwvB2M6fPiuZqcWP0QWg
	 6rqBBgqGfxycTXyGDDJvNG2ZnjuyAbPvsCQEyNxA9kzPOA5RQAfT1xKcGrn6HKQWln
	 WctQTy+ElbY0hJ/TiDqtJii7U6pHbttVIXOHhip+/J+xTWN/eNXLBsKNC8ciU3vtTU
	 iXg7EigH4jvbA==
Date: Sun, 5 Apr 2026 09:17:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Message-ID: <20260405-nocturnal-mighty-pegasus-eff399@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-2-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-2-changhuang.liang@starfivetech.com>

On Thu, Apr 02, 2026 at 10:49:33PM -0700, Changhuang Liang wrote:
> Add documentation to describe StarFive JHB100 SoC System Controller
> Registers.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> new file mode 100644
> index 000000000000..c0e1f6f68fa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 SoC system controller
> +
> +maintainers:
> +  - Kevin Xie <kevin.xie@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive JHB100 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as PLL and PCIe.

How a MMIO based device can provide a MMIO information? What exactly
does it provide? Register where the value is the offset of other
register?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jhb100-pcierp-syscon
> +              - starfive,jhb100-per0-syscon
> +              - starfive,jhb100-per1-syscon
> +              - starfive,jhb100-sys0-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jhb100-b2h-syscon
> +              - starfive,jhb100-gpu-syscon
> +              - starfive,jhb100-h2b-syscon
> +              - starfive,jhb100-host-syscon
> +              - starfive,jhb100-husb-syscon
> +              - starfive,jhb100-husbcmn-syscon
> +              - starfive,jhb100-husbd-syscon
> +              - starfive,jhb100-npu-syscon
> +              - starfive,jhb100-pcieep-ecsr-syscon
> +              - starfive,jhb100-pcierp-ecsr-syscon
> +              - starfive,jhb100-per2-syscon
> +              - starfive,jhb100-per3-syscon

Hm? per2 as starfive,jhb100-per2crg is a separate device, so how can it
be also a syscon?

> +              - starfive,jhb100-strap-syscon
> +              - starfive,jhb100-sys1-syscon
> +              - starfive,jhb100-sys2-syscon
> +              - starfive,jhb100-usb-syscon
> +              - starfive,jhb100-vout-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jhb100-pll.yaml#
> +    type: object

Why are you mixing MMIO and non-MMIO devices here/

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jhb100-per0-syscon
> +              - starfive,jhb100-per1-syscon
> +              - starfive,jhb100-sys0-syscon
> +    then:
> +      required:
> +        - clock-controller
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jhb100-sys0-syscon
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +      patternProperties:
> +        "^chipid@[0-9a-f]+$":
> +          $ref: /schemas/hwinfo/starfive,jhb100-socinfo.yaml#
> +          type: object
> +
> +

Just one blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jhb100-pcierp-syscon
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +      patternProperties:
> +        "^reset-controller@[0-9a-f]+$":
> +          $ref: /schemas/reset/starfive,jhb100-reset-pcierp.yaml#

There is no such file so nothing here is testable or even possible to
apply.

Following my first question, I don't understand why this is even a
child.

Anyway, properties must be defined in top-level.

Best regards,
Krzysztof

