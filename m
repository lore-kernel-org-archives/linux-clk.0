Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA52857FA
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712235; cv=none; b=VsaYOWfjvG710G5vcWVtp7IUM8qV9RfrsM60ASmgvmPYAvbsYdW0pRCaeL5aFa6aJKRw9+gaf6NuF/b/m9UXdvR6cBUXMCKAXf77P4o+3tJptmNINnHBCuf2+Cg0vJ+WfRwRz6I61aiL+jh6Be9iwRX6M/qAzzTo2jSGOOaz+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712235; c=relaxed/simple;
	bh=+JOidhfjGr0Iz06UJWK2SN/49d4BYeGCXuMWaKrMxOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kU09OnisaS4MX1VOMWWWv284QnJPzkTGdl12adWdA7J7/T3iHKpn3bq52kwQWGyzR9JFKn0J9gOrWK1uS6ifpp5PtIsktCnO/b+ox7ly+jtESVpVEtIqMI5/OQ2QK+oirj9+YvCkF5S8ZHQ5RMDWRxKsaPKiMqYhu4UxytGar4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=QpJi2/WX; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="QpJi2/WX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783712226;
 bh=PLRr85CNC1eO28rwGXWbZFk7lEDMqIoxiSt+2izE2og=;
 b=QpJi2/WXukm1qtMN9eb6EnVYlGdQoxwgJnmrrbsVFYGcNgq4TUn2WTpC0m2bwesGJ4TGzX1ws
 BE7dKeBXIkpwnIMfLUyEqLwugbjqihqEmuyZgGSER9MG2/1k3+1paurV5meGLzz0VhnS7WQl2mc
 qbQzS/ekh/W/X5QCCJ8Dd3f7uLMCYS9wsItgZCTqv+Kc6twL+7fCKjxwWMqmQSapDOh3PXz73/J
 J68BlRPwSZVoDJqHxoaeWlLgDieOPsPwOfQltOh4agdY1BLMWyGF0GS107DTH3iJHl3sMb+3p8e
 AyeSs6C1mVMesMXRqbXpUeum86R9TSoFYjpr0TR7WPWA==
X-Forward-Email-ID: 6a5149dcf640ad60663f0665
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2a6f03c3-32e1-4d73-857d-1301d7c39fcc@kwiboo.se>
Date: Fri, 10 Jul 2026 21:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: clock: rockchip: Add RV1106 CRU
 support
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@nabladev.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Brian Masney <bmasney@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, huang lin <hl@rock-chips.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-2-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-2-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Simon,

On 7/6/2026 9:57 PM, Simon Glass wrote:
> Add the clock binding header and schema for the Rockchip RV1106 clock
> and reset unit. The clock IDs match the numbering used by the vendor
> kernel so that existing devicetrees keep working. The header also
> covers the GRF clock controller, which provides the MMC drive and
> sample phase clocks.
> 
> The RV1103 is a package variant of the RV1106 and uses the same CRU.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  .../bindings/clock/rockchip,rv1106-cru.yaml   |  59 ++++
>  .../dt-bindings/clock/rockchip,rv1106-cru.h   | 301 ++++++++++++++++++
>  2 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1106-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
> new file mode 100644
> index 000000000000..884a4a8bb0fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1106-cru.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rv1106-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RV1106 Clock and Reset Unit
> +
> +maintainers:
> +  - Simon Glass <sjg@chromium.org>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The RV1106 clock controller generates the clock and also implements a
> +  reset controller for SoC peripherals.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rv1106-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xin24m
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing the "general register files" (GRF),
> +      if missing pll rates are not changeable, due to the missing pll
> +      lock status.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ff3b0000 {
> +      compatible = "rockchip,rv1106-cru";
> +      reg = <0xff3b0000 0x20000>;
> +      rockchip,grf = <&grf>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/rockchip,rv1106-cru.h b/include/dt-bindings/clock/rockchip,rv1106-cru.h
> new file mode 100644
> index 000000000000..acbf9c1ee6af
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rv1106-cru.h
> @@ -0,0 +1,301 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co. Ltd.
> + * Author: Elaine Zhang <zhangqing@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RV1106_H
> +
> +/* pll clocks */
> +#define PLL_APLL		1

Clock indices should start at 0 and be a continuous enumeration.

> +#define PLL_DPLL		2
> +#define PLL_CPLL		3
> +#define PLL_GPLL		4
> +#define ARMCLK			5
> +
> +/* clk (clocks) */
> +#define PCLK_DDRPHY		11

As mentioned above, indices should be a continuous enumeration.

> +#define PCLK_DDR_ROOT		12
> +#define PCLK_DDRMON		13
> +#define CLK_TIMER_DDRMON	14
> +#define PCLK_DDRC		15
> +#define PCLK_DFICTRL		16
> +#define ACLK_DDR_ROOT		17
> +#define ACLK_SYS_SHRM		18
> +#define HCLK_NPU_ROOT		19

[snip]

> +/* mmc phase clocks provided by the grf-cru */
> +#define SCLK_EMMC_DRV		1
> +#define SCLK_EMMC_SAMPLE	2
> +#define SCLK_SDMMC_DRV		3
> +#define SCLK_SDMMC_SAMPLE	4
> +#define SCLK_SDIO_DRV		5
> +#define SCLK_SDIO_SAMPLE	6

For other Rockchip SoCs the grf clocks have been exposed from the CRU,
please take a look at e.g. SCLK_SDMMC_DRV and other similar clocks for
RK3528.

Regards,
Jonas

> +
> +#endif

