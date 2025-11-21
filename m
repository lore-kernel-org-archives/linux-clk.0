Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8071E22D7B6;
	Fri, 21 Nov 2025 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763709970; cv=none; b=AVyAjq/FrQYbdfEfFrNeD5NrspuYtztsJkak22dT7QjVUIF3vAASVbCKwQGQTwi/BR27EM5y19ha/xZAcuiZyJ0hn98tD8luJdCKIGTxbb96wxcVcx4wKWC2kIbf1D0yPQYFCAaxZFOivLJrmd3us4Txq7QfsyNlGXrQJsnU8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763709970; c=relaxed/simple;
	bh=zoTP0H6LCrDf44J80jKYYIbxqWfXSddsSjSQgVFRNfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eO0C7eGOFnpHD7mJgJLso01zWgch3Gg8GxTJs+B/WsJaARqPSXiRs1n6exT0yTuzKtrjImBRSf2oJCkA3udVUqyU1nO8MKLOSE1ZyMa8E1ABsKh6ECPedfcjTbYNWXArltBxbLYFY3hRoyIhVDMfrynQbW+XZ6W76D76wt4p8iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8CQ9wsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8CQ9wsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826C4C4CEF1;
	Fri, 21 Nov 2025 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763709970;
	bh=zoTP0H6LCrDf44J80jKYYIbxqWfXSddsSjSQgVFRNfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8CQ9wsFqMOEctmbhfeXOzYXupALekL3vnuD1Y7rFavM7Ye6aM9XIu49fnSyMVvD5
	 oZt/mKvzeMd7qpubTvXUhCKx1ZrmbtClmMg3lyMa/A8fFTl7xvjv0COubOw9SQ4pam
	 /hbucJ5shkJ/Eye/XId6Y/myqwJSjCHRiASna+zbiTyJTm0/V1O2BZiDzaR1hPvzhP
	 OLIpYfSGr14tRiYUzjNASGbSPGdpqPYafDTMAq9hzSE1EZRk9JLH6MwlXpha3izQW0
	 QKBEbvqHVif4zyYp9alSuBPJVkMrsuOq++wlIw8JTaSNBDRL/CfeHhMJHtKnQaZbO/
	 L6y3XBJucNLwQ==
Date: Fri, 21 Nov 2025 08:26:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de, 
	robh@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, finley.xiao@rock-chips.com
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251121-tunneling-quaint-copperhead-18328e@kuoka>
References: <20251121024645.360615-1-zhangqing@rock-chips.com>
 <20251121024645.360615-2-zhangqing@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121024645.360615-2-zhangqing@rock-chips.com>

On Fri, Nov 21, 2025 at 10:46:44AM +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  54 ++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> new file mode 100644
> index 000000000000..fee49700113e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3506-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3506 Clock and Reset Unit (CRU)
> +
> +maintainers:
> +  - Finley Xiao <finley.xiao@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The RK3506 CRU generates the clock and also implements reset for SoC
> +  peripherals.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3506-cru
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
> +    description:
> +      Reference clock input. This is optional when the clock source
> +      has already been configured and enabled by the bootloader/firmware.

So your description confirms - this is not an optional clock. It must be
enabled/configure and it is always in the hardware. You could have
avoided one more version of patchset if you only bothered to respond to
review.

Drop description and make it required.

> +
> +  clock-names:
> +    const: xin24m

Nothing improved. Conor made comments some revisions ago and reminded
you about them. And you just ignored them?

That's just xin pin, isn't it?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"

clocks and clock-names.

Best regards,
Krzysztof

