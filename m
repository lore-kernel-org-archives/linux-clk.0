Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE7B3054D2
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782499; cv=none; b=r6Y5UtkBnUIMCpUD/UWlR6k17JA18YUdXo6BsWxXDDvQCh7UYc4HZrAxbnmTvSqQ/4/6I0RdO71veTgJdt69YXjJ3HcK6273GmI7CUNG4qWRqCNtiM4TcDkgXmWMd10b7GSu1uvAoSmAO/BvZwKt65RkJi/NV9QLtLLbAVxU1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782499; c=relaxed/simple;
	bh=TLoF+tW6MGQGC3ZdXzJEdfrUV9IkUw4etXHaqpJERy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq8lhb0UC+ZBHlG997wm9waL4Ee4SX9CdGml5wCZyKfVR5Of1lzJ4ysF54uKkWUEYwGUeImpAKsVmyjqgZGl/Ng+EIS6aaoiZ03SwUDcV+bohHrD6vKJVf7yMKtuEwcW65txx9QbN2M+Cv9WmLV000sr24e3ToogOygpyQfdWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dbd2b7a7e3so2492611137.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:48:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782495; x=1763387295;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiUUP6y/tdABD28k7Uj6Lx28HH/CBe9ubTZdjhyrBDg=;
        b=GisYhlLzEu7k3p3RA2Q4rCJTJbTxWy68SOH50PiIZcgDX3y7LuSll8jhL5GZWME0jO
         omJuvk2jE+igOYEQXHLbpYRwlQgcxXdfT6sSnOYkRTAQVSO/s2d007QaZsg0zlEC/u18
         ai7OBvUAFNu1aeyaIBS8kyEnzbmTM5XFzU+O2M06V7Fcdn0yubc6Ph5ItZpI6izRxH5j
         XEOE9vdCVGgYxHqRIuByFTnePVHjGWWABAkrJR0k7VomuQ6HvY+3wW1yrR6d7AzYPjzf
         znHiUw4zI3hfd9a/urIy4NtbbxYcWRMU7OYAvYiF0JO9q+w4pOK10q2SQEIrDj2OOTa0
         8mKg==
X-Forwarded-Encrypted: i=1; AJvYcCWsH2nfs9xkCyHHijOzF5Rz9M0V3xu8DPwb8OvaH7jGtwy2N4QBBz/rkCJ7z1a+GWqba3sTWMyuYmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLr47cmamRHGfT+57b3Z09N5U8QvGcbDxtfqJCNyxDMQilyUVT
	PZIXesP9rPgAnRoYx6VkJNKLPd/KCE9VT7C1/nlytU3C5R0iiutNOTvKuwngAlfl
X-Gm-Gg: ASbGnctVMhm/Ql4JS+/b63GiQMrWZw2fPLlPlXVkGtd2A8h+7XqAhppdMuUvVgdXlFy
	9cRLcN/APJeydulAAZ8nV9Vudt2D040C9CqXWPWZqpVfSnrhb2/Nb2YbM5u9HhIndhRwT5t2h+A
	P6s8ScjscignHjrJkYFgziuyjFTSe5w4ic1fWWt5ZGTkdpEK6CgE8tLLQGqpONtPP5ZWav72IEh
	NVF5DtleFXZrlwfCe2bTuff9lgSuXCdHyofY0Sc3uT/byOHk+vq9CocbdD6YlBGZ2AvTDb4pNze
	tyTHXWgmwGpuiVZT+Knl3jmfdN8SeQImCbrp1P1yh4IimqeWijuNGGXn9EV3QXSpAyfFmQ+a1yC
	QKRe5yTbcfv3XaFK40imx5UNVpG4rGiNX6uuYjKA0PrGbNcW8gBy4Grau8T93Yv/hi83g8B8tvR
	BRjfoD/xwj2BwfJyd41qDinw3zlGhB+Sib9kFulQ==
X-Google-Smtp-Source: AGHT+IEQdyw0N+2r+Sf9mi3hIAM/o0pH5rqI+nncTIpiordIgplhlbObeuoTlaUwPHlm1Ig/l+Lf8Q==
X-Received: by 2002:a05:6102:d8c:b0:5db:1e80:7813 with SMTP id ada2fe7eead31-5ddc47ee37cmr2564613137.43.1762782495397;
        Mon, 10 Nov 2025 05:48:15 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9370898d9d1sm5865591241.12.2025.11.10.05.48.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:48:15 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-937268fe284so1000213241.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 05:48:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCXBS5/pGuiBMwKOe5XeYP6JaRtsJRvxoV6NUxOso664+7AzMs53WHBnrr/GA5QXHF30BwWNY8HEk=@vger.kernel.org
