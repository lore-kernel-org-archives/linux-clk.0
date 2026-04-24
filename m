Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1723CEBB8
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035229; cv=none; b=X3ss7Q77UPuSlw5fHigY1A6dYe2JN9mq7m7+vm8yL4IjbVC3RZ0GfWjUzL+Vt1TuGg4wjJM2OOyxdqX+7N6C96l6f4MYL+B8eIZ/3Lb4keEtJwuMPi5tyahCrLo+iHqRl8KtERtC2nXVnYDdW7qb5mUJONM7kG6IKj/bmCvKN6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035229; c=relaxed/simple;
	bh=JiJcoMrr81heW78mZh+WFRVFAEv9sq2yJAkgsjUca/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5ifdAnVsiojVeFyXs2ClmyoRSmYdb1iQt4k040HlrKsaXzTD67gsE1xJaYEpoFCc9oqDiiX+AxWvYaIh/zI+ECJpDqrsGROF871vE4d3iB/FvzJf0s3Z4m56+uTwOZd3e6fcUATOYIAJKI0KCgAByAjlakuPYOT5GeaJpScDlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67389cf78b0so13948372a12.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035227; x=1777640027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWuPEQ4wuoknRAimbXn+PnxB1sExNMaFbd6EJBCrV98=;
        b=pUCRhvophF5gJfEQcd2muglcK5ATysvBvyopKYayVczpR6NFV1fJ1ZjGlKC1RnmTRn
         aXCpACByBv5qVd7zyFqqwyseRQKbhDi2VJ7wQCUgKRNVqiyAu5YYoPc0NkBr4q7Qpyeu
         bPFcI9XDFZsO9bg79ubtDu+GupAybee8Kq0RNT3sqqJODBebOZe4xRpeg2URQ9puxGIb
         hUP1Y+z//exOKzyEQiE5YR78Qp8DmEEXxWnLH08mFkg+gzcfAP8LHdI1FSnOdBc8muU0
         jgt02LekCjc3W3q8zqAwnpav1NGKvyGUROVs7JvR3a+HW3d2mHJfucDz+i7Ey3IPYziW
         wJYw==
X-Forwarded-Encrypted: i=1; AFNElJ82SnZt0+5N4yPwI1BfPWPwUG5urPOeekJIaTo+X16+GlOI98cONzEoai+cfJXf/VJGaxdpycfAsDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkCQIYlgsRpSSRj5r4dPLSIKTUG9L0QibPjbWoCQOrO3lQp/j
	7hsl3BARwf4q6P54Eji+j65zWIvxzqL3/+yoPUhn/CBlNrWIHlaaYW7jwKjj+JbfgXg=
X-Gm-Gg: AeBDies4Pigg9Oue6T39x7hBudTZKtv2z9HT/jBHVIYWqwq8f1gDvjIVme+y6VRk6pJ
	/WEuUNp4BGc0hfwavQdhFpqclpvPYRUlFdktn4Zze9ikf+RewJLC81lOh3UtZ2Iz0Z0c2ekfmjY
	WJ0UVy5v2JPvSZdLHl6lUuzFIqPukpDfufAjLrLjwChIvHl/8fGdufCre/qwUBb5KV811Zszg7r
	y3c1Ktmzj0tdK1lLndU4O6rTii2KFnOkvYRGTaFhhdFe84gjiig+n5idRqoayvW/KJOmRhmE1lS
	dCNf2aIKMie3R+lMGEwAdsSle36UOxDegWLPcE1UtxVwL0Twh31O9Gi/OqCtVgzXIDVcTxCla1R
	8AgzodtwYOqlSpPJmg7AUyYYnk3ePljK6u3im+aUJBtUtyLxPRhJ6pULKnw8DGt1lTU+dN11p5l
	gj151X3HT0RycGp/oXR4BwA5DywdPGKqk6VwRVt8X8wrdJ/MjupxY6nomuPyrXEU4Bq7wGV5A=
X-Received: by 2002:a17:907:6c0e:b0:ba5:216c:56e6 with SMTP id a640c23a62f3a-ba5216c6068mr1533520766b.0.1777035226438;
        Fri, 24 Apr 2026 05:53:46 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45503c414sm769125566b.44.2026.04.24.05.53.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:53:44 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b886fc047d5so1399610366b.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 05:53:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9BCuHiR7WzRFQ3UaZGLmQjrcOu3rh+LbO8OdCf1qWwI+PE6CrsjC7lN5Vvjj642KCkQRWMX2kDpJA=@vger.kernel.org
X-Received: by 2002:a17:907:6d19:b0:ba4:ea47:5a2b with SMTP id
 a640c23a62f3a-ba4ea47b226mr1389280366b.43.1777035224322; Fri, 24 Apr 2026
 05:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:53:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
X-Gm-Features: AQROBzAGxz8erWqURAZ8ygYPlnHfb7Kkb4p46nGFXzzCf7yAkuPcam_l3ELewTA
Message-ID: <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add CA55 core clock entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c

> @@ -25,15 +26,24 @@
>  #define G3L_DIVPL2A            DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
>  #define G3L_DIVPL2B            DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
>  #define G3L_DIVPL3A            DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
> +#define G3L_DIV_CA55_CORE0     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 0, 3)
> +#define G3L_DIV_CA55_CORE1     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 4, 3)
> +#define G3L_DIV_CA55_CORE2     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 8, 3)
> +#define G3L_DIV_CA55_CORE3     DDIV_PACK(G3L_CPG_CA55CORE_DDIV, 12, 3)
>  #define G3L_SDIV_ETH_A         DDIV_PACK(G3L_CPG_ETH_SDIV, 0, 2)
>  #define G3L_SDIV_ETH_B         DDIV_PACK(G3L_CPG_ETH_SDIV, 4, 1)
>  #define G3L_SDIV_ETH_C         DDIV_PACK(G3L_CPG_ETH_SDIV, 8, 2)
>  #define G3L_SDIV_ETH_D         DDIV_PACK(G3L_CPG_ETH_SDIV, 12, 1)
>
>  /* RZ/G3L Clock status configuration. */
> +#define G3L_DIVPL1_STS         DDIV_PACK(G3L_CLKDIVSTATUS, 0, 1)

G3L_DIVPL1_STS is unused.  Perhaps you wanted to add the I-clock, too?
If not, please let me know, and I can drop this while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>  #define G3L_DIVPL2A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
>  #define G3L_DIVPL2B_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
>  #define G3L_DIVPL3A_STS                DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
> +#define G3L_DIV_CA55_CORE0_STS DDIV_PACK(G3L_CLKDIVSTATUS, 12, 1)
> +#define G3L_DIV_CA55_CORE1_STS DDIV_PACK(G3L_CLKDIVSTATUS, 13, 1)
> +#define G3L_DIV_CA55_CORE2_STS DDIV_PACK(G3L_CLKDIVSTATUS, 14, 1)
> +#define G3L_DIV_CA55_CORE3_STS DDIV_PACK(G3L_CLKDIVSTATUS, 15, 1)
>
>  /* RZ/G3L Specific clocks select. */
>  #define G3L_SEL_ETH0_TX                SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 0, 1)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
