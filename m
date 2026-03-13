Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FAA3314B7
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410774; cv=none; b=nN7Et/TLNCQb9iP4jc0+LafoHoVwkQxAE3PeD5SzDfAMbckj7wWVznhFw/WVi1tnWXj1UmqquffqdL3Dr+5sd8ugNQl3HdaWa80bnuWYOthkhR3vkorLq0LauFVDAC1Jh28onJ0NVUwFZbVASfeZrbEt4ukCrBkvbDSlwGvMmz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410774; c=relaxed/simple;
	bh=Wo9P0OvFu5Q/66npS57S4aKOuZktzVuLsj7oQRamu9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYOpZ3TWx1YjOgUQw5ZOhH3CnFD3HDoHgIGcQnWPPOluL35Eo8k1ExITO8n5ImfZXTmiY2KcWj/xMMohETUGRSAaz5rHsVstLl7Etz18Pw86Km3J5n6Bcf+9l/V7Y514eMs3JQsFc+5ibDOnDcsXbgYoM2Z3213u8aFhnbR3uxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-600404dbea3so1394167137.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 07:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410771; x=1774015571;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISrMP7lkY0Gwayd/no0kP3RKtW7L8snMqqKoKdEo9Io=;
        b=oH5r6CEequ2bI5Ueb0aUMEbXexRO2URS8/d5frQWMW+LYzHGoHXzn8G1QmNUjBpbmg
         D54BNkKVbHrz3PSDDEC1nkRv1TuIC6jcnHAq9z6ZQwSvpLXXi2p85TRa+p/aR/6xH0R+
         1c/eTLs6sKDpfwvTzu3womOBO/6eMrIhLctncrMRAGrgJN7Zj3ZaypwUBqRBW+bRJOmt
         5nNDKAgy/e2dwzMGGSynS2SityRHM9uMslC0anjkfkyGMvvbkLnrY/v6HvhZYGK/qjeT
         nlY/Ohlb79O7TT5KAN6xQlJqgGUienHqADzqw5yO6ufrpNWrmMTfuPuMKQO/+r//Gsm2
         Fwnw==
X-Forwarded-Encrypted: i=1; AJvYcCWO+3DmSRrhtrH+HXqzBNh2rYrXFPciUWpxc19cC2l4k8JN7CuI3fno085cWYZUOEUqJJdLTcKhrko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHnM+NLRUsy+CPeF8wHoNfA+W4BrC4H9KehC5H03XpoWxwj9W
	PMtKuBoKJXiPWAHEC1OEafWVgyNfSb7+6CJRFh/db/YBDx5STChHlXliXOBak59K
X-Gm-Gg: ATEYQzze8WcKt8fTAGYkdmxid5D22WeffgrWxcC7315i/OtLW0vRm4dg/gwlLgCise4
	LWG6W3vkZ1+BfTY89H/4lBk+9nDC0yIvxdqTYmCCCjVhDCO8foAXG1quSYD3In4L/z1Szhfugfq
	hIhsb5pw/T5o049exAo1wPfXg0Z6hcV6VVa2yH6AZ6pmg+b5AUDt5GBwj1hhR/AgS0MGUuAyRLG
	KTGigGava6rTYrpq+4XBHsRy0k38psPWuVsU8zuidVDR/J3D54ApArW+Vpo+dBKLKuUy8G1xYPd
	V70rqD4SdCW+k7iIy8L9HZrcQm/ciAkz6onqq1wqebm1Spiz8FS+bWe8jYReXgCRwiVh4vbH7Xj
	JrZlOeMylAjwK66THlNG2SL3metlds9cRcAtPvvUz+4H05orl/eeND9YA1N8YI4FV4Cgho1BS65
	467Tk7MS9cCfdC+JnlTC+YmBh0k3eftSgPFfxc37CfQojnm7PwZVwqt1mrM3eKIV5z
