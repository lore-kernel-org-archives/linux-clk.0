Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9034EBAE6
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534196; cv=none; b=vGeFgs5eq8Qhhq/92F7Ms+70+CrY0JTv8hvmLqbj1O7Mt+SPX8cJEfmN5cbbPuvNZJMihiTbBiVFFgG++422w9h0mj3F3tyPewF3ZMhkwWfooBdZh9AreEGep1Pni/I0thKPaKoGim6/uhsIDE85jzTHHF2am5+F/V2exAgMMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534196; c=relaxed/simple;
	bh=OVpDaLi1lD+Takpp4uvA66C8HI92i7f0cSJulK2KE6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTVj3AZNgrLuthe+nHGT5chkxZ/j0XcjXUblQAgg8I+wiQhmpBEFjKLwU/Sff5ShbxVU0nAGtsoV08QJ0D3r3mkM6FymsP0RBhkBdBnRYuQVAVwZWKXA2IkUJ0El+x4oqVOD7crEczr8omoHE5/ve4V0Tmc7fCblSzvwBvY5XYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-783047c8464so835503137.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534193; x=1789138993;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qjft24L+Kray3Ujvp0X5j4rTQSYixQ6JGAbX73Xi0TU=;
        b=KqPMkfGVeL7meFpzdZh2DxZFIgIgFFqC3oOyDhmPEzuLuUiRxyPYVKNpyA/70RIJ90
         w29uMQesf4GevPbQ6icxnNTa8fRSulUM45G4nEQKlTBeoI2w6mvLTF+yd4oaI9NgbbrW
         Ab9UiUZmT3dk7JKoAsecE7oIjPGp5L4rXZ4o+lmoqwr9AbOb2jPBJInRcizw3JaHAMyb
         d9Cwekz8BoNjRnxBAiGjczZykb625wqtv48ezV4hNsGkn5cZHA60nkFTt+dmQ4Nhe5BQ
         RgtC9nb42gnZGwIJOmEdJmnh5SB58rj8ZBRNdEY/y5Bnu59b7gkhCsXZW2V9K3V4a3Ad
         tLiw==
X-Forwarded-Encrypted: i=1; AKwUvBwFHlMeXIMA4uijUrBHrwCmJOAqRhUlrl+MuLgtupuOWgK8syNTNVT07nozFH14xXpgol/zGOh4qpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lj17uMlCOA5ypZnKSOgT9I1LNwTuxt2PjLnfuLT0zp4H7S/zcs
	2gZcLa+ud1kgd4AwNE5llnNmKAS0EybG9r7nBzkavPnyTiZlPEBCn0Z/AILT5DkX
X-Gm-Gg: AYBFou2n8uR9Gen2lKym30A/GA/nwmrCMqbnoh/W9XsRl2hMbT5WUyC0vxXBd00fKwr
	QZP4bhhNvp7DTDIygeO31CbMK8WWI6s4L+pcV5NtW4TTcc1vOQhH0WLJXb+MQQPXAP0jM2iaXkP
	jWCo2UPntuCfnvww24yu/O13oY74LQgNeqLqT3eiXstfuo4gCYOGfWuMzwEKfoZ9TexLESjagdK
	OhH4HBXXYSq4VBFNDyvLRfbBkJxs+YIyP8Uxk9YD6Ic8yJyUIo26Q3qzxJAdIIwAmUMpRQV+7AV
	6mhABCvCh0lmEdhxT6gfuexJp7BFvIyFCTr4DmGidTSVFuONp4+BbwsW+nOR3M/UIEOYTHmL0d9
	yENmxCVQFdGGR1deEQXBi7OSt+x68XmCZd/gewl2moeuubX/f8d6Mb+Ec49qPpt7NiVpX/2bIjx
	Ap8Wo3J4cFzsljFm0AWcYTAOWG+TCg1ujjeS8S2MrQ0HXD6hzhXSfVGI329aG6tFgIIdL9jwih1
	DYw6fkkSIRvI4rIUOjnAp01XFXgeQ==
X-Received: by 2002:a05:6102:3a06:b0:77c:6bdc:824f with SMTP id ada2fe7eead31-78a4a90fc19mr2325104137.1.1788534173269;
        Fri, 04 Sep 2026 08:02:53 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47b3468csm1977505137.11.2026.09.04.08.02.52
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:02:52 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so1123213e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:02:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzx/SzA5Nw2gD4ZdDHKdHi1eFr5hO8HBezr/1Zegu52QF7il21u3IOVsHXJOo+5umpQIWq3tEjrlUs=@vger.kernel.org
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id
 71dfb90a1353d-5c7ed81a4femr3374662e0c.7.1788534167484; Fri, 04 Sep 2026
 08:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:02:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
X-Gm-Features: AcwNN1XqgKT4w_HXWtn4Y9fm8kvbc5sNYhBHCQ08jgA0R_r3KSaIYmzU-ZXgbgE
Message-ID: <CAMuHMdWH2ojjcpKK4vDWQWw7buj67H4y9=Mpf9L-xn-qD_4U6Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a774a3-sysc.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2M v3.0 System Controller
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + *
> + * Based on Renesas R-Car M3-W System Controller
> + * Copyright (C) 2016 Glider bvba
> + */
> +
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/power/r8a774a3-sysc.h>
> +
> +#include "rcar-sysc.h"
> +
> +static const struct rcar_sysc_area r8a774a3_areas[] __initconst = {
> +       { "always-on",     0, 0, R8A774A3_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
> +       { "ca57-scu",  0x1c0, 0, R8A774A3_PD_CA57_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca57-cpu0",  0x80, 0, R8A774A3_PD_CA57_CPU0, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR },
> +       { "ca57-cpu1",  0x80, 1, R8A774A3_PD_CA57_CPU1, R8A774A3_PD_CA57_SCU,
> +         PD_CPU_NOCR},

Please add a space before the closing curly brace.

> +       { "ca53-scu",  0x140, 0, R8A774A3_PD_CA53_SCU, R8A774A3_PD_ALWAYS_ON,
> +         PD_SCU },
> +       { "ca53-cpu0", 0x200, 0, R8A774A3_PD_CA53_CPU0, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu1", 0x200, 1, R8A774A3_PD_CA53_CPU1, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu2", 0x200, 2, R8A774A3_PD_CA53_CPU2, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "ca53-cpu3", 0x200, 3, R8A774A3_PD_CA53_CPU3, R8A774A3_PD_CA53_SCU,
> +         PD_CPU_NOCR },
> +       { "a3vc",      0x380, 0, R8A774A3_PD_A3VC, R8A774A3_PD_ALWAYS_ON },
> +       { "a2vc1",     0x3c0, 1, R8A774A3_PD_A2VC1, R8A774A3_PD_A3VC },
> +       { "3dg-a",     0x100, 0, R8A774A3_PD_3DG_A, R8A774A3_PD_ALWAYS_ON },
> +       { "3dg-b",     0x100, 1, R8A774A3_PD_3DG_B, R8A774A3_PD_3DG_A },
> +};

For the content:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
