Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28183331A41
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798759; cv=none; b=RoHNl/9Wn47OTeuixnpBDj4EDu615EhIl46X2JuLPUOf1Pd4QF8BPlobq29ICjzSwE2OXvw00kbbRhsUCChoT92J+cafuBNOH1TpE5vQdfdJBQlAUH1CjBdfaeEA3zLX8y5qySeOhQMDjLtZNUqudzfm5XNAczGeRo9/T+x5Iog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798759; c=relaxed/simple;
	bh=lQH1FRm/rJzskVoeclFFS2ftwdSJglbw9Ah8hTk5DQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOyLJnpDgeHgR2wC88IciZi6IlgQRn/bSLUwx2fYNaujyOK0S13Lo/RXYRO0R9XwtFjAMwcW/2xcakfJy+/OrLgNxvfOqu+u8mAFT+Sz5I1y45GPVZshgsUeHlC4xYlnLUe5J2kKsoVu1MBAFDS6+TF4IzkFtejSQZF/B/tfNrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ed09471ab9so201788137.0
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798757; x=1768403557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTnh7CkZFGGtUC43ryOTlC9N4pV7qcvjxYMPMpt68WY=;
        b=ZccSDVcfCjCS3kAhrakiIiOTfjUNlJSsjw7dzVUk/fPfiNaKTLh/Sj8tGyn4xeSGwx
         kd3KqQlmvPuKu1f25Ry47xmmjcex8tvXNG6XRGq0VR+PQPzzPk2VBYJUjIF8DqrXeRG+
         nXJF9pNoJQ6ypfvuVaagXSutVp/GdOp15yd0Y1ackrOEpmsBPP7WRiqk4HpR8j/cbdL0
         vztFSoFZ9L9+mLsV/QFmt/Dr7OOPAhAUismPF92B0ovyA6uS90j+e0IWOMpkYA2pji1w
         2h/xOwyyXyRC+rQ+y9pOWlTUvhFzBxtixcFS15tr0ViR2FX+RFAxWyxslUFlr0omyrct
         0qbw==
X-Forwarded-Encrypted: i=1; AJvYcCWcs4xQtWfu2dSEnuibF9WQxzESfv8DkTMPCFKDDUqbw2GWPeLfsUU8TEXtoH+NOFtCNKPaLdTvKbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSkSr2Wf3EDF9G3/zahGvPLlDpdZU0Gm+uA7XS+TIKlAYKl0Iv
	OVLG8KPGxi6EF6937gdP+qet9FXx4u+bkhqWejV2OAUu2Hn0y3ebDJWqSXm7HyH2
X-Gm-Gg: AY/fxX4gJW4IKRNLNn38t6lAAkXdAz0MawkD6XwJI4FZ1xU7vhymhNdwTKrruZTIHOw
	ReTNDlPEgb03StkWlypwxyxu8IouDhTpuyisWrtqHag4ksBR9U8usL8qhCT+PF3N/rxUKXtz/Il
	4umS4hU6KiUjzln3YqqD7hqrtxdVHvpUGGSwIPNIL3hL2KkKhOHfE04nhjBYVOmsIjHPccIn5N8
	TLqUPDJyijRFxsKH++0xN11GPOgx45xlom8twuiSD6cqpLEApLqVKW7CXCMjVEUHypS+TpN0/5I
	HTV8d+wv9Fb0djmvnpGQHc3VC9zlLYFUuPxxovcxC0tMOmmZZLQukt2a/g1rVAnIyYhQnoo6BHx
	rarDJc97mT/+1rmbvw9aXX53qT0u3ZDOSFl/+DFUz19qT31w2U3Jgl2x5olhBzjj0wUSFrdlvxM
	WBkvGzpczmTEnnMDambM1sd9CMcBgbwJBkqk3v8ChuMcl0TvVc
X-Google-Smtp-Source: AGHT+IFVeS8cpSZNoSQlTOXznUCKOgRrui/HY64Fc7ZFvJ5oVCD1joVCJNmtCxCOK6lbt+1AarD/9A==
X-Received: by 2002:a05:6102:304a:b0:5e5:6360:1f5c with SMTP id ada2fe7eead31-5ecbb160489mr1037420137.42.1767798756867;
        Wed, 07 Jan 2026 07:12:36 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec772e322asm3220746137.13.2026.01.07.07.12.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 07:12:36 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f56a97064so649593241.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 07:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1pHpofacQHNvI+MzM2SXZyOp+mJP2IPtObL0RiJWM3h0xTgXNt3o7ZbGivd2FFy6xUWiLj0chSAY=@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5db:3b75:a2aa with SMTP id
 ada2fe7eead31-5ecb688e212mr1021167137.18.1767798755697; Wed, 07 Jan 2026
 07:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224165049.3384870-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224165049.3384870-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 16:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9CnVBybm5ipadp5MeUZTfG0GrBXLNmV2A3sOq7s87VA@mail.gmail.com>
X-Gm-Features: AQt7F2oy55RsF88MDpvy-XJ8ZxqntDCnKvwZjjY1H7FzCraTsk4lAgUrlROdqFc
Message-ID: <CAMuHMdV9CnVBybm5ipadp5MeUZTfG0GrBXLNmV2A3sOq7s87VA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a09g077: Add CANFD clocks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 24 Dec 2025 at 17:51, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have a CANFD
> peripheral which has three input clocks PCLKM (peripheral clock),
> PCLKH (RAM clock) and PCLKCAN (CANFD clock).
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -251,6 +261,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
>         DEF_MOD("adc1", 207, R9A09G077_CLK_PCLKH),
>         DEF_MOD("adc2", 225, R9A09G077_CLK_PCLKM),
>         DEF_MOD("tsu", 307, R9A09G077_CLK_PCLKL),
> +       DEF_MOD("canfd", 310, R9A09G077_CLK_PCLKM),

The documentation is a bit confusing (it states that PCLKCAN is the
peripheral module clock for CANFD), but after some more digging,
PCLKM seems to be correct here.

>         DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
>         DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
>         DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
