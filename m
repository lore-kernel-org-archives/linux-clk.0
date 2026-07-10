Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C861D42E8E9
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783697620; cv=none; b=FFQ7pWWXHnLz7cPYc+BXjAirln8ELHJty9UiejCZ8aM97B/lXKFtvSAKevTZkHZVhq7lWvkwkoBvdjKaKXyBhRl8eEzn8zmNADinTevu9JOOpa4uoqxploogEKzdEAbPWCsFdbzjDyjKa2VprVbGpx3NApx6xEcyWSDGIQwLTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783697620; c=relaxed/simple;
	bh=+uZ5UXdDa5uhMDpMicnYOj6M0pDzL1+0oF3Co1ShkM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MX5U2wvXZM6xsOAeV5UoQW3HM9145Dk3dK0bxh5HOevuxIU2OGRp2gema4hDV1hMLJxOJXVCqu5hLCUrqVEbPbykgdPAC71oRlM5iHDpbATgfjJWESnZyZcsfF5Vj6N7IIkW/Le2zzB13Dki0RMV8zKJnBZlzYSFE9u6unLZGIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-74019ed06aeso894668137.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783697617; x=1784302417;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+J9nqX31rcmK2FDgFjQE+og8sL9DsOwtNN74GPHDF2c=;
        b=NoTfxYVWSxxFIFIrN9FuX6H7Y4rgufQN6egG4so98HFbbCJKNLU8e7lgEaYP8l+BHp
         DRkuKJciwAyzJiZ5WNQe6VPweMvlSlxcfkKwNW/si+nNgjy/tZx29Jii8DoEs3FQEq8k
         CjytDobX3ctE55O2cJq92J91PlGYkygGTYPnQ0gor4bo5iwF36Jq01ZWmaYF8BvOdSXX
         6CAVT8oqyiEUHD8zkst2aVgh1eiimQOfjQph02dADRF7rZUGDZqD3Bc67GT0J/44amoc
         Wnj4NcAMEPV/6HJ8rC6kotvx69lZcQU+TyfqLRn2EOQK4wb0gpQ1ln9WHhQDaEUw/+5p
         viWw==
X-Forwarded-Encrypted: i=1; AHgh+RrT5NUeg7upun84cbzoNmUq9Xr/GDclPvMw+GU6euAi3Ag7SS1aZhuqNWpxNHALVfPTTwd6VZVnlnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXkjwZr5aT4HfzXsmph8YlIvezMryHFDGnQDGq9OdZ4U0DI92n
	ulPQXXEHIJGDtfi1WyDxHKb4GjcKl/USgPtlh3XR4khkQW1PIKFnUVb15hUsx7CV
X-Gm-Gg: AfdE7cmkVSoWCqz3AM+2IW0vSUJNuMgcWUpNQfPMQ8ijKxHRiX3xqzylkGlcFoNfUYl
	xoh4Uuvbps3J0PWs6lR/EY+mAh5sGmSlfRnwSDVHjK9ac1mcGwhsBn0xP80469T5pYIsd5hYJiX
	fHxdqm3KAAIoIKOvrChBTmV1wPBLqbBjypuWTGS0T3v98fmSsOBZDObBPOfG0h9ZeNcuiQSx8EY
	vqdOSw3Td15NUHD+/1RHVqmQ35bp8GE4UeT5AyCNHIiqjIEk5P46+vE/ijUevikMarc+gVfZu+N
	yOKPtebDKYCLq/lpZlvuRudE+0Qb3gtfXKRwFOvkWmD659RQD1mxeZfqr0KaupCmWzFl38qtzYZ
	jN453XpRiX0YUtZuIc60m3PltzZ5eJWQp/dssWDNRJ3z6UtqDnqin1ZAFDOd5W6WEw80DnSCzSP
	WVqzSpEnvcTn4MqRGXTHcgMFNZvklyrhSlabAxSfTenseCYIRHZw==
X-Received: by 2002:a05:6102:3ed4:b0:738:ff1b:940 with SMTP id ada2fe7eead31-744dfd069c7mr7678752137.4.1783697616589;
        Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6545095sm4776278241.11.2026.07.10.08.33.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-737de525d2eso1192722137.2
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:33:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp5FRdlNDUpXX8MBf3c9pc8QW8bWYac6B9mz9WwaY1hJ7TI6cwo2lZvO9BGzMC1//wVmOmQ/di/cKk=@vger.kernel.org
X-Received: by 2002:a05:6102:424e:b0:740:4fd:1c40 with SMTP id
 ada2fe7eead31-744dffe9c44mr7334430137.25.1783697611180; Fri, 10 Jul 2026
 08:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:33:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3hKHP-dSVrX7xzQS8oozeJo_2na9Od3vRuPbKDGLt=Q@mail.gmail.com>
