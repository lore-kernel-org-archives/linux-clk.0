Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447002;
	b=Esgv/YrnNat60L6OmEtuChshdRpFAmFyNiUwSbcaRZGkbbi16WKUh9cnqDTSCsDzTCwx
	 QUflOlapUbPrKNFnjjf2pgaygfx160P9AcTPQtm+MqMl/fxrMx0h40yTb/KhwsuF8SLRP
	 mOEoVyQa4O6DhSMTchSJxbokbTMUv3cAPPbMlywzBmD/4I0MadRllfkVw5IaYHLzf8uWZ
	 Wzanhe61qRiakiP+ba1mLvokZREgEc+vd0KrBbrraF8CNd7Y3WJlG9O3jIhMn14W2OrXm
	 MrbNQTDQxvs2BRZFZFAP5vIsqobbhfmieRnVDHSHiWsmtlo1PIUathlgStVJo6R8ZDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447002;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Mq/jGeJ1kGXXos6D0p95YO4hddT5N8ASO2P3gIqnfss=;
	b=hMqxqKYShc5IdNwWVABsRyKScqzRFaMqSqoty994ydxQr3Lnukf+cnBfTY5KFuWICo0x
	 +rwsmAaiDIXQyIBt/zhEo8fGmFVjnN2fpd0lDpDmwiSu6aMgZE1ZIfNxt2zOuFLvlx8w7
	 OE/WQjd7uJgu0OMItypYgqQO9T9jJKazav9nZtWtgfmscbdqygb5NqpaEHpxQ+N081184
	 wqZ3nBoSct85ZCcRaPFSHtY4Bmn5AWgOJCkscfqor25LF4rh7JUXBgwofJ0SUTlWd+Gbu
	 igqFu759Uu2l6C51jCvRgk8y2EIe494Y6l/iN7NGHxmS1DJWSLi9j+ogjZXim/0Rgfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWYShvXE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD7F606A880;
	Thu, 12 Nov 2026 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWYShvXE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976A71F00A08;
	Thu, 12 Nov 2026 01:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794447002;
	bh=Mq/jGeJ1kGXXos6D0p95YO4hddT5N8ASO2P3gIqnfss=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iWYShvXE+v5oGFNXO1K5u0zwED1XMRYvN4zj5eYCJCoYp3vhh8gBsWTSo2VxZ1qD6
	 3Q8YpRo0M3w6LWsF1rTtA1aSZRfDFqKpVZrBaYpHTI1FGT/tsra+A3F1Oj+5GrO59o
	 twP82U9XQ49hjTOfoJ+EhMBHb0pvrNJNDVVaT4v7cMBU5c82flD20OZo/4Q+hNtaoP
	 z8S63wgyN72edM6J9IIrQ6L61t9XrjBDv2yATLDp5GrZFnjCZpBUOzpW6S/GqwHQZq
	 XWFo79Vhsk65+b+N3WNp+yoi4wZK3B/P5yPobnAjC27lw+1p/u8vTveib5lK8fTlEK
	 lwfY8Igfe4KLw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: Add Siflower SF19A2890
 clock manager
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev>
References: <20261111-sf19a2890-sysm-v2-0-d2fcb723e4f1@telaak.dev>
 <20261111-sf19a2890-sysm-v2-1-d2fcb723e4f1@telaak.dev>
Date: Wed, 11 Nov 2026 20:29:53 -0500
Message-Id: <179444699398.1126566.18079369824329437583.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=OrUYxx88NbEJGdzMRTIiV7RLdbl6H+Bpa1NcCXGtC0A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+ik25WH39d8jdF0suq/etZz3yJGZK/XM1gc0inf/33
 4x9fmv7x45SFgYxLgZZMUWWJblGBRGpq2zv3dFkgZnDygQyhIGLUwAmcsqckWHWqn+OBdc8XwZI
 m27mC9IW7Uz6HnBu/bbP16++X8fiUJHHyNCrcy2SK4pdw2RnuKvcIt5z9Qv29ns7WX1KK6/esb7
 BmxEA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joseph,

