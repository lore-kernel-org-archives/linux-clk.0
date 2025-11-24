Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD5D314D12
	for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000901; cv=none; b=mNcgWX98AHZibKfQ8QUKGINkg3DT2XZxZKCV6i2OjVAVpokE+QH+QzXthclyItI0QfOL+40fjoF/HI8u1/bCS4I8eZ6UP/JL+R8uEMHSkATRg5waL1w1zothp7QzXdY4r0KXhrT8Q+C9sOFRJBOhPqqwuOpZMGiNMpfsJ7bPtA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000901; c=relaxed/simple;
	bh=Ct6EmmfJDAgn7B9tkHJzMK6uE8/DdEgE+4JHHWAnNSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gN9O/Xj10S0VQUF8khbD3aEcWeghJrUBS0qeCzAoEOo5Y1odvfSAfTsKBDCyawKRgujIoCTT7NVFOrBKPPDD9m2evs7sqaN28WTxdEUxz1RhZ9hgybOlWDQtJeGpHAkygndWp7Y7I+Z+VhlkX0PZi66ayuKGrGvMFnm5cqdxKf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b1dde0961so3035365e0c.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 08:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764000898; x=1764605698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skCFru9tSb5bZJKp10m7UL+/GYNhDPJb/Un2MBDqH48=;
        b=LDFfO81WWCjM6PmXGEqZUbr1a4WZQpG6MY700sK7z8iSmWDqhpT33jS6LD2D/0kKuO
         nxFv8pgUvizv+LJLl/xuAn/mJwLI37h5c4J005ZZYTIfkrQ4VQN5LEWHEqMgK0k8BEcT
         mPvqzMY0ex3WXsURpEAgyjFu/jvaSm6D6yA3DZY4eNQry3Knf5SE8mK4dMHR4FE+SUVF
         uF7EfZtJJkMdgPtx3m7S2Jekn8NicTP+9YpZistn1cHTsKKDeNL+k/kvlnL3nR0M+wTR
         xG7zJrTigJ+wHUyhIa/O7qtGtnJ+JirRqL3Tpm0EX97mfBXfugs6LZeS/5CsDad8TDsQ
         RbXA==
X-Forwarded-Encrypted: i=1; AJvYcCXTtka5PMDkHpNguuUwMRCdBYcmA/yDgb2YY3JYzqrbw9LdWCPbk8bKohcEziTMFG18gtBv8AX206o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMpFXUcXQDATH0ENzcHIDun2dwG2enwlymZw/lbFMHbdFbyfVG
	tu+Tf23klzbENbdI5wADQDPDtA4EHneaPCwqdYfsmeCb5nzVhh/+PKDpxdE9jaKjnvc=
X-Gm-Gg: ASbGncs8ZWHBiu8hhBsC58RmraWoPzGe8/vepxAE8bF8VgWNQGrV1Gop00A9fe0nWNi
	ULmK5I8q0UronwMuKuWtnO4rnOO31MxT2YRYzmn40MnM/BgDtpd7jdKxtPsxAyFtnvXwMfpBW/i
	gZVVOukIp0ik/zL92QyLcKqDnrl+QdrgRI+x8c0XJUitGnRZX3mDtLoaQ6MroB39tVgM3kRXfKp
	7rozbHp18RuOii76mFskFa3oSRWzJ96pBPOUOIUR2O7ZzHn48ii+ztaGnTH9fo3GNneXUvBpJ+I
	6XA2jweranq9AMzTM1iuieTeJuETzyKHVUuSoUSK0hEi6LZmC87BX0i4rg0MA8PL6Y2sjKxfuDM
	d4/IA03bSxm+Yqq5/QhNHCYTI9+Qr1feZfOJ/g6s1570QzXYzk8kzmKPf9SqSyxXLY9faUUWIWv
	6SI7Iluj8TgxTKmtoQJA0I2ma5zMwItFibB9VKy0iqspGnmMi4
X-Google-Smtp-Source: AGHT+IHM37XY5HGnZ2JinT8BqIjyL2dpzKEzU46xFBFEiK6L19gOOuCYoro51CVbnDeSgSumYVZmlA==
X-Received: by 2002:a05:6122:3d04:b0:537:3e57:6bdc with SMTP id 71dfb90a1353d-55b8d7bd90cmr3959406e0c.12.1764000898104;
        Mon, 24 Nov 2025 08:14:58 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f633999sm5768612e0c.6.2025.11.24.08.14.57
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:14:57 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5e18598b9b1so3161631137.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 08:14:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEBuLsRzKoKLjHj1b0bGEDsuxGbA4N3e54you/fPoEnhNSgGUZFZwvI2xKC+gY+WkJtmdmenlwiFg=@vger.kernel.org
X-Received: by 2002:a05:6102:2c1a:b0:534:cfe0:f86c with SMTP id
 ada2fe7eead31-5e1de0881aemr4251586137.15.1764000897028; Mon, 24 Nov 2025
 08:14:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 17:14:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnUiaGr1dcqhB3aBYLE4STsPDqvqPoiwcR4RoK3ykxFi0wp_OUt9jBeQrg
