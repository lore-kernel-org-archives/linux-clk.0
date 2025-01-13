Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2921AB51F
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 17:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736790640; cv=none; b=WAA3yfeaxFLWdaftQ+egyTa9hV7ZQVBIpv55CRPrRhZQquTh1XlrWC07lvnNQdkWL8gzh/gZST8g3l8aWoqFo9IlABQ03KfzuCV4870bfpd+4hgpqxrOzoLnZZnxRKJ9FivUKkd02lOI1JaOH948pbYjH827tGTCjumR/Fb+gWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736790640; c=relaxed/simple;
	bh=mzNBb2csGN8G7oSicyy8WaikwI6wEKSOUUQ5bbbVypM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EaUyF+9HsdoT21reALelooM2SOEHRQLHt0Rrg02dgWb1l+56/LU9SZ6XJ9gAgVSBGa6x9dWi0dXCCMBDL3FK9ku1me5gZLtki6D9HSgVNnyv6ksx+trK9kXDo3AiCB7BlDZciKG1yey2mZXTvhP5me8qJNoIeZ/iGwRG6i1o7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dOQmKSg1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dOQmKSg1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385deda28b3so2584140f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 09:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736790636; x=1737395436; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V4+ss7VmfFv1ZzmIjUW4cCV/+dSLMs2iLGWhoJnQnc=;
        b=dOQmKSg1hacYywRC/6nlluyQwsGP066JUBbr72OsHLQbprJRpFxJL3HJHsNGfrUPCW
         wfQVwsDI1Pz+Mgn2zHkIh+XdeLgmBD7HzxW42UXi8/y3bZtJfO/es/SrVuMMj5Zy2hFD
         J0gm246irO50dfa9PKMiknG9G9z7fSVXszO1mG9qSwliL9tpEcowi0xlc3L4qt0lzcBz
         Jqtim56d2uHQsNo34WHpSMldDpfhGr61eQeLYyX5FY6yJme5kFV7xUpUkhyEI0U4Ef6Z
         JKkhyUKhWm0Lbvm3P2cA7X37TNipZl/SH4G4CEGsJPgeptj2rsgZVJMyMFd7nALuiJ3f
         fX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736790636; x=1737395436;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+V4+ss7VmfFv1ZzmIjUW4cCV/+dSLMs2iLGWhoJnQnc=;
        b=WSdti4T4EOJ2Img59ZP2f6mOpt0oP/DVk4oI2ryz0AvowkWOygQ6PpcR3ujBbIh02o
         vGLwOwpizJN5FkDqHs3hNuIW593Gx1RCFbMiLE36L95ma9MNmuz6zkIDo5OPv79qvYQM
         4gTYz61mbTFGJWaVzSy9d2n0BYlk98O9lDNoT/6dc9uY/CiHpYA7ZvEwMPy8esB1kC0X
         C7pclakqwSHT+YaJ+iA6qosaP2D37na9l2Q/qmQDsb/2wb+pFD7NEJvSSY4T17AThLZv
         A/6AWXvp0GI3vHQjzObeMg7JgZ7w/IqFIIPA19F0niijw6TWxRXxR4VEzPld2/Kk/arZ
         Ogww==
X-Forwarded-Encrypted: i=1; AJvYcCWjjp0C+pP7AXCibDcXs/wYB4AXtA75HdrM78a7tDT8loVbPDGC/uHnozUDcMREJFyuFNpUSDnc8FY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80fvSWpc6pOqlvwz2EWKn6eyv+NiRaWUXdjlmpWgv8RnIDDGS
	icBqiL5EEm+FMflK5fI2+FeX7bIb8y9zT05ek3HUrweAkzuA5n5MJu2aCGPk0D4=
X-Gm-Gg: ASbGnctJoEvFpR3ZK9S7dfT1lTdd1MA6mEeZpeAO8i6vI/TlCi0pmN307tm4mQZV6GG
	l6U9EQLKOe7enun5vNquEWZlEuPWdL1lcm+HEM71+0MPBVV4toG8T8A7fd/wJHLipCEqEzd4V+D
	bd6Ot+BdTJgqih4fWJqsYMb3WFDZiTDX/4Fv+m+oFzgzQ5MaVvZCYt4a1yxHL/kG3nEq1CEPOC1
	hdKGq+ZhvUZdWf1UOnVrIM7fD/urEuDUFzVCp5/ryLRsU47sm3zovzR
X-Google-Smtp-Source: AGHT+IHoW/dJXXFDIaypQq5flb4uL8n3vMd3OOwNi9RrzsjX+joUmbyw1Xx/wzp9vW06KectOo11Ig==
X-Received: by 2002:a05:6000:4020:b0:385:e3c1:50d5 with SMTP id ffacd0b85a97d-38a87338fa8mr22388141f8f.48.1736790636460;
        Mon, 13 Jan 2025 09:50:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383df8sm12973781f8f.38.2025.01.13.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 09:50:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Dmitry Rokosov <ddrokosov@sberdevices.ru>,
  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
In-Reply-To: <20250110155404.GA2928945-robh@kernel.org> (Rob Herring's message
	of "Fri, 10 Jan 2025 09:54:04 -0600")
References: <20250108094025.2664201-1-jian.hu@amlogic.com>
	<20250108094025.2664201-2-jian.hu@amlogic.com>
	<20250110155404.GA2928945-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 18:50:35 +0100
