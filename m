Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF93435EC9
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698564; cv=none; b=XepN+9W5/m+BkYNr9C6oC/27bOC2zayBnWzypU+oQTJaGzGq28otHAD+/LEMnou5wMfQvzYc7NGPK26vFYELdNibN9WQCcqhL3iOy8/gO9v2Ehj0upieFiPbOJJspzUnjxitccsTdnFuUaFuyK2eJWQjFBSWc6ZSXOELrwlkkSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698564; c=relaxed/simple;
	bh=A4h77ibawannBAPH87BChFbbPCITD6OENy0wjOmzx7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8lhFuku9qqgG5NNKBg/ydI3cHSj8Z7GHOyptGciqmNgmmfq10ITUsNdRjuWweaB9RFQIOPju13n/l/OuEajmn/3YdzqGwaf1nKYPSGcK4K4+gIpkZri/Nt0ycAoiYK1VEH27Kn71Sgt5aCuYIvsYpZ40Fc1xSaq9ozuXQTe4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73791ee3612so840524137.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698562; x=1784303362;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c56Is5NzVBtMY2XB6xsd7AIP2CY/o4bo39X3DPUe1yU=;
        b=c0HMpkoVYb/BnChg+m1HImJY5lVxBn4RRqUmuSWkHVFy3vuCn4CNQF8kfxEykvGan4
         MZDbMgL9IOFV9FynyQkRjX/Z+PfvCgb5oGQOtGGhlq5JcoXHPStXUUKteeVbvnu+chob
         161vbhz2jepWE2rBd06Hb3aRGk3aKyqXyx96a87BpL1lrL27A80ZyKCI2ObiN3YyRD/q
         rY6bmBkMvjSvmAXimOh2A2R5t57g0nApaDZHaTACa9Fbqikooy7mIwWXU0QN/Rh+2UL9
         Gk/38xiFlt9Cenz+PXOTEBRD4IytQW4lJ1ifKUzWADLZLBD88F57jgI6CC7GGIdjoRx4
         rGxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOfubfmFTHrOFHodHdXf+UPuXUvtpCmPXa0cLwmcShioTjJGQyf/46oL0XaDM55amzliQbFgtWLFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXa9X4aPstz796btqwgrOcPyzgPXz9M+qDpEIBd4eoTAglm7bl
	63n95VRQuza/ME80oqTFH7OPizNL147ieAaRIdXxUt1entwT1b651xifu4DXtq0V
X-Gm-Gg: AfdE7cnshmA4AKmdW9/3byIIesjm3IYsGWLBqpFLDvSeDDv4TzgosZMcUODjDtLC93u
	C7NH+Y6ka1dPxyFDkAoxq8rfkOTG4ZoW9irus4a9P8aWwpY+vHTLNaOXqutXFGntrCuBEBd0/fM
	5X/2FQE2gHGS793h9POori/EnRqi8nb1sHkLXNy7c2yg56eKL7xfqiEsTZCUxRHhypnVE0kUdbU
	XDAfzJTP3n+y8p067WEPJRvK2JXYeWJ5jJAa+plR9Ua9LXaf2+0Vp9tvXtcD4hwcoVieGyYeBuh
	iSU87Lc6KKF0y1JFuu9vbtAiUbHFRAXwYYlX0OZeoCfG0M+/H7YDDBdOyYvesB6zqxr3vkoIWLv
	8bg99zytzLmAYL0jqrADaTHBzr26dPlzmf9Ur1dx3mZLcZjqR8KCAFS5HplNUJ+8a1+2O7rodfz
	viLA+qBbCTLhHCsO7C4qKSilARW/On1l0xJo8vJMYBXtpOWeqOIIabng==
X-Received: by 2002:a05:6102:f89:b0:744:cb59:d6e4 with SMTP id ada2fe7eead31-744dff883c1mr8334544137.22.1783698561893;
        Fri, 10 Jul 2026 08:49:21 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6deb2a3sm5429141137.8.2026.07.10.08.49.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:49:21 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bdc96b0714so846806e0c.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:49:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqCEgPqaN3fT+5R5mAffueexbzHod4TaWnvwfj2MAdSuXHNnbKS/7VhIyuDsqDo9PYBozp5o77rJs0=@vger.kernel.org
X-Received: by 2002:a05:6102:a54:b0:738:b13a:c81b with SMTP id
 ada2fe7eead31-744dfd58226mr8804295137.7.1783698560769; Fri, 10 Jul 2026
 08:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:49:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
X-Gm-Features: AUfX_mxzY40KN7w0aM5WBFkuFrJcn1qYlqHElb3aj7kHBqjUkZvRwirbZBKZLZ8
Message-ID: <CAMuHMdX2+Y3Wpd5WwZBRSjhPdABGfKEzUifcGg5gTbkya6Pjuw@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L DSI mux that supports 2 duty cycles.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

More comments...

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -120,6 +120,11 @@
>  #define RZG3L_PLL7_FSTD_DIV_MR_MIN     (8 * MEGA)
>  #define RZG3L_PLL7_FSTD_DIV_MR_MAX     (16 * MEGA)
>
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM          4
> +#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN          7
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM       1
> +#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN       2

I am wondering if these macros are worthwhile, as IMO they make it
harder to understand the code.

> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw

> +static int rzg3l_cpg_dsi_smux_get_duty_cycle(struct clk_hw *hw,
> +                                            struct clk_duty *duty)
> +{
> +       u8 parent = clk_mux_ops.get_parent(hw);
> +
> +       /*
> +        * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
> +        * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
> +        */
> +       if (parent == 0) {
> +               duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
> +               duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;

The 4/7 duty cycle is due to the division by 7 between M2 and M2_DIV7.
Perhaps it should be set by that divider clock instead?

> +       } else {
> +               duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
> +               duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
> +       }
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
