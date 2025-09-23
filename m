Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F026E717
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758611504; cv=none; b=ktP5K/JaS2n/FS8TmNoPhlTrbF4YH8+ttBAogfPsOqIS1MkdBUle520qqYYlWZH4JD6o/TQi4eT8rxGKhV4LcBVIlM3UZJJhVslXPsmrXEBpjKGHVw2GsLP44OIm/+ZLUTTw4Z2IDgrONH7mBv9pPuNYl3ERY8lhtopSiC03XZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758611504; c=relaxed/simple;
	bh=lABsp8gvjknFQ37de9gqAnMwmx0hTbvHeH1QVV9Be5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ap1oH5ypMZBVxPgOLuOD3yARQoAGyVXfnxs6flCJ/9BZGsxBO5PJdY0VmSBznFOROc383GExCpYpMGkIC1BtjeP4Ggoxr9y8oDjv6TJi15UoDod46fbZZXT36goKN1G6+M8f6Fgw0tEy9mc/rQqY9oS/m56i0CVvIuCwG/0JxL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-52e6037a484so939104137.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 00:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758611502; x=1759216302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFsTdKxavgCQUg2QQGOIC2nf6+AvLxajlrLtSjRxAuk=;
        b=lnHmAAUFNG1JtyJewprnq7vAUeOFpKCHAQTeheNfjWwt25+xVYIO47cOJX3NFJ5BNM
         8PW1kbGgILm43rLA93jsXnYmpXPYq2A42sJFyEYHSdg2FDDmN7p2WgEhFujLX9MU/nqw
         EAfGVChldMtQaBgaWgiPe894Om66ody2JPe2T5oPxjVZhAj+6Aw55pXGvaN2vhB7F25b
         5l/HjGrhTK53+JfcUeapfQzkP+JDsA0yE94ws6BqKSYyj8t5YcZuExcDaWkWiD67ZAQw
         75J4vHnoVg3Z9xCaT+ZsABu/bNf6Y0tW5sSTThaTqgg7G9QGMMqJxufMvTs9sYDrXh4v
         xJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0uqeMebAF9z6VwCBPlZ3efO4Tq99HicxiLlbW5z5tRvBjfSorUKLqE8q9n4q3LiZjPOBWHk+rmi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+HSXLCragQcY6ftAMDrLJ9/lOWNEeH7Ayk/aO38yNHz3x8CzQ
	pJlDBV0PZ72dd3a6JIR5OD+Hh/7IkXxAeblz2dC/tYGO4TPYScuUOX3ZxSeVJWyf
X-Gm-Gg: ASbGncuohb34utigYjSwOGG49KAA7iIizFLQ/jmPFoSq9G7q/PvGiXuKyR3PfqZ0tDY
	CGLAg0ieJ65Mw3c0EVT+JyWSlQ9zAirkDeH+WnGjTa6ZOaLZ9JsWVzu6xXEpYZymqI7c4eBiYcz
	MrvC5PX/To+ugakhmZq0c162vIXor4UaaVrOkhkI1mj6xiX2ldp1elck1LgcT48/WlHqmYbnHYf
	CaSfEG2DGb+n38l8DQhF7vaI6BlTHmy0ItFD5bDtzxqYktK/QRGfvCBch8f0EChfU4bHV1bfDwW
	40VnsQRZzEIolLxvC/0DrK2vRAJHLdtxVTd4TUH72Marf22q09f32NGbpswN7vxqH1AbmXKx60G
	5ebwPiYMOOrJLiceQxajfPnzAB/HKnU/Er08bwJAe29BmLqLHU1+I2m/Qw/sN/YKWGZXs3l8=
X-Google-Smtp-Source: AGHT+IEsAx6KfFvvCeYEo69eWWvyi/Rpj6ZXF+DGdb9wAMX7yVZpMSMJ+nLnP0W5KJailwnNUlVKTw==
X-Received: by 2002:a05:6102:a4b:b0:521:57e7:3b19 with SMTP id ada2fe7eead31-5a578c99184mr557999137.25.1758611501628;
        Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-57a05ef52b3sm3911220137.13.2025.09.23.00.11.41
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5a392946c4aso859762137.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 00:11:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6/gOrUE6Gh53jpxhkmGC7QKn49e+73JRJPnGcAE+c/OQSIuiFrMCKs3H5hwgoBQ2XFJTy1ZRmhCA=@vger.kernel.org
X-Received: by 2002:a05:6102:6a8b:b0:5a2:c93c:8f82 with SMTP id
 ada2fe7eead31-5a575a9a98cmr503789137.9.1758611501039; Tue, 23 Sep 2025
 00:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWncCJQ_5uiATC+JhGr8K2ewO72L0DTWXtcx-OF-P=zVQ@mail.gmail.com> <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
In-Reply-To: <196d5c6d-0bd6-4dd5-b3ea-c8166b2bd830@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Sep 2025 09:11:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
X-Gm-Features: AS18NWAc9jYFHCjAWopmo_SZ1H2hwwG12zzTpMASIYI_DARZ5FZlGm7NHgYnia8
Message-ID: <CAMuHMdW=WTTvhfe_qRBsp+T2cEC21Y62_O_Zhj_eUApqNdoX6Q@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Sept 2025 at 18:24, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/22/25 1:35 PM, Geert Uytterhoeven wrote:
> >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >> @@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
> >>
> >>   #define rcdev_to_priv(x)       container_of(x, struct cpg_mssr_priv, rcdev)
> >>
> >> -static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
> >> -                         unsigned long id)
> >> +static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
> >> +                                     char *func, bool set, unsigned long id)
> >
> > This function does a bit more than writel()-with-latch, so please find
> > a more suitable name. Or... continue reading.
>
> I did so in V4.
>
> >>   {
> >>          struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
> >>          unsigned int reg = id / 32;
> >>          unsigned int bit = id % 32;
> >> +       const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
> >>          u32 bitmask = BIT(bit);
> >>
> >> -       dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> >> +       if (func)
> >> +               dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
> >> +
> >> +       writel(bitmask, priv->pub.base0 + reset_reg);
> >> +       readl(priv->pub.base0 + reset_reg);
> >> +
> >> +       return 0;
> >> +}
> >
> > Now, do we want a special de(reset)-with-latch() function (which does
> > reduce code duplication), or would a simpler variant be more useful?
> > After this, we have three different "dummy read" mechanisms in this
> > driver:
> >
> >    1. Clock enable/disable and resume on RZ/A:
> >
> >           writeb(value, priv->pub.base0 + priv->control_regs[reg]);
> >
> >           /* dummy read to ensure write has completed */
> >           readb(priv->pub.base0 + priv->control_regs[reg]);
> >           barrier_data(priv->pub.base0 + priv->control_regs[reg]);
> >
> >    2. Reset handling on R-Car:
> >
> >           writel(bitmask, priv->pub.base0 + reset_reg);
> >           readl(priv->pub.base0 + reset_reg);
> >
> >    3. Reset release on RZ/T2H and RZ/N2H:
>
> Maybe T2H support is not yet upstream , even in next ?

My bad, that is still under review (and I didn't even have the latest
version in my local tree). Latest version is
"[PATCH v3] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H"
https://lore.kernel.org/all/20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
