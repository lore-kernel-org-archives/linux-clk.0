Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87C125A623
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 20:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614297; cv=none; b=fDryXu4Ij1CqmXkSFtJpP/IJhpqT//xeFIuACU4SrjvHC9B18YSt/FviJOlOwz656KdfI6TwiVH6eHrO6B/q3xKYPIxu4SBUR39yU3ZKYpCxx++9RyQzBJTps4A8A7sAy7yn3kHhgNc9BYalDE4TDnWQ64ioqYvGf6VxnxHUPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614297; c=relaxed/simple;
	bh=4ZBhPOFz5eul4AYPe6eHBKQQNaWdLcFFW5q5R1zympQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7kd55G4dSCfLLjbHuUSeT0l/Z1qZMgtZyFb0wVkJJYbO8ImYpttb+ooYPSKl9Sf7Lnv7oG9jEKAmwkJQRRfV3mEuI3hDvgH2UDiqzW4WvfMiVoGXn6nLZ5NKTvPJ2zZZL1v0PltcIuDN9/wluaGEYS0il+Acvy/T+UIaqq4R0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=LWm2nX3r; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LWm2nX3r"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-84cdacbc373so124664939f.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 12:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738614295; x=1739219095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9JFObA4COff1XvgL6pyI7Lgpee7/4aC4TK3AK7tuo=;
        b=LWm2nX3r4yuzLJk7bOC4zGbj5+8RlS9DO117ViHxA3RN2J2sFGf0/0GgeAsohuqu1a
         dxLbznRbKU3anqRnheABr+NdfYUa4//B4hRp4v9hnA8Tk/Uyz0D2wVYSali6/xwWF9dO
         5OR9hTIGUgXRC1e3XEBBCxLQIqEY4cTMRf2Nwp3lU5nfjaqqTin4Tq6Xh6p2j2xQHaLS
         OdlLlBJHZ1zOKKlkoktIlb8rGz9evpMVLxJFBLNEh71+OfQlUJd2d3giJsNe1W4l7sPf
         DYAdoZNPj2Rm8N7/8JwFuWUcCGWRQEZi2yE1CzeyXG36E35ChYoC81EUE8TjFmiEPKUW
         Z9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614295; x=1739219095;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9JFObA4COff1XvgL6pyI7Lgpee7/4aC4TK3AK7tuo=;
        b=IOLZHJLPTXvqDuKLxL4rk70HkPCt2T03Y/4H74uqrXOG2oBto8iWc3yicYCpfu6RYy
         EapKOPogpm0ADcSWLxd409fSEOZ4OMRvqR/4glAXOXTlb/tYXmpFfbfxqIgpHbugCNt4
         wARqJTTX7/l3kokpMhRcsmz2ttBKUIMaY9EQH6GaKWqO6r3JSWPh9m9C0o+vzi6WZkwc
         KzznwC+cGOwDpoM1SLoK5abMXQEAc2/6s8OFvu3mTz4i3DhWjYGRvyIEKv1EiLJXx6GT
         PYcBQBIhbJJUAmDq5lcsr+y7cNELGfXZpT8RaFcVL05rtx7ycRBeeaHZRUgte1ZRFwsQ
         OoWg==
X-Gm-Message-State: AOJu0Yzvtme6GKWKA2+N0APp5Nd35d94+Rk057VdrSY+o5UiUD8Fwnqj
	GPVgZLK/17v1WGiWGYIZY9SmkCEIlkXj4Hp+FubZOHKUeJqyr1iYu+90+m5C5kE=
X-Gm-Gg: ASbGnct7P4yOS4AOIZQBWuCHhP7k4UzcXiUge5+jhA7F3yRgGP8LgtzbvfBgmbfpsfJ
	/t9HiD0kAaSxoDxa8JcMOOKtzz5FiPSQawtWKMT7Nb3rPiAwWiCGACQKMdZ3fOoPWmCAxkc2uJ8
	R1JM1W2k787LL9KVvTpJmTZPyfCVNjJYV84/YPjmfuBL9LuGIL9wk++ff86gkt3LV/Oj2ShVXaN
	QUswMKWVSpbgfQMzUr5cYZZliZlka9n5aZpSwjdtL6QVdUqPS9Hmb4kZuTGg7Na7ua17FyC8p5D
	nRZZzwRl2rRUwMTnxHh7dqEZ1Ms+FLEugLtwI5k=
