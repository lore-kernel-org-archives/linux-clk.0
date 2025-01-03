Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E8C1A8F80;
	Fri,  3 Jan 2025 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735930537; cv=none; b=MYNL6yHAXZX9FsKd26W8Lz9RMpfnfWNEHxoHbElPj1pEBtqfE13iyVlXLBq9nInHlOyzUKi3HVCXZ3uzxYt8DRwEXmtIIPYVI9Ho2/ezck06TCxDi2zfc8TximfniBOBPKbjN90vTcumK/GWRhUD00A6YTBB5tUR1KVxFH9sVm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735930537; c=relaxed/simple;
	bh=XQxYutNgrITYpUa9i4dLX5UIo7Vh+etoJ94keWJktx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEZzLcv8QAM/alJj/DPjbh7WBlpOh9dFUzJ1D0e9Vm8NgDVeVcS9sZTC1TSc625VubvQ2ne/xjKfnIC6P3IkNXfF2572XWKRLqxWkcH9J8sHsG7vbqgUBF6JspIjsp+gSUxzlmhdtRyYC6+xVMnZwpsfaNPOKux70l9sh/Cfsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD2Xt62S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD2Xt62S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA394C4CED2;
	Fri,  3 Jan 2025 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735930536;
	bh=XQxYutNgrITYpUa9i4dLX5UIo7Vh+etoJ94keWJktx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FD2Xt62SwcGD/iot4UTktOgDx0pupKu3+l2s1JX8e+wyFnyFG4eKajMWrLRfnGKEy
	 SO7gh/SkLthepU5wfB2xqMDQdJwa8tyBZDN0jD8ynydKUf6qCTIAiII3ekKlUXOLU1
	 6fQU8sTIowPnBEX8zRJGclu+0TKYkJVP0eKXPSYJjYYbtC8iBztPV2dF7y8yJu5yzz
	 wTISr3FZMLFBcIO6N7M1JR4vnk9+kPhUe/D3A9uwaAGFzJ50UotZS5FVFjdb++5tAI
	 CCmPQ8EemmpyQ5T8d/mGxpRV6bcBUw5eJUGFpv6bZ/pjbEGIs1tvJBFbvD8ocUL/Y5
	 mkU+YKTSf1z0A==
Date: Fri, 3 Jan 2025 12:55:35 -0600
From: Rob Herring <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
Message-ID: <20250103185535.GA2552898-robh@kernel.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-2-jian.hu@amlogic.com>

On Tue, Dec 31, 2024 at 02:00:43PM +0800, Jian Hu wrote:
> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 115 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 +++++++++
>  2 files changed, 172 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> new file mode 100644
> index 000000000000..f90e6021d298
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic T7 PLL Clock Control Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,t7-pll-gp0
> +      - amlogic,t7-pll-gp1
> +      - amlogic,t7-pll-hifi
> +      - amlogic,t7-pll-pcie
> +      - amlogic,t7-mpll
> +      - amlogic,t7-pll-hdmi
> +      - amlogic,t7-pll-mclk
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 3
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,t7-pll-gp0
> +              - amlogic,t7-pll-gp1
> +              - amlogic,t7-pll-hifi
> +              - amlogic,t7-pll-pcie
> +              - amlogic,t7-mpll
> +              - amlogic,t7-pll-hdmi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: pll input oscillator gate
> +
> +        clock-names:
> +          items:
> +            - const: input
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,t7-pll-mclk
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: mclk pll input oscillator gate
> +            - description: 24M oscillator input clock source for mclk_sel_0
> +            - description: fix 50Mhz input clock source for mclk_sel_0
> +
> +        clock-names:
> +          items:
> +            - const: input
> +            - const: mclk_in0
> +            - const: mclk_in1

Define the names and descriptions at the top level. Then here just say 
'minItems: 3'

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        gp0:clock-controller@8080 {

Drop unused labels.

> +            compatible = "amlogic,t7-pll-gp0";
> +            reg = <0 0x8080 0 0x20>;
> +            clocks = <&scmi_clk 2>;
> +            clock-names = "input";
> +            #clock-cells = <1>;
> +        };
> +
> +        mclk:clock-controller@8300 {
> +            compatible = "amlogic,t7-pll-mclk";
> +            reg = <0 0x8300 0 0x18>;
> +            clocks = <&scmi_clk 2>,
> +                     <&xtal>,
> +                     <&scmi_clk 31>;
> +            clock-names = "input", "mclk_in0", "mclk_in1";
> +            #clock-cells = <1>;
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> new file mode 100644
> index 000000000000..e88c342028db
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Jian Hu <jian.hu@amlogic.com>
> + */
> +
> +#ifndef __T7_PLL_CLKC_H
> +#define __T7_PLL_CLKC_H
> +
> +/* GP0 */
> +#define CLKID_GP0_PLL_DCO	0
> +#define CLKID_GP0_PLL		1
> +
> +/* GP1 */
> +#define CLKID_GP1_PLL_DCO	0
> +#define CLKID_GP1_PLL		1
> +
> +/* HIFI */
> +#define CLKID_HIFI_PLL_DCO	0
> +#define CLKID_HIFI_PLL		1
> +
> +/* PCIE */
> +#define CLKID_PCIE_PLL_DCO	0
> +#define CLKID_PCIE_PLL_DCO_DIV2	1
> +#define CLKID_PCIE_PLL_OD	2
> +#define CLKID_PCIE_PLL		3
> +
> +/* MPLL */
> +#define CLKID_MPLL_PREDIV	0
> +#define CLKID_MPLL0_DIV		1
> +#define CLKID_MPLL0		2
> +#define CLKID_MPLL1_DIV		3
> +#define CLKID_MPLL1		4
> +#define CLKID_MPLL2_DIV		5
> +#define CLKID_MPLL2		6
> +#define CLKID_MPLL3_DIV		7
> +#define CLKID_MPLL3		8
> +
> +/* HDMI */
> +#define CLKID_HDMI_PLL_DCO	0
> +#define CLKID_HDMI_PLL_OD	1
> +#define CLKID_HDMI_PLL		2
> +
> +/* MCLK */
> +#define CLKID_MCLK_PLL_DCO	0
> +#define CLKID_MCLK_PRE		1
> +#define CLKID_MCLK_PLL		2
> +#define CLKID_MCLK_0_SEL	3
> +#define CLKID_MCLK_0_DIV2	4
> +#define CLKID_MCLK_0_PRE	5
> +#define CLKID_MCLK_0		6
> +#define CLKID_MCLK_1_SEL	7
> +#define CLKID_MCLK_1_DIV2	8
> +#define CLKID_MCLK_1_PRE	9
> +#define CLKID_MCLK_1		10
> +
> +#endif /* __T7_PLL_CLKC_H */
> -- 
> 2.47.1
> 
