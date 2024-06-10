Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBB0757EB
	for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 10:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718013854; cv=none; b=uerAdIrsWh9oY0Lp94h7wK89y9T0fOhyPuYyc4WYlT0K5gPJKpDRqSLQPP9wEdqCS/u94b6wZVkZCTLX0VzLTUrjc6KGFU3T0Y4eV2igBMSaBr9lxVRupNxVpL4vtzZETY3Sd+AEMAWhh5P7yjlfp3mTkCt0vrrH9p7xoLqYB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718013854; c=relaxed/simple;
	bh=M+z9EGehKc7WekRDesUv7b2e6+dLTQHN5H+ZQO0R5LA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pG+3lJIu45VIqK8AtC3MAmhnTQPuE2VxdcSVbYzY8maUbNkuFe62xYZniLrO34RdonfhYJFSinE/K/j8+geYEVlIWNu1HLVhxcJQeCy0bKhwV1yA3v9EqoNgp2BHHjIZQzSJofFKGspfNfg5hDVIz3v+YvxorYHIiOG1f3js76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p4fUkysN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p4fUkysN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f275c7286so423772f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718013850; x=1718618650; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgW8B70Q8zX7acFGE+7FKzyC1rI3PYnZTOkuVMqMUeM=;
        b=p4fUkysNAAmS3y6BvkkKl96K1aimot1o+27iV3h8jsAJt2J0oDjoEHQwARrrDRU1+9
         J3SlTk7QaYoQhhBMydqdopBM4xSDFInp2E8VWVaESmUR6o5pJz+AxiMtg6tixUbzFn/3
         t1+KfW8AX+IWqzM8whW2HHyYjrn1vtiTmGIzaaQ7Z1C/Z9s/itAWG2y+JhZYXqku0dfN
         Pa5uIXMGsCitU4MzV0+dga0dg3gRWxz5llPYeRd+CSK85s0aSvA79YQkrvobY6bXlKNy
         OcU7NgFFqgjL06UzvZ5nglK8L+fHfxMBk3ocq2DR+lomrRcLVchJ1ENH691HJXTnmgc5
         yfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718013850; x=1718618650;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgW8B70Q8zX7acFGE+7FKzyC1rI3PYnZTOkuVMqMUeM=;
        b=eWw3p6v4ElCS8BzXS/oIW6hS5Sa8TrHQh25kTAWM8zoLEmXAQYvdeZ5QVHgHDqwdCr
         fm/5EjcAUdIraqynErS1w+UqxX4wRMSXdzAWQ2m0bAg+CI6TKEPZ6fD4QzgWZ07I09az
         9ZA18dMHrMr2otEfp7MevK5KN/CeWmHIKka6AigVTOL40ln1Bz+BUAEMnhnUpMRlemIU
         jWtyynxAiEYxr3NIXaP27rVy7hfbLz9aBBnfNmkYoYehUo0JN0AHtkcmJunxa1k9tJ2g
         /DxgTSWqQwMYBh4jiXs7+l/0j34f/vuO9E6f9lNzr6Wpuy5FG8R5phr6iTarYdu+9My+
         fgNw==
X-Forwarded-Encrypted: i=1; AJvYcCULCSu5UjeKm11kFHifgS8eXTRJ573bE98F/XMryKQ0QKQlb/K1zScz6EIvU+iU4QzkB5Pj4RS8gx3hgjzNyT10SP1i49Hh02S6
X-Gm-Message-State: AOJu0Ywfab4qUhe+1SmS+8cUYUZYDrTpmoa/qzYJCHk1aw95EfQeiYcU
	B/5BeXHCpiHWhjHjaexddCaDT918OD7zB0rqiiYlRPtPrDTO6b4J2WZNvulW2y4=
X-Google-Smtp-Source: AGHT+IGSgkd3LqLIyxqDoIX0DW/WYOv65XykZ7jmOpZ9kbZonCQsXNHJT+NKtkJEDBC3j4DrawCjIw==
X-Received: by 2002:adf:f6c4:0:b0:35f:16a4:6b99 with SMTP id ffacd0b85a97d-35f16a46c11mr2450784f8f.4.1718013850018;
        Mon, 10 Jun 2024 03:04:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0e49e898sm6844132f8f.22.2024.06.10.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:04:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: meson: add A1 CPU clock
 controller bindings
In-Reply-To: <20240515185103.20256-7-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:29 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
	<20240515185103.20256-7-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:04:09 +0200
Message-ID: <1jtti1p10m.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> Add the documentation and dt bindings for Amlogic A1 CPU clock
> controller.
>
> This controller consists of the general 'cpu_clk' and two main parents:
> 'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
> fixed clock, while the 'syspll' serves as an external input from the A1
> PLL clock controller.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> new file mode 100644
> index 000000000000..f4958b315ed4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a1-cpu-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A1 CPU Clock Control Unit
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Dmitry Rokosov <ddrokosov@salutedevices.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-cpu-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input sys pll
> +      - description: input oscillator (usually at 24MHz)

According to the documentation, fdiv5 is also an input of the CPU clock
tree.

That is typically the kind of things we'd prefer to get right from the
beginning to avoid modifying the bindings later.

> +
> +  clock-names:
> +    items:
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: sys_pll
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@fd000000 {
> +            compatible = "amlogic,a1-cpu-clkc";
> +            reg = <0 0xfd000080 0 0x8>;

If reg is <0 0xfd000080 0 0x8> then node name should be clock-controller@fd000080

> +            #clock-cells = <1>;
> +            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +                     <&clkc_pll CLKID_FCLK_DIV3>,
> +                     <&clkc_pll CLKID_SYS_PLL>,
> +                     <&xtal>;
> +            clock-names = "fclk_div2", "fclk_div3", "sys_pll", "xtal";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> new file mode 100644
> index 000000000000..1d321c6eddb7
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
> + */
> +
> +#ifndef __A1_CPU_CLKC_H
> +#define __A1_CPU_CLKC_H
> +
> +#define CLKID_CPU_FSOURCE_SEL0	0
> +#define CLKID_CPU_FSOURCE_DIV0	1
> +#define CLKID_CPU_FSEL0		2
> +#define CLKID_CPU_FSOURCE_SEL1	3
> +#define CLKID_CPU_FSOURCE_DIV1	4
> +#define CLKID_CPU_FSEL1		5
> +#define CLKID_CPU_FCLK		6
> +#define CLKID_CPU_CLK		7
> +
> +#endif /* __A1_CPU_CLKC_H */

-- 
Jerome