X-Google-Smtp-Source: AGHT+IHEJGxfKm/XxR5HOi6egCzTPsETR1qnlZiOaKKIny+VHepRdiI6w/LjA3M3OvHKbwmvA+nh+Q==
X-Received: by 2002:a05:6602:3f0b:b0:84a:5201:570b with SMTP id ca18e2360f4ac-854006dfe26mr2249929239f.0.1738614294882;
        Mon, 03 Feb 2025 12:24:54 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ef58sm2399719173.5.2025.02.03.12.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 12:24:54 -0800 (PST)
Message-ID: <237ce4e3-d66f-43ee-bd4e-38007dc750e5@sifive.com>
Date: Mon, 3 Feb 2025 14:24:52 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: clock: Add bindings for Canaan
 K230 clock controller
To: Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
 <20250203-b4-k230-clk-v3-1-362c79124572@zohomail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250203-b4-k230-clk-v3-1-362c79124572@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-02-03 8:49 AM, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the new clocks available and
> the required properties to configure them correctly.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 43 +++++++++++++++++++
>  include/dt-bindings/clock/canaan,k230-clk.h        | 49 ++++++++++++++++++++++
>  2 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  reg:
> +    items:
> +      - description: PLL control registers.
> +      - description: Sysclk control registers.

From the way the driver is structured, this looks rather like two separate
hardware blocks, not two groups of registers for a single hardware block. For
example, the driver registers two clock providers for the same DT node, with
overlapping indexes. This doesn't work. Either you need two separate DT nodes --
one for the PLLs and another for the sysclks -- or you need to include the PLLs
in the binding header below at non-overlapping indexes.

Regards,
Samuel

> +
> +  clocks:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x1000>,
> +              <0x91100000 0x1000>;
> +        clocks = <&osc24m>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..47d966fda5771615dad8ade64eeec42a9b27696e
> --- /dev/null
> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef CLOCK_K230_CLK_H
> +#define CLOCK_K230_CLK_H
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
> +#define K230_CPU0_SRC			0
> +#define K230_CPU0_ACLK			1
> +#define K230_CPU0_PLIC			2
> +#define K230_CPU0_NOC_DDRCP4		3
> +#define K230_CPU0_PCLK			4
> +#define K230_PMU_PCLK			5
> +#define K230_HS_HCLK_HIGH_SRC		6
> +#define K230_HS_HCLK_HIGH_GATE		7
> +#define K230_HS_HCLK_SRC		8
> +#define K230_HS_SD0_HS_AHB_GAT		9
> +#define K230_HS_SD1_HS_AHB_GAT		10
> +#define K230_HS_SSI1_HS_AHB_GA		11
> +#define K230_HS_SSI2_HS_AHB_GA		12
> +#define K230_HS_USB0_HS_AHB_GA		13
> +#define K230_HS_USB1_HS_AHB_GA		14
> +#define K230_HS_SSI0_AXI15		15
> +#define K230_HS_SSI1			16
> +#define K230_HS_SSI2			17
> +#define K230_HS_QSPI_AXI_SRC		18
> +#define K230_HS_SSI1_ACLK_GATE		19
> +#define K230_HS_SSI2_ACLK_GATE		20
> +#define K230_HS_SD_CARD_SRC		21
> +#define K230_HS_SD0_CARD_TX		22
> +#define K230_HS_SD1_CARD_TX		23
> +#define K230_HS_SD_AXI_SRC		24
> +#define K230_HS_SD0_AXI_GATE		25
> +#define K230_HS_SD1_AXI_GATE		26
> +#define K230_HS_SD0_BASE_GATE		27
> +#define K230_HS_SD1_BASE_GATE		28
> +#define K230_HS_OSPI_SRC		29
> +#define K230_HS_USB_REF_50M		30
> +#define K230_HS_SD_TIMER_SRC		31
> +#define K230_HS_SD0_TIMER_GATE		32
> +#define K230_HS_SD1_TIMER_GATE		33
> +#define K230_HS_USB0_REFERENCE		34
> +#define K230_HS_USB1_REFERENCE		35
> +
> +#endif /* CLOCK_K230_CLK_H */
> 

