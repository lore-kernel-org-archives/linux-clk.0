Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6A24A06A
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772720508; cv=none; b=DFi7wjW9TZGwZ7t+aGCn8wPJgn9DT4JoV1R3+8l4WdXve1WVfjXKFgenAY4qab6uAqoarpTygfXQ+eeJ7eMjv+EThuaIgOvX8ljvSezqUljjJ7mK4yYqV1w+V6LmqflKC0r7lVjanFwi2IefK6nniXSXpUbsjNFy5IjLkmc6law=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772720508; c=relaxed/simple;
	bh=rEhy/H/nCGCiHwzJthbPzEIukVehLVTNrC1dkGO/Qd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSNhBInEQIiuu4R65gFPLBnsFMMhTtoX69mLnylbnah2sC7vsFyScMO3eEobfxnIvYt9nYVSMotDb7+xrRNmVkGJYCNFpGr8i3AYwn7fyr1gNCvoSWS7ZHMPlJWABq0aEm976k2YlII2Sm6vDnS9LkfX8Pd+ZgrwSWOawBVL6OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9419139eb7so46929366b.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772720505; x=1773325305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXtAYRrzYSGErNFDdgbOo6Dg4VTIExI46uaNzGfcACQ=;
        b=B87yWpd/hWJphqxit1KO7WMqHp03OPmkLpl+N6IaOdFAv0r/Z8HMTj5udetawvA0rx
         fw+P5Nfa/XmT9eI3OOkw/IurSsPlj0TJ7xex+5CumlN6/5awSx8F9nw45bfKaWDQd7BJ
         QVzK95PpMd2PzaO35/vtdwnUW+hVnMigApKI+3gNoua4/0QE4ohkD/JhV+6J+dH8WDKg
         +NV4HFSsPR6B8NaJ2RRZIufQIpKJTsSTt29UlobWqqgDY1wBZTw5qqK6FD0uP49EUZ7/
         OcFUpEFeByKhYcNxyMPZM2kt6FWNfOH8pLVwZ0/ynCrCevrT7ML+aKeNXDIQBxKqYFt1
         7gNw==
X-Forwarded-Encrypted: i=1; AJvYcCXzJmCt4Mpl8nU+b+hOaqoT8bHxCKWpHyQvtzqh7C4AOSXWUFFYvfHQ1nacCtOdEK9rnSfz7c4Fb8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx75IBa4Rr6B5hssQTS8FPJkB4Uv6VNmBZQ+AMWAoJt2oidks/T
	31m35HgsW3viebbiewhYziTOdyxQtBhLqAKt/mHKUPqObLI/oO3RgQRysCkvAX2hBzk=
X-Gm-Gg: ATEYQzyO516A0fjvnky8ZQPsW8TNPmPLvrlfHyDRnP0bxaDlOVWpxmnRSZQJYSgDe2F
	w1NCQgNzJ7repbzSyx0IfGMrUjmrBcCq2LgjKxw1EoKtK674tfKiUG+gtbTurAQxdqwPTL3urEC
	XcKIIxrV04QDDDENs31kAQsEygEeBa9UQVg9K1YK/NlMXUE9ZXVMyMzxqQxH2DzXGWYz/aNrWwb
	xZleonDPrZIQMjw7umPS567R2Qa3fe8APepyTytBNMI0mjc6PWIKloBTgoUnEQJrjojQk8WFljw
	8jBSWB/O1CuWcagJHrzTHbTk0rIA2DzEMlrhisVMt5UkraOpWTMfBQ7LzrZaZC0ssyAxrhUJQ3f
	R89HAjKxxe3VjwK0HHphHh5H/kbo+gDA7vtKK9iIXgCXeWTM76VCzLqDcSFaR4sWUvKWiPJQGYk
	rxapuWY7hnDBZhSW6eJOKBYXRSjxPxB+SbMJPi2Vzul/99dYhoyn4Knz2udW+m
X-Received: by 2002:a17:907:701:b0:b88:775c:bd68 with SMTP id a640c23a62f3a-b93f13873aamr394045866b.28.1772720504749;
        Thu, 05 Mar 2026 06:21:44 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9383397fcasm784140466b.60.2026.03.05.06.21.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:21:41 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9419139eb7so46916466b.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjgUcWPlv3f1bNUhHi301eRXhW8FroQ45V5MGyMN7vjlQ378Qx1eQNK/2cXovwjGKP9PM6Kx6/Z0U=@vger.kernel.org