X-Received: by 2002:a05:6102:2907:b0:5ff:d192:ff22 with SMTP id ada2fe7eead31-6020e8af3eemr1606427137.19.1773410771331;
        Fri, 13 Mar 2026 07:06:11 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deaa379asm3261888137.8.2026.03.13.07.06.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:06:08 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56b65ef9441so592595e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 07:06:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBffjMr6AsD+GYG5p5pRY5b7D5t6lgZKrSuyYdBBccGq0MFr2/gv/Xk783iy3QARc2hZioVivDiOg=@vger.kernel.org
X-Received: by 2002:a05:6122:4219:b0:559:6092:936c with SMTP id
 71dfb90a1353d-56b629213e5mr1521906e0c.12.1773410767533; Fri, 13 Mar 2026
 07:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com> <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 15:05:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
X-Gm-Features: AaiRm50baEw2pzLDwGKmHfiVoIio9lIXgG4IiYSq7bUGte8xcq7IbKlQNDwy-y0
Message-ID: <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 5 Mar 2026 at 16:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document the device tree bindings for the Renesas RZ/G3L SoC Clock
> > > Pulse Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has 5
> > > clocks compared to 1 clock on other SoCs.
> > >
> > > Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock,
> > > module
> > > clock outputs, as listed in section 4.4.2 ("Clock List r1.00") and add
> > > Reset definitions referring to registers CPG_RST_* in Section 4.4.3
> > > ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > @@ -28,19 +28,30 @@ properties:
> > >        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
> > >        - renesas,r9a07g054-cpg # RZ/V2L
> > >        - renesas,r9a08g045-cpg # RZ/G3S
> > > +      - renesas,r9a08g046-cpg # RZ/G3L
> > >        - renesas,r9a09g011-cpg # RZ/V2M
> > >
> > >    reg:
> > >      maxItems: 1
> > >
> > >    clocks:
> > > -    maxItems: 1
> > > +    minItems: 1
> > > +    items:
> > > +      - description: Clock source to CPG can be either from external clock
> > > +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> > > +      - description: ETH0 TXC clock input
> > > +      - description: ETH0 RXC clock input
> > > +      - description: ETH1 TXC clock input
> > > +      - description: ETH1 RXC clock input
> > >
> > >    clock-names:
> > > -    description:
> > > -      Clock source to CPG can be either from external clock input (EXCLK) or
> > > -      crystal oscillator (XIN/XOUT).
> > > -    const: extal
> > > +    minItems: 1
> > > +    items:
> > > +      - const: extal
> > > +      - const: eth0_txc_tx_clk
> > > +      - const: eth0_rxc_rx_clk
> > > +      - const: eth1_txc_tx_clk
> > > +      - const: eth1_rxc_rx_clk
> >
> > Are you sure about these four clocks? On which pins are they input?
>
> From Figure 4.4-5 Block Diagram of the Deformed Clock System (4), page 789
>
> These clks are external source clks connected to CPG_ETH_SSEL mux for
> selecting rx/tx clks.
>
> In RGMII case, currently on RZ/G3L SMARC EVK:
>
> For Tx: we select DIV_ETH0_TR (SEL_ETH0A_SET)
> For Rx: we select ETH0_RXC_RX_CLK_IN (SEL_ETH0B_SET)

Sure, these clocks are indeed shown in that Figure, and referenced in
the CPG_ETH_SSEL register documentation, but where do they originate
from? On which pins are they supplied?

> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> > > @@ -0,0 +1,343 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > + *
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + */
> > > +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> > > +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> > > +
> > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +
> > > +/* R9A08G046 CPG Core Clocks */
> >
> > [...]
> >
> > > +#define R9A08G046_OSCCLK               52
> > > +#define R9A08G046_OSCCLK2              53
> > > +#define R9A08G046_CLK_P4_DIV2          54
> >
> > CLK_P4_DIV2 looks like a purely internal clock to me.
>
> Page 3918 Figure 7.9-1 Block Diagram of CAN-FD
>
> Peripheral clk,
> RAM clk,
> CAN external clk
>
> Then, CANFD clk which is DIV2 clk of Peripheral clk, so thought of
> modelling this as Core clk. I may be wrong here??
>
> Maybe I will drop this now and revisit later when we add support for CANFD??

That may be the better option.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
