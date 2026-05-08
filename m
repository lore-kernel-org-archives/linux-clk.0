Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504703CD8C1
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 10:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234536; cv=none; b=H5Ay0FRkLEhL9KMoEMhZV/l/VSQ+cDmkG7yzX40AuVtJxug4Gl1sa/+Aqpxzlv3gD9VYvJxo+pVpEezx8H0xIuKHK6YpoCdyb4+wrJC0xLhxMwTuIW3kSAFBRGwdHxcn/CVzNoQqNb0fkdAIeHiRsIYUPIBiZ6FdasGm95JE3gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234536; c=relaxed/simple;
	bh=xvmoJSJ1vW711/dM2ob3bppJLYip6cz95f5WmwJa1pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OR2Aa1+2eRyjNMqOq7ZaHJ/u+eFqNWWNpuEGHS2vvfgTcljBxjdjp22LkwFARlQOGAaf5+i6nWTF+a0+OgGMqA9cl406FkNEj0hOuFLKACuDBYg/Txu3lb3JCtl+q2MOkH2j4DWwLarUljx9XdS/PfQGBdCbynlAmba+YUSSjpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5637886c92aso879806e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 03:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234531; x=1778839331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcl8IC5svK1OXmJv9TpTHeh/oYwzMHlG3MjWZjSCGcQ=;
        b=E3lu4k0cwPhUf+ZDOSpi8tSiS3eWESX6Zy7Fg0d9b8E4knngktSriu6D6Ztuu6wIsB
         pQOPvfQPVLwzktdKu2TBzFqCuYJ+v05D5ugy0v7JoYeeHnmfZD/jHuiMrZTRlDrHtWOA
         ZjSc/P9GVwyGkuUk8tQdOTM1rxV2tSARk/OM942dNPHoAfwPDIrePXwrtPfMmL+vq4Pe
         zFyZzPZ2T6pnFoxTn6wxfm2a0lmo7KqOlnvPvjCUa2tMEjcJuWYTgsuSKxS00YXJf56S
         TEaWKMGq6bSgSRohxNzqEWh0EQ9RKeKVron/n+IfACLVY/2DhpyRkGoxQ2Zs9/i3l6cO
         tUJw==
X-Forwarded-Encrypted: i=1; AFNElJ+580QUkM468/C4j1wkDGZChAIT7Clu4fBL8ViUPK8I3WkUkn+FkbJXMn/eRJQHiXaIqId5cTw/wdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVBlUp6qAPnYuxSHA7kqac/qRU5nBLz+86eWXdnhPgLK42LwNM
	/7iiNrZ0T5g6e1Yrx+BW4M7SCnbik80m5f8M/3aS5XV9D0r1zxvB02HHL/uynGMvRMU=
X-Gm-Gg: Acq92OEuITs6iLGJoR0KOtdrsyyWEwzk8p3dF6q3k8S67VSmaKbseh+vQsl99d+x+Aq
	uESMYYphnEH9ycv4NrNAPmkLo2AhrHb9afDO7NgKkhrMFAanoEFAHcJhpXsaxlHAONLePD/To5L
	72cvESvFL5mvMP5gzBV8R5u/cKueKsaBv9ZZYXCJ3pzcPJVGnet7IebpYJg5sI0MPdeTF234GHA
	82mSf4LHb4PM0eE8PLhD4fgn7MAoi7kq3git3o/4ZV1y6KaJjO0WQZV7yM7kowAzUCUxS9+L3Dy
	BVhNTc/9VbrwyjID8smFo+3EOGpCmuBbYeOUgEY3WmFgbildCNNN4SmeemwnbwfZiloCJeZBOJJ
	GYrPstfh++YZgP9JGxX+eaSexEppv7pYXoe2SnO36t8nI9PTUzea7vAqb+ukA1ugje0CTL+dNEs
	Z1kSl8IiNkcp/gn2tiUtYdf1UP+RRyvtXRuz16Es3qJcPbwds5c4hjfecjoOb1+JWBnBqKiku9o
	MA=
X-Received: by 2002:a05:6122:915:b0:575:29ef:7e13 with SMTP id 71dfb90a1353d-575594f743dmr6232134e0c.3.1778234521233;
        Fri, 08 May 2026 03:02:01 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21ba2c2fsm594445241.12.2026.05.08.03.01.59
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:01:59 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5751e12c524so645579e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 03:01:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8n4ApBkJnp8u+UgWKX3xBq3YWR+G42rXkEyOLLrNOpXLXb1yPCmhRTJcA3Ibmb4L28dTO+HWsIDOs=@vger.kernel.org
X-Received: by 2002:a05:6123:a8:b0:56e:e7b5:17d3 with SMTP id
 71dfb90a1353d-575595d06b6mr6630766e0c.8.1778234516982; Fri, 08 May 2026
 03:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com> <20260402163126.12135-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260402163126.12135-3-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 12:01:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyf1HPqAArdy8nsOuW3qxExOEAeO72221A0w1mCtXrVg@mail.gmail.com>
