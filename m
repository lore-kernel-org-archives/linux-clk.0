Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595555;
	b=UDUZOF5nfpqQ8UazMen8FieMV6u3MNIvMpztfBQxnSTHTaxWIjMi0cLS6b4BXNCkMq5H
	 e4C4VDvA2DEaXWHZ9zXmnQt7tG59mt+bXyXKv8+OMS1Yc3d7ts/92dLrg5kiplIxlbgsl
	 QBjtiywGPU7BtIig8jrPWwVLB0jCHKoiyqbL/OHcN9lGCG/f8xWEwAHa/MBK8i+f9IEJe
	 YV5TdFO2qEZcGx7ciWe2dGMdN2BqgVRZVrBTdu0Wy7Y1u3Q3Q/yFHlmGMutS8SF2YGanh
	 JYk4ghah2cLEdGMa1NJenJe6mFqdb7fFdSFYqMWC6vDp/OWp6JkdjYEonxZDxjgpsBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595555;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ocJYbfT6g5bezYeAIa1e7zaXiCG4wIbvDDiN4JuxlxY=;
	b=lsHP78En+BDwYjstn5totOzo2+fNx/tL23ylFcj8S9YCJjU7h2qwvxX3qY6z8o4/uAte
	 FgOTVwphuIbOshIKzuRpHrdYEGnh2g9KLxvb+ZV0+Y+qfhx3/ntidCbjQ2u9aXkoDk435
	 PsUhxU5lOm9UuX+AQzWgzyJ4gzmdRr7Jc8Wt+WZ55es3KgfrADGUUKaK+x7+TAFmf6sKs
	 nTIrP4+iccI/weJagA0kz/DWHkZLIoiguKDmvrSX6l8adEs26rFiK5iK5mIVjwoRN4y4m
	 6efFhynN4DOK1ogfbj+LuIWp/eX//Wnq9FUGN4ivhQ83eOYJ/zLvw5YxWW7Zf4b0VxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=bRD7SKFy;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230EE606A321;
	Wed, 25 Nov 2026 08:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=bRD7SKFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795595551; x=1795854751;
	bh=ocJYbfT6g5bezYeAIa1e7zaXiCG4wIbvDDiN4JuxlxY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bRD7SKFyHzLu1nC7qNjFwkb75NJhdRk81G9HUHk5gT88YD1qTWCgBTAqPch376Cku
	 +8l9qDb+E9tbnmc5m/37SKHWHWKqKYcO6SMWWGGHGyUP+xz6e58DV98Zwlp7HxoZnj
	 UHSVdpKC1bYHpjAykyedPqgQqOzPp7cjk2yA/xReJj0PTkGeFRg2YsAtKV+NCFXQ0m
	 jHu4vX9rYnuy+olB3lI9I4OHhEkILpOR9GYo4ckA+imDUQvo4BeziGmK2t1/w5KxHw
	 pefcFp/ABCPrd7+VTCx5zhQq9m11qfZg07ca1KYgBvS4oQGIPkveLdjL0HwSXfeirp
	 PP6jMjsx5OHqQ==
Date: Wed, 25 Nov 2026 08:32:26 +0000
To: Echo Zhang <echo.zhang@mediatek.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
Message-ID: <hbfQpNQOlAFzs0tUkhDLyxa2evgCuK2TA6HLtNPnASJ-0neKDSdo9kvldUCCVCvv9OwjNQxx7WToK4nwSKfKGX7Yyj37PgPe1tpVuhBTWeQ=@protonmail.com>
In-Reply-To: <20261125060037.649659-3-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com> <20261125060037.649659-3-echo.zhang@mediatek.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 11c2febfc39a728f981e5e8e4c2b0aa17a47990a
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Wednesday, November 25th, 2026 at 8:01 AM, Echo Zhang <echo.zhang@mediat=
ek.com> wrote:

> Describe the MMDVFS clock provider and its connection to VCP firmware
> in a common binding. Document the optional MMUP shared memory and IPI
> settings used by the firmware backend.
>=20
> Add an MT8196 binding for the HWCCF syscon and seven mux OPP tables so
> the driver can map clock rate requests to hardware votes.
>=20
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  .../soc/mediatek/mediatek,mmdvfs.yaml         | 60 +++++++++++++
>  .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  | 87 +++++++++++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediat=
ek,mmdvfs.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediat=
ek,mt8196-mmdvfs.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdv=
fs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.ya=
ml
> new file mode 100644
> index 000000000000..d65f4c9084cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mmdvfs.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mmdvfs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Multimedia Dynamic Voltage and Frequency Scaling (MMDVFS=
)
> +
> +maintainers:
> +  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>

Maintainers should be real people, not a mailing list.

> +
> +description:
> +  MediaTek MMDVFS provides dynamic voltage and frequency scaling for mul=
timedia
> +  hardware accelerators. The controller exposes virtual clocks that mult=
imedia
> +  consumers use through the common clock framework. The driver aggregate=
s
> +  consumer rate requests and sends the resulting DVFS votes to the multi=
media
> +  hardware voter and VCP firmware.
> +
> +select: false
> +
> +properties:
> +  mediatek,vcp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the MediaTek VCP remote processor used for MMDVFS share=
d
> +      memory, feature registration, notifier, and IPI operations.
> +
> +  mediatek,mmup-sram:
> +    type: boolean
> +    description:
> +      Use the MMUP SRAM window for MMDVFS callback records and status da=
ta.
> +
> +  mediatek,mmup-enable:
> +    type: boolean
> +    description:
> +      Enable the MMUP path for MMDVFS shared memory and IPI handling.
> +
> +  mediatek,vcp-ipi-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      VCP IPI channel id for MMDVFS. If omitted, the driver uses the pla=
tform
> +      default.
> +
> +  mediatek,mmup-ipi-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      MMUP IPI channel id for MMDVFS. If omitted, the driver uses the pl=
atform
> +      default.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      MMDVFS clock specifier. Consumers pass an SoC-specific MMDVFS cloc=
k
> +      index.
> +
> +required:
> +  - mediatek,vcp
> +  - "#clock-cells"
> +
> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt81=
96-mmdvfs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
8196-mmdvfs.yaml
> new file mode 100644
> index 000000000000..13381c78dbd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-mmdv=
fs.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-mmdvfs.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Multimedia Dynamic Voltage and Frequency Scaling

Why there's mediatek,mmdvfs.yaml file if this exists?

> +
> +maintainers:
> +  - MediaTek MMDVFS Team <linux-mediatek@lists.infradead.org>
> +
> +allOf:
> +  - $ref: mediatek,mmdvfs.yaml#
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - mediatek,mt8196-mmdvfs
> +  required:
> +    - compatible

Drop. select is automatically inferred from the compatible.

Best regards,
Roman
