Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4905934D394
	for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779704499; cv=none; b=chJxOj6Mu9t5iq71kl6L7zVPkOSn6EPD/vaUToRKV44tRwO/uo2LwG65S7tBxavd57JYZa09z81jRhWxlEbvcTxzBrlszC1w2fdubvyuildZaTRPr0hCo0FVz8kHrlMGZjd4FLryKY5+uLS+WKj3Y2Oln5cbKDJsu8bRrYsVB+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779704499; c=relaxed/simple;
	bh=p0HvZ3sT7POUm4/0PI1XUJ7a2BU4q/k/Mg+JR9ylYyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6snKY0+Vp+qpvvIwcrp+rBTtdglyWKosJB+5qbAN2Wgvt7q2xnqyJjj0pRHrMIK68i9j/teTv3bG2zBE1A58WCM/05C2tsrXRHCqrRFI5Ek2riqvVqrXfm8aFQHrNg+Wqp7nNpyeFTavaG9E7gUOXVsKAv7buXTZAMF+NLzuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-63124ac76f5so2912543137.1
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779704497; x=1780309297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N8nwhp2ksCBATTBgDUrbzFAvExrUr7ic1VBwQK9ofc=;
        b=Nm+uIClgHplhUdpIqjAER/D77gaVBReibNWwTZNsx8TD8C0oEEs0x6yQe66VmreUqC
         Uqte+i8pzBbTNpSwSRmLy7leg6D6RjqrZadBL12ZZmG5wG/LsqGNzyiu6tWcSNprw/vH
         EjowckPyjcpaFsgHiIONjUeoJMx7n8+Mys+U+Byn6AaLnKUof97//+kYU7Hcc08yO5ip
         bjGlkaOBKrJiAZMcu7LDBC4t/bcikK7v1PnANADAEvPKCaySAvyIK4rY5vGbiN0kWUsx
         SLNC1OvFixHJPo++NZA17lcWoqmPK5h30omLypGjkmuS2/VwBTN1qLWNEi4Wg7rVFvpw
         0Sow==
X-Forwarded-Encrypted: i=1; AFNElJ/8vj7spPmOPF0tK5N0f73/UxxEI4auhcunz7OxDkxKtOC3oPxVOXBWvPaZiOYcutBsj+lEMkxbeBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVOC9gmL2kIU8xwBdV9q7I0DtKtbLXIQFmxPlne3yJU4P8fV3T
	PTNVOgQxPQRb1Hs8eq9RT1Snho5xAkYLk0LupdXnuoh08IWqd5rWbIR/WUIcyiRE
X-Gm-Gg: Acq92OG4UpyjTLh+GepMM2LKVSizlCwIRhf35u1uKiys2GjrMb5n0AwkughyF9oral4
	M5WrLzbzScLYl5JUdDh62uaHh9XYOVBYyWFirUsVrSX5q26YP9DICXLYbygbeGFAZ1CnxIsUQ0W
	uBzRR0ta14mKRs8Oc/5rSq84Vn4iqGmqroKKqYkx89rF/1FKG4jNqbIwF5j1Y6T1PkOee2RwKdO
	yd+61VRdOwCWb2PTd1vvP9Q2n+NHnF8PXU0hYrZExyGV6L6YvjDrB+4e9sPtlU6q399Ho0MHD3p
	UlBVNT5PPNLuAxW+4iMjgNxZJ5jVYFqXO/ZDckpkCBaQKECj8fZtZps9UmKFcEXfCdV8Cf3k5Gn
	uJrFwvMErlo7AqAxA8CK3oiSaGAqbTlLz1F5Tr9H1q/S2Oky7stzzpsHXsKnSocreAjOO/q+1Cv
	C8ha0T7onrRtVg9DM69zM8PmmuLVwsUHQ3vwxdaDc7aFK2QqrxM7JUBJBtk9Z9QRip
X-Received: by 2002:a05:6102:14aa:b0:604:ec90:ba14 with SMTP id ada2fe7eead31-67c817f0aaamr6006923137.11.1779704497156;
        Mon, 25 May 2026 03:21:37 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850c32sm9316109137.2.2026.05.25.03.21.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 03:21:36 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57513ac61f0so2976104e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 25 May 2026 03:21:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LkWGtmlB0HyaZ6uQtgT2y7wk61PEeIHi9GZXYvplVR095jd+l7Qcpd+fjTwLnqInYetoA9x/GbGs=@vger.kernel.org
X-Received: by 2002:a05:6122:2215:b0:56c:ce8a:b07a with SMTP id
 71dfb90a1353d-58660d810c9mr6371489e0c.7.1779704495972; Mon, 25 May 2026
 03:21:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
 <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260522172000.15096-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 May 2026 12:21:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
X-Gm-Features: AVHnY4JxX69tsdj1KyIPYumyrvTwDTMHhV4blwWLghLppzdyXfjGAG938kQSX7s
Message-ID: <CAMuHMdXrdPrtE-8ytaBA5oYsFa_1EyVgQTWM_9qFszwEf_u6FQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: renesas: r8a779md: Add support for R-Car
 M3Le R8A779MD Geist
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nguyen Tran <nguyen.tran.pz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 May 2026 at 19:20, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> From: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
>
> Add support for the Geist board based on the Renesas R-Car R8A779MD (M3Le)
> SoC, a register-compatible variant of the R8A77965 (M3-N) with reduced set
> of peripherals.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Nguyen Tran <nguyen.tran.pz@bp.renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Drop pwm2 and pwm2_pins
>     - Follow KSZ9031RNX tSR for reset assert time,
>       FIGURE 7-5 Note 2 for reset post-deassert time
>     - Add RB from Geert

Thanks, will queue in renesas-devel for v7.2...

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> @@ -0,0 +1,720 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the Geist board with R-Car M3Le
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include "r8a779md.dtsi"
> +
> +/ {
> +       model = "Renesas Geist board based on r8a779md";
> +       compatible = "renesas,geist", "renesas,r8a779md", "renesas,r8a77965";
> +
> +       aliases {
> +               serial0 = &scif2;
> +               serial1 = &hscif1;
> +               ethernet0 = &avb;
> +               mmc0 = &sdhi2;
> +               mmc1 = &sdhi0;
> +       };
> +
> +       chosen {
> +               bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
> +               stdout-path = "serial0:115200n8";
> +       };

... with the chosen node moved to its final alphabetical sorting position.

> +
> +       audio_clkout: audio-clkout {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
