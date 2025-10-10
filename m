Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EAB227E83
	for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081863; cv=none; b=YMLbWdmqMXH0LEWPFddmR8aenuZV6NNlvuppCHrYyPkDDHxZuSvFETu1uHlOu95TjSHFlaL7mO/UpDmSDrGb/daf5OApVDU1ef2IPa4h/keCJa3Rtzo5Az5cB7knwKGsf9Zy1PeP6BTv8+xYRecnFJkjO3rdJRylhtuM/sotqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081863; c=relaxed/simple;
	bh=eST3ZT7rgB9R6WdFdGECdhPZDbsoewBoBABzcKzXuMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBPheFd5aNzeylZmyfVnekdzzsPPgL8XzZyO7zDdgsCw4hCyU8mFXNeSfs79+04ZhWkYPwb3Df7blw51DbPGKEM+P6Q2VM4VgWPQDX71ii/JSQplKEhs6CLzQ4jytiVMbEp93mfyxqXdV/rrpBIpZvRM4aniuuMIuJ0CZtQQtC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ce093debf6so1865253137.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 00:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760081861; x=1760686661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyJ7Kpxwh9FSglSF6Jve2BNo88/F4JmGj75EOHjBoPk=;
        b=HIomi8WyuUA6dzRQdtZiQkGc2HOk/iSlC8PQXKzKXWqz1oyLEAQlfBba6IOhv3X6vT
         OgR5IVqPTF2OlypGm24JrnsJeVHJIoLwXGaPML+Oep32hfQ269ai+ikh7Tyxh8BGvzoo
         n2X+oVPAHKTgJGGADbbUuhBTptuzX9EZYL3se9LNQ/1AKhlQL2LvhQQJd6N2Sfrkbtfl
         WIwYrW95uTsyyNqpUJxATvSRz/P3EKYjimL/6/xHxJ2X/MqoBpUW0fPdJMGHYk+JnSQ8
         cm54rSD61a+7VEijNrxnscEcuQ4eDhPFIEa7pc+F7gAND7Hih0JRaoNSCvSy5mx4+anL
         QA/A==
X-Forwarded-Encrypted: i=1; AJvYcCU7KBySq2cKWXpyJP9DbpWVn1YWENc6ctWdJILfu7cqCGkF+ezPfqf3/aLIb0nDlGGCzFCgt8ivDVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvMsAGP9Q6VRfTBc7B5hJwoLAJFyOwu2UGV2jng4aP+1HwxPfM
	DlHadV/ghphvZ9z6+QnqsQVpr1FGOW5xZigndTgFbAH2265kXW0PFs/GG7RAUgnp
X-Gm-Gg: ASbGncup3Tym7nXepZ2BQ83kKAKdYKI6QO6Uzb591CcAVbUIEHwc1JCACoItPMXjPXM
	bH5NLqNka91CeOtrFigkI9GC8gBy1pj3VsWtMKKSLDs6WN+fUXzMhZnEkV49dUvkc9pM6OjUiQw
	W8EkNT6PthTc83/nGY3oiPEEfma6Vo0CZzTtxq2iEZh6+3dUfZqYCztbI2/QVw4vMln9z/S/HUk
	zJK5EQATEpOZFj+G/VyJ4K17A8cTFON5TloGcTRlRwcDXXYbMVbuDZtlW6qAK1vX03QAX68MkB4
	CSy6NnV03bCFhdihQ7MJUFg7QroUsnKDn5lCcpmu0Ah4i81CleDD+Yjj5bhAkR9ppS3G5GhajUj
	0i3jjQVSYvldmYboZ1Ap9GW+lafK9FU9MFzNWFSD27G7lF0e+FLmb/ETQsnfh4v9MALga8nO19a
	FAjho=
X-Google-Smtp-Source: AGHT+IGKhkKF1fk9PKsnsroA01Yemocx/iQU+Iwd/RbpND+5n3xPsUtlGoIcN5uF1ZxnuF1Aruj2iA==
X-Received: by 2002:a05:6102:4187:b0:5d3:fef5:8724 with SMTP id ada2fe7eead31-5d5e2352439mr4827322137.26.1760081860711;
        Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-930bf76bcabsm532405241.11.2025.10.10.00.37.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ce093debf6so1865244137.1
        for <linux-clk@vger.kernel.org>; Fri, 10 Oct 2025 00:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtSpqyVEzsUpO+scNBeCzOe5RHkhsf/bBL7vv398iTf7Q3xYDsIrTZKXC4HMUr62u9pubgRGxUSUg=@vger.kernel.org
X-Received: by 2002:a05:6102:a4e:b0:528:92b8:6c3e with SMTP id
 ada2fe7eead31-5d5e21ce95amr5073612137.1.1760081860129; Fri, 10 Oct 2025
 00:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
 <20251003150819.GC344149@ragnatech.se> <CAMuHMdWXkwOyAhAZB=j_zZg8PcGcdkMDGOa-nBhcgjYRgb7MSg@mail.gmail.com>
 <20251006122338.GB1353934@ragnatech.se> <20251009181250.GB2550463@ragnatech.se>
