Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF696358D3C
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058021; cv=none; b=XKl446gyZfQJ0FKviTMIEsBiQwIOXRyDYnNdsAoxzS/l3D3KXlYSqOnMai/oYqPby3T2cleJ7gD87nTD3ONi2RXu34YYzTBQ5Bh0pE9vaG4eG9Ako/o1dmVR+h73PVWBiGSVsVQx1axvSyBdKtcInHqyWnv9aUauN41au4gufYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058021; c=relaxed/simple;
	bh=q4Pni98XzUAF/l2bWun5gxCY4hAH8sNECZ2AvGITWiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOgSxv4SSHipR5WWYCCQ3Wjn2XMaCIOtP8zuy7JqTM8N/IJl7+KoM8wzqghauUwtaU9LQM50tK6pXJkvmObu/I8qBuEkzfAD+FkqJ4gnrmpvQr/iIwQwatDG8cZYX8IpLpRg882oGjOCglerTWPmvBO5C2Rc5KZT7mEMbYQwshc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b09d690dcso419986e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 10:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058017; x=1763662817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uS/kxH5JVnFFcogceq0XBHqgyC93uzre0sinNeAFlM=;
        b=sOdmGCIXCa/1s8I5ZPoSficpz2U/qULBw1B3tpFd4BrqAfn4PiB4Mr2WIoxEongLSd
         q4XNoxd2lZuaiLwnyw9mNExGg582fdLaZpLDGecYbLNYWTj5tpqMVf725qNWZRfqOG/o
         0NCPy/d6hQVYwhf7VZ5zSOJ5s2hRv1AD/uIBwNogyj0m3oyrjFiK5PzIaou4z5bI+8LB
         unaRtyLdVMm5S9I6DjaF46PTyytwfquISPWULwjAqPzrKDvAfhQl/grqT9M9lkMkOgji
         /tX5lAzZALIb+N5Dw+I1EQIvRNPGZAG1TPImQSDIjfCSSbd5ecc0tLaXc2NumVqB+6RP
         YiSg==
X-Forwarded-Encrypted: i=1; AJvYcCX4XHihdLJ0RU4HGR7x6vyaEBdtvk63qFH0dlxvkX42X5MCAKP0qWG4+4h55MVC3Le00gWwgaKp19k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHzNQjAx3e08SqnxTyFwgV/YAkHpzNPjfS2Zsa/zCcUqafnn9b
	UNGQQfTFY6BVzRoXVGCjZVSTwoCRRTwkYQtMlhitEUJSccTsRDKUQA+ZjpbzlXuS7oY=
X-Gm-Gg: ASbGncusHcCbbqeWrETXp0JfPJWz0TPMmoUkm9SXyRDTZmVOOAvPkHtHkgkBEei4gU0
	zrxMDgTnQeVEy1Qovz8Y+M3T5yyhfyzK7rT15PPsNQVY/sTMWBJjLYCWRI9Guiyd4uGU+kD0n+2
	cLbWOKqPUPmD2ivU867W4ARe0Ilk++W5QzQNCuQJxsonwB7LvwpRjUN3m+UIa5edvwIL5lBMBch
	R0hcon+Z0nMnQnp8ix8ekftyGMDuPgBCDGYwkLQ++zZnKnwYO7BIcArNthHoOlJOznrJT2h5jKI
	kjyvXcx6noQlm7fgwoPa5+nsm/AlbMzFAX2thkyo8G6Ucvl7+ah/n9R+ITFL2XZS/bE2F5NA8qz
	v7QhB/V8mR/mv7k9Q8qnwXA+ztPBWsObfX4ZRbvqO8H6mm4Rs5zeBqT/3XtyIAY/vME5S/Xzvqp
	wzq2XnTZ2IIUSTc+JEgs4TbBkFxGkluAK5dWs1LXWsDNQf5Dp9
X-Google-Smtp-Source: AGHT+IHK+RDHbN0lTOL61v93/pbl6Ip7bt1EiSulHImhcijIlduZez73xGbgJmk9J5OI5ojgPg3vDA==
X-Received: by 2002:a05:6122:d0f:b0:54b:bc2a:f58d with SMTP id 71dfb90a1353d-55b1bd4f0camr324317e0c.3.1763058017502;
        Thu, 13 Nov 2025 10:20:17 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f464868sm892381e0c.20.2025.11.13.10.20.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:20:17 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dbd1421182so891614137.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 10:20:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPEqI9Y78u0t5SU7F7b+IJLzVszegjUcGhKz+G9Ort1rsATyTVHSAx2t7lEgWVNoM0U/V8p3SgdYw=@vger.kernel.org
X-Received: by 2002:a05:6102:94b:b0:5db:ef7e:8dc9 with SMTP id
 ada2fe7eead31-5dfc5651308mr396910137.22.1763058016686; Thu, 13 Nov 2025
 10:20:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com> <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251027154615.115759-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 19:20:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
X-Gm-Features: AWmQ_bleUQW3hiCX1KSxLvD3JgUUV41Fe_nAwW--UKlxTY2D9OsiAP6kBwTqJBI
Message-ID: <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
Subject: Re: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 27 Oct 2025 at 16:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add RSCI clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -218,6 +224,106 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(5, BIT(13))),
>         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
>                                                 BUS_MSTOP(5, BIT(13))),
> +       DEF_MOD("rsci0_pclk",                   CLK_PLLCM33_DIV16, 5, 13, 2, 29,
> +                                               BUS_MSTOP(11, BIT(3))),
> +       DEF_MOD("rsci0_tclk",                   CLK_PLLCM33_DIV16, 5, 14, 2, 30,
> +                                               BUS_MSTOP(11, BIT(3))),

According to both the clock list and the clock system diagram, the
parent clock of rsciN_pclk and rsciN_tclk is CLK_PLLCLN_DIV16?

The rest LGTM, so with the above clarified:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
