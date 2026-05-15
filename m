Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01E37BE8E;
	Fri, 15 May 2026 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832640; cv=none; b=nNK9qH3Er/M7w/OATDYyqQPyqbITKE8a/9r3OERkAch8R6SBcsPCrhdefaGIMOORxVhXw7yJFV6pM6ji5NB/XePmC1BYiS+tc4DL/oh3ygb7ADY3EOM1ofJRIBFrGraCE8TiSKYFdp1dpt90G/OwHx+PJvRTv9/GnRHBo8ML6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832640; c=relaxed/simple;
	bh=gBhbHi0NNHhrL8d6+VY3N6+g1i4FaaoCLvTGFtKl2Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPnowAJy6hWnq6kGxGQhiMHK8B8oPWnUo+edyQ02OXKe/r/Bned4nXVv1nPgC/93kTw9bqu/KrX5grOP+0LDKzcph8f6Dcgae0aSAwEjC+6erJbgxhqcWrYapNDFWpcQYqT7K9qIMibT2+JG9xgK1CQh+RtW+7LFVJPfOTG5DYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIisNbMa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIisNbMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C324BC2BCB0;
	Fri, 15 May 2026 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778832640;
	bh=gBhbHi0NNHhrL8d6+VY3N6+g1i4FaaoCLvTGFtKl2Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FIisNbMahMfMg8P1xFwMV8fkdAzB6JeAP7J9qN5JVAv5AShhQ8A8hhuuUTJddX5U8
	 +Kwfsy0yYf5LNChgUD9xOIUIifMjt0yZ1b7MDrzkkimPaAl4pYsyFB+xZscVPfokaF
	 5J2wpPRuU/079FaRMfblnDwVCNVD/NtwUyOLl1Iagm/bkzjtQyUmQsOFyC+vhbhUpP
	 cFmilDV+dk1luUGRU3W0jGx3DrOKwt0nQsllZ7EE8lYu1wpqTlsVTG5HfObLeH0TRC
	 YMTa6Iuhi90/xDMngx62lOddNQRWofgO9AHB32hn4twFPbiA10Ia6aJgV6y3KhsRYY
	 cKzaHo8xoGOVQ==
Date: Fri, 15 May 2026 10:10:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] dt-bindings: clock: Add Amlogic A9 peripherals
 clock controller
Message-ID: <20260515-augmented-cyber-puffin-4db20f@quoll>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-3-41cb4071b7c9@amlogic.com>

On Mon, May 11, 2026 at 08:47:25PM +0800, Jian Hu wrote:
> Add the peripherals clock controller dt-bindings for the Amlogic A9
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../clock/amlogic,a9-peripherals-clkc.yaml         | 150 +++++++++
>  .../clock/amlogic,a9-peripherals-clkc.h            | 352 +++++++++++++++++++++
>  2 files changed, 502 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
> new file mode 100644
> index 000000000000..97e2c44d8630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-peripherals-clkc.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a9-peripherals-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A9 Series Peripherals Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a9-peripherals-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clocks:
> +    minItems: 20

I don't think so. How they could be optional in silicon? How does
exactly work from silicon point of view?

> +    items:
> +      - description: input oscillator
> +      - description: input fclk div 2
> +      - description: input fclk div 3
> +      - description: input fclk div 4
> +      - description: input fclk div 5
> +      - description: input fclk div 7
> +      - description: input fclk div 2p5
> +      - description: input sys clk
> +      - description: input gp1 pll
> +      - description: input gp2 pll
> +      - description: input sys pll div 16
> +      - description: input cpu clk div 16
> +      - description: input a78 clk div 16
> +      - description: input dsu clk div 16
> +      - description: input rtc clk
> +      - description: input gp0 pll
> +      - description: input hifi0 pll
> +      - description: input hifi1 pll
> +      - description: input mclk0 pll
> +      - description: input mclk1 pll
> +      - description: input video1 pll (optional)
> +      - description: input video2 pll (optional)
> +      - description: input hdmi out2 clk (optional)
> +      - description: input hdmi pixel clk (optional)
> +      - description: input pixel0 pll (optional)
> +      - description: input pixel1 pll (optional)
> +      - description: input usb2 drd clk (optional)
> +      - description: external input rmii oscillator (optional)
> +
> +  clock-names:
> +    minItems: 20
> +    items:
> +      - const: xtal
> +      - const: fdiv2
> +      - const: fdiv3
> +      - const: fdiv4
> +      - const: fdiv5
> +      - const: fdiv7
> +      - const: fdiv2p5
> +      - const: sys
> +      - const: gp1
> +      - const: gp2
> +      - const: sysplldiv16
> +      - const: cpudiv16
> +      - const: a78div16
> +      - const: dsudiv16
> +      - const: rtc
> +      - const: gp0
> +      - const: hifi0
> +      - const: hifi1
> +      - const: mclk0
> +      - const: mclk1
> +      - const: vid1
> +      - const: vid2
> +      - const: hdmiout2
> +      - const: hdmipix
> +      - const: pix0
> +      - const: pix1
> +      - const: u2drd
> +      - const: ext_rmii
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    apb4 {

Same comments as other patches. Do not come with your own style, but
adjust to mainline. Do you see this anywhere?

git grep apb4 -- Documentation/devicetree/bindings/clock/

So why coming with something COMPLETELY different?

Best regards,
Krzysztof

