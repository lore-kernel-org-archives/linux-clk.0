Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604292;
	b=afB1vKbblKC/OSaramtZqkKl/X1XjpVdnuur+j+kaAfY3lhyhSG1oLdzCBziBkuvKGIk
	 J4ZVwbabfNENAJZqgyt3bDtl/h2wqBBqHH3kjigzM2oe48KJHhAjWbfqKqH15GBlYGDZz
	 /0nSD1bCppre1IsHpz8iQQstNX3Q34RkJLKz8IHuoenVqGNuGTjOXFVDYV8xK35BSuAg9
	 bs8FXTzLEdl/H3aznPZEAQe3vIDltQPeVjuO5AfS1MhJIhA1l5IusS9gihkur8SnGqfSb
	 KHh90TeX63+GQ4hWJq9WiiJvWY1HfwqefnGeq0YwkNFN1PsKvRpdAb3qaLCMfWo9gKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604292;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ezl81EdcwaGzGmgo8qc93IdYDX7vHXyDmmf20JLLsZk=;
	b=ZKMK8maoV4XKWzq2Y2WO0VfnY9FC8VreiUeKgCHFRo7RLoeUJ7045MjuzVdEkG/pMUM/
	 P4XynvsLE8W7Y7p4VgMm2HmX5eqJX51wznnZ6EitI/nUB5nyffQG97lYmzhNKqFApYYw+
	 XwEO94ISJpWylDTwMH4mXSRyfJ0qZwN9DVSEXVV4syPLAxgyyg3KAFb+fPaBslWJSdi68
	 KbKS49ThEyblDPXdz4DQfA4DCMebb3S0gyt2hWveSTCsg53JWgihxoTNoXRF70fhnULPy
	 UClhMzu5bNlQbO/3SFY9Sr8+4wrkwyVaXS+VTOIMhVEzah0+UcfEuSPv7A4VYdsW2nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEHC8FEK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65035606A31E;
	Wed, 25 Nov 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEHC8FEK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14951F000C0;
	Wed, 25 Nov 2026 10:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604292;
	bh=Ezl81EdcwaGzGmgo8qc93IdYDX7vHXyDmmf20JLLsZk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=YEHC8FEKizvcfCDw2AHuP0lJqmhMrm1wFdck2zClUIEzHPpozUOdkUx9G9dUg0WcH
	 BL0TZSWG1iZctoyRa0aQM4C5Ev7A3lAmX+6xXuOZ/A5e/52p08/ejOfvUt7TBoBYID
	 OkazQJ+2w6zxa/v6b080eQNSWSLgQYOj9Ivry84mYHJvTz00Q12cWavkfwNQMcIm+J
	 AKUQJWlGOa+sCi/px7bkkXArG3BQiuibiVL51LrHAIMogyg4IqRFBGsWCagFq1ddMZ
	 6a+iKXgTtC9XRrYjS3ekP0CLfytm4ECKjkHxRf/4kGm3f+swBe4w63XG2Y1d8/urY8
	 lCbOMi3tL2Ecg==
Message-ID: <22b88487-6445-4fe1-ab96-d46b303b7f9b@kernel.org>
Date: Wed, 25 Nov 2026 11:58:04 +0100
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
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com,
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, llvm@lists.linux.dev
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-3-echo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261125060037.649659-3-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2026 07:00, Echo Zhang wrote:
> +description:
> +  MediaTek MMDVFS provides dynamic voltage and frequency scaling for multimedia
> +  hardware accelerators. The controller exposes virtual clocks that multimedia
> +  consumers use through the common clock framework. The driver aggregates
> +  consumer rate requests and sends the resulting DVFS votes to the multimedia
> +  hardware voter and VCP firmware.
> +
> +select: false

What?

> +
> +properties:
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the MediaTek VCP remote processor used for MMDVFS shared
> +      memory, feature registration, notifier, and IPI operations.
> +
> +  mediatek,mmup-sram:
> +    type: boolean
> +    description:
> +      Use the MMUP SRAM window for MMDVFS callback records and status data.
> +
> +  mediatek,mmup-enable:
> +    type: boolean
> +    description:
> +      Enable the MMUP path for MMDVFS shared memory and IPI handling.
> +
> +  mediatek,vcp-ipi-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VCP IPI channel id for MMDVFS. If omitted, the driver uses the platform
> +      default.
> +
> +  mediatek,mmup-ipi-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      MMUP IPI channel id for MMDVFS. If omitted, the driver uses the platform
> +      default.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      MMDVFS clock specifier. Consumers pass an SoC-specific MMDVFS clock
> +      index.
> +
> +required:
> +  - mediatek,vcp
> +  - "#clock-cells"
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
> new file mode 100644
> index 000000000000..13381c78dbd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdvfs.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-mmdvfs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Multimedia Dynamic Voltage and Frequency Scaling
> +
> +maintainers:
> +  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>
> +
> +allOf:
> +  - $ref: mediatek,mmdvfs.yaml#

What?

> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt8196-mmdvfs
> +  required:
> +    - compatible

What?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-mmdvfs
> +
> +  mediatek,hwccf:

clock control is via clocks, no?


> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the MT8196 multimedia hardware clock control fabric syscon
> +      used for AP-side hardware votes.
> +
> +  mediatek,mux-opp-tables:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

NAK, you are messing with us...

> +    minItems: 7
> +    maxItems: 7
> +    description: |
> +      OPP tables for the seven MT8196 MMDVFS muxes, in this order:
> +      display, MDP, SMI, VENC, VDEC, IMG, CAM. MDP and MML share
> +      the MDP mux. Each OPP entry must have opp-hz and opp-level.
> +
> +required:
> +  - compatible
> +  - mediatek,hwccf
> +  - mediatek,mux-opp-tables
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-mmdvfs.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        vcp: remoteproc@31800000 {
> +            compatible = "mediatek,mt8196-vcp";
> +            reg = <0 0x31800000 0 0x100000>;
> +        };
> +
> +        mm_hwv: syscon@31b00000 {
> +            compatible = "mediatek,mt8196-mm-hwv", "syscon";
> +            reg = <0 0x31b00000 0 0x6000>;
> +        };
> +

What are all these nodes? Drop.

> +        mmdvfs_opp: opp-table {
> +            compatible = "operating-points-v2";
> +            opp-0 {
> +                opp-hz = /bits/ 64 <100000000>;
> +                opp-level = <0>;
> +            };
> +        };
> +
> +        mmdvfs: mmdvfs-mux {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Honestly, not a separate device. You just added it for Linux drivers.

NAK for entire binding.

> +            compatible = "mediatek,mt8196-mmdvfs";
> +            mediatek,vcp = <&vcp>;
> +            mediatek,hwccf = <&mm_hwv>;
> +            mediatek,mux-opp-tables = <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>, <&mmdvfs_opp>,
> +                                      <&mmdvfs_opp>;
> +            #clock-cells = <1>;
> +        };
> +    };


Best regards,
Krzysztof
