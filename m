Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A62B2066E5;
	Fri, 10 Jan 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524446; cv=none; b=MxT1XFLZc2NOxO0xAuoCRyxzQDX0Kz1vGdSYkNVkDwMym1n5bEACXGVQHsr/uWmUY/ycztO6spD5ZBvlCzlzojkneTuyZ9CU8JUmLlRygEcBkrGOETAQMukJVuIy0NBHbfkVYTA8ZwPma7Ws8BwxqargY9P+o1PX4BjYhShbxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524446; c=relaxed/simple;
	bh=KtZ4c7jWTzK/1RwsYWEQ3b4sPV8HEvuExiQjmVNRQaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh6Gdg4VmGgaY37q/4BFnwAE24sHZkRr+LFlak7841VfDUBqr7+BbkZEs5LL2wDnZpOXCxfNuqi8vWpvUH8Cg1rkokLOKg0D4HyaEqeVlBmeybrracgoI8Jocf8nMOpDc7h0TsXrB3cMB4l9Xnw2DdjKjY7OXfTOcKXkIctS2YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqo2nWRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqo2nWRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3500C4CED6;
	Fri, 10 Jan 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524445;
	bh=KtZ4c7jWTzK/1RwsYWEQ3b4sPV8HEvuExiQjmVNRQaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqo2nWRtkTXHYUIcAvGXBfFz9lRjc90pKSWJa3X5Rt1ujIb/Zfnhbs3zoTHzUnZKS
	 reXKrHisV3jT85sYHUYGWu2GG2+M3aKs8lyIE0WUXx3dwmlBJtEanCJzsQ6oqekaCq
	 2NYie+vO8run7Cf1nlJJsbiQsrip82LufKuN+HshH3W0GpZUAfOn5yvWT8NTov4Xez
	 BX81epoL9777exAxcqECpJnGfTixE4bc4vv3AIdQoF4BNqfyPCDcJi10VzyzCL1tVA
	 7zysNjo68cGIj9mxNi9/FLuUFdGFjJNFZ+GdPv/qtXylav7Ugpae9E899Nm3XG6TDx
	 W/f9aIUS8o5ow==
Date: Fri, 10 Jan 2025 09:54:04 -0600
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
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
Message-ID: <20250110155404.GA2928945-robh@kernel.org>
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
 <20250108094025.2664201-2-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108094025.2664201-2-jian.hu@amlogic.com>

On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> new file mode 100644
> index 000000000000..fd0323678d37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
> @@ -0,0 +1,103 @@
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
> +if:

Move this after 'required' section.

Generally we put 'if' under 'allOf' because we're likely to have another 
if/then schema on the next compatible added. If you don't think this 
binding will ever get used on another chip, then it is fine as-is.

> +  properties:
> +    compatible:
> +      contains:
> +        const: amlogic,t7-pll-mclk
> +
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: mclk pll input oscillator gate
> +        - description: 24M oscillator input clock source for mclk_sel_0
> +        - description: fix 50Mhz input clock source for mclk_sel_0
> +
> +    clock-names:
> +      items:
> +        - const: input
> +        - const: mclk_in0
> +        - const: mclk_in1

Move these to top-level and then both of these are just 'minItems: 3'.

> +
> +else:
> +  properties:
> +    clocks:
> +      items:
> +        - description: pll input oscillator gate
> +
> +    clock-names:
> +      items:
> +        - const: input

And 'maxItems: 1' here.

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

These are the 'top-level' definitions if that's not clear.

> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@8080 {
> +            compatible = "amlogic,t7-pll-gp0";
> +            reg = <0 0x8080 0 0x20>;
> +            clocks = <&scmi_clk 2>;
> +            clock-names = "input";
> +            #clock-cells = <1>;
> +        };
> +
> +        clock-controller@8300 {
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
