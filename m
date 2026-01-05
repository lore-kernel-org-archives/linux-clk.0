Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C08277C96;
	Mon,  5 Jan 2026 07:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767599286; cv=none; b=YoGBXF1DFb18iOGqoIUCW0T+Zd8se6rvr49KpaEHlPsgfWrsKDSbVmsVOBcmRE110GfbjtkzGyAX7uU2gm1zLN9qxi5vUOOqrzU0Cc6bOcGaSZfv2AoHwH7hhcYNOZg77fCcdhtMmeP9UVmKDhPKUDOqCJWFEQZ1BNLDzuPIalc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767599286; c=relaxed/simple;
	bh=jFItEYqWycbML0uRZa5QIsNaPt2k0e3e4B23aor7VOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pH8it82WmECoFLb8jEQSkCTPHtVqJyVnNmN2lrYQDaTXW+zBpijue6ftU9COpkZVEOekPl5oNoZ0JSAmIQQwKaDl8R6Zt96WnfZOVphwchF5Fmp9sJYSrdIaNWq6aoiG98OZKM27RrU0Z8pqYjvi2MyeazFxpgJOtTVsj/NA74g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DU6sJ1fe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DU6sJ1fe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F95C116D0;
	Mon,  5 Jan 2026 07:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767599285;
	bh=jFItEYqWycbML0uRZa5QIsNaPt2k0e3e4B23aor7VOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU6sJ1fe+5obkbuOqQlJARDdHeheBUzVuURdhizbD8Wq16wnRvc5kr8MhL7rjGyGQ
	 4zo0ZBi+qr2Ur/02GZ/gQs7tWiDC/klyvi3Sfc9BbiGgzg6M5DOrYuUk+USeTwz0ZN
	 Hl9kW3z0bSItcM1o6gG0ueMpRTz4QdDnHDWrUVAerH+C9dqiKKoGBMJLKBz/+pqFjc
	 IjMF5yxiiBCTNNUNJ/rVOOucgb5cQlYJelNgnY2s+XBuuUT+2ZcwzQAS5CnR0vjmjY
	 1s6yT1c7I+LzjYOxvbIRSfLYqxWN/lZtz0iOQhVenpTjtzoFR1ZM3YHZP3jhNjcnbL
	 nVvHfsASB5T1A==
Date: Mon, 5 Jan 2026 08:48:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@4d2.org>, Guodong Xu <guodong@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: soc: spacemit: k3: add clock support
Message-ID: <20260105-copper-warthog-of-mathematics-883f7c@quoll>
References: <20260103-k3-clk-v4-0-4cccba2360f0@gentoo.org>
 <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260103-k3-clk-v4-1-4cccba2360f0@gentoo.org>

On Sat, Jan 03, 2026 at 03:44:16PM +0800, Yixun Lan wrote:
> Add compatible strings for clock drivers to support Spacemit K3 SoC,
> also includes all the defined clock IDs.
> 
> The SpacemiT K3 SoC clock IP is scattered over several different blocks,
> which are APBC, APBS, APMU, DCIU, MPMU, all of them are capable of
> generating clock and reset signals. APMU and MPMU have additional Power
> Domain management functionality.
> 
> Following is a brief list that shows devices managed in each block:
> 
> APBC: UART, GPIO, PWM, SPI, TIMER, I2S, IR, DR, TSEN, IPC, CAN
> APBS: various PPL clocks control
> APMU: CCI, CPU, CSI, ISP, LCD, USB, QSPI, DMA, VPU, GPU, DSI, PCIe, EMAC..
> DCID: SRAM, DMA, TCM
> MPMU: various PLL1 derived clocks, UART, WATCHDOG, I2S
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/clock/spacemit,k1-pll.yaml |   8 +-
>  .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  13 +-
>  include/dt-bindings/clock/spacemit,k3-clocks.h     | 390 +++++++++++++++++++++
>  3 files changed, 406 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> index 06bafd68c00a..66e109474824 100644
> --- a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -4,14 +4,16 @@
>  $id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 PLL
> +title: SpacemiT K1/K3 PLL
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pll
> +    enum:
> +      - spacemit,k1-pll
> +      - spacemit,k3-pll
>  
>    reg:
>      maxItems: 1
> @@ -28,7 +30,7 @@ properties:
>    "#clock-cells":
>      const: 1
>      description:
> -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +      See corresponding file under <dt-bindings/clock/> for valid indices.

List two paths, better. Generic path to clock directory is obvious and
not helping.

>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 133a391ee68c..66e6683a3ccb 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/soc/spacemit/spacemit,k1-syscon.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SpacemiT K1 SoC System Controller
> +title: SpacemiT K1/K3 SoC System Controller
>  
>  maintainers:
>    - Haylen Chu <heylenay@4d2.org>
> @@ -22,6 +22,10 @@ properties:
>        - spacemit,k1-syscon-rcpu
>        - spacemit,k1-syscon-rcpu2
>        - spacemit,k1-syscon-apbc2
> +      - spacemit,k3-syscon-apbc
> +      - spacemit,k3-syscon-apmu
> +      - spacemit,k3-syscon-dciu
> +      - spacemit,k3-syscon-mpmu
>  
>    reg:
>      maxItems: 1
> @@ -39,7 +43,7 @@ properties:
>    "#clock-cells":
>      const: 1
>      description:
> -      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +      See corresponding file under <dt-bindings/clock/> for valid indices.

Same problem here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