X-Received: by 2002:a17:906:7316:b0:b87:1fe6:f223 with SMTP id
 a640c23a62f3a-b93f10f8313mr358270066b.6.1772720500784; Thu, 05 Mar 2026
 06:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 15:21:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
X-Gm-Features: AaiRm51dLhVDp_IdfNbKoUzEcAGoO9N7tD3ybXTlfw77SuglDEgtVuQ3mKWaML4
Message-ID: <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse
> Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5 clocks
> compared to 1 clock on other SoCs.
>
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock, module

Core Clocks, as listed in section 4.4.1 ("Block Diagram of the Clock System")

> clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -28,19 +28,30 @@ properties:
>        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
>        - renesas,r9a07g054-cpg # RZ/V2L
>        - renesas,r9a08g045-cpg # RZ/G3S
> +      - renesas,r9a08g046-cpg # RZ/G3L
>        - renesas,r9a09g011-cpg # RZ/V2M
>
>    reg:
>      maxItems: 1
>
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Clock source to CPG can be either from external clock
> +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> +      - description: ETH0 TXC clock input
> +      - description: ETH0 RXC clock input
> +      - description: ETH1 TXC clock input
> +      - description: ETH1 RXC clock input
>
>    clock-names:
> -    description:
> -      Clock source to CPG can be either from external clock input (EXCLK) or
> -      crystal oscillator (XIN/XOUT).
> -    const: extal
> +    minItems: 1
> +    items:
> +      - const: extal
> +      - const: eth0_txc_tx_clk
> +      - const: eth0_rxc_rx_clk
> +      - const: eth1_txc_tx_clk
> +      - const: eth1_rxc_rx_clk

Are you sure about these four clocks? On which pins are they input?

>
>    '#clock-cells':
>      description: |

> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> @@ -0,0 +1,343 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A08G046 CPG Core Clocks */

[...]

> +#define R9A08G046_OSCCLK               52
> +#define R9A08G046_OSCCLK2              53
> +#define R9A08G046_CLK_P4_DIV2          54

CLK_P4_DIV2 looks like a purely internal clock to me.


> +
> +/* R9A08G046 Module Clocks */

[...]

> +#define R9A08G046_CRU_PCLK             65
> +#define R9A08G046_CRU_ACLK             66
> +#define R9A08G046_MIPI_DSI_PLLCLK      67

MIPI_DSI_PLLCLK is indeed not a gateable clock, so it should be a core
clock.

> +#define R9A08G046_MIPI_DSI_SYSCLK      68
> +#define R9A08G046_MIPI_DSI_ACLK                69
> +#define R9A08G046_MIPI_DSI_PCLK                70
> +#define R9A08G046_MIPI_DSI_VCLK                71
> +#define R9A08G046_MIPI_DSI_LPCLK       72
> +#define R9A08G046_LVDS_PLLCLK          73
> +#define R9A08G046_LVDS_CLK_DOT0                74
> +#define R9A08G046_LVDS_PCLK            75

LVDS_PCLK does not seem to exist, there is only a single reference to it
(but I can see where its gate bit used to be ;-)

> +#define R9A08G046_LCDC_CLK_A           76
> +#define R9A08G046_LCDC_CLK_D           77
> +#define R9A08G046_LCDC_CLK_P           78
> +#define R9A08G046_SSI0_PCLK2           79
> +#define R9A08G046_SSI0_PCLK_SFR                80
> +#define R9A08G046_SSI1_PCLK2           81
> +#define R9A08G046_SSI1_PCLK_SFR                82
> +#define R9A08G046_SSI2_PCLK2           83
> +#define R9A08G046_SSI2_PCLK_SFR                84
> +#define R9A08G046_SSI3_PCLK2           85
> +#define R9A08G046_SSI3_PCLK_SFR                86
> +#define R9A08G046_USB_U2H0_HCLK                87
> +#define R9A08G046_USB_U2H1_HCLK                88
> +#define R9A08G046_USB_U2P0_EXR_CPUCLK  89
> +#define R9A08G046_USB_U2P1_EXR_CPUCLK  90
> +#define R9A08G046_USB_PCLK             91
> +#define R9A08G046_USB_SCLK             92

USB_SCLK is not gateable, so it should be a core clock.

[...]

> +/* R9A08G046 Resets */

[...]

> +#define R9A08G046_RSCI2_TRESETN                114
> +#define R9A08G046_RSCI3_TRESETN                115
> +#define R9A08G046_LVDS_RESET_N         116

Missing BSC_X_PRESET_BSC?
It could be added later, but you do list the corresponding module clock.

> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */


The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