Message-ID: <1j4j228uxg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 10 Jan 2025 at 09:54, Rob Herring <robh@kernel.org> wrote:

> On Wed, Jan 08, 2025 at 05:40:21PM +0800, Jian Hu wrote:
>> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>> 
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>  .../bindings/clock/amlogic,t7-pll-clkc.yaml   | 103 ++++++++++++++++++
>>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |  57 ++++++++++
>>  2 files changed, 160 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..fd0323678d37
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,t7-pll-clkc.yaml
>> @@ -0,0 +1,103 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +# Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,t7-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic T7 PLL Clock Control Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@amlogic.com>
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +if:
>
> Move this after 'required' section.
>
> Generally we put 'if' under 'allOf' because we're likely to have another 
> if/then schema on the next compatible added. If you don't think this 
> binding will ever get used on another chip, then it is fine as-is.
>
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: amlogic,t7-pll-mclk
>> +
>> +then:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: mclk pll input oscillator gate
>> +        - description: 24M oscillator input clock source for mclk_sel_0
>> +        - description: fix 50Mhz input clock source for mclk_sel_0

The rate is whatever the clock will actually be. Better not to mention
it in this doc.

>> +
>> +    clock-names:
>> +      items:

one being "input" and other suffixed "_in" looks really odd

>> +        - const: input
>> +        - const: mclk_in0
>> +        - const: mclk_in1

or just in0, in1, in2 if you are going with Rob's suggestion.
Having "mclk_" in the top level would be confusing.

>
> Move these to top-level and then both of these are just 'minItems: 3'.
>
>> +
>> +else:
>> +  properties:
>> +    clocks:
>> +      items:
>> +        - description: pll input oscillator gate
>> +
>> +    clock-names:
>> +      items:
>> +        - const: input
>
> And 'maxItems: 1' here.
>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,t7-pll-gp0
>> +      - amlogic,t7-pll-gp1
>> +      - amlogic,t7-pll-hifi
>> +      - amlogic,t7-pll-pcie
>> +      - amlogic,t7-mpll
>> +      - amlogic,t7-pll-hdmi
>> +      - amlogic,t7-pll-mclk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 3
>
> These are the 'top-level' definitions if that's not clear.
>
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@8080 {
>> +            compatible = "amlogic,t7-pll-gp0";
>> +            reg = <0 0x8080 0 0x20>;
>> +            clocks = <&scmi_clk 2>;
>> +            clock-names = "input";
>> +            #clock-cells = <1>;
>> +        };
>> +
>> +        clock-controller@8300 {
>> +            compatible = "amlogic,t7-pll-mclk";
>> +            reg = <0 0x8300 0 0x18>;
>> +            clocks = <&scmi_clk 2>,
>> +                     <&xtal>,
>> +                     <&scmi_clk 31>;
>> +            clock-names = "input", "mclk_in0", "mclk_in1";
>> +            #clock-cells = <1>;
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/clock/amlogic,t7-pll-clkc.h b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> new file mode 100644
>> index 000000000000..e88c342028db
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,t7-pll-clkc.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Jian Hu <jian.hu@amlogic.com>
>> + */
>> +
>> +#ifndef __T7_PLL_CLKC_H
>> +#define __T7_PLL_CLKC_H
>> +
>> +/* GP0 */
>> +#define CLKID_GP0_PLL_DCO	0
>> +#define CLKID_GP0_PLL		1
>> +
>> +/* GP1 */
>> +#define CLKID_GP1_PLL_DCO	0
>> +#define CLKID_GP1_PLL		1
>> +
>> +/* HIFI */
>> +#define CLKID_HIFI_PLL_DCO	0
>> +#define CLKID_HIFI_PLL		1
>> +
>> +/* PCIE */
>> +#define CLKID_PCIE_PLL_DCO	0
>> +#define CLKID_PCIE_PLL_DCO_DIV2	1
>> +#define CLKID_PCIE_PLL_OD	2
>> +#define CLKID_PCIE_PLL		3
>> +
>> +/* MPLL */
>> +#define CLKID_MPLL_PREDIV	0
>> +#define CLKID_MPLL0_DIV		1
>> +#define CLKID_MPLL0		2
>> +#define CLKID_MPLL1_DIV		3
>> +#define CLKID_MPLL1		4
>> +#define CLKID_MPLL2_DIV		5
>> +#define CLKID_MPLL2		6
>> +#define CLKID_MPLL3_DIV		7
>> +#define CLKID_MPLL3		8
>> +
>> +/* HDMI */
>> +#define CLKID_HDMI_PLL_DCO	0
>> +#define CLKID_HDMI_PLL_OD	1
>> +#define CLKID_HDMI_PLL		2
>> +
>> +/* MCLK */
>> +#define CLKID_MCLK_PLL_DCO	0
>> +#define CLKID_MCLK_PRE		1
>> +#define CLKID_MCLK_PLL		2
>> +#define CLKID_MCLK_0_SEL	3
>> +#define CLKID_MCLK_0_DIV2	4
>> +#define CLKID_MCLK_0_PRE	5
>> +#define CLKID_MCLK_0		6
>> +#define CLKID_MCLK_1_SEL	7
>> +#define CLKID_MCLK_1_DIV2	8
>> +#define CLKID_MCLK_1_PRE	9
>> +#define CLKID_MCLK_1		10
>> +
>> +#endif /* __T7_PLL_CLKC_H */
>> -- 
>> 2.47.1
>> 

-- 
Jerome
