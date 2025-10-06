Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E122D239B
	for <linux-clk@vger.kernel.org>; Mon,  6 Oct 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759758218; cv=none; b=Jn5NkuvOoHjGW3SXyhzyqPcLQhnk8sibii9ukSdonfgpE6d44X69DQ3WlAT4zQQdlwpUqG6MeXG3CFrvhT7EfAL8kT7XeRgRGaXLNGc67Ee94EIWK5aUrwOlJX1HMwtsNm8PpUAPgX/TWhzEnbBMHV1GtjaRJR4JBjIMT9kgTxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759758218; c=relaxed/simple;
	bh=GWPhB7ZUdV7f1J58EehNLyYdtceaMJx9xcnivYhGU0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Okw1pRNVkQa9Jc9A+i7EFCHyjoZbPX8MBhvUrXEvNl+QLQb53Jsue6FouilgfVRbaw7Dwn4Zz46SiTVaXJfijHg00oNbYaQckkNXe5fWGwt45j7zmyojVFV1hN+auOgA1cyAJGjObSAYolNKunTQXyQmP6L758EJgDsdViZPsF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54a80b26f88so1915979e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 06:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759758215; x=1760363015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a67E2/Ihlt/Uu1lKuZ2sBmUpA48B6MG/OEXHNzpezk8=;
        b=kLCh37JTZupEspFRZaiQo4QxpkpoinAQOD2Z9uO+YuGxhEzZqnv72PfgDD1p5qVgls
         UIjDKKG6CrWPVtppQTJK8fKPylvP83yeuGnC/yFPH1VDNhw2XxawdSO/yrdxoBZPIoqV
         W2cU7gibjgZ2OMlDzxWjONh+fSOwMoZRLDlzH14CyCwIzgyj5zRD3FTOewTM3gjR4E/d
         ixQORHpoewk8FCrh1UvEdlKNBu3GVEthcD5EXDdeUtP9OCC8TNblpod9wMRl6/tGKwa7
         ghFXjQVpKc1r8Axaa1W2EJ9dv37whxIL+J9Z3FdschLVjyaKsUn5ZZTe15Wouvpuah6I
         8irA==
X-Gm-Message-State: AOJu0YzkO3uH/gcJb3ycQO4Oyan1FRSP0E34RsZZR+nenPh+WcQpGGrl
	vp6XCBpNHtfuTiP5PDJIBOTWzbqUz4mxL0BA5TLQxo3FxfwHcw/IKkR4wR9FMsBZ
X-Gm-Gg: ASbGnctBt36sasA0wLJINstVo6acGZqfrCbKV+QpfViD+Qcc8ZlR8/ttp4hJK9LSsHS
	Wbzo8uQe+S7g1trtEtcR/TEGbykIwPmNOwv3yiz3kDYXZD/cYALUTdFB0Cy0X3naJ++BdFxha9w
	0XWkMKpToc42NiR4KviPBfYfCIuYmg0p5qFj9xOhfYiHD6wx2b/pB2JFoArTX6hRomGsyOoPwMV
	R/OToxjiRQlWDRLjU4GdvKqZk1GxWNYJnmvl6cgjgqBEL+3Dtkbt4kAMJA9XpPfOUs32yl+n3+a
	PjxT/hbB1Fzy1KppTyebL2Pau4qJch4iGkYqPBtiKW8wnomLP0idCelQUpYNsRAekG2/65L3JGg
	UV71mJkdKRYJbRULpivNHeoKlVljn4TbPvvl7c4tHPixZ2Bc0z8kJdgrCwVtiZnvR6LFWJ8cybq
	FjV2lBPEK2
X-Google-Smtp-Source: AGHT+IF8thpD3JGYkbs7YZ8qm1GA3KNn3CFvDDy6+vT4Evfol2TUKNL/TGYAMjqoSX5NZaDyziPg3Q==
X-Received: by 2002:a05:6122:1825:b0:54b:c417:4d7c with SMTP id 71dfb90a1353d-5524e846f09mr3381995e0c.1.1759758215464;
        Mon, 06 Oct 2025 06:43:35 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce694ffsm2955342e0c.10.2025.10.06.06.43.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 06:43:35 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e261568020so884869241.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 06:43:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5108:b0:508:aeba:ac31 with SMTP id
 ada2fe7eead31-5d41d002033mr4256282137.2.1759758214610; Mon, 06 Oct 2025
 06:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 15:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
X-Gm-Features: AS18NWClqzJN9dA6PiMr6EUhixU8-AfcKoTYj9pkzTaAb0NMa8OHnHTyzG2qTcI
Message-ID: <CAMuHMdV-6A+vV4bZLoT2NtXiqMQLTRRbNJXC1z2ttXX=aXFEGw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into
 reset toggle callback
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

CC p.zabel

On Sun, 5 Oct 2025 at 15:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
> Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
> after reset has been asserted by writing a matching reset bit into register
> SRCR, it is mandatory to wait 1ms.
>
> This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
> whether S4 is affected as well. This patch does apply the extra delay on
> R-Car S4 as well.
>
> Fix the reset driver to respect the additional delay when toggling resets.
> Drivers which use separate reset_control_(de)assert() must assure matching
> delay in their driver code.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for the update!

> V2: - Add RB from Geert
>     - Use ca. as abbreviation for circa (cca.)
>     - Switch back to udelay(), risp triggers this code from atomic context

See https://lore.kernel.org/all/20251003150819.GC344149@ragnatech.se/

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
>         /* Reset module */
>         writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
>
> -       /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
> -       udelay(35);
> +       /*
> +        * On R-Car Gen4, delay after SRCR has been written is 1ms.
> +        * On older SoCs, delay after SRCR has been written is 35us
> +        * (one cycle of the RCLK clock @ ca. 32 kHz).
> +        */
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
> +               udelay(1000);

1ms is a bit long for busy waiting, so I'd really like to avoid this.

While the documentation does state this 1ms, I understand the
issue we saw in the field was fixed by
https://patch.msgid.link/20250922162113.113223-1-marek.vasut+renesas@mailbox.org
so perhaps we can do without this longer delay?

FTR, it looks like the reset controller documentation doesn't say
anything about the context from which it is safe to make reset calls?

> +       else
> +               udelay(35);
>
>         /* Release module from reset state */
>         writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
