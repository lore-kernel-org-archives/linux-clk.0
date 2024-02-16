Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAD1BDE6
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708077720; cv=none; b=qAZ2HDwzLBVLdvZJqz3CNxqu/UjuhXJI3C0CFoNn7eFDMayjptwN9D+Let/Bxt0Cxmj+imgDiNP3IZxHRH1tfRVuWjf/Zt+QvmLA5+4qCSjYKms5L+pg6IKWE9C4Ij3YQErwYnKmNLm6Sbm6gXIy4dD+FbHpTnDKPs/4kirXp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708077720; c=relaxed/simple;
	bh=Z/XYm/vM4VgY5V4BXr3It7TP+acCcU3YNhxxirBHWfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ee5QEry/DJqTkR3izLFSemk4ajfCyYq7GLAxU8AR5KiPYuXQWn2l3ln3tR3sOgPb4B+ikc6TZeurYVrHZu0zUVd3hHYNGMg6swWWFtD4LYt1aT3Pbn1D4wXmB6F7nOZz6Zif6dMDW7xeKOaj/bpNfPsGwcQmdoAwT6GckLzhoKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6ZM2JI5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6ZM2JI5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so239982066b.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 02:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708077714; x=1708682514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QT/ux1VatBXPTZcSq/MG2mossW5fK3VfSxozRaV9SI=;
        b=U6ZM2JI5rZlgLyBaVP2LQtnne4Ky2Zl2wfQ371HRFAXg0Ose1YkBDACG381KDjUsLM
         gh5hiXemRBy7xBT6LZJt2Fsfh2FGXHdyjXo1OQv2dBOkbv0iZ3Ew0zos5aHQb6DFqPWe
         Sz+OH+fDGZ3vocBz7ZJ6bqSUlp9+MCdtdynznoWXTh6k9KNnRsCjZ8JuDO/+GYx+yAWy
         9sE03iJ48QKJA5quZBduylmYU7vx1qjWVFJn3WT5/t3bk3/NC2f1Xea/5X8w4R5zbsWg
         ald+klkHmLqIkoHkoggfgCbc7skTdjAR9Cv15GrAhlZDgd7wvnLv2D9w+CtLM4Rf5vvF
         EYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708077714; x=1708682514;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QT/ux1VatBXPTZcSq/MG2mossW5fK3VfSxozRaV9SI=;
        b=WXA310Ufn2GqbJuV7pk0jA4SysI15RgJE6XfWDykoP0M3LLXYWKA2CvILEuVysZBIa
         dqbfyBWqTyADQcXlRi7S2BTILAKgtTDevRnJf7j1jocctDHq6+gKlbcTqHvUmTCvAmU5
         6W8+65aBjLPfjiK2t0OHmjzYdNjNU1i2YjhfWg7mdzS95tVg4nfmNRs1nr53bs4i4NFP
         q0Vgf3uvTx5BKU1KeG+8FskI+TT2LwMC8eEJsgyoRpa3+ryw4wp2cWnI5PqKlOi/0v1w
         suRtIb694XXtKwD94N2qhZHKN3qu0mBe5fhk+wj5xOcmgpbWj6ApiSsuAs0zh1MGcKoj
         XKjg==
X-Forwarded-Encrypted: i=1; AJvYcCVpRDCBsIaQQW/owsBAvIihCdkAeMeHuOSoi4lFvWFIEFY7wr0YLztGMVTQfUAOq6fvvGk+c6onM59aY/XTApmXXz9J80KwDtzY
X-Gm-Message-State: AOJu0YxeqM+dIwe9l+QGzq2aPnBLb9KRS0Zl4lY0t1ch2XCGsIYD6KhV
	uoFK5y8YGqiorqfu+p1rVeE8tE+bF3H8OEPY/vy9bPSGzua7sZ1F5BNOpiJe9a8=
X-Google-Smtp-Source: AGHT+IGgpuj+6MrK/exz/vLTKC/yIxnfx058qaJM+QEM56Ti2Co8gAQl68udOr78c7mrUFcO79WD2A==
X-Received: by 2002:a17:906:3659:b0:a3d:1fad:e37d with SMTP id r25-20020a170906365900b00a3d1fade37dmr2718584ejb.20.1708077714491;
        Fri, 16 Feb 2024 02:01:54 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id ty8-20020a170907c70800b00a3d1b3c5f1esm1400467ejc.77.2024.02.16.02.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 02:01:54 -0800 (PST)
Message-ID: <fd3b7ab7-3702-412f-947a-95396dbe1f4c@linaro.org>
Date: Fri, 16 Feb 2024 11:01:52 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: media: Document bindings for HDMI RX
 Controller
Content-Language: en-US
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 dmitry.osipenko@collabora.com, sebastian.reichel@collabora.com,
 shawn.wen@rock-chips.com
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-dt@vger.kernel.org,
 linux-arm@lists.infradead.org
References: <20240216094922.257674-1-shreeya.patel@collabora.com>
 <20240216094922.257674-3-shreeya.patel@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216094922.257674-3-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 10:49, Shreeya Patel wrote:
> Document bindings for the Synopsys DesignWare HDMI RX Controller.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> ---
>  .../bindings/media/snps,dw-hdmi-rx.yaml       | 128 ++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> new file mode 100644
> index 000000000000..a70d96b548ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-3.0 OR BSD-2-Clause)

Use license checkpatch tells you.

> +# Device Tree bindings for Synopsys DesignWare HDMI RX Controller
> +
> +---
> +$id: http://devicetree.org/schemas/media/snps,dw-hdmi-rx.yaml#

Why this is a media, not display? Does RX means input? Lack of hardware
description does not help?


> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI RX Controller
> +
> +maintainers:
> +  - Shreeya Patel <shreeya.patel@collabora.com>
> +

description:

> +properties:
> +  compatible:
> +    items:
> +      - const: rockchip,rk3588-hdmirx-ctrler
> +      - const: snps,dw-hdmi-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: cec
> +      - const: hdmi
> +      - const: dma
> +
> +  clocks:
> +    maxItems: 7
> +
> +  clock-names:
> +    items:
> +      - const: aclk
> +      - const: audio
> +      - const: cr_para
> +      - const: pclk
> +      - const: ref
> +      - const: hclk_s_hdmirx
> +      - const: hclk_vo1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: rst_a
> +      - const: rst_p
> +      - const: rst_ref
> +      - const: rst_biu

Drop rest_ prefix

> +
> +  pinctrl-names:
> +    const: default

Drop

> +
> +  memory-region:
> +    maxItems: 1
> +
> +  hdmirx-5v-detection-gpios:
> +    description: GPIO specifier for 5V detection.

Detection of what? Isn't this HPD?

> +    maxItems: 1
> +
> +  rockchip,grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the GRF register.

Instead describe what for. Basically 80% of your description is
redundant and only "GRF register" brings some information.


> +
> +  rockchip,vo1_grf:

No underscores.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the VO1 GRF register.

Same problem.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +  - pinctrl-0
> +  - pinctrl-names

Why? Drop.

> +  - hdmirx-5v-detection-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/rockchip,rk3588-cru.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/rk3588-power.h>
> +    #include <dt-bindings/reset/rockchip,rk3588-cru.h>
> +    hdmirx_ctrler: hdmirx-controller@fdee0000 {

What is hdmirx-controller? Isn't this just hdmi@?

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +      compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
> +      reg = <0x0 0xfdee0000 0x0 0x6000>;
> +      interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
> +                   <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;



Best regards,
Krzysztof

