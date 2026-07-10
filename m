Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C927B3F4127
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678500; cv=none; b=neMMy22qtM/ye6vFRQGzg4CxzfNhFdOo4pAs1PMK0L79nKjqVsDP09/m+hcPs7Gk5aVFJtUzjPFCQQhoUWJTlvPgXxAuLy0AlM2h69JwaS6+VVXUh1epITFxk6EC0SiFCisNZzZM1LZh8XUIi8rnc+sZBYi54p8i+FueDBbUnbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678500; c=relaxed/simple;
	bh=jStoTu7RQA8BRTqGbaAV34VwUP2BPEMz29vPuO1fGCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QOWImEEI4ux9jjGy1KJL7RhwmEy7ZCqVn5HI3fUOJq7GetbC9Lr4oPvSaVwxi8O5dpexf0310QUBpC21dsjej5wGhwTV/ktUeGw98HPXY4yEZnRtz4BCzMVwYKM0PrKxwzxwjpOSQ8k12ZpqESLK090HuUl7yYXdON/6Wdg2XyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so1488458e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 03:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678498; x=1784283298;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GbEWAG6xIcV+3P2phIYnj4SrZfkvn8WstI+WFIFJ95k=;
        b=Ucojl3M1GZVabwsHx+/7VL7nx1gXNXVpRO/0HnqiUcNmeRZSXgZsNBUUbJDSMDUhdQ
         vblMYwfXcy3L/g/BC1dfLQUzs0zhfUl+JsoQV8iG84Zcy83Et4/YypfKPBfhPbdD+42F
         qQOPz8Lj7Ke2JFw1To06gGYSD1MY5JngstQuOyObjtRed35QZJYHsHRPHJICQo9W9gnY
         rNddzf6egvdhkPj5WaN7XAyyzWVAFOXLNMuLTZgH4luM8dMWicfsUnorLzQkasML57+a
         83s0PyEP6GOu9kCNbKjlMBcUbIQ2pj+rmtQ7P/hUBFZSfvl8k7RQcG6W9JgXkUwKV8W9
         ahyw==
X-Forwarded-Encrypted: i=1; AHgh+RqoClt1+RTgkOOv1bhdzSxRAyP5h8dVzGLWdFxuDJMzuxzzeqiCEWpNV+6WA1Uv50e9Pr/KZSl86mY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywao4tEjDgWllqlavjl6WhYAy0wNcJXPbPIwXKBn1RBAboyJnqj
	i3tdt2myCyhQ/G1iZsXV6DZtKGoybewVmc3AFpeD0HvVaOdknatuXShMnzBl/m8ABCI=
X-Gm-Gg: AfdE7clLuea7ASEaUvaychZvXvKpiqWG4C06xooxlprH32mgL2Zp2RaOfowjK2m2wO3
	znjHO55Dv6pCfP4MllqrYrJFykL75Y6O2sai3Hg56Dz0tRXgl4LxAgBur5R/vgSd6hxdhREHpiJ
	bwBca73Gz4AB0wcYAvKNSzocRkbRO/uas87BNrEBZDftoVrycmK/SFjJmeqArLzzmWdo668Zxpk
	m3E7wHrdPJSHxiPAjxXHLnDmSJ0eWj7wOBRMRExdMvwdwfb7XD15K+Lpb0QA9uCHGEQKBw8FV19
	bpt8TLYEo15ZOKS/1wRp/81aMSqF4K5hTCZLy9BBMICmoZ4gETPLCnliQeIUUlgGypsMGQMJc/y
	34zzfljn/8wApzCqWxBjvt2u4S6R55QCeBoIW3/q4AP5Pw6tHoIyECgy/q+pJDK0GMJ6Cs2MG46
	3mMDthc1stWQrmm0JcSAoivYn/6p6O48NTifj7pQ5UXCG1KdhnXQ==
X-Received: by 2002:a05:6122:16a0:b0:5bb:fa79:56dd with SMTP id 71dfb90a1353d-5bfa554025cmr1572538e0c.7.1783678497679;
        Fri, 10 Jul 2026 03:14:57 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f68d099sm5171544e0c.8.2026.07.10.03.14.56
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 03:14:56 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso969285241.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 03:14:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpcbR/y/uzbwVmyL0rWDqcB649s8xKnssWP+wQjVvWd5KyTxp1Dt6fNbf+Ppo7BTNIo8d0LSiEJi+Y=@vger.kernel.org
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1278940137.3.1783678496645; Fri, 10 Jul 2026
 03:14:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709182332.876408-1-claudiu.beznea+renesas@tuxon.dev> <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260709182332.876408-3-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 12:14:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
X-Gm-Features: AUfX_mxSD2HzC_Ku4zRdh3S4Ewoz9pnRW_48syvAhXfLnIrebj7osOYA05aUezc
Message-ID: <CAMuHMdWeCpR70fQ52NYsB_p+Feth0gewdfjSBCbpLWfUCCDvQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, claudiu.beznea.uj@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 9 Jul 2026 at 20:23, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The CAN FD controller found on the Renesas RZ/G3S SoC is largely compatible
> with the variant present on the RZ/G3E SoC. The main differences are:
> - the RZ/G3S provides only two CAN FD channels
> - the RZ/G3S supports only CAN FD operation; the Channel n CAN FD
>   Configuration Register does not implement the bits used to select
>   classical CAN-only mode (bit 30) or CAN FD-only mode (bit 28);
>   consequently, bit 31 (CAN FD Frame Distinction Enable) of the same
>   register is also not implemented
> - some bits in several registers (mainly reserved or status bits) are
>   read-write on the RZ/G3S but read-only on the RZ/G3E; their behavior is
>   otherwise identical: the bits read back as 0 on both SoCs and software
>   is allowed to write only 0 to them on the RZ/G3S
> - the RZ/G3S provides 128 acceptance filters, compared to 64 on the
>   RZ/G3E
> - the RZ/G3S can use PCLK clock as the CAN FD clock source through an
>   internal clock divider, while also supporting an external CAN FD clock
>   source
>
> Since:
> - the SoC clock generator provides to the CAN IP only the peripheral and
>   the RAM clocks
> - when sourced from the peripheral clock, the CAN-FD clock is obtained
>   inside the IP itself by dividing the peripheral clock
> - the assigned-clocks and assigned-clock-rates properties are specific to
>   the CAN-FD clock
> the assigned-clocks and assigned-clock-rates properties were dropped from
> the required properties list of the Renesas RZ/G3S SoC.
>
> Add documentation for the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - forbid renesas,no-can-fd and renesas,fd-only since the IP supports
>   only CAN-FD; for this didn't collect Biju's tag

Thanks for the update!

> --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> @@ -267,6 +267,7 @@ allOf:
>            contains:
>              enum:
>                - renesas,r9a09g077-canfd
> +              - renesas,r9a08g045-canfd

Please preserve sort order (alphabetical).

>                - renesas,rcar-gen3-canfd
>                - renesas,rzg2l-canfd
>      then:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
