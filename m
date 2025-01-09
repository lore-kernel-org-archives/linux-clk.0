Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6313B1FDA;
	Thu,  9 Jan 2025 08:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413170; cv=none; b=V1yWl1GRNfWocE6CvDPu+chXgHV5XIW0yVEpKEF6JzsSiv2O3KczyiSp/LjudjzxN2D4nSlR4nVrrbubKtSG0Ct7lsGrK26sWTvJ37KO/TIrmRZKmDryxZWrqEErOU2FGX47jC1ACjggg8PbOSfFytVmAWxe6r4JDe4z0ToU5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413170; c=relaxed/simple;
	bh=Sc6QqQz2Zq7wQpvdnuknqWgjeROXiIqNNUloa9EIDdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ec6erFJkm1sVGM2Ox5cVjOWiJByEAJd6k9CHRTD8ZRwbzX5pWFXlo0F4KI55YOzvpBU197sl5UrIxTdXiD/oXnUfVuDCsxrwyC29PTj/d+4ZRvXIa/M0JfnUpVx+LxrJkeE4E4bNwX5LiTUOJNv7unHqzBqhBLlbPCza7LEKF6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4GWE1do; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4GWE1do"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AB2C4CED2;
	Thu,  9 Jan 2025 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413169;
	bh=Sc6QqQz2Zq7wQpvdnuknqWgjeROXiIqNNUloa9EIDdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4GWE1do+W6PEulta2FXq7gYIj/EGTO+4e7I2toDxA7xnsKq6EU7na3HIPE1VXXHT
	 Z0KM7wy2o4Erjau/dW7Q2vTJndt2xh5KvOZQd9iLmByDbqMOK4HTZdmX28MGc/oE5o
	 pADlHWwHxJ/hqOw2CQBEXJaNERc3qmLyIRThwzH4F0pzQwztlw9J5o1otiW23iiajP
	 UWuqEPXmERGhZV+eQVjswDBebe9VKKrlTH++8af1Awh7PinxRpB5gTr8zUPoNqQdGT
	 sS7V1Rosc640tAxbQZ32ChWw344dnIq1/z6WvMZv9d9SxcIZKUAV0zeA4mpkmNSXms
	 Vb71gJUtkH4RQ==
Date: Thu, 9 Jan 2025 09:59:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
References: <20250108114605.1960-2-ziyao@disroot.org>
 <20250108114605.1960-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108114605.1960-3-ziyao@disroot.org>

On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
> There are two types of clocks in RK3528 SoC, CRU-managed and
> SCMI-managed. Independent IDs are assigned to them.
> 
> For the reset part, differing from previous Rockchip SoCs and
> downstream bindings which embeds register offsets into the IDs, gapless
> numbers starting from zero are used.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
>  3 files changed, 761 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> new file mode 100644
> index 000000000000..19dbda858172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3528 Clock and Reset Controller
> +
> +maintainers:
> +  - Yao Zi <ziyao@disroot.org>
> +
> +description: |
> +  The RK3528 clock controller generates the clock and also implements a reset
> +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> +  module.
> +  Each clock is assigned an identifier, consumer nodes can use it to specify
> +  the clock. All available clock and reset IDs are defined in dt-binding
> +  headers.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3528-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true

Drop both, totally redundant.

> +
> +  clocks:
> +    items:
> +      - description: External 24MHz oscillator clock
> +      - description: 50MHz clock generated by PHY module
> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +      - const: gmac0

gmac
(unless you have gmac1 here as well but then please add it now)

Best regards,
Krzysztof

