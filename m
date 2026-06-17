Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EAD3C4B85
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690705; cv=none; b=Er2J8hzLNxKlZrEY13rPI9xmuBCMiZZYCLt/blilPH26OjbHLjbS30Cl0OEavcXIpSvwvrsDkSx4cEvU9BE/C9VafuBLU8NOn4+riSIhRumVxt0Ak5gyRgQ//ENIUQvqLUD5XxNPJZNqshTw8GuPh3V8HLjauQVacoxxbj2KnSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690705; c=relaxed/simple;
	bh=05HtEekKnLhODQoM/NJU1MleMJk27P+YZTUKE2RwX2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiG0N3r4MZBxH7Zp4K6sy/puox58K0Cl1UmJky957xQopgU4ET30jx4TjZa4181LzvqE/lb2d4wFf1m/L0k/3IQTFOjfLENFx+EG3j/mtvCuh62lq4i+vw08ZhF7Xxvnbqsqox4MAS2QbAmOsbvEUdRm5rFcFB9H4Uqwc6K3X9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-963a7e48493so3755953241.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690702; x=1782295502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/+25ljVbrV0cFHF02tOeYF6TAhfGn2KQZp2f/CD5R4=;
        b=Oh6G5K8Y+UAIYBrUFbjYocKWVr4b+Pb2lygVr1FOzfBrHMzDVLQQP3eHNlijWYhxP7
         2aVZqy0EAMPBMBH/zmVaE9JczaXYmWI93Y2Kfdoyk7tE1eRztKeQUxicNLK4LTqCn4cV
         uQ1a7QJ9W57wavRxFUz2uTdZW3Oa67MbLbtQsnFsnHobGjmhrIr/r6GJe1mgawWrYzi1
         5cyspCdhK29JFQl9FJNo4LdUAHpOFMGFXXPjGolC5uJ8ttEPInsh4trzDIDamI9fLZid
         Hi/Awcl3hTSckNPpuUVqhXMAZ1YcjGQ3phi+S3jsMMDIst5J0lFCUf6ktYmEuVCcaPxU
         dqUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8UEY3pKjv+z/znWU0B7Xi4ep4W/afLVZczqZVHnTxxG/euS2u6CtIHFqiUIKraxOMWhB2A922vwr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQVmVSGQb1WZBBYSfnHvni26IxXmz5JHRjlYcPMGIEdPo/uOX3
	9mrofsn7py36UPihMaGSS3mFveNUok0BUxglvWTEvbV9EWFKzlHrCxEUQa1kNDFm
X-Gm-Gg: Acq92OGHLP9oTL+0KWbZQud3O0kSdJ981lRLp0UDcN9fTJwoJ2SBFEW9krXoQAvQmlG
	68H+AM3otb1XpN7M3lIkNK2xzyET9nXsQ9JPfbt6NyRdiiynXlZM8AjPvIPyispPddFwFbYOF1T
	X1tNFhxKRklZanTusgHrzRlXaHWI0aiFOpVbQUVsdIVgr3qA/V08/9f0Y1LYsgZErTnbZLeZUjR
	pG7btxZAV16K7KtrgYpW49YX08bgoo6MuMxwdb4CSka40BWxhdAoIggzgmU5LG5K53xvlRYuP5g
	jqIfsyFAsOzKoFRpz7BySL6D1e2hZ4x286a7qoaAcQ12osGBmZ0cwgyhXdoDdQw9vt7ykvhvbZ7
	tC50QMIPgRXfGeK4rw1yzqwzZST7QMPPntW9vpX4pBc3dT+q/NVINLAmH3oabj287WL/LoE139f
	6ZnXaNuLG0lkJd2H6bwPeieAUHNd9ziAwV3ZooosGDNvoAWso91Q==
X-Received: by 2002:a05:6102:290a:b0:6f0:3c5b:ce7a with SMTP id ada2fe7eead31-7246a30bfdbmr1592685137.17.1781690702085;
        Wed, 17 Jun 2026 03:05:02 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966ceca5f6fsm2436588241.1.2026.06.17.03.05.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:05:01 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-966c74ebc1bso1074907241.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+M5p8XuAcbUK39wHAyD0K8o9z8XZ2czjWwX0PouUfvePL8bUyEaXgBCzUkBchxe/USrKJQEZYh4Wc=@vger.kernel.org
X-Received: by 2002:a05:6102:1513:b0:71e:39e9:ce5a with SMTP id
 ada2fe7eead31-7246d11266fmr1475284137.26.1781690700505; Wed, 17 Jun 2026
 03:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
X-Gm-Features: AVVi8CfvzgARP_H_QUsETrMu4OFV4lGTR_oJF8-LhQSQALrUoXJKUkxdtqOFv-s
Message-ID: <CAMuHMdVN7dfF6bah0Ca=G-uHZwJ7JDyQb5NoE59PPfAuXp+mHg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation
 math into a library
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

Hi Prabhakar,

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move the common PLL and divider parameter calculation logic from the
> core rzv2h-cpg driver into a standalone library file.
>
> Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
> rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
> rzv2h_cpg_get_pll_divs_pars().
>
> Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
> driver as wrappers that call into the new library helper endpoints.
> These wrappers are maintained for this cycle because they are actively
> referenced by the DSI driver; they will be safely removed in a subsequent
> cycle once the DSI driver is updated to use the new APIs from the library,
> preventing cross-subsystem build breakages.
>
> This restructuring allows other Renesas SoC clock drivers, such as the
> upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
> divider mathematical logic, to share the iterative calculation helper
> infrastructure without duplication.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
>  }
>  #endif
>
> +#ifdef CONFIG_CLK_RZV2H_CPG_LIB
> +bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                           struct rzv2h_pll_pars *pars, u64 freq_millihz);
> +
> +bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                struct rzv2h_pll_div_pars *pars,
> +                                const u8 *table, u8 table_size, u64 freq_millihz);
> +#else
> +static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
> +                                         struct rzv2h_pll_pars *pars,
> +                                         u64 freq_millihz)
> +{
> +       return false;
> +}
> +
> +static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> +                                              struct rzv2h_pll_div_pars *pars,
> +                                              const u8 *table, u8 table_size,
> +                                              u64 freq_millihz)
> +{
> +       return false;
> +}
> +#endif
>  #endif

What about just dropping the old functions, and adding two simple
compatibility defines in the header file:

    #define rzv2h_get_pll_pars rzv2h_cpg_get_pll_pars
    #define rzv2h_get_pll_divs_pars rzv2h_cpg_get_pll_divs_pars

That way there is less code to change in the next phase.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
