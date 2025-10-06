Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0465D34BA3A
	for <linux-clk@vger.kernel.org>; Mon,  6 Oct 2025 11:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751630; cv=none; b=a7AMbmQZKztBEYojQ/fEBHByYzkhVdQI1T/zTE6ViUk+JrSLcrsTEVJiZ9auVaqT3cEhJ6GF8gl/w4JbwLJsLyDYCk4IO7DwoMn2kFoc0Bji+uqx+nvDmLdv7c/B7HP/Dpj4SV7vJwPiupjKjgl9rCOonTj/higBrzs9P6VRkDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751630; c=relaxed/simple;
	bh=nmucVonihOM1No6Rgw3JA096neGxM0Ok2zCGcjS9rrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRVOfw631N9UsWgBgYc3LllsGQQpJL+bzZl0nFbWre4KxFpjLRNVsdMUpfVCC7tZccWRjtcehNZSuoF3P+SkDWW874l19gee8M2LxXdpdAnv5S/GftcBaU3/xi2OrtaQPK3M/PSDqsaj8H+8O16iHfQW77hW9Nci7L8BK9qVX98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ce093debf6so4866404137.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 04:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751626; x=1760356426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAnFEXlq3ED3p75APIm7D4gfrJzhRabFp7PqS182e5g=;
        b=taIZOKUyiXwePXP1av9s9AwZ8oafrIDMdPR0kP7cKIHlqi8ZMJ9lhWjL2UHZa8MMs9
         ZP+wChkegQDlWk2uxRF9H7sPUfNLuAUrWDt3CBz4q6uSflKHP69j0ZAtrRsrzDJRcnXm
         WeH7XD8RtbKd+ufEnUZVtHEXd/DdY3fkO18YKvVxkibx0EZTZdmnCQGR3DbaHZ9XaWru
         gdtA/SYZad81ioZXbDdRumWhtgAAMuitGgqDKJw74LwD+/Wxf3Y8NGsLUr3+7Ge6Pqwk
         v53ZeC9gWRDsmI3yB9ADZK3YMerTeef65MvUeg3NW5Y0XmYMkkEZMj0M7H9K5Edi4J2U
         alew==
X-Forwarded-Encrypted: i=1; AJvYcCWV4QtI2Jtk2USdtyUfyO/IYmtJ0/00n4TDWbvCGlaireWBhl6EkdbtLKXx3qwOm89m6hT9pBM2YCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6aedD1U3pJ/SvobqYYy5b7j939ckAmV3GqLQg7GzB17oGBkJ
	TPAiGc54A8wDcWEQTM8z2GmUq8t3s3jOf+1e1KNmxDcUO+6krp0hcW0wjUGgkISe
X-Gm-Gg: ASbGnctnMIecKnjbmRlSHn7tmGyyT9lDCqgnno3Fu/uuMbGneNwRD01apoYYvKpCYDI
	Uqknknto+SWCZreOSSiCOiyr21z8rVv+XebOVnor3z44zvNwf+V/IpSOKOFY+DP+dwFyDibQVqG
	I3UgCGInr/pdB5DmousabO00Yz3Nf0rq4rtL1tEBBHoBUJgyV2luy1lPtxFlWyq4+NkrSBNBFK3
	mzh3SV/Mek1fYp9kKmvPx0CSns8MEFHzHwjar/0BUERnV5Kb4U9TouILlycZDbu8w8taXjOA6t0
	Uy1Abs1OEoVNJYagFIfH0mzFwjy+W6R/3Qb6eVmcakps8/3R9MqIXqPUpeOeteSW9BqXHnlHqSE
	jvQviZpt8QiW3S7vNvBC255jL/GzUPqNP9a01DNA8fVAoSKOKGOz67XRkr2A2eox3MrzYsodv8f
	mD0quh8EO3EOv0Io9DIMY=
X-Google-Smtp-Source: AGHT+IHie8A2aw6iL8dWwJOdjE4erc4TwiBzu62OuQ/DH90wS7yNSOsmOrXauVuPFxaTmvF/vShsVg==
X-Received: by 2002:a05:6102:c4c:b0:525:42d2:78f8 with SMTP id ada2fe7eead31-5d41d05b7c3mr4970914137.11.1759751626449;
        Mon, 06 Oct 2025 04:53:46 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c50a12fsm3301851137.7.2025.10.06.04.53.45
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:53:45 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso5966303137.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Oct 2025 04:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjSzFVigx3s/bDpsfo/n2wK6TtjgYanqA2lKNFABQ2KfJsL+MbPJnIPcaikwPclAFZ60AVQR97bN8=@vger.kernel.org
X-Received: by 2002:a05:6102:3754:b0:515:a84d:45a8 with SMTP id
 ada2fe7eead31-5d41d11ca0dmr4462571137.20.1759751625668; Mon, 06 Oct 2025
 04:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org> <20251003150819.GC344149@ragnatech.se>
In-Reply-To: <20251003150819.GC344149@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:53:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
X-Gm-Features: AS18NWCx5U4qop3kVkjDI967KSoG0Y63UyirUqb8qpDcG32DFYcK9VAMkRy561E
Message-ID: <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 3 Oct 2025 at 17:08, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page =
583
> > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indic=
ate
> > after reset has been asserted by writing a matching reset bit into regi=
ster
> > SRCR, it is mandatory to wait 1ms.
> >
> > This 1ms delay is documented on R-Car V4H and V4M, it is currently uncl=
ear
> > whether S4 is affected as well. This patch does apply the extra delay o=
n
> > R-Car S4 as well.
> >
> > Fix the reset driver to respect the additional delay when toggling rese=
ts.
> > Drivers which use separate reset_control_(de)assert() must assure match=
ing
> > delay in their driver code.
> >
> > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H=
")
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_=
dev *rcdev,
> >       /* Reset module */
> >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >
> > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) *=
/
> > -     udelay(35);
> > +     /*
> > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > +      * On older SoCs, delay after SRCR has been written is 35us
> > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > +      */
> > +     if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4)
> > +             usleep_range(1000, 2000);
> > +     else
> > +             usleep_range(35, 1000);
>
> I rebased the R-Car ISP work to renesas-drivers today and it included
> this change, and I seem to have hit an issue with the switch form
> udelay() to usleep_range() I'm afraid. I can't find any other good
> reproducer of the issue however.

Yeah, AFAIK we didn't have any callers of reset_control_assert() from
atomic context, but I was already afraid one was going to pop up...

> THe core of the issue seems to be that if a reset is issued from an
> atomic context bad things happen if you try to sleep. I get this splat
> and the board is completer dead after it, needing a power cycle to
> recover.
>
> If I revert this patch things work as expected.
>
> [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002

> [   29.265595]  reset_control_reset+0x4c/0x160
> [   29.265604]  risp_core_start_streaming+0x100/0x440
> [   29.265609]  risp_io_start_streaming+0x74/0x108

The existing udelay(2000) after the call to reset_control_reset() is
also a bit gross.  I understand you are using a spinlock because you
need to synchronize with an interrupt handler.  Would converting to a
threaded interrupt handler and using a mutex (which the code already
uses) instead be an option?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
