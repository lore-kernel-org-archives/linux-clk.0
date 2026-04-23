Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149183E51DE
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937049; cv=none; b=BChsVirl8HXsN/fTfMINWRyMbbmKaeGLCcAwwlMOLfms690+w/O+rmZOvScnJ7/D31v03u8lXKb61oGkFpNMTJx6mj/MDhpts4hEnkxqTCjwXjWWzdG8Z2VrulqHDA9iY4zfaJLFRRvUnY1Tk2WdCT1WVcd2xDkVEesjtG6jeLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937049; c=relaxed/simple;
	bh=MMW8tY8fFNjxzkTNFQdlqOQr9QMK/x8eljdm5gJfveY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlPDp7D/TadF+ujEDNISi2OyBpEcwuu5/+HMIXLYVZM8Rk2nHcKrXB2VsFzqXn4wYbuGP1GMROYs0MFD33g1lFWTWTsWgAJn7D+qNftFLbQFV+TDTO8vdpwH4id4FcHA/OanBufvqu/VVPLEYU73Edsbg3GtsJ0fVIOFYN2sBBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6057723d553so3446010137.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937047; x=1777541847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sPVy0d3Q09KZb/RrhEpm6fKzZd0ZrDUPEVCPpd/6xc=;
        b=Q1pYInN/8jdNlcaqqyOMYP8Ph1C/GyrTTNi0v5z2CyYcHoBf5PuAJYX8z0an53AF/S
         tb/zyMm2C7iwCMYD/1W6D80IadtaPFWwyjjksAN+hPM07qldqhjCx1sEG0E0x5EQbF5q
         K0upP0OKOhO+XwPg39SnOLCb5SCHF22CZqVV9HQrFnj7RJ6OM87MwIpvZUXKaC5W/tXm
         +kkPXmAxYLCMQ+5upjZeb3cwRCY0wbInmSF2YFMPnIjtq/9xWbuO6bKpwYXE4KsjtR+E
         c+4alh9RuHf64nsJ44k6zz9qJQzTUoMH+ZTOg28xBWixu0I1WSDszoEtQKIkoJNgUH6W
         GaEA==
X-Forwarded-Encrypted: i=1; AFNElJ+2byb81+CFxmGdepfQvR31lRlaMXVR8FcXE9x6zSbzhxBMdnWu2LV+A0N6jT4VSc+09LEO4c6d/Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOIF+oFr4EFk3/1OnBafsbxS9MZ1y42KEIT+suBYefYO17d7Q+
	vQCdOmesdSE315MxwUmOB9fszZSd/7aYjHt4+KY1BOg10iG1z4GrzrB20bO42+I73Ws=
X-Gm-Gg: AeBDieuJa8VEjtTwpLV0VcZj133h922fLE9mCKH2cidfObgGXt/W3OuZBWaU066vMDm
	nj631SsYlKsT8VH5i5EEjoek6ubMHL36iApPnNtQ/BCr5cdlHJMbXj5+7trhUsFveCB/5Esb6OC
	I5eRbOJhHg5zyPieI2+uymNPmaNu5ccHNROthNKA/mPm0NcoEBbRD6sjTYUVtBlMochTGLUyKsS
	456tWNuLIX60cLXS33AU40OBLIIdyr6qVQqujNarvnyZAoJsPT6N4TPAxEclf7F0l/rrqItc6vO
	scNtFEZh+flsRMFeNmZOL90F9RE/kjjnH1oXmilOjt5aaUnQQdPKPigNQVulKHQqTj+c1plY0ZS
	U7pmOJM7mklN5Rr+/cCpRshJK2fVKZjURINUDz1bCalObILJF7SFFsqDbO5cmUpAJbMdCCStddB
	foOjMeYl3AoD34dpLq815xxR6kc+EJTXAiohG+dzhjlxVLNSX2oPnU/TBDMkn5w0AC/UT8NyU=
X-Received: by 2002:a05:6102:5094:b0:608:94e3:bd8a with SMTP id ada2fe7eead31-616f4f77861mr12885324137.8.1776937046989;
        Thu, 23 Apr 2026 02:37:26 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589097ec5csm9180540241.4.2026.04.23.02.37.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:37:26 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60904a76e63so3759248137.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 02:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qkJo+IxKjo1X0ciIq+xGHIqv8O3ACfvococ7TIpJ2qus1kFIOwfhRf0EFLEHF3R9N49kMOgkT9J4=@vger.kernel.org
X-Received: by 2002:a05:6102:2d09:b0:605:17b8:16dc with SMTP id
 ada2fe7eead31-616f6ef7d62mr14489475137.20.1776937045430; Thu, 23 Apr 2026
 02:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com> <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260326110648.29389-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Apr 2026 11:37:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
X-Gm-Features: AQROBzATkhB-bEdA01TJo1KbJI6u1Ear7Clb_HG6YiZ4zlpVNu741tRlDhNBios
Message-ID: <CAMuHMdUAdDAzRVkn6yOnTuN8nMWHwQsmfSncYu-0g=0KzUXbhA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
> some PLLs, if they are not in use(eg: PLL6, PLL7)
>
> Introduce `is_enabled` and `enable` callbacks to handle PLL state
> transitions. With the `enable` callback, PLL will be turned ON only when
> the PLL consumer device is enabled; otherwise, it will remain off. Define
> new macros for PLL standby and monitor registers to facilitate this
> process.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -58,6 +58,13 @@
>  #define RZG3S_DIV_NF           GENMASK(12, 1)
>  #define RZG3S_SEL_PLL          BIT(0)
>
> +#define RZG3L_PLL_STBY_OFFSET(x)       (GET_REG_SAMPLL_CLK1(x) - 0x4)
> +#define RZG3L_PLL_STBY_RESETB          BIT(0)
> +#define RZG3L_PLL_STBY_RESETB_WEN      BIT(16)
> +#define RZG3L_PLL_MON_OFFSET(x)                (GET_REG_SAMPLL_CLK1(x) + 0x8)

This - 0x4 / + 0x8 is a bit hard to follow.  I don't want to block
this series, so for now it's OK.
I think it would be good to refactor the whole PLL sub register offset
handling: currently the config value contains the offsets of both the
CLK1 and CLK2 registers (which differ by a fixed value of 4) in the
config value, and the other register offsets are derived using the
macros above.  Instead, it could store the lowest PLL registers offset
(STBY), and derive all others from that by additions only.

> +static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       struct rzg2l_cpg_priv *priv = pll_clk->priv;
> +       u32 stby_offset, mon_offset;
> +       u32 val, mon_val;
> +       int ret;
> +
> +       stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
> +       mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
> +
> +       if (enable) {
> +               val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
> +               mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
> +       } else {
> +               val = RZG3L_PLL_STBY_RESETB_WEN;
> +               mon_val = 0;
> +       }
> +
> +       writel(val, priv->base + stby_offset);
> +
> +       /* ensure PLL is in normal/stanby mode */

standby.

> +       ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
> +                                       (val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
> +                                       10, 100);
> +       if (ret)
> +               dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
> +                       "enable" : "disable", stby_offset, hw->clk);
> +
> +       return ret;
> +}

With the typo fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
