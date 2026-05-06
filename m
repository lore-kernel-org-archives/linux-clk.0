Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4919D480320
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077761; cv=none; b=ExuIxSK6YCj2nTuN9Sbu2nSJGhU3pJ+iZZQnhI0H3NoQpDOfKWng6qsc/Z7IE6ah5sagNYHYMQThKrx+O5c8mI5RakkRn2etECOwabg+zms7IQ8JwieYZztmBYHFUF7zxvKrKVwY57iNj4R9TsquNwzczChRab41WMI64N/7yWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077761; c=relaxed/simple;
	bh=xSCqnnA7WW1S8JqkwXiyfL/AUeV8+187ca45KJ5fOts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/7cbD6g8aGt47x+x4PrUmKp0w52CdGoZCdzjViE9xb2SOglWfEhFW8s40B7WkPOXd2ZC1OU+ITQTgjMjshkObb3KZ1G5ugvas6k3ibrvDHMESDRhGBwxUl/wslKgsgSKxzGHw+7fJP8fzVgUraQ4B2DZw+C1u89fQomXKLe0WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bc3582acc23so423693366b.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 07:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077759; x=1778682559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY7IqF7EZtPFbGXc2uDLUDmZ5A2gxJRq1XnzXcjisJQ=;
        b=OlSn8OSpRQb0/aj6cXFgsRTjveRN239B5qnz/X3o4LJWt+6D6F1s/pc5IVTTfp6wbt
         Y4vP0nvYBdYcK+mFxyn/bJLsB9pxS6P1PGjbJohZNOGpX4LeMHSFFyKvyf+N0vAhoLZf
         V4WXH5OsHVGfHkf86b00BRPIU9KX2FDngxOq4rwXu13JOzHZkgq4KWkL0uffEnDaLouc
         BzY3kpyoIj5a+TH9v0rUx6ot3lJ04eRvS5DCzX4C3z0+n9icisBKKIZqqycmev+kRPYD
         Zy6k1PLLLf9EB3Aed3F6cPnbXXted4YptVXM1Pjpti0BFluHqkqMn3lUIVaU4KcQjTmK
         4Q/Q==
X-Forwarded-Encrypted: i=1; AFNElJ8MM31LLxXO1hCr59kG5Krxy1+dCehlkI8WDSyE89UBjtyz2pg55GuUGKD6XsIlYug2I1hSdr39OLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjoIbOk0sowSlRz+QRFwsih8estgCi5O6g6bYvJ/XBz9+nlM6
	UHLcaaOA1wnwL5Gt5BfpFuJB4BWbfT2uRRUdnS69vTwUZHk2A6VuoXQyh+hyJBV9PKc=
X-Gm-Gg: AeBDieu7pX0frmPDTU9aDUwE9ZHay+OM+TbFVFlAASVIJMv3muG6ZiHvxVW/wL9oYRI
	fZ37tJOD0cKRydlDpkRB/LulnPqhe8KoGfZ9MVL4pJvSlXm1xgE4NWftANRPdaktf9cDEzg1dE0
	sOEV8Gwk/vWWBmkQ9AIKy5Voimgs4EQ9RKkEVKCGDX1r0ok8Xmghyjnca/NMGl2tY0XIcI+3djD
	9Mzo6i3yc3TUQY9S5vhE3I8UpNV9uLRZNcGlowl5z9SW4Fncry/SDxqXhso9PwG12uipGg8sV3d
	ZOoyiebPbqgpl1B/zipPLjF7HdmPDRcQaeyYZq5ZkXm0yDAD0iD8xhbu38ojOLfdZfLtIURv0f7
	jcu1NFySqJUeJmaYNnS8PJdC1/8NzWpx+9AxcdblARBiPeHTDFkYs4H/W9hdLesQ4KB/C7FhQCy
	1JG0Qz1np85o9MtZi1y7TkgDs9E6tiZ5QjN6I/7s6UKatRpO1pNNGtFI2YyUpcfmLjMMZ47P0=
X-Received: by 2002:a17:907:3f86:b0:bb7:eb68:514e with SMTP id a640c23a62f3a-bc56d51a64fmr184193966b.36.1778077758559;
        Wed, 06 May 2026 07:29:18 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc55e6ec761sm90581966b.33.2026.05.06.07.29.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 07:29:17 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67bce1840f1so7661301a12.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 07:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/y/pDw9mF266F5q11wDGMSCwXdZy5zOMOyyR/zvD5hHygYd+Nytn5FdzZX5fy4ZH+hwoD85MIXEKQ=@vger.kernel.org
X-Received: by 2002:a50:ed10:0:b0:67c:4e1b:9131 with SMTP id
 4fb4d7f45d1cf-67d6489a2acmr1189650a12.21.1778077757174; Wed, 06 May 2026
 07:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430100838.157306-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 16:29:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
X-Gm-Features: AVHnY4JIWsfX3RObNxzzkQIdZ2g2nyGfjaY6a3VREMXWQFxMgdRXrU8sBjv2LdU
Message-ID: <CAMuHMdXUWDPcHb28riZ6Uj2aN-BtgGxazu1A7ocZymVL8wYGEg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a08g046: Add IA55_PCLK to critical module clocks
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 30 Apr 2026 at 12:08, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add R9A08G046_IA55_PCLK to the critical module clocks list to prevent
> the clock from being gated during suspend, as it is required for the
> interrupt controller (IA55) to function correctly.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -312,6 +312,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
>
>  static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
>         MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
> +       MOD_CLK_BASE + R9A08G046_IA55_PCLK,
>         MOD_CLK_BASE + R9A08G046_IA55_CLK,
>         MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.
Or is this critical, and thus a fix for v7.1?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