X-Gm-Features: AVHnY4LLjavjc6b4hOixot-jTxjcDtq_QAYXdyxTt9JPymFC7dc2OhGNdgp1wPY
Message-ID: <CAMuHMdUyf1HPqAArdy8nsOuW3qxExOEAeO72221A0w1mCtXrVg@mail.gmail.com>
Subject: Re: [PATCh v3 2/8] clk: renesas: r9a09g047: Add audio clock and reset support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, john.madieu@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 2 Apr 2026 at 18:32, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add clock and reset entries for audio-related modules on the RZ/G3E SoC.
>
> Target modules are:
>  - SSIU (Serial Sound Interface Unit) with SSI ch0-ch9
>  - SCU (Sampling Rate Converter Unit) with SRC ch0-ch9, DVC ch0-ch1,
>    CTU/MIX ch0-ch1
>  - ADMAC (Audio DMA Controller)
>  - ADG (Audio Clock Generator) with divider input clocks and audio
>    master clock outputs
>
> While at it, reorder plldty_div16 to group it with other plldty fixed
> dividers.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -22,6 +22,9 @@ enum clk_ids {
>         CLK_AUDIO_EXTAL,
>         CLK_RTXIN,
>         CLK_QEXTAL,
> +       CLK_AUDIO_CLKA,

Please drop this, as the AUDIO_CLKA clock is provided by the
existing CLK_AUDIO_EXTAL pin.

> +       CLK_AUDIO_CLKB,
> +       CLK_AUDIO_CLKC,
>
>         /* PLL Clocks */
>         CLK_PLLCM33,
> @@ -34,6 +37,8 @@ enum clk_ids {
>         /* Internal Core Clocks */
>         CLK_PLLCM33_DIV3,
>         CLK_PLLCM33_DIV4,
> +       CLK_PLLCM33_DIV4_DDIV2,
> +       CLK_PLLCM33_DIV4_DDIV2_DIV2,
>         CLK_PLLCM33_DIV5,
>         CLK_PLLCM33_DIV16,
>         CLK_PLLCM33_GEAR,
> @@ -41,15 +46,19 @@ enum clk_ids {
>         CLK_SMUX2_XSPI_CLK1,
>         CLK_PLLCM33_XSPI,
>         CLK_PLLCLN_DIV2,
> +       CLK_PLLCLN_DIV4,
>         CLK_PLLCLN_DIV8,
>         CLK_PLLCLN_DIV16,
>         CLK_PLLCLN_DIV20,
> +       CLK_PLLCLN_DIV32,
>         CLK_PLLCLN_DIV64,
>         CLK_PLLCLN_DIV256,
>         CLK_PLLCLN_DIV1024,
>         CLK_PLLDTY_ACPU,
>         CLK_PLLDTY_ACPU_DIV2,
>         CLK_PLLDTY_ACPU_DIV4,
> +       CLK_PLLDTY_DIV2,
> +       CLK_PLLDTY_DIV4,
>         CLK_PLLDTY_DIV8,
>         CLK_PLLDTY_RCPU,
>         CLK_PLLDTY_RCPU_DIV4,
> @@ -64,6 +73,7 @@ enum clk_ids {
>         CLK_PLLDTY_DIV16,
>         CLK_PLLVDO_CRU0,
>         CLK_PLLVDO_GPU,
> +       CLK_CDIV5_MAINOSC,
>
>         /* Module Clocks */
>         MOD_CLK_BASE,
> @@ -120,6 +130,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
>         DEF_INPUT("rtxin", CLK_RTXIN),
>         DEF_INPUT("qextal", CLK_QEXTAL),
> +       DEF_INPUT("audio_clka", CLK_AUDIO_CLKA),

Please drop this.

> +       DEF_INPUT("audio_clkb", CLK_AUDIO_CLKB),
> +       DEF_INPUT("audio_clkc", CLK_AUDIO_CLKC),
>
>         /* PLL Clocks */
>         DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
> @@ -135,6 +148,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>
> +       DEF_DDIV(".pllcm33_div4_ddiv2", CLK_PLLCM33_DIV4_DDIV2, CLK_PLLCM33_DIV4,
> +                CDDIV0_DIVCTL1, dtable_2_64),
> +       DEF_FIXED(".pllcm33_div4_ddiv2_div2", CLK_PLLCM33_DIV4_DDIV2_DIV2,
> +                 CLK_PLLCM33_DIV4_DDIV2, 1, 2),

These two clocks are unused?

> +
>         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
>
>         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
> @@ -142,9 +160,11 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
>                   dtable_2_16),
>         DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
> +       DEF_FIXED(".pllcln_div4", CLK_PLLCLN_DIV4, CLK_PLLCLN, 1, 4),
>         DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
>         DEF_FIXED(".pllcln_div16", CLK_PLLCLN_DIV16, CLK_PLLCLN, 1, 16),
>         DEF_FIXED(".pllcln_div20", CLK_PLLCLN_DIV20, CLK_PLLCLN, 1, 20),
> +       DEF_FIXED(".pllcln_div32", CLK_PLLCLN_DIV32, CLK_PLLCLN, 1, 32),

This clock is unused?

>         DEF_FIXED(".pllcln_div64", CLK_PLLCLN_DIV64, CLK_PLLCLN, 1, 64),
>         DEF_FIXED(".pllcln_div256", CLK_PLLCLN_DIV256, CLK_PLLCLN, 1, 256),
>         DEF_FIXED(".pllcln_div1024", CLK_PLLCLN_DIV1024, CLK_PLLCLN, 1, 1024),
> @@ -152,7 +172,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_DDIV(".plldty_acpu", CLK_PLLDTY_ACPU, CLK_PLLDTY, CDDIV0_DIVCTL2, dtable_2_64),
>         DEF_FIXED(".plldty_acpu_div2", CLK_PLLDTY_ACPU_DIV2, CLK_PLLDTY_ACPU, 1, 2),
>         DEF_FIXED(".plldty_acpu_div4", CLK_PLLDTY_ACPU_DIV4, CLK_PLLDTY_ACPU, 1, 4),
> +       DEF_FIXED(".plldty_div2", CLK_PLLDTY_DIV2, CLK_PLLDTY, 1, 2),
> +       DEF_FIXED(".plldty_div4", CLK_PLLDTY_DIV4, CLK_PLLDTY, 1, 4),

These two clocks are unused?

>         DEF_FIXED(".plldty_div8", CLK_PLLDTY_DIV8, CLK_PLLDTY, 1, 8),
> +       DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
>
>         DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
>         DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
> @@ -164,9 +187,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
>         DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
>         DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
>         DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> -       DEF_FIXED(".plldty_div16", CLK_PLLDTY_DIV16, CLK_PLLDTY, 1, 16),
>         DEF_DDIV(".plldty_rcpu", CLK_PLLDTY_RCPU, CLK_PLLDTY, CDDIV3_DIVCTL2, dtable_2_64),
>         DEF_FIXED(".plldty_rcpu_div4", CLK_PLLDTY_RCPU_DIV4, CLK_PLLDTY_RCPU, 1, 4),
> +       DEF_FIXED(".cdiv5_mainosc", CLK_CDIV5_MAINOSC, CLK_QEXTAL, 1, 5),

This clock is unused?

>
>         DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
>         DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
> @@ -460,6 +483,96 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD("ssif_clk",                     CLK_PLLCLN_DIV8, 15, 5, 7, 21,

ssif_0_clk?

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("scu_clk",                      CLK_PLLCLN_DIV8, 15, 6, 7, 22,

scu_0_clk?

> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_clkx2",                    CLK_PLLCLN_DIV4, 15, 7, 7, 23,

scu_0_clkx2?

> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("admac_clk",                    CLK_PLLCLN_DIV8, 15, 8, 7, 24,

dmacpp_0_clk?

> +                                               BUS_MSTOP(2, BIT(5))),
> +       DEF_MOD("adg_clks1",                    CLK_PLLCLN_DIV8, 15, 9, 7, 25,

adg_0_clks1?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_clk_200m",                 CLK_PLLCLN_DIV8, 15, 10, 7, 26,

adg_0_clk_195m?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clka",               CLK_AUDIO_CLKA, 15, 11, 7, 27,

adg_0_audio_clka?
Parent is CLK_AUDIO_EXTAL.

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkb",               CLK_AUDIO_CLKB, 15, 12, 7, 28,

adg_0_audio_clkb?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_audio_clkc",               CLK_AUDIO_CLKC, 15, 13, 7, 29,

adg_0_audio_clk_c?

> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi0_clk",                 CLK_PLLCLN_DIV8, 22, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi1_clk",                 CLK_PLLCLN_DIV8, 22, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi2_clk",                 CLK_PLLCLN_DIV8, 22, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi3_clk",                 CLK_PLLCLN_DIV8, 22, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi4_clk",                 CLK_PLLCLN_DIV8, 22, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi5_clk",                 CLK_PLLCLN_DIV8, 22, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi6_clk",                 CLK_PLLCLN_DIV8, 22, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi7_clk",                 CLK_PLLCLN_DIV8, 22, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi8_clk",                 CLK_PLLCLN_DIV8, 22, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),
> +       DEF_MOD("adg_ssi9_clk",                 CLK_PLLCLN_DIV8, 22, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(2))),

Specifying CLK_PLLCLN_DIV8 as the parent for these ten clocks
is probably a (temporary?) simplication, as they are generated by the
ADG, from adg_0_clk_195m or adg_audio_clk[abc]?

> +       DEF_MOD("dvc0_clk",                     CLK_PLLCLN_DIV8, 23, 0, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("dvc1_clk",                     CLK_PLLCLN_DIV8, 23, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu0_mix0_clk",                CLK_PLLCLN_DIV8, 23, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ctu1_mix1_clk",                CLK_PLLCLN_DIV8, 23, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src0_clk",                     CLK_PLLCLN_DIV8, 23, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src1_clk",                     CLK_PLLCLN_DIV8, 23, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src2_clk",                     CLK_PLLCLN_DIV8, 23, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src3_clk",                     CLK_PLLCLN_DIV8, 23, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src4_clk",                     CLK_PLLCLN_DIV8, 23, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src5_clk",                     CLK_PLLCLN_DIV8, 23, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src6_clk",                     CLK_PLLCLN_DIV8, 23, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src7_clk",                     CLK_PLLCLN_DIV8, 23, 11, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src8_clk",                     CLK_PLLCLN_DIV8, 23, 12, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("src9_clk",                     CLK_PLLCLN_DIV8, 23, 13, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("scu_supply_clk",               CLK_PLLCLN_DIV8, 23, 14, -1, -1,
> +                                               BUS_MSTOP(2, BIT(0) | BIT(1))),
> +       DEF_MOD("ssif_supply_clk",              CLK_PLLCLN_DIV8, 24, 0, -1, -1,

ssiu_supply_clk?

> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi0_clk",                     CLK_PLLCLN_DIV8, 24, 1, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi1_clk",                     CLK_PLLCLN_DIV8, 24, 2, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi2_clk",                     CLK_PLLCLN_DIV8, 24, 3, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi3_clk",                     CLK_PLLCLN_DIV8, 24, 4, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi4_clk",                     CLK_PLLCLN_DIV8, 24, 5, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi5_clk",                     CLK_PLLCLN_DIV8, 24, 6, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi6_clk",                     CLK_PLLCLN_DIV8, 24, 7, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi7_clk",                     CLK_PLLCLN_DIV8, 24, 8, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi8_clk",                     CLK_PLLCLN_DIV8, 24, 9, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
> +       DEF_MOD("ssi9_clk",                     CLK_PLLCLN_DIV8, 24, 10, -1, -1,
> +                                               BUS_MSTOP(2, BIT(3) | BIT(4))),
>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -538,6 +651,20 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GE3D_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GE3D_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GE3D_ACE_RESETN */
> +       DEF_RST(14, 1, 6, 18),          /* SSIF_0_ASYNC_RESET_SSI */
> +       DEF_RST(14, 2, 6, 19),          /* SSIF_0_SYNC_RESET_SSI0 */
> +       DEF_RST(14, 3, 6, 20),          /* SSIF_0_SYNC_RESET_SSI1 */
> +       DEF_RST(14, 4, 6, 21),          /* SSIF_0_SYNC_RESET_SSI2 */
> +       DEF_RST(14, 5, 6, 22),          /* SSIF_0_SYNC_RESET_SSI3 */
> +       DEF_RST(14, 6, 6, 23),          /* SSIF_0_SYNC_RESET_SSI4 */
> +       DEF_RST(14, 7, 6, 24),          /* SSIF_0_SYNC_RESET_SSI5 */
> +       DEF_RST(14, 8, 6, 25),          /* SSIF_0_SYNC_RESET_SSI6 */
> +       DEF_RST(14, 9, 6, 26),          /* SSIF_0_SYNC_RESET_SSI7 */
> +       DEF_RST(14, 10, 6, 27),         /* SSIF_0_SYNC_RESET_SSI8 */
> +       DEF_RST(14, 11, 6, 28),         /* SSIF_0_SYNC_RESET_SSI9 */
> +       DEF_RST(14, 12, 6, 29),         /* SCU_RESET_SRU */

SCU_0_RESET_SRU?

> +       DEF_RST(14, 13, 6, 30),         /* ADMAC_ARESETN */

DMACPP_0_ARST?

> +       DEF_RST(14, 14, 6, 31),         /* ADG_RST_RESET_ADG */

ADG_0_RST_RESET_ADG?

>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
