Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D7D3AEB2D
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133373; cv=none; b=Dysf8uv6+bxOAsDVsw8pEoeeavqCrL9ybdPPDnjgrPjs0j6iDNRWmNljiQZuqDdNiAf3/amBefGQMqpj71TRwf4gRHF/W9JcbxcJBRM/a92EV018EPEQj79JE03EZte97BWutwD0FO7MNL/NRRRBLIZEzFMNgttjx8f9Ihn2loI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133373; c=relaxed/simple;
	bh=vpZ9OKBxRaFankypZ6LbMStZQAMty0CYmOmvVJLTcB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=angZk3dOAdCGnlI20FnJ8hOYdj80wn+TNuKdZEE9Ti4n6qW2T3Rqvg35hCdtL+bGlU33jLaQ9ouypgjvgAUEJdDrJhxrYdxQEVouwZyAwaaGViVOItqoVKcpJrCnAZEWbr1qXXCZOT5QgrjG9fjrYjSLBXY7ooZ0kP/dznXPSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec49f7e35eso623628866b.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133371; x=1782738171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9wtzqvmTPlyh3hNxuU2x4nVM8ZntPzt7m+UykQwrGE=;
        b=fL73xRrP094A2yi2Sii1YRbOdCzr6SsiYEwL5kCtq+EsWU0qI4R7EzAKIEQVN2odqH
         R+tV3ZIwj3NeoDKbzJcZGxFycp0Mk1XECtYR3mV/HwXt9+OMegTnDAQ3GGwkUDUHWLi2
         wKPfw5EKErWHRhmdd6h3AP3HOg7RMJGcatj+H0edYBQwSmBHXGD8vYk9fq5WZCNk/Qji
         NzIPdBLr+bDVQIiGqXZQZ8YUTvWg21VE3LSiuFxmADl2fz/ZG91yPHfN0UHcJrdJAeVl
         XW7DPwcBrbbCLMeC5FnToQdSwiIhWeOYSB58hf4GlV96yxbi/HQZJg2kvNAcEx/N0Q9G
         gNUg==
X-Forwarded-Encrypted: i=1; AFNElJ+EuoRRyX14aLk8tkmwY7X31Mmpj4HRoni/n1w+yEL1noAxiVFZLlXyRmv8nln6OYt5/USRzLkf5H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRy0eiQA0+AFg5vzdyX2OXqMQ57kdvXf3pQ+Z2bvS7Fk/6AgR/
	yhe6YX5tiV4Yr5ftCKQt9x62prjUjhsL8Yv3UnFo8pYGTBOjWjhR3N9x57/fkeldfRA=
X-Gm-Gg: AfdE7ckcRy7bEaAGcwp87VhCJALewc2BWF6anOagPrlaLSgVkIy2qsU/Fmt/0yu0Uv0
	uGKNuD7lN8uqZL6jhr8FE8kAHWOfyDcTglsORW1o6ISb8u5jZIcavGS66szGgZWr+at+VNSHrzR
	L74TP1JPls/uNdnoYWD0451xwXpGR21EHmDG2YgYj6x8wDydxhPaRSDdGdS4UJbj1HIFT4NIFPs
	YesTbXKVRc/If//Ib1I51ijlDx8uu2mO83Kd6th87x458SibBssfxF48qZ5U2dHOrIu3BxjSKsS
	gvK1qMqpHu5l1en8izRMECbrJRxz8vk2IwVMo5/jq723DrBo5ZM6GD74qB+kov2vhySpwegsVCV
	Ofdiy1KkwX2Y011LwSU2uUhKZOEsnkpb8gjJg49VLYF06+DVsYRVQNDrHEI6lP8S0LgZR1qSyPn
	OBPeeev2JQErFnRqh+GSXP34wj/5UXnjIPeWYW6YRk8a/QXubNbw==
X-Received: by 2002:a17:907:c405:b0:c03:b8c6:cc27 with SMTP id a640c23a62f3a-c097c0af2a1mr615880466b.24.1782133367569;
        Mon, 22 Jun 2026 06:02:47 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac8284sm359755866b.34.2026.06.22.06.02.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:02:42 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-697ad7f663cso1499859a12.1
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eqcggHngQsjwvgcBvFl7PKmxZmUEIS9w16ZRIGEsVAbPVU6mcs6fJfK4Vr4s6F5sNdsdGdLntw9A=@vger.kernel.org
X-Received: by 2002:a05:6402:3548:b0:695:837d:529f with SMTP id
 4fb4d7f45d1cf-696e5221662mr7072149a12.20.1782133339417; Mon, 22 Jun 2026
 06:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 15:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
X-Gm-Features: AVVi8CfgIAfwOmCE6zZuFwVKPTX86BS9YPtcpPMAwipkZXEClLrZPjNAjwEsi_c
Message-ID: <CAMuHMdXWn9zY=v-OYeWE8W4eE+sa6vj55gkkt8dmsmU_-TazKQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] clk: renesas: Extract RZ/V2H PLL calculation
 helpers into shared library
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 20:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the RZ/V2H PLL and divider parameter calculation helpers from
> rzv2h-cpg.c into a new reusable library.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig symbol and add
> rzv2h-cpg-lib.c to host the PLL parameter search algorithms currently
> implemented by rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars().
> Export the helpers as rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars() for use by other drivers.
>
> Update the public clock header to expose the new interfaces and provide
> compatibility aliases for the existing helper names, avoiding build
> breakage for current users while allowing future conversions to the new
> API.
>
> This prepares for reuse of the PLL and divider calculation logic by
> other Renesas clock drivers, including upcoming RZ/T2H and RZ/N2H CPG
> support, without duplicating the implementation.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
