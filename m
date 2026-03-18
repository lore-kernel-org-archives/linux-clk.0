Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66343DE43C
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845910; cv=none; b=AkKoKeuv4dX2EKM5xr0toyS7qAIVPlS4MLZ+ToNVsR9w7sqOhr68FXBlu6ptmUYdhmBJsoHUAlOPpkn3+DfKqPzVB5yUYOc0SkOFKYZTnOi2TbTdHXItIDl0jA0feHSc+JEkWvqQkW4jA0HLPF5xVQMddEVmNt1jFpFPV/+HH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845910; c=relaxed/simple;
	bh=50MfmCN+KUemq5gXleHso1CH8MXsjSKPubK5G/ZXF70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBZDxSMv5h45Akfy619D51laVO34QiBdHaNpjVSYtltqKHLzUYHx4uMDjXdJeCK2+xqk7/cRrAMP029ynAYZPRLW2KJYpDOoWfVWdneyWGog2L9mswxbhwSjeL7Hm8g6x3Mb3mpEBE8BSwlKqioqYpwOe5jbvNX40COl+diG5bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso6617443e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773845908; x=1774450708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIIcUcbDwIu+sKvFkfbi0aVtWpdCOn/cQkP6OcnI+Xo=;
        b=STETmtDaTQJLKTl+/wrfz+fATNJ4nVT8K/DEUvCWdM3fq11oRpXmD027SBNsGhKNrc
         0evB1myfJKbMft6Dpb+oGTkyfDTeeeKjQQDPyGrg9lgVWvzPVU7c7ujp5Ug4Q9ijYBV/
         dhoJzu4t8VtiOETd36eJLATCuvACodURLZN40A2lQM1Lw06lLg3xEFYfIzd9wQeYKPAR
         vuRj5jdoCuYOFR71cju0qeWTsGua1ma0Jmo3R4z67R6RC8f2g+qDZBzumyhDJynbHGcF
         yN5lWLOFBKTXUpgNU5nf1v+HYtc8POp28LODNr0N5LUt9CEz4gvlnDr6ZoJXGv7NUlbE
         ON3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUw2a/m0gyOPSFOg/eFBBeDMMMBBnzpMB1NwnaUPe9OvlTPHJ8AdghQuTi9ulXDLHKWAqvqTqjuFB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wOtLNWqBkm3OFGZREmXk8pypHg1fONQ6FqFApkw6KLzh9S3z
	xc4oh8qF7ogLUtv6awX1peNKgJ88VEZYEqMGjdojb/3PoqDeHMs07aL2iKXQ3npxQoc=
X-Gm-Gg: ATEYQzy06uyY0QQW9J02sPNOnZtu1wGGYgK3MNHazCCxTVyI2SCk70GJ/EL40wFOF7d
	NHNcKoQlt4I7ffjlzghfaPqgC4f3YeHkWtZib10t9yr4BOh6unbKkhkv6L4FXWN+hn/TFWk+U01
	XwtsDM4kO3bKZJ3bWV2znoWIeUinw1MDDm/L0Ow/sxvTkbu5TBiZVpEEE2Ra6+XbzzwMLH98dnJ
	k2edEgQvUJmR+7LE5XHz3crjZ557Q1yDpPw6Bw12qUUBRmD+cDnCd0ZraIaK1dg+tB/Qbd83Xle
	ARGQ8+tVgeOpj70c1OAbPLLlXJU6WKNYpstdNHmiQBglFXdr9vbSAe8SibvDX2Ch4RtuIT1GpEj
	A4wXh8WIFqNgp+o8QRAJF0wNhUYGktnI9PjjQEPBAzkbIVrbqhg149mcwqnXP88YibrDcEF3w5D
	rk57EkiGBY8K2AgRhSlwMnT2Y4on6Ox+CXBePHoUPa7G+9bikbDoo6rwzrfMx/XYUoGhIKZp8=
X-Received: by 2002:a05:6122:1811:b0:56b:982f:1267 with SMTP id 71dfb90a1353d-56ba71b70c2mr2278847e0c.13.1773845907566;
        Wed, 18 Mar 2026 07:58:27 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba6e82b4asm1697052e0c.8.2026.03.18.07.58.26
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:58:26 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5fff77ff719so3287953137.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc6nGp319+oHWucwr2UPMXhqFuWkmCvu2XLdC2+6vuzX318uayz4kJifkLiaHqKQfs29eye9ar8zM=@vger.kernel.org
X-Received: by 2002:a05:6102:3f4b:b0:5ff:a0dc:1773 with SMTP id
 ada2fe7eead31-6027d09e097mr1964046137.7.1773845906277; Wed, 18 Mar 2026
 07:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com> <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:58:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
X-Gm-Features: AaiRm53OukJhR16tomRr9McagvrVaNCtjyR2KfZ-2HS-YMJlQs8CIh_0kBzvPN4
Message-ID: <CAMuHMdX0yCX_mFt1B0jU9wM71BDaO27exmhbsKkMmRXJQthnUw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 18 Mar 2026 at 09:41, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no owning
> driver to restore them. This mirrors the existing crit_mod_clks mechanism
> which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
> some peripheral interrupts to CPU.
>
> Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
> allow SoC-specific data tables to declare reset IDs that must never be
> asserted.
>
> Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
> resets and deassert them. Call it both at probe time and during resume to
> ensure critical peripherals are held out of reset after power-on and
> suspend/resume cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1765,6 +1765,15 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
>         dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
>                 assert ? "assert" : "deassert", id, CLK_RST_R(reg));
>
> +       if (assert) {
> +               unsigned int i;
> +
> +               for (i = 0; i < priv->info->num_crit_resets; i++) {

for (unsigned int i = 0; ...)

> +                       if (id == priv->info->crit_resets[i])
> +                               return 0;
> +               }
> +       }
> +
>         if (!assert)
>                 value |= mask;
>         writel(value, priv->base + CLK_RST_R(reg));
> @@ -1802,6 +1811,21 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
>         return __rzg2l_cpg_assert(rcdev, id, false);
>  }
>
> +static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
> +                                         const struct rzg2l_cpg_info *info)
> +{
> +       unsigned int i;
> +       int ret;
> +
> +       for (i = 0; i < info->num_crit_resets; i++) {

for (unsigned int i = 0; ...)

> +               ret = rzg2l_cpg_deassert(rcdev, info->crit_resets[i]);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
>                            unsigned long id)
>  {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
