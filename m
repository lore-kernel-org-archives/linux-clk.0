Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F336CDFE
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159191; cv=none; b=qDxs/LNRg6NaJSxa27RE0cteZTD40CEZXLROfrD5zaR943aEtL2f+HKZRYwgaeMAZJQZLSa5qL3vIa5uSr6+i58iEr3G/MhRbk1eYPx7MEALS7PEcLHDbM15nkgDJvRBsjFUTC/uIKp8nxuAjDE//RMx8AR2bPQb/xR/9gBR7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159191; c=relaxed/simple;
	bh=3KEsf8hW5vDrHWJD69ik4mJTX2qI1RyXuMnidIbzMQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAfxYww2dnlKiK8iLhdXDgBVTNrgqTaXDhmt4SsHJoCDYJez5VlBkZTaxmOajnEs7xqYSXtvtZUkBB5CPj0879DxetdufECdRc/qRqJgyxrPUZUTY6J48ENUNogt3Z8Mn7LY6lJeyuMGQBhXPmS8b/RZV+dNipkglRYg6ngJUR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6312af106e3so163416137.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 06:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159189; x=1778763989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/rfnlVV4hZ4Bnzpl4JtGBkoPv/yJhy21sNz8ykSgsE=;
        b=Ug+FGllsPqwZKFPpJzVKRh0lhJXSRGMnVvQ9h5/AxVQ3ZKJUrXIevgZczld0dmRfZk
         Z4dfzyN2arHcOVXwvKHqC9F9CMtQxW+nQNRUoxExEjOF8b6MHBMyndmHbf2EaHbFzjLJ
         EHV7mKlgkUqnai4EzrLV+FXcHqHb85zAYlgdo1Lgn8bivm0xqvUQ8puvDtMA38c1kYa5
         /wpwdB4NEYdfLNIqKJ/JlZU2NfL63bapwi4wmSsQKUC/Hk0+Lyui6MFjCR/NBGmV875e
         XEuQ605tVcFrpnrR/Sa4tm2GulpXx5beb43Em8nL8f1XYQAff8ropJeaE3+5Zdyttesy
         ietA==
X-Forwarded-Encrypted: i=1; AFNElJ97eQi3xzCjeoxz+Cfr4NItDWiRWDCowzef0LQ+YM3GjWzzaxjHY5/tJwgdUcRwgbjcK3RjpSUoNSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwm0viNv1hMhM2wLPaYwJD1KLUdZHrUrTdd0woUdy/kM3wUFkT
	c+LZFICv15J7DCy47rRYeQn5oen7wnvLtQCcB7iVjzm14cKfc8lmaww91C3uYys0kzo=
X-Gm-Gg: AeBDietMj72SlqMnA5WsGVzFwhP+fo5Moszr98L5i4ygkaedxKWEiRcHPu0BlEiwApx
	Mvykbda4z8Gv1KOVJM5NmXERd2uoS78bMi3nACeS8RFnwGd2oLAXs0PgOa3LYpf8JUkBrapIgx9
	XdfhF8WNb1szYGhx2Y/LlTmXlwkDGYql1UAW0S/BQ74h4vMJVtUBol7+SE1/ffULP80hm/xWFGB
	kcUU01yL9bmhZYbXVDNsR610x/6DIj6sKnqAiAt5/lc7QiwH2caXRL1+OG68FiNtk4F779gZ4J5
	n2Y8NqVbNRgHmVqX4edzqNonC99wXxtf3W1BXxW9ceBlqnNC6bDMmHBqA3WH23MPKX6ns2SRwHI
	Zf66h7Kd2cLdKTdO2myY04BwRj40fHgFVfjE54nB+iTVsxJ/b5PQzVFMprGXhWFKihtQae+fEKd
	2MIzc5XEyrGbq9+KkFgfINLChbDVwJKbMQlWsUU5NfcL6Fz2CNjEIS+35ZHMpQLql+QoISmTIjQ
	R4+9uotU2kSFSfS9onG4Bn6
