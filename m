Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681742727E3
	for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760370415; cv=none; b=BT3Y8dOdVIVGlAvxo85LwEtb1EWKUJKaUyZfyWXGw6Qi7jj2gj/vZlPptZ0ckr88x9Ki3dDJ619HQ2xFwk/+/1AHJBdAIikLloE0aCI/0KqeASu5A3tqHlnjFz8vsp/3OVmMRHLf8YWPRpDjXHirbuYiaWFT363CxBuWDC52xkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760370415; c=relaxed/simple;
	bh=UlmRHBnP3MpiQ+OwZRY1Jv/J/gbcIYNu5Xl0caw6270=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOjikUjZyGpucykY5pVuKOu1SDP3RtUKOKg5WjsoJrFDyFA1Yf+N9GINTsVKJ3TXKq2VWGDgZPeVhk4pPU71MGJcw8l06yqvrC67Aa1aWltrSg9q+oUFshPtV0CptGQj/JFaC/gSss4Xf5St8LEivwe296hokng7OvT5bc6qANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-59a8c1eb90cso2084550137.0
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 08:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370412; x=1760975212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtJsWdibGOFQ5FzXb1Mac56uXQ5iFDLzA2u7VIR4IYY=;
        b=nQfBLTxeIBOlDA0VN0+UjtopKm2jFOmCr8sRahH2iGqHz4juSCZfDIW3MhNeRAqj62
         0HVJ7fgz86XBI1Q3e2DFGlSaYvmSRrHZBuftv85+7W/XK8yc0o1kv5eMK0Ns53Pu7VXU
         RyVZx9kIvmSVT4dpU4laU2n0ZN+hkX+v2ceYKbJ/j/jtzhTQ+WM4jHJAm5GlkaDqeRUo
         /75THL4lQ3q4ga/eLyvu1SpuxP4Gzs2R5R1czGRLiELZLWE5bvdlYJMaXIPr3+yeLitS
         RFVLO4BMTV3wiW91mNN+KBp6QQM8RmOTCVWYrHom5c9xYFZp2fNue9WndnDQX8re6Do5
         2awQ==
X-Forwarded-Encrypted: i=1; AJvYcCWik47l4098Cz3Yn6acxn+a7yefam13IQ4R7NAqf9z4IxCrhMPq0+QfvCdxIGZllIMNfnogRemBnpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw9ejeyf+6JpfQ+H1JX7dK/UP4CBVLLevmkjqmokH5DOBiF/qO
	pQwz7a+TaRR08EUd23zcKxMW/OjfZD3CRpIS5x8qA8mQWmWQq2V1rI0MFUCQHa6W
X-Gm-Gg: ASbGncuXInJQQA2vCpgeOkI2cuVVG331s+uRUdGxaqzjXWjb8TiKLU5xSpbgzD8siI/
	j6TR2xO5MSOzc1gzW3haCYN69haxWNOSlhnP57JZyE/RDV4qtmlF4HruRcxcSqlDPHG4h3QJu9M
	COJuKshGe4S8CEjeZv5rGpU6JKYq2/AYksoz0okIigcNie/bhQ+Ee6HLo4BmJlhuQ/XVT5gzErw
	OCKBTbrtK2IDfxsaTAZPNxOBrP0pFcy06BJ32mBC2P/hZd/spjK0Sr4WX6v/UzpYMAek/d1d1SJ
	05yLtKs0bymaFSawgP/X2JEzMMGGnF1+30IdaRuuTbL0s1LDs8VKPlL3p7RRd7zRynKecBG0HyC
	n/zpMoL4eVLcF8qSE6tA0ADBCfc13r63SBna6o8HfqNcgj/4w0oytPud+xotf86JY144ovN72j6
	4kyzU=
X-Google-Smtp-Source: AGHT+IEvvFXlCOPXCl/81+coLyBw/otJ9UQImU4oGWl7er599KEYfEhbtCX4VlqVYHmKZiMKKDjSFQ==
X-Received: by 2002:a05:6102:2c09:b0:5d6:155c:33aa with SMTP id ada2fe7eead31-5d6155c3c51mr1980416137.16.1760370411935;
        Mon, 13 Oct 2025 08:46:51 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc8f17fdsm3498789137.14.2025.10.13.08.46.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:46:51 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-583a520bd81so1680059137.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Oct 2025 08:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVocGJebrWzzux+uk2uOSTsEuASHbTzfkJ24d2sL1NzlaXl06Gb1R1k3VarTa4fgfCq5BzVvuvZojk=@vger.kernel.org
X-Received: by 2002:a05:6102:3e25:b0:521:b9f2:a5ca with SMTP id
 ada2fe7eead31-5d5e224f3c1mr7951324137.13.1760370410972; Mon, 13 Oct 2025
 08:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250929112324.3622148-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 17:46:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
X-Gm-Features: AS18NWCTwKq3E1BVZam3Q34YfaC1jIp6YPas2zUMEY6rkQoDMFp4o8_Br3H8oBc
Message-ID: <CAMuHMdXz0ThdhjeeurjE6TLXjVLXUy-ie-PqXHrTYExQ6TpeLA@mail.gmail.com>
Subject: Re: [PATCH v4] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 29 Sept 2025 at 13:23, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> Registers (MRCR) where both reset and deassert actions are done via
> read-modify-write (RMW) to the same register.
>
> Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
> it to reset_regs. For this SoC, the number of resets is based on the
> number of MRCR registers rather than the number of module clocks. Also
> add cpg_mrcr_reset_ops to implement reset, assert, and deassert using RMW
> while holding the spinlock. This follows the RZ/T2H requirements, where
> processing after releasing a module reset must be secured by performing
> seven dummy reads of the same register, and where a module that is reset
> and released again must ensure the target bit in the Module Reset Control
> Register is set to 1.
>
> Update the reset controller registration to select cpg_mrcr_reset_ops for
> RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Renamed cpg_mrcr_set_bit() to cpg_mrcr_set_reset_state() for clarity.
> - Updated the parameters in cpg_mrcr_set_reset_state().

Thanks for the update!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -736,6 +754,72 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
>         return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
>  }
>
> +static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
> +                                   unsigned long id, bool set)
> +{
> +       struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
> +       unsigned int reg = id / 32;
> +       unsigned int bit = id % 32;
> +       u32 bitmask = BIT(bit);
> +       void __iomem *reg_addr;
> +       unsigned long flags;
> +       unsigned int i;
> +       u32 val;
> +
> +       dev_dbg(priv->dev, "%s %u%02u\n", set ? "assert" : "deassert", reg, bit);
> +
> +       spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> +
> +       reg_addr = priv->pub.base0 + priv->reset_regs[reg];
> +       /* Read current value and modify */
> +       val = readl(reg_addr);
> +       if (set)
> +               val |= bitmask;
> +       else
> +               val &= ~bitmask;
> +       writel(val, reg_addr);
> +
> +       /*
> +        * For secure processing after release from a module reset, dummy read
> +        * the same register at least seven times.

This comment is waiting to become out-of-sync with the actual value...

> +        */
> +       for (i = 0; !set && i < RZT2H_RESET_REG_READ_COUNT; i++)
> +               readl(reg_addr);
> +
> +       /* Verify the operation */
> +       val = readl(reg_addr);
> +       if ((set && !(bitmask & val)) || (!set && (bitmask & val))) {

Perhaps just "set == !(bitmask & val)"? Or is that too obscure?

> +               dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
> +               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +               return -EIO;
> +       }
> +
> +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +
> +       return 0;
> +}

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
