Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E354313533
	for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 19:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062758; cv=none; b=Zb4Aikb7bQqCI/p21D/5T7Biw3nL9NMzkP+2q0nkbxGzwnHybtEBix09YqzJektQ0e+trmI/Xzxji4XNry/Ctl/xRrVtCL9X0UwljvKiO/DE4dHG4DfepyLogk/adKPUAzKg0To0mzB6givMKZE1b6FtlL2Ea7OFD3l2q5Y9n/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062758; c=relaxed/simple;
	bh=KrVPSr030oztfxZIPgcjWHnLE170syEv/sQVsiYj6tU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TucrvbFLNqGRu/UNU9nnu+ZCa3R0iS6EMwPoGQHA6kCPCCG0errczRBS3ztVu9uzOJ2PHAQ66K7r589WTUYntDDUWk63Yw0yYhfMGduzW3/3iT3Dd7I3qxg/8cWi7M/NOcrVa7pEAk6xkyJD6xP8ufd+9/82FrpCuU66hnhDtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so547644137.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 11:39:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763062756; x=1763667556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pTcM33l/BUAPozIzYP9jhGNhpCj6nx3D59IiN3ZLnk=;
        b=okZvikH5MS+Y/37ba9SuQXG+FOpmAPeMWu2Gj+H5BJ79QepnszTkK/+wF6g2F7yuyx
         76iqX8m7MWfv9wEN5dNM6vBq59fH4VgZ7/6BFZ/J2n3EE5h/QELbpg3PuhitiFQJ2WCg
         nmg3eGMAz+wbXOe0BAKnRlGKLn2PcdfqAcRjm0DvNLQ5TF2BP4/x/CcNq9OIzv+sYmV8
         qame5yHdttJIvgl/zAePauJh8wbSpLscOzf9yGVhCfCLxw7nCZxhSvP2AHFq1GU97a51
         CTQU6bm2jvCpRFsg3jXjNZLcsEOxv6B9i1wVMQLY9bsfolaFdt0kNgOCy3Kg1jXzq0FK
         DZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4ek/0rcxi0LCmikG2VBSjiy++7LU6nct3EhKF0c/HJY0CtOf13Ad1BmbdcJofw3t4HHvNlVUS09A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/Qq52t8Ktgl7MFQjwVkN1+Ik3/LKjTqJKgRyclkm1vCP/pmV
	lD1FErKJUWbRVXyU/LMuyNsvQb8DcfBqrQzv5fGQfMjTSAc3Z5KIXAJa3sc/ypkUPdU=
X-Gm-Gg: ASbGncua/UHQ4o1CyUjnxQH8qDD7zIXz29xIumHPD/SxJLIvfR8kM/2dgTInmQT1S0T
	ceIaH8MWo6c1EsUzR+8+lazvKRmp77L+yOr1Az0aZ/Xy40yt/pTCCvjmFGvYCVvwuKx4LMmGtkQ
	XV0T2b7GSMNTdzIzFQynaoEhhg0me+jr1lYLiSun8Cdaxs7iT7qixjM75FNZ8aBc9MP1EQX85lo
	yOge7uPtozxwsfNh0NvLp+0MBKC5FF4TR4RSbrNBmGcYSR02i1fCyHp3NOqsZg7Ir3KewUYdwx/
	cV/uf6Y2vJAe4pIZ/QPUHsZDUfENoppZLERJbmU9rBQeHmNfl0OFfnMVHe4wVvG2uF98hnxuVHu
	lHi4Q80C9xTyNILERocy7XLRC3f1b7ooBa/DjQa7soMkJ5aFizyXv4cnxJyWmWk+7ieDvhKCLGQ
	r+we3rruJ3D9YgJkJCF2oaUqTsjiDf0lu6WWBK/w==
X-Google-Smtp-Source: AGHT+IFbFemVQEady+8p9cQNo2e1LhSw5g1sLbD+tE5oqo572d9qwvMCVhcXdE3K8JFZgP5+oTED2A==
X-Received: by 2002:a05:6102:5486:b0:5df:a914:bbdf with SMTP id ada2fe7eead31-5dfc56514b9mr444351137.27.1763062756083;
        Thu, 13 Nov 2025 11:39:16 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dfb6ca9d47sm999911137.0.2025.11.13.11.39.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:39:15 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so493134137.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Nov 2025 11:39:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj1ezQeUMQRnffZwupQhc5ZWcS0EE01Wqjxufj5LyiyYpjiQKCvPVXAZg0Himj59FjIQHDqDNft4I=@vger.kernel.org
X-Received: by 2002:a05:6102:3584:b0:5db:3d11:c8d6 with SMTP id
 ada2fe7eead31-5dfc54e8119mr433490137.5.1763062755344; Thu, 13 Nov 2025
 11:39:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-2-biju.das.jz@bp.renesas.com> <CAMuHMdX4YxaU4KQoAF+hhfOfqGtRH-xSRgNqLp8dyEU29z5z1g@mail.gmail.com>
 <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346CB74E94956AC93A9471C86CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Nov 2025 20:39:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
X-Gm-Features: AWmQ_bkbG8_TdPRJtSgGPoKrasUmNhVEi6af3-UdoFhIEOwJ_G61yii6AUJLKgk
Message-ID: <CAMuHMdUxyg=ky8MhRVhsFBpkEGfZ+TxmAZTbt0V=BvARz1Q2Kg@mail.gmail.com>
Subject: Re: [PATCH 01/19] clk: renesas: r9a09g047: Add RSCI clocks/resets
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 13 Nov 2025 at 20:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Mon, 27 Oct 2025 at 16:46, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Add RSCI clock and reset entries.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/drivers/clk/renesas/r9a09g047-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> > > @@ -218,6 +224,106 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
> > >                                                 BUS_MSTOP(5, BIT(13))),
> > >         DEF_MOD("wdt_3_clk_loco",               CLK_QEXTAL, 5, 2, 2, 18,
> > >                                                 BUS_MSTOP(5,
> > > BIT(13))),
> > > +       DEF_MOD("rsci0_pclk",                   CLK_PLLCM33_DIV16, 5, 13, 2, 29,
> > > +                                               BUS_MSTOP(11, BIT(3))),
> > > +       DEF_MOD("rsci0_tclk",                   CLK_PLLCM33_DIV16, 5, 14, 2, 30,
> > > +                                               BUS_MSTOP(11,
> > > + BIT(3))),
> >
> > According to both the clock list and the clock system diagram, the parent clock of rsciN_pclk and
> > rsciN_tclk is CLK_PLLCLN_DIV16?
>
> Thanks, you are correct, I will fix this in next version.

Thanks for confirming!
I will fix it while applying, i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