Message-ID: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 17 Nov 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add core clocks and module clock definitions required by the xSPI
> (Expanded SPI) IP on the R9A09G077 SoC.
>
> Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 and
> add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> PCLKH as its bus clock (use as module clock parent) while the operation
> clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> provide mux/div selectors and divider tables for the supported
> XSPI operating rates.
>
> Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> where the determine_rate() callback enforces the hardware constraint:
> when the parent output is 600MHz only dividers 8 and 16 are valid,
> whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> be used. The custom determine_rate() picks the best parent/divider pair
> to match the requested rate and programs the appropriate SCKCR fields.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note this patch was originally part of series [0] as rest of the series
> is already merged into linux-next, sending only this patch as v3.
> [0] https://lore.kernel.org/all/20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
>
> v2->v3:
> - Dropped check for 800/600 MHz in
>   r9a09g077_cpg_fselxspi_determine_rate() instead compared divider values 3/4.
> - Sorted pll4d1_div3/pll4d1_div4 definitions to be with other pll4d1 dividers.
> - Dropped u64 caset in DIV_ROUND_UP_ULL()
> - Hardcoded the maxdiv when no dividers are found
> - Rebaesed to latest -next

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -58,11 +60,16 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
>  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)

Moving all of these up while applying, so SCKCR comes before SCKCR2.

>
>  enum rzt2h_clk_types {
>         CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
>         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
> +       CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn source selector */
>  };
>
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \


> @@ -148,6 +172,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>                 sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
>
>         DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),

Inserting a blank line.

>         DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
>                 dtable_24_25_30_32),
>         DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,

> +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> +                                                struct clk_rate_request *req)
> +{
> +       struct clk_divider *divider = to_clk_divider(hw);
> +       unsigned long parent_rate, best = 0, now;
> +       const struct clk_div_table *clkt;
> +       unsigned long rate = req->rate;
> +       unsigned int num_parents;
> +       unsigned int divselxspi;
> +       unsigned int div = 0;
> +
> +       if (!rate)
> +               rate = 1;
> +
> +       /* Get the number of parents for FSELXSPIn */
> +       num_parents = clk_hw_get_num_parents(req->best_parent_hw);
> +
> +       for (clkt = divider->table; clkt->div; clkt++) {
> +               parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);
> +               /* Skip if parent can't provide any valid rate */
> +               if (!parent_rate)
> +                       continue;
> +
> +               /* Determine which DIVSELXSPIn divider (3 or 4) provides this parent_rate */
> +               divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw, parent_rate,
> +                                                               num_parents);
> +               if (!divselxspi)
> +                       continue;
> +
> +               /*
> +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> +                * When divselxspi is 4 (600MHz operation), only FSELXSPIn dividers of 8 and 16
> +                * are supported. Otherwise, when divselxspi is 3 (800MHz operation),
> +                * dividers of 6, 8, 16, 32, and 64 are supported. This check ensures that
> +                * FSELXSPIx is set correctly based on hardware limitations.
> +                */
> +               if (divselxspi == 4 && (clkt->div != 8 && clkt->div != 16))
> +                       continue;

Inserting a blank line.

> +               now = DIV_ROUND_UP_ULL(parent_rate, clkt->div);
> +               if (abs(rate - now) < abs(rate - best)) {
> +                       div = clkt->div;
> +                       best = now;
> +                       req->best_parent_rate = parent_rate;
> +               }
> +       }
> +
> +       if (!div) {
> +               req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
> +               divselxspi = r9a09g077_cpg_fselxspi_get_divider(req->best_parent_hw,
> +                                                               req->best_parent_rate,
> +                                                               num_parents);
> +               /* default to divider 3 which will result DIVSELXSPIn = 800 MHz */
> +               if (!divselxspi)
> +                       divselxspi = 3;

Inserting a blank line.

> +               /*
> +                * Use the maximum divider based on the parent clock rate:
> +                *  - 64 when DIVSELXSPIx is 800 MHz (divider = 3)
> +                *  - 16 when DIVSELXSPIx is 600 MHz (divider = 4)
> +                */
> +               if (divselxspi == 3)
> +                       div = 64;
> +               else
> +                       div = 16;

Replacing by:

    div = divselxspi == 3 ? 64 : 16;

> +       }
> +
> +       req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> +
> +       return 0;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20, with the above changes.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