X-Received: by 2002:a05:6102:510a:b0:5db:d7a5:ba18 with SMTP id
 ada2fe7eead31-5ddc4807e64mr3048323137.44.1762782494661; Mon, 10 Nov 2025
 05:48:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028165127.991351-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251028165127.991351-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 14:48:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
X-Gm-Features: AWmQ_bmKTzSHX049lQiR1VHWNPu-wG2BlrvB51tlczP7EyXTuG2z2m7Th5IlB-8
Message-ID: <CAMuHMdWSB4OvS5AeWqOBQPNG2J9VMYe9YUeXAp9kPjcJEQm3+g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 28 Oct 2025 at 17:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> v1->v2:
> - Added custom divider clock type for XSPI clocks to enforce hardware
>   constraints on supported operating rates.

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -54,12 +56,19 @@
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
>
> +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
>  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)
>
> +#define DIVSELXSPI_RATE_600MHZ         600000000UL
> +#define DIVSELXSPI_RATE_800MHZ         800000000UL

I find it a bit weird that the name of the define includes its value.
Perhaps just use "600 * MEGA" resp. "800 * MEGA" in the code instead?
But see below...

> @@ -154,6 +180,15 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>         DEF_DIV(".sci5async", CLK_SCI5ASYNC, CLK_PLL4D1, DIVSCI5ASYNC,
>                 dtable_24_25_30_32),
>
> +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),

Please move these two just below the existing entry for ".pll4d1".

> +       DEF_MUX(".divselxspi0", CLK_DIVSELXSPI0_SCKCR, DIVSEL_XSPI0,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
> +       DEF_MUX(".divselxspi1", CLK_DIVSELXSPI1_SCKCR, DIVSEL_XSPI1,
> +               sel_clk_pll4d1_div3_div4,
> +               ARRAY_SIZE(sel_clk_pll4d1_div3_div4), 0),
> +
>         /* Core output clk */
>         DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
>                 dtable_1_2),

> @@ -264,6 +305,116 @@ r9a09g077_cpg_mux_clk_register(struct device *dev,
>         return clk_hw->clk;
>  }
>
> +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> +                                                struct clk_rate_request *req)
> +{
> +       struct clk_divider *divider = to_clk_divider(hw);
> +       unsigned long parent_rate, best = 0, now;
> +       const struct clk_div_table *clkt;
> +       unsigned long rate = req->rate;
> +       int div = 0;

unsigned int

> +
> +       if (!rate)
> +               rate = 1;
> +
> +       for (clkt = divider->table; clkt->div; clkt++) {
> +               parent_rate = clk_hw_round_rate(req->best_parent_hw, rate * clkt->div);

I had expected the use of some *_determinate_rate_*() helper, as the
parent can be changed to find a better clock rate?
Perhaps you should use a composite clock for that?

> +               /*
> +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> +                * When the parent_rate is 600MHz, only dividers of 8 and 16
> +                * are supported otherwise dividers of 6, 8, 16, 32, 64 are supported.
> +                * This check ensures that FSELXSPIx is set correctly.
> +                */
> +               if (parent_rate == DIVSELXSPI_RATE_600MHZ &&

Does this actually work as expected? I doubt parent_rate is guaranteed
to be exactly 600 or 800 MHz, and expect it can differ slightly due
to rounding.  Hence I would look at clk_fixed_factor.div instead.

> +                   (clkt->div != 8 && clkt->div != 16))
> +                       continue;
> +               now = DIV_ROUND_UP_ULL((u64)parent_rate, clkt->div);

No need to cast to u64 (DIV_ROUND_*_ULL() handle this internally).

> +               if (abs(rate - now) < abs(rate - best)) {
> +                       div = clkt->div;
> +                       best = now;
> +                       req->best_parent_rate = parent_rate;
> +               }
> +       }
> +
> +       if (!div) {
> +               u8 maxdiv = 0;
> +
> +               req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw, 1);
> +               /*
> +                * If DIVSELXSPIx is set to 800MHz set the maximum divider
> +                * or else fall back to divider of 16 which is a maximum
> +                * supported divider for 600MHz operation.
> +                */
> +               if (req->best_parent_rate == DIVSELXSPI_RATE_800MHZ) {
> +                       for (clkt = divider->table; clkt->div; clkt++) {
> +                               if (clkt->div > maxdiv)
> +                                       maxdiv = clkt->div;
> +                       }
> +                       div = maxdiv;

Why not hardcode the divider, like in the else branch?

> +               } else {
> +                       div = 16;
> +               }
> +       }
> +
> +       req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);

No need to cast to u64.


> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