X-Received: by 2002:a05:6102:5e8e:b0:601:f85b:efeb with SMTP id ada2fe7eead31-630f8eec834mr3956060137.9.1778159189350;
        Thu, 07 May 2026 06:06:29 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-630f858f550sm3288875137.3.2026.05.07.06.06.27
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:06:27 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575320e6f2aso606327e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 06:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8kzZjn4Lp7KiC6giD3F1rOFhx4KPI2fJEWMnfWFv7yHwe2bj0Dv9JLnIwdYlfbmk2qveRWwdtylTk=@vger.kernel.org
X-Received: by 2002:a05:6122:3293:b0:56b:1eb:d396 with SMTP id
 71dfb90a1353d-57559680c45mr4250734e0c.14.1778159187270; Thu, 07 May 2026
 06:06:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com> <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 15:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
X-Gm-Features: AVHnY4IDDt-ipBkq7SjbPkIcGhg1wXbnEJaQpBvmsG8maNMy-0mQZD-rRFQ8sbk
Message-ID: <CAMuHMdWESdLpNzMzCvQ0ZJM_hg9fgw1T+pn0MoeXx74YyXc7-w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 4 May 2026 at 16:45, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
> a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.
>
> Drop the now-redundant GET_REG_SAMPLL_CLK1() and GET_REG_SAMPLL_SETTING()
> macros, replacing the latter with CPG_PLL1_SETTING_OFFSET() using
> FIELD_GET() to extract the offset value. Update RZG3L_PLL_MON_OFFSET() to
> use CPG_PLL_STBY_OFFSET() + 0xc directly.
>
> No functional changes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -56,9 +56,6 @@
>  #define G3L_SEL_ETH1_CLK_TX_I  SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
>  #define G3L_SEL_ETH1_CLK_RX_I  SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
>
> -/* PLL 1/4/6/7 configuration registers macro. */
> -#define G3L_PLL1467_CONF(clk1, clk2, setting)  ((clk1) << 22 | (clk2) << 12 | (setting))
> -
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
>         LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -58,14 +58,15 @@
>  #define RZG3S_DIV_NF           GENMASK(12, 1)
>  #define RZG3S_SEL_PLL          BIT(0)
>
> +#define CPG_PLL1_SETTING_OFFSET(conf)  FIELD_GET(GENMASK(11, 0), (conf))
>  #define CPG_PLL_STBY_OFFSET(conf)      FIELD_GET(GENMASK(23, 12), (conf))
>  #define CPG_PLL_CLK1_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x4)
>  #define CPG_PLL_CLK2_OFFSET(x)         (CPG_PLL_STBY_OFFSET(x) + 0x8)
>
> -#define RZG3L_PLL_STBY_OFFSET(x)       (GET_REG_SAMPLL_CLK1(x) - 0x4)
> +#define RZG3L_PLL_STBY_OFFSET(x)       (CPG_PLL1_SETTING_OFFSET(x))

Shouldn't that be '(CPG_PLL_STBY_OFFSET(x))'?

>  #define RZG3L_PLL_STBY_RESETB          BIT(0)
>  #define RZG3L_PLL_STBY_RESETB_WEN      BIT(16)
> -#define RZG3L_PLL_MON_OFFSET(x)                (GET_REG_SAMPLL_CLK1(x) + 0x8)
> +#define RZG3L_PLL_MON_OFFSET(x)                (CPG_PLL_STBY_OFFSET(x) + 0xc)
>  #define RZG3L_PLL_MON_RESETB           BIT(0)
>  #define RZG3L_PLL_MON_LOCK             BIT(4)
>
> @@ -75,8 +76,6 @@
>  #define CLK_MRST_R(reg)                (0x180 + (reg))
>
>  #define GET_REG_OFFSET(val)            ((val >> 20) & 0xfff)
> -#define GET_REG_SAMPLL_CLK1(val)       ((val >> 22) & 0xfff)
> -#define GET_REG_SAMPLL_SETTING(val)    ((val) & 0xfff)
>
>  #define CPG_WEN_BIT            BIT(16)
>

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -59,6 +59,7 @@
>  #define CPG_CLKSTATUS_SELSDHI1_STS     BIT(29)
>
>  #define CPG_SAM_PLL_CONF(stby)         ((stby) << 12)
> +#define CPG_PLL_CONF(stby, setting)    ((stby) << 12 | (setting))
>
>  #define DDIV_PACK(offset, bitpos, size) \
>                 (((offset) << 20) | ((bitpos) << 12) | ((size) << 8))

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
