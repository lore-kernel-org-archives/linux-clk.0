Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41963B27DC
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433824; cv=none; b=qG9f3tBqzc4xQygvMwdprp12NFdwNlmYcfmuKEnga8WzC6lelCyN3qo/HICXad9S0vXyETSBPg1aK7m0AERXwR1JpH55MhOmf2cblFZcemIWwakg7trqpqX9DmSYfp4PiAhZohUShAWXFKI/wBqb+mInE3wsk5IpxjknbCgZZyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433824; c=relaxed/simple;
	bh=62igCHF5603h2cDAAalhEN5a09CaNNC/4Ln4C74bl7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze/qxBTIMcm9M0Q4gu/fp0VG3CMRogWs6Lic098ltbMVJlf7MqTOWVFXsIAor1o9fSD4MEvF6n3GN0D9SukNwavgAYTrylA0m7qLw6FhEjYamjv1GJDFyDUpXJkAyh3KnTk+Z/QPt1nK5yAtZLoSdIsDb/oScpGVAMhkpkGkcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56739adfa1aso4711004e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433821; x=1775038621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTLtnGl1M6udnRP5yuu+s9KqbRSTNVgcMGsOu4/hFHA=;
        b=faELHHIOZ+vn4gG9xV4Xy8t1B6m26WORM/Ps47/B8gUAR0MCVFllDYn8hm1rTi5CLF
         PjuQZQBthtWLM9pWKb5jOgxzrHQvqbKf8DCh/4k6hHvH3BVnOzOdQadlkij0NEnon+ok
         dckbdafsfkwkt+lHeJUrciPThaBO3e16BtGYqR4+h007+AU5V8AY1cSQKdabksXSyc1z
         Zi/9h7GY4Pfv1qokGTRNVpHXGwsmWzd3Ixg2Eup+tTQ+yFs2m8N6iMhEnpHuUcUYOkDr
         AjxJuQCh4lJ7brm/0nBEsOHBs0DIJJzhQlobGxdhRff/zHyNH8mJ2RR5TwBkw6Da9ilS
         UV7A==
X-Forwarded-Encrypted: i=1; AJvYcCXtX8GSOxm+xLxHZlPf7zKXh1MXdeYEIXc/eq4DPqm4+WlTJHF2zgn9h9qhx0Qt2an46wXvDOkSNpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWVV1KDpPfohf+8wE8tRxiLItyDau4oPwjIbVtoeNpJFtVNjO4
	kXjVIvz8ce9WLtAoZkGtJSC1NE9UMYEFsA6jxRR0tYnipDf1g067Jzr+dhbUsGExFDs=
X-Gm-Gg: ATEYQzzPXPBmBs1QQ0o4pwm9Cp3RAVHo6d+2gI4+qhrrUakFagtXeS+14DnT2UB0jAn
	JQW+VEunf0fgIPNcUiRkbFysOmi9SOYMMhRJ5Vvx4n2WkRKb2Pgm1gvenSQdQX+qbX2ZqV5uqer
	UxJ7+JqEu2oNMDlj0rwVzIv2DwgIj0SZ2psheHTfqV/PztcZwqTIUctE0PEck6VKdUgDoCe2wFW
	Ss9KWyBq1hcXUxkXlnfYrHQYq4Yf+JUkHep2MJS0uXkLH7pmVxfUVeVommAWCehEEfFxBpJMLPl
	ZQ/CAFWBNDHvqueP/CNsNydvdDTXwYveTaety79MUACdAz+Y85neWfx+6rCypGvlHXV2cx+t9HW
	IFLOsoiEXnKYXKpk8ewWwhb0ilxjlwp5oLyWOFAuBGOBsgvE/Em9sNkLmmtID75nA27UQHORI83
	ldYabFUB/YOTgtxGlVOXnE36kMOWjXQIfAbpXQ4mocWMlPQdpgJQ611LGaFqBk
X-Received: by 2002:a05:6122:83c3:b0:56b:6adf:150b with SMTP id 71dfb90a1353d-56d220e6d08mr1494383e0c.13.1774433821333;
        Wed, 25 Mar 2026 03:17:01 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d2b58cc6csm687371e0c.12.2026.03.25.03.17.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de88e52e5so3763036241.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 03:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSNlYopPRbpqkxspn6xy2FqSatRbWAItKz8tsaWVvs4ySdtjzPLdNbGhISs8pUTmHc01kmZKpJ+6w=@vger.kernel.org
X-Received: by 2002:a67:e705:0:b0:5ff:b684:f7c5 with SMTP id
 ada2fe7eead31-60378fe5973mr1555537137.8.1774433820077; Wed, 25 Mar 2026
 03:17:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324225239.19136-1-fabrizio.castro.jz@renesas.com> <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260324225239.19136-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 11:16:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
X-Gm-Features: AQROBzDiB3ZNSpBoCH-0zzZh64dFUliOdmHE4q1JciSR7WAkrsj16jKQbjIuw6U
Message-ID: <CAMuHMdVEtjDMfzo=ZQig3+3eYa=vxkAx8cHwxdmC7L3kTdS+vQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Remove entries for WDT{0,2,3}
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 23:53, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2N SoC (a.k.a. r9a09g056) comes with 4 watchdogs.
>
> As it turns out, it only makes sense for Linux to have access to
> WDT1.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 core.
>
> This change is harmless as only WDT1 is currently used in Linux,
> there are no users for the WDT{0,2,3} IPs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