In-Reply-To: <20251009181250.GB2550463@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Oct 2025 09:37:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQ-5eL53xx0h0A951J-vU_vTbZtXksO3zai+qs3-hxOQ@mail.gmail.com>
X-Gm-Features: AS18NWAhg-eRKCHFk41jOIrVt9EBhsPvKCaPawOrsQMFS0mslGNWcDjWshSyeHE
Message-ID: <CAMuHMdUQ-5eL53xx0h0A951J-vU_vTbZtXksO3zai+qs3-hxOQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset
 toggle callback
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 9 Oct 2025 at 20:12, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2025-10-06 14:23:42 +0200, Niklas S=C3=B6derlund wrote:
> > On 2025-10-06 13:53:34 +0200, Geert Uytterhoeven wrote:
> > > On Fri, 3 Oct 2025 at 17:08, Niklas S=C3=B6derlund
> > > <niklas.soderlund@ragnatech.se> wrote:
> > > > On 2025-09-18 05:04:43 +0200, Marek Vasut wrote:
> > > > > R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025=
 page 583
> > > > > Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C)=
 indicate
> > > > > after reset has been asserted by writing a matching reset bit int=
o register
> > > > > SRCR, it is mandatory to wait 1ms.
> > > > >
> > > > > This 1ms delay is documented on R-Car V4H and V4M, it is currentl=
y unclear
> > > > > whether S4 is affected as well. This patch does apply the extra d=
elay on
> > > > > R-Car S4 as well.
> > > > >
> > > > > Fix the reset driver to respect the additional delay when togglin=
g resets.
> > > > > Drivers which use separate reset_control_(de)assert() must assure=
 matching
> > > > > delay in their driver code.
> > > > >
> > > > > Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-C=
ar V4H")
> > > > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > >
> > > > > --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > > > > @@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_contr=
oller_dev *rcdev,
> > > > >       /* Reset module */
> > > > >       writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > > > >
> > > > > -     /* Wait for at least one cycle of the RCLK clock (@ ca. 32 =
kHz) */
> > > > > -     udelay(35);
> > > > > +     /*
> > > > > +      * On R-Car Gen4, delay after SRCR has been written is 1ms.
> > > > > +      * On older SoCs, delay after SRCR has been written is 35us
> > > > > +      * (one cycle of the RCLK clock @ cca. 32 kHz).
> > > > > +      */
> > > > > +     if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4)
> > > > > +             usleep_range(1000, 2000);
> > > > > +     else
> > > > > +             usleep_range(35, 1000);
> > > >
> > > > I rebased the R-Car ISP work to renesas-drivers today and it includ=
ed
> > > > this change, and I seem to have hit an issue with the switch form
> > > > udelay() to usleep_range() I'm afraid. I can't find any other good
> > > > reproducer of the issue however.
> > >
> > > Yeah, AFAIK we didn't have any callers of reset_control_assert() from
> > > atomic context, but I was already afraid one was going to pop up...
> > >
> > > > THe core of the issue seems to be that if a reset is issued from an
> > > > atomic context bad things happen if you try to sleep. I get this sp=
lat
> > > > and the board is completer dead after it, needing a power cycle to
> > > > recover.
> > > >
> > > > If I revert this patch things work as expected.
> > > >
> > > > [   29.256947] BUG: scheduling while atomic: yavta/597/0x00000002
> > >
> > > > [   29.265595]  reset_control_reset+0x4c/0x160
> > > > [   29.265604]  risp_core_start_streaming+0x100/0x440
> > > > [   29.265609]  risp_io_start_streaming+0x74/0x108
> > >
> > > The existing udelay(2000) after the call to reset_control_reset() is
> > > also a bit gross.
> >
> > Haha, I agree :-)
> >
> > > I understand you are using a spinlock because you
> > > need to synchronize with an interrupt handler.  Would converting to a
> > > threaded interrupt handler and using a mutex (which the code already
> > > uses) instead be an option?
> >
> > Yes and no. For the current use-case where the ISP is used in off-line
> > mode, that is userspace dequeue images from VIN and then queues them to
> > the ISP, it could work. But if we ever want to support the ISP in
> > in-line mode, that is the CSI-2 Rx queues the frames directly to the IS=
P
> > I think a threaded interrupt handler would be to slow to change ISP
> > parameters between each frame.
> >
> > But that can also be a future problem, I will see what I can do.
>
> With a bit of work I have reworked the ISP driver to reset the core from
> a context that can sleep. Without the need for a threaded interrupt
> handler. Thanks for all the tips shared on IRC Geert and Marek.
>
> I now have no known case where usleep_range() in cpg_mssr_reset() causes
> issues. If I trip any more I will let you guys know.

Thank you, I still have this v1 in renesas-clk-for-v6.19.

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
