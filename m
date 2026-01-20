Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818042C08B1;
	Tue, 20 Jan 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925755; cv=none; b=BGEdzm89F6OeEL5a/Ztv5NnDVZ6wH2NwAisyfyDg1KfpC4osIswDGf5vG7LrMhYj3Qr/hH8DmNTEYZSAafP7RZK0tcYD6H0Ki0WoFtxv1Adc+Tw+/IVKCbdX3iebUXAw5/sa/78CuG9J/g/eyX6n4bFt+BDhmOfKtBOdy8yOx48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925755; c=relaxed/simple;
	bh=383Gd5xSOQdRj2F70N3Tm/kMAxT4zUbvqXJ7vom+1d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YffbQJYAW5O8sI88PDM7RGEui2uYj6ecmpPi0w+sSy8QcP+kkpiGcfbSFMvJcXORT+V5VgWLM+Vu3/s2i6ZOcs4LPiNIYtDxgW4kfnZICNxVN+Ljx1erNZ5dKqMzNqKt0G3u12dG+O6N4LlSljnDCahhOL12UuJTEwBTEJlF4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOWJOzyI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOWJOzyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755E4C16AAE;
	Tue, 20 Jan 2026 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925755;
	bh=383Gd5xSOQdRj2F70N3Tm/kMAxT4zUbvqXJ7vom+1d4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOWJOzyI9gAoJFJKFsc/BwlWyYKnrphjLsVS1cpcWlefmW7qbdnCuO6SO/lI7Cy3q
	 4WvUZKAoUJ1FLPrKdF3TsSYzh8LC9z1HwNeKgeYUjD93AW80CuQvOnxeFh3L3rh3AX
	 mdobH11Y44mAQo6R6jpFCpSn3rp0AhVGHhx9kWHribV3GCZ+qrJmFsltEBR/WvYNYi
	 7c1PThzqFl23UouMxk+RoI+LOge+nopRARQUjmcjuX8/ryjg7BiP5dwKR4n80lLGAo
	 ed2wEssQ2ARJphkcH2itZ7D/tByYKg2bGLaxD3/q8lzV8j/6eDbO1X7a3yDh1VVMOu
	 0L0C8DPT+7DUg==
Message-ID: <9d950686-6a40-44eb-95d4-4b20ed48e601@kernel.org>
Date: Tue, 20 Jan 2026 17:15:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: sprd: Add SC9832E clock
 controller
To: Nadi Ke <kanadenady@gmail.com>, sboyd@kernel.org,
 mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
 zhang.lyra@gmail.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260120144436.233998-1-kanadenady@gmail.com>
 <20260120144436.233998-2-kanadenady@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260120144436.233998-2-kanadenady@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2026 15:44, Nadi Ke wrote:
> +maintainers:
> +  - Orson Zhai <orsonzhai@gmail.com>
> +  - Baolin Wang <baolin.wang7@gmail.com>
> +  - Chunyan Zhang <zhang.lyra@gmail.com>
> +  - Nadi Ke <kanadenady@gmail.com>
> +
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  compatible:

Compatible is always first.

> +    enum:
> +      - sprd,sc9832e-ap-clk
> +      - sprd,sc9832e-aon-clk
> +      - sprd,sc9832e-apahb-gate
> +      - sprd,sc9832e-pmu-gate
> +      - sprd,sc9832e-aonapb-gate
> +      - sprd,sc9832e-apapb-gate
> +      - sprd,sc9832e-pll
> +      - sprd,sc9832e-mpll
> +      - sprd,sc9832e-dpll
> +      - sprd,sc9832e-rpll
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      The input parent clock(s) phandle for this clock, only list fixed
> +      clocks which are declared in devicetree.
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#clock-cells'

Why reg is not always required?

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc9832e-ap-clk
> +    then:
> +      required:
> +        - reg
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: ext-26m
> +            - const: ext-1m
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc9832e-pmu-gate
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1

