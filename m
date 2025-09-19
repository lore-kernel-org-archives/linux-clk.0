Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366EA2BE051
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758266476; cv=none; b=RQTv6MssWQUto7Gga5+RIOR0SncagicTM2eRjG2FCrCKn+oqB9muJqSWY5iTOnbisjyFhdngjAzRO4rgf+x88j81WdhPFB3CkfVNH834wAJP6kTcEvrut7naKXfLRhGisgh7XXp33HnCEUetwI/HkIjD+c7/3uA4Zgwp1u/itQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758266476; c=relaxed/simple;
	bh=Q+yeL72eS/EFDh4aFYPzpqwZ4gkMGeQeQ3gNYps+5s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFvnskn7epwF/X6m0zRF2mWxbAtbL9DoRE24Rm84GuYDVMfhNQbeq0cCdWXwNW0zC21vqEz6Q2WKTCSyktGlMGa4oMSb6s46PXwT8PZLWnFM8rMw4KnVdgAis8Nuyi9WGqgPCv1TfQfRfQr2eqeHOmSm8padzWZq9gqh6ZU6URw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018ea5625so533524241.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 00:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758266472; x=1758871272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy84fRvImGlGf/x5eRlETn8EsRWO9FKk3GgLBbxuALM=;
        b=Uke8Bj0s0A4Ju8gn1ZClzLjddOEiIbtx9eWmxop6LyslgaaJWcTZYP+sh76HGXGgGU
         WqS1Oj3pv4+UKXGYPrzc0kAn8OYieGKKNenb5IPJb5ZoDe9FIw0XoA+XRCdmii61pmBK
         RvzKUlZKroE5ouWSfr7Ccg8KhgWGyeb7Xh9hDxEEX8vM6IHDk5FWoRYGEl2+U83J/Lu0
         7gKitRMQBTpX9XhbIBUDShXLKRv1yzpmP8+ck6+64k6nvnIafVUG2k+PE4o9UeXadxjo
         RvJuXFLY06K/XaCSHIVWnOzH5P65oozZnkJrpgaz9j5qSZ22tdPFQ6Oq3h63z15cgJMK
         7EQw==
X-Forwarded-Encrypted: i=1; AJvYcCUbEJJoMXQ3HO4l5/t5s0xev+oVR97PO/f3Y1bNSoBwXfWQkKUOlgV81Iyk9jYrBLcE3Au7GTf6ki8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhN8QgUbDD2+c0GMD4djJ9RZZss2Yar+kthg7vALK3vqLL5ZY/
	KFzoy2YkJD3jN13fBO7KmXKhzfkIzi8cpDt/RUx/L4pjEQDapQsG09Htchtb1EHe
X-Gm-Gg: ASbGncv5yRqIBzcTTbNdhVGshY4xHnQ00D/h6ayG771Zw6ia2JIf0vuCu34wr8C07BS
	D2yGrSJXHnZP/VuCNHWMJWkh58mdLQNYmJIhRQNhQnZuMy8RyeE3oF/0/n+mx216hbJgepMtZWX
	UWl8A7Sb5SVKAguYiEe4FVWWIG3rpHIxjUR9SPfdrWpWNTVneSbhWgOLO2N3cHDBDWt3tLx2EWZ
	XamZ1oKXnCAVq5tZyXkY9c+X0XZFGm4Dfk+pkJ6uqjBhEazzc6Da92fvkojNTW8FBkCy26Xvvpv
	nq+j6bOSC8uOS79eWZS6pvM8j1bZBEFQq+nFyIhFRTREs4t5f1UW+TrgTr028crNCtgYZ0NuK4Z
	HOUCV8pS4Zppm84gGP6Tx6CU9IzAK/UcbTRQVRHYsm07RVZ/qBHTETWbT8JsLslKPzjw+luZzwX
	Y=
X-Google-Smtp-Source: AGHT+IGSUE2JK9DIg0rbsaPXT3WFcWMOlQg6gGsDLpDHBCdNPQmsE0VurX0T5Y0cFxpxsFQD+ph46A==
X-Received: by 2002:a05:6102:9d9:b0:53a:ca19:4336 with SMTP id ada2fe7eead31-588edada884mr609295137.29.1758266472009;
        Fri, 19 Sep 2025 00:21:12 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8e3e58e736csm751705241.1.2025.09.19.00.21.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 00:21:11 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54a664ffe83so700947e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 00:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX94onFYjEEjELyFnYGjJuTT/hcTiw4XM4oRosJzWqKdxyYjF/m8wzpqe1m0WQEPBRfpIAf9UHn/ec=@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:57d:9305:63db with SMTP id
 ada2fe7eead31-588dada3a4fmr641660137.15.1758266471269; Fri, 19 Sep 2025
 00:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
In-Reply-To: <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Sep 2025 09:21:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
X-Gm-Features: AS18NWCwEfI5KFrh0NIrqWXYQYE3E0Y3sbKZZ_oamCae3icZUAjis03HzRmeCBs
Message-ID: <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.=
org> wrote:
> > On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
> > >> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/re=
nesas/renesas-cpg-mssr.c
> > >> index 65dfaceea71f..7b52e8235984 100644
> > >> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> > >> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> > >> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controlle=
r_dev *rcdev,
> > >>
> > >>          /* Reset module */
> > >>          writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> > >> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> > > Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> > > to read the reset register `7` times and confirm [0] (as mentioned in
> > > the HW manual). So after reading do we want to confirm the bit is
> > > set/clear?
> > This is interesting, I wonder if the readback is something more common
> > to this reset controller.
> >
> > Why 7 times ? Is this documented in one of the HW manuals ? Are those
> > public and can you share a link to them , with the specific chapter or
> > page I should read about this 7 times read requirement ?
> >
> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> Module Reset Control Register Operation:
>
> 1. To secure processing after release from a module reset, dummy read
> the same register at least seven times except RTC
> and LCDC after writing to initiate release from the module reset, and
> only then proceed with the subsequent processing.
> For RTC, dummy read the same register at least 300 times and for LCDC,
> at least 100 times.

Ugh, the number of times depends on the module to reset :-(
Do we need #reset-cells =3D <2> to encode the number?

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