> The clock manager of the Siflower SF19A2890 holds the SoC's PLLs and
> the muxes and dividers that derive the bus, CPU and peripheral clocks
> from them. The peripherals' own gates and resets are in separate
> blocks.
> 
> The header is Chuanhong Guo's, from his SF19A2890 branch, without the
> count at its end.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  .../bindings/clock/siflower,sf19a2890-clk.yaml     | 57 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  include/dt-bindings/clock/siflower,sf19a2890-clk.h | 27 ++++++++++
>  3 files changed, 91 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> new file mode 100644
> index 000000000000..9b72f14c2bd9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/siflower,sf19a2890-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Siflower SF19A2890 clock manager
> +
> +maintainers:
> +  - Joseph Telaak <joseph@telaak.dev>
> +
> +description: |
> +  The clock manager of the Siflower SF19A2890 holds the SoC's three PLLs
> +  (CPU, DDR and common) and the clock muxes with dividers that derive the
> +  bus, CPU and peripheral clocks from them. The peripherals' own clock
> +  gates and resets are in separate peripheral clock and reset managers.
> +
> +  The clocks are defined in include/dt-bindings/clock/siflower,sf19a2890-clk.h.
> +
> +properties:
> +  compatible:
> +    const: siflower,sf19a2890-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 12 MHz oscillator
> +      - description: 40 MHz oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc12m
> +      - const: osc40m
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@19e01000 {
> +        compatible = "siflower,sf19a2890-clk";
> +        reg = <0x19e01000 0x800>;
> +        clocks = <&osc12m>, <&osc40m>;
> +        clock-names = "osc12m", "osc40m";
> +        #clock-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..ce8d0596939c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25698,6 +25698,13 @@ N:	sifive
>  K:	fu[57]40
>  K:	[^@]sifive
>  
> +SIFLOWER SF19A2890 CLOCK DRIVERS
> +M:	Joseph Telaak <joseph@telaak.dev>
> +L:	linux-clk@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/siflower,sf19a2890-clk.yaml
> +F:	include/dt-bindings/clock/siflower,sf19a2890-clk.h
> +
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hansg@kernel.org>
>  L:	linux-input@vger.kernel.org
> diff --git a/include/dt-bindings/clock/siflower,sf19a2890-clk.h b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
> new file mode 100644
> index 000000000000..a9fc9ecf4520
> --- /dev/null
> +++ b/include/dt-bindings/clock/siflower,sf19a2890-clk.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */

The license is different compared to siflower,sf19a2890-clk.yaml. Is that
expected?

> +#ifndef __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
> +#define __DT_BINDINGS_CLOCK_SIFLOWER_SF19A2890_CLK_H
> +
> +#define CLK_PLL_CPU		0
> +#define CLK_PLL_DDR		1
> +#define CLK_PLL_CMN		2
> +#define CLK_MUXDIV_BUS1		3
> +#define CLK_MUXDIV_BUS2		4
> +#define CLK_MUXDIV_BUS3		5
> +#define CLK_MUXDIV_CPU		6
> +#define CLK_MUXDIV_PBUS		7
> +#define CLK_MUXDIV_MEM_PHY	8
> +#define CLK_MUXDIV_UART		9
> +#define CLK_MUXDIV_ETH_REF	10
> +#define CLK_MUXDIV_ETH_BYP_REF	11
> +#define CLK_MUXDIV_ETH_TSU	12
> +#define CLK_MUXDIV_GMAC_BYP_REF	13
> +#define CLK_MUXDIV_M6250_0	14
> +#define CLK_MUXDIV_M6250_1	15
> +#define CLK_MUXDIV_WLAN24_PLF	16
> +#define CLK_MUXDIV_WLAN5_PLF	17
> +#define CLK_MUXDIV_USBPHY_REF	18
> +#define CLK_MUXDIV_TCLK		19
> +#define CLK_MUXDIV_NPU_PE_CLK	20

This is the only one that has a suffix of _CLK. Can that be dropped for
consistency?

Brian

-- 
Brian Masney <masneyb@kernel.org>
