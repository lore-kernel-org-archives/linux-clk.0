Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gOPQnOre"
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7813D10E7
	for <linux-clk@vger.kernel.org>; Sun, 26 Nov 2023 23:08:11 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-54b1812ae1fso2182827a12.1
        for <linux-clk@vger.kernel.org>; Sun, 26 Nov 2023 23:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701068890; x=1701673690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ1qy9BZ1qyfzs89N8Lb4GIR3Gihkdl8F0LLaK//4UY=;
        b=gOPQnOrevzuHg7eZNx1QNko64SZIxRNsay6+K0unnZpZGfjTF4CGVjCfrd0Q392RlW
         eqbksCMu3ajcZE72a3UxvqJxL7/LSU0IqhnWLs0D2TxLuGJrGxuYzC0Y3AG5IaEd6bq4
         rjUY6XOTYg74fss3aCWdWMJdK10SozNss/mWa3z6PyTk7uPXOIV+30JyhV0LDZA5I3Vf
         39BojEzT1iGrmUj/+BXxmSOG7PwgrIkMKBxQ8QmSfQpmNvFnPKkov6AzZnEmicVy7vgf
         LbLyq1Df3zSeIPR7+w0QWMw38YTsFkFw5TOVYJ6HVzlnSH1ztS/5LvofVrqf41/yRBMi
         owSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701068890; x=1701673690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQ1qy9BZ1qyfzs89N8Lb4GIR3Gihkdl8F0LLaK//4UY=;
        b=Ib1xo5ysdjalT3m3maxzf9nCxW6b+bWO6KawS9+EYrcv4XaLmPDXRv0DKW6JeHUfXP
         RGcmJ6aFGxb9H/aqNOhtIV7f93hmKFXPfOQSRUHakD/mwysS7DP5+p20sJef/MaTdI6A
         pxQIC2mo6BGqsm20UNYNjJ8OsOB2EUhBO0SbiZwNfN4cR/b4diHHa/P4Z4z59eXFx4G0
         /oENQ/A4f1OF32PflNa4/rkEiKeIf5QbTvraU+tVUFlInb0k5NDLwG0HU/THp2HRGl1k
         U4KtXLTWNyiFbKSh2odzUKg/6DCXUlaE3fXnQlTLSZDm6agNxifwNnfrYM09P6fqzp2p
         cUlg==
X-Gm-Message-State: AOJu0Yx+YVqRtwXSCsj/gZ6zvvO7yJPYxOnP7EZC9L52ZJKGisGEKNEh
	B+u7qM1OO2HXkIS1u1uyriZlGS/CSkTblTJOZLy4Aw==
X-Google-Smtp-Source: AGHT+IGH7O+miI+brl+xKCrg1b8t98lW5NTcL9cIQCtR5/gZdcYoYLc3+Erif3+bYvGTSzPOxIqK1g==
X-Received: by 2002:a17:906:207:b0:a0b:6873:45b1 with SMTP id 7-20020a170906020700b00a0b687345b1mr4941856ejd.39.1701068889899;
        Sun, 26 Nov 2023 23:08:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063f8a00b009f8af454d0dsm5350041ejj.112.2023.11.26.23.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 23:08:09 -0800 (PST)
Message-ID: <e74740c2-7d61-4dfe-ae88-4ead6d72ea5a@linaro.org>
Date: Mon, 27 Nov 2023 08:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sophgo: Add SG2042 bindings
Content-Language: en-US
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
References: <cover.1701044106.git.unicorn_wang@outlook.com>
 <aea19fcddcb0aec54b2779fc99b5ac6c1e465fe0.1701044106.git.unicorn_wang@outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <aea19fcddcb0aec54b2779fc99b5ac6c1e465fe0.1701044106.git.unicorn_wang@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 01:58, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the clock generator on the SG2042 RISC-V SoC.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../clock/sophgo/sophgo,sg2042-clkgen.yaml    |  42 +++++
>  include/dt-bindings/clock/sophgo-sg2042-clk.h | 169 ++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
>  create mode 100644 include/dt-bindings/clock/sophgo-sg2042-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
> new file mode 100644
> index 000000000000..6c0d0461e489
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/sophgo/sophgo,sg2042-clkgen.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 Clock Generator
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-clkgen
> +
> +  clocks:
> +    items:
> +      - description: Clock Generation IC (25 MHz)
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/sophgo-sg2042-clk.h> for valid indices.
> +
> +  assigned-clocks: true

Drop

> +
> +  assigned-clock-rates: true

Drop

> +
> +required:
> +  - compatible
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller {
> +            compatible = "sophgo,sg2042-clkgen";

Use 4 spaces for example indentation.

> +            clocks = <&cgi>;
> +            #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/sophgo-sg2042-clk.h b/include/dt-bindings/clock/sophgo-sg2042-clk.h
> new file mode 100644
> index 000000000000..a8e05c00c3bf
> --- /dev/null
> +++ b/include/dt-bindings/clock/sophgo-sg2042-clk.h

The same filename as binding.

> @@ -0,0 +1,169 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */

Any particular reason for a bit different license than the bindings? How
is your DTS licensed?

> +/*
> + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__
> +#define __DT_BINDINGS_CLOCK_SOPHGO_SG2042_H__
> +
> +/* Divider clocks */
> +#define DIV_CLK_MPLL_RP_CPU_NORMAL_0 0

Missing tabs before each value.



Best regards,
Krzysztof

