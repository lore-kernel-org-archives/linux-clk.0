Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795258965;
	b=CEPhCl4by294VhqgzHhLSj4I+mJb8467l3xQrC8yxeqS6YnBOO3FA5wyCvrGO5D1r6YH
	 EKGN6JZ5ADGWXVB0rkFA7JreFAZb72mTVyESc8OSwYeG4K/VW2pjSuqc0JUNCTEs1uPai
	 cQ1hb7JmY6yI/ffZdRHx/xq8+jD3j/oBHjD2T0Q0LCFYFMX25X/xLdgp5t+7xoG5rOHdh
	 aeJEY0QF5KQSDU10PGc86pxYoKwmXdli1yWVf/1/2E/1xK6qcn2UE3c7gKgP/4L7G21Ri
	 ZyYWd9Y4rRcLS/ixsqowFNLPkyZNtRRFZOJJ4LDrcbb4G6Z4tyMCoUqt8WQejuJhzlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258965;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7BuVzlJ+/ARC5V7HvviKlJq77JZVN16FxSVAokPlQk4=;
	b=EwXj9eRpBJTUCEXGsowqtBe12FUSeyBYqZegzgZ/wSxYv+q6psR5J3Xs/9hh4SvMmb1L
	 PyybGE9OCln+XCDn3KIAWsqX8ZYVmYsJ4jMs5bfae5NFVXixfidbVqMB18L+qeEoZapee
	 fs2affnmSrTCGgCB7GjR79CTHex3pgCywmgZ42MFKj4+9mKfwUEf+Vr2AMOZX526/8J3P
	 +ixxhboL/9FxnJ8jdLkfxDrArJokTFQ43Kr4tlg196bsPaCNkIkNh3Ds7Flq1HID1x1J2
	 N2ba71Z47Isk/OJO/gOe3T2kbNKvIorrpapDT+x5vOm3i/7zhLAxH9k5JKynKEKuWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aU/wCJ9c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17960606A320;
	Sat, 21 Nov 2026 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aU/wCJ9c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EC91F000C4;
	Sat, 21 Nov 2026 11:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795258964;
	bh=7BuVzlJ+/ARC5V7HvviKlJq77JZVN16FxSVAokPlQk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=aU/wCJ9cn/NiupW1IdxBQYuJywrcMJ+qtxYHrrAQNyQ2ZpUor1cY7lmWSdl3JM13d
	 571Y6vkxZDO+8uctVhX4dMkkqSq5R8jNzPYyQJztr+KcsfXoSYDudyj1WqoF+oq4XR
	 9vM4YFvKnvmy++WOtgJNAYLpdNLBo/lkDXsIctn3bFnF5h2EGGCvzHwdjRDZ67epc5
	 dTHVfi78OZ6zfjDC8dRKbdR1thPlJ5cJbSsimst+/3xduPXIJBOWY3oiZbCnX3T0dJ
	 NF4rvjlbFlRlusNIiu2rD2GdH3Z0a1q/jMWhr0yA34WZaWAe/3uwkLgnw4zsk7yDX1
	 1/TCySqHEQeIg==
Message-ID: <f98c3f68-82d7-41e3-bb58-d3737b73c7b5@kernel.org>
Date: Sat, 21 Nov 2026 12:02:37 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: rockchip: add clk-out
To: ZhuXiangyu <1194781887@qq.com>, Stephen Boyd <sboyd@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <tencent_8104629BEBAEF41637AAF1CC7D95BC7DCC09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2026 11:58, ZhuXiangyu wrote:
> Document the Rockchip clock output/input switch, a single GRF-
> controlled gate used for signals such as the SAI MCLK output.
> 
> Signed-off-by: ZhuXiangyu <1194781887@qq.com>
> ---
>  .../bindings/clock/rockchip,clk-out.yaml      | 81 +++++++++++++++++++

Please follow carefully submitting patches document, including how to
sign your work and how to send it correctly threaded. There are numerous
guides already, so just follow them.


>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> new file mode 100644
> index 00000000..bf2a9b8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,clk-out.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,clk-out.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip Clock Output/Input Switch
> +
> +maintainers:
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |
> +  Some Rockchip SoCs route a clock between an internal clock and a pin
> +  through a GRF bit, for example the SAI MCLK input/output switch. This
> +  driver exposes that single bit as a gate clock.
> +
> +properties:
> +  compatible:
> +    const: rockchip,clk-out

Generic compatibles are not allowed. Do NOT send us downstream code,
it's not acceptable.

Not doing detailed review as it does not follow basic rules. Please go
through for example DTS101 slides.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 0
> +
> +  clocks:
> +    maxItems: 1
> +    description: Parent clock.

Drop description.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clock-output-names:
> +    maxItems: 1
> +
> +  rockchip,bit-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Bit position of the output enable in the register.

Nope

> +
> +  rockchip,bit-set-to-disable:
> +    type: boolean
> +    description: |
> +      By default the clock is enabled by setting the bit at
> +      rockchip,bit-shift. When this property is present the polarity is
> +      inverted: setting the bit disables the clock and clearing it
> +      enables the clock.

Nope

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - clock-output-names
> +  - rockchip,bit-shift
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkout_parent: clock {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <12288000>;
> +    };

Drop node, redundant.

> +
> +    clkout: clock@ff910004 {
> +        compatible = "rockchip,clk-out";
> +        reg = <0xff910004 0x4>;
> +        clocks = <&clkout_parent>;
> +        #clock-cells = <0>;
> +        clock-output-names = "mclk_sai0_to_io";
> +        rockchip,bit-shift = <8>;
> +    };
> +
> +    audio-codec {
> +        clocks = <&clkout>;
> +        clock-names = "mclk";

Drop node, redundant.



Best regards,
Krzysztof
