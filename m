Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96321BC2A
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710918; cv=none; b=qWgdao/JoZE1uY9EcpB6cWHV+irB0PM7PIU3N+woyhm2fedsh5g++ukzWA5BHnmn/tvumIvmkJhnrZ6WWdKRMvbdLuorHVBrucc5pkbRJcqojaVaXTffbgxN75FHplqie5TCKqIV5kdbMjorKcLWIWHJ7XGo4WM3ahaMl+47vP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710918; c=relaxed/simple;
	bh=8OCXjdlcsorW7F3wlDb9Rg1EhzwfK4LjvHWJgLnbL8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6QX3Ib6aYKerMBXZuV+9PVER8lLHD9VJpWEAhed3DN9BacBdSw/u5j4yCwTRrLCHgKoNIf2WbGoZteOZ9wLUCWrK5ymyLwmKWrIs54YKgYEi4WKtS6yT4gMUdaHM+32ibzbve1mdk0uoYSJPkVMmXb0YmAZjhIBFS17kJkDfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1fbe461f59so151783866b.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710915; x=1787315715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FB5ANdhijMw8+haLtploY2iQ9eczR6t2NkhhsUQF4JY=;
        b=L/9fFoAZ3V7EFRts7FoXft4g8XsAWQU+yYKCxSpqTqKytcbtysmk2wpfGSxFK2voZi
         1UWWj4V01HJMD3wz6faq17dEcZ99IBLYP/4jZu/TI5X6XqkXqSR153ZW1bSmqZ5g3tP3
         3RI36zHmiB9VlSRqwccbP9K69RIA9nUtKd8gAsPwWQDY6lpaJ4qzf7obiTin5/Rr8C3H
         oUK2GayuIL+pzDNXHa7V7AV8l3kv9EyVRyzQBAxVF20GlIE++Hq9NYGjq3q0uVrpZBqp
         zSnzU3W3nxewAbvbL6BaQIVY/5V/Mfm66G0oBzCH1LvXb3cH6rhumucGFIsEHnS7v8wx
         8SNw==
X-Forwarded-Encrypted: i=1; AHgh+RrVYNsXu4yJ7UB893R2+uBKs6Vf1qDDzdh+cf8cb3DfvgR2ZCSNy8/6gjDzXXvHHtIJBnYsVKpQswc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnzWAjlb5wcIi4Gb/MFaWLrmGsvOsHjCC+FwU+0A/aFp/+jpiq
	x7TeyZeJjvWk76Orr4JHepxmZBtvubCTAtqKTGJy991ib+nyxe6O4UXMrMJiD8eej6c=
X-Gm-Gg: AR+sD12ZiYlxtHWnx7S0HvT2Pn1flCZU/4/I8eNVJdF/hUMk34QniFsYVGEsAYj8jVb
	KMvaPa8ss6Rt7ds0QhhI2UHoAqGPjqauZlTtkELPdfnR9EmSbdIGMwJjltCu1ttCoF9M5CSjnn0
	mN5LyJXB+o08igfgmcy8VvH0xJ0VMSrB+NdGeJYXMFcqbT7lRy3qFotii3Y8nf0b52VlY3CQuld
	GOKofKc/+bFWjgQaicLrT9NA2tIc/0QkoYw7PiGV5KjQDAJaexyrnD73VHnRFXNr3u8QRWD9EXc
	aJnGJKdUY//NSvtOdOB64xWNXb581xFQP7k/rWXOKwDITDsD94Y6LonSKTh3VmoijPse4Hg4Ufe
	Fz6+ywdkvwIhvb9DKMrgTlqFXzmIxUCBaqceSTr/VyL7jWb1+UizElTKU+rMHoIqOOo7yahs/1+
	C6AAh7CyQu6o0it8TN0CiXf0wJeRtik8g5VafWVK+KeJxFHE33O87dKmQpeTKaC6LQcwPqA7Ise
	gl5I3bqj28uM+7WPtK6Fru0dQ==
X-Received: by 2002:a17:907:7b9e:b0:c20:33db:41d3 with SMTP id a640c23a62f3a-c2129bd0001mr241187266b.11.1786710914947;
        Fri, 14 Aug 2026 05:35:14 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21234c4893sm98483166b.20.2026.08.14.05.35.12
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:35:12 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1fbe461f59so151776666b.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpApQQOhKU5vjg5UiEtJCs+XactKus1GCbMoQ6q82+cKVU+yRuSuA+M77tZk10hIj8F//7eW0QUzQc=@vger.kernel.org
X-Received: by 2002:a17:907:c17:b0:c16:13e7:fd63 with SMTP id
 a640c23a62f3a-c21291fdcfcmr243697466b.0.1786710912661; Fri, 14 Aug 2026
 05:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:34:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
X-Gm-Features: AUfX_mxcx88DEcyLlr5JNAc6a9MM4NBZevz1i_Gg-nCQLWP5aYOxwOMH-wNJ27k
Message-ID: <CAMuHMdV115FmUP6tiNi1YjEfOevuDvuLib7pLd1da=7JwnsNdg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS
 fixed-factor divider with 4:7 duty cycle
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add a new CLK_TYPE_G3L_LVDS_DIV clock type and register function for
> a fixed-factor divider used by the LVDS clock, which cannot produce a
> 50% duty cycle for odd divider values. Implement a custom
> get_duty_cycle() callback that reports the actual (div + 1) / 2 : div
> duty cycle, and add the DEF_G3L_LVDS_DIV() macro to define such
> clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> +static int rzg3l_cpg_lvds_div_get_duty_cycle(struct clk_hw *hw,
> +                                            struct clk_duty *duty)
> +{
> +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +       /*
> +        * An odd divider cannot generate a 50% duty cycle: the output stays
> +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> +        * of 7 gives a duty cycle of 4/7.
> +        */
> +       duty->num = (fix->div + 1) / 2;

DIV_ROUND_UP()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