Drop

> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: ext-26m

And the rest? 3-4 clocks? All other devices?

This binding is really poor and messy. Please write constrained binding.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sprd,sc9832e-aon-clk
> +    then:
> +      required:
> +        - reg
> +
> +description: |

Completely messed placement.

> +  Unisoc SC9832E Clock Control Unit.
> +  Other SC9832E clock nodes should be the child of a syscon node with
> +  compatible: "sprd,sc9832e-glbregs", "syscon", "simple-mfd".

Not relevant. Other schema should define that.

> +  The 'reg' property is also required if there is a sub-range of registers.
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* AP Clock Controller */
> +    ap_clk: clock-controller@21500000 {
> +      compatible = "sprd,sc9832e-ap-clk";
> +      reg = <0x21500000 0x1000>;
> +      clocks = <&ext_26m>, <&ext_1m>;
> +      clock-names = "ext-26m", "ext-1m";
> +      #clock-cells = <1>;
> +    };
> +
> +  - |
> +    /* PMU Gate Controller inside Syscon */
> +    syscon@402b0000 {

Drop entire node, not relevant here.

> +      compatible = "sprd,sc9832e-glbregs", "syscon", "simple-mfd";
> +      reg = <0x402b0000 0x4000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges = <0 0x402b0000 0x4000>;
> +
> +      pmu_gate: pmu-gate@0 {
> +        compatible = "sprd,sc9832e-pmu-gate";
> +        reg = <0x0 0x1000>;
> +        clocks = <&ext_26m>;
> +        clock-names = "ext-26m";
> +        #clock-cells = <1>;
> +      };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/sprd,sc9832e-clk.h b/include/dt-bindings/clock/sprd,sc9832e-clk.h
> new file mode 100644
> index 000000000..6eff6a82b
> --- /dev/null
> +++ b/include/dt-bindings/clock/sprd,sc9832e-clk.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Unisoc SC9832E platform clocks
> + *
> + * Copyright (C) 2015 Spreadtrum, Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_SC9832E_H_
> +#define _DT_BINDINGS_CLK_SC9832E_H_
> +
> +#define CLK_ISPPLL_GATE		0
> +#define CLK_MPLL_GATE		1
> +#define CLK_DPLL_GATE		2
> +#define CLK_LPLL_GATE		3
> +#define CLK_GPLL_GATE		4
> +#define CLK_PMU_GATE_NUM	(CLK_GPLL_GATE + 1)

Drop, not ABI.

> +
> +#define CLK_TWPLL		0
> +#define CLK_TWPLL_768M		1
> +#define CLK_TWPLL_384M		2
> +#define CLK_TWPLL_192M		3
> +#define CLK_TWPLL_96M		4
> +#define CLK_TWPLL_48M		5
> +#define CLK_TWPLL_24M		6
> +#define CLK_TWPLL_12M		7
> +#define CLK_TWPLL_512M		8
> +#define CLK_TWPLL_256M		9
> +#define CLK_TWPLL_128M		10
> +#define CLK_TWPLL_64M		11
> +#define CLK_TWPLL_307M2		12
> +#define CLK_TWPLL_219M4		13
> +#define CLK_TWPLL_170M6		14
> +#define CLK_TWPLL_153M6		15
> +#define CLK_TWPLL_76M8		16
> +#define CLK_TWPLL_51M2		17
> +#define CLK_TWPLL_38M4		18
> +#define CLK_TWPLL_19M2		19
> +#define CLK_LPLL		20
> +#define CLK_LPLL_409M6		21
> +#define CLK_LPLL_245M76		22
> +#define CLK_GPLL		23
> +#define CLK_ISPPLL		24
> +#define CLK_ISPPLL_468M		25
> +#define CLK_PLL_NUM		(CLK_ISPPLL_468M + 1)

Same here and everywhere else.


Best regards,
Krzysztof