X-Gm-Features: AUfX_mzojKdu_GbcaopGh8X_KXQ0RBr0eGDv_KuWYH0dzXkQTjZt2QCt2fgBU28
Message-ID: <CAMuHMdU3hKHP-dSVrX7xzQS8oozeJo_2na9Od3vRuPbKDGLt=Q@mail.gmail.com>
Subject: Re: [PATCH 1/6] clk: renesas: rzg2l: Add DSI divider clock support
 for RZ/G3L
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
> Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
> SoC, which requires a different divider implementation than the existing
> RZ/G2L DSI divider clock.
>
> The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
> DIV_DSI_B, where the effective divider is:
>
>   rate = parent_rate / ((1 << div_a) * (div_b + 1))
>
> DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
> and DIV_DSI_B is a linear divider with values in the range [1, 16].
>
> Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
> rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
> the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -834,6 +837,134 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
>         return clk_hw->clk;
>  }
>
> +struct g3l_dsi_div_hw_data {
> +       struct clk_hw hw;
> +       struct rzg2l_cpg_priv *priv;
> +       unsigned long rate;
> +       u32 off;
> +       u8 div_a;
> +       u8 div_b;
> +};
> +
> +#define to_g3l_dsi_div_hw_data(_hw)    container_of(_hw, struct g3l_dsi_div_hw_data, hw)
> +
> +static unsigned long rzg3l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
> +                                                  unsigned long parent_rate)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       int div_a, div_b, val;
> +
> +       val = readl(priv->base + dsi_div->off);
> +       div_a = FIELD_GET(GENMASK(2, 0), val);
> +       div_b = FIELD_GET(GENMASK(7, 4), val);

Please add and use

    #define DIV_DSI_A_SET    GENMASK(2, 0)
    #define DIV_DSI_B_SET    GENMASK(7, 4)

(after having seen G3L_SDIV_DSI_C_SET, I kept on looking for  similar
 A_SET and B_SET use).

> +
> +       return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, (1 << div_a) * (div_b + 1));

You can simplify the divider to "(div_b + 1) << div_a".

> +}
> +
> +static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> +                                           struct clk_rate_request *req)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       u32 divider = dsi_div_ab_desired;

unsigned int

> +       bool divider_found = false;
> +       unsigned int div_a, div_b;

Perhaps move the declarations of the loop counters inside the
for()-statements?

> +
> +       if (dsi_div_target) {
> +               /* Calculate the DIV_DSI_A and DIV_DSI_B */

Please drop "the".

> +               for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {

div_a is unsigned, so >= is always true

> +                       for (div_b = 0; div_b < 16; div_b++) {
> +                               divider = (1 << div_a) * (div_b + 1);

(div_b + 1) << div_a

> +                               if (divider == dsi_div_ab_desired) {

divider is 1..512, while dsi_div_ab_desired is only u8.

> +                                       dsi_div->div_a = div_a;
> +                                       dsi_div->div_b = div_b;
> +                                       divider_found = true;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       } else {
> +               dsi_div->div_b = 0;
> +               /* Calculate the DIV_DSI_A */

Please drop "the"

> +               for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {
> +                       divider = (1 << div_a);
> +                       if (divider == dsi_div_ab_desired) {
> +                               dsi_div->div_a = div_a;
> +                               divider_found = true;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (!divider_found) {
> +               dev_err(priv->dev, "failed dsi div for: %u\n", divider);
> +               return -EINVAL;
> +       }
> +
> +       req->best_parent_rate = req->rate * divider;
> +
> +       return 0;
> +}
> +
> +static int rzg3l_cpg_dsi_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                     unsigned long parent_rate)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +
> +       writel(RZG3L_SDIV_DIV_DSI_A_WEN | RZG3L_SDIV_DIV_DSI_B_WEN |
> +              (dsi_div->div_a << 0) | (dsi_div->div_b << 4),

FIELD_PREP(DIV_DSI_A_SET, dsi_div->div_a) |
FIELD_PREP(DIV_DSI_B_SET, dsi_div->div_b)


> +              priv->base + dsi_div->off);
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
