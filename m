Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197774CB8D7
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536654; cv=none; b=KUaKPHIcnH3m1k6eRFYjfkJOnRUIC3raf7nDFQ5XufSEkVVZfxFM6RWVXctRbDPh9nPyjultqpzpbb4Wz7OYBbec1LRbUGxgvoI2fAeA/6DNmBMGai4ppYPlGRpP01wuPFpdBUSO3N3Vo4SqveqIDmjnmwxP46wGGPsJdNy/oSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536654; c=relaxed/simple;
	bh=4bEAll6bJapZukrKkjXZtk1Cgl7yrbg5PsFtTRWvy8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHtS75xsR72+4OaoXEwXEbkhG8/BKqM1Mvey4ZNx5zEdKY+TgPrT6g0MNG6y7fAzmSFVBo8wiz9OyCbUmp8rNayhdZ51vq/O80DLmC4WfcZsW3kAKKcIqVYGLj0czWWGhjrKcZo1RE/yDMQvRwJWhPUVwpkzuK1VMLWRgh0ffzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d9537bcso975223b6e.0
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536652; x=1789141452;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzE9a7y7ZZDe66bPxoXer0uMhuOeucoXHc9TRbP+CZA=;
        b=LNbzgDzjwb86Ym8wx4yoRpR7OHLAjkmJgVY6iEmGyPKgGecTGkd36ipNAMvnfZe++7
         mK6g/Urx1jx2R74r3qPRIQWriqSHluKSGMEQp0PLIAVR6WIZzolyVmUd3nKGNkLN1YhW
         dxWlO9OYdEgj0Vb3KW2qiKXWac6NH0e/dLCcsc37cCO8FZ1XbUNNgflltWUQNw+9dA4C
         FkQxaqRd3EF8KxAAJtFrXab6v/Zgsqygm3VEexjzMD4JnQfvurrtJeB69eJ9KtIoZ+AU
         3raBQocsfjn0aOdjWsY7MhCISw0PPeATkXrf5F/ck4dRgPooAI1XflLzYhe/R9p9WLjI
         8WeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2p2kEWRk2HhRoiFJt3zwrJnJoR9Cv3HN8VOOvUaAGNn0YZbsC13lUZwrHAfbMoX0L44upSy6Lc/U=@vger.kernel.org
X-Gm-Message-State: AFuF++mbipcIb/ni1aqLiGvadYa+b4wXtL/51SNoNOoeylO4JJBF/hkY
	LApa3xlxOtusqIDQzgLd8G9CxBplyPtTqNKiFGpb0XsUfEXnhbSIGONl9/FiuG3X
X-Gm-Gg: AYBFou1rZ3BqKO+5FwYRmtw6Cp8PBZF1qL/lpOvKrTWJ4UxfN0h/TOv4mxBZSNQUfwC
	QIBRSvPGgEDiIdf7xymsOxhUfYbXOmTdeK+siJJmDcER0b8mC+WEeQzByey4yKtahzQhUENQfet
	HkjbvA7Wigt3FQACxcLl9qKgvatEZthHMHp87IOGMs1azGPlM3D7O16Ijbd5wHHGXM1XDts975N
	frxfxAMaDd/iqCfLlQNseydcn4UVzG2aYbGxvENlT/n9n+hrEy91Pwe124Bqh871azSljFjtCgW
	kfmqsOianO5ePPtUXv4aCR7DNHaJZSycqG+1spXkyx2Gbva/SEt4GuhrA1Y5nDIjyDFb0ZzPr12
	2ovMy06UN3SETrUvjNLhHJfaSieWgWe/GcMg9WYONo+BPysrtyOnPSrKYyz79t5jPq+raUMi5A9
	kedm1aTspv970Xnk9btToUAiqz55C00AFVd8CunJRMFz1h0LBQQ1GI8Qg/z53J75bNbeecrJsau
	MOM4ERudg+LcmwIckv3XNsf5wli6Q==
X-Received: by 2002:a05:6808:191c:b0:4b2:b057:934c with SMTP id 5614622812f47-4b979825bf9mr3021384b6e.3.1788536651473;
        Fri, 04 Sep 2026 08:44:11 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96babc2c3sm2801317b6e.0.2026.09.04.08.44.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:44:10 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-497e6956acfso1082085b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 08:44:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwoLBa/eufOc7ID8rrrnX7U4JwAM8jiWSjj+CD7flZXi/x4heVol2rjqlQTcQ6hbwI8BBKO1D3oJew=@vger.kernel.org
X-Received: by 2002:a05:6102:1676:b0:785:6719:abb1 with SMTP id
 ada2fe7eead31-78a2ef7b044mr2760248137.11.1788536188830; Fri, 04 Sep 2026
 08:36:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-11-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:36:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
X-Gm-Features: AcwNN1Um6XH5hlFEECJFpWec4doGqp3W45Z0eEeDzho30JjiEWI3GGf_1U5A2yE
Message-ID: <CAMuHMdV3uLdyr+VOW-_eN3QMFpq9KV-O3HQsKY6GPpixeQhcKA@mail.gmail.com>
Subject: Re: [PATCH 10/10] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub
 board support
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

On Fri, 21 Aug 2026 at 17:06, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only OR BSD-2-Clause?

> +/*
> + * Device Tree Source for the HiHope RZ/G2M v3.0 SoC sub board
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a3-hihope-rzg2m.dts"
> +
> +/ {
> +       model = "HopeRun HiHope RZ/G2M v3.0 with sub board";
> +       compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
> +                    "renesas,r8a774a3";

Please replace each group of 8 spaces by a TAB.

> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
