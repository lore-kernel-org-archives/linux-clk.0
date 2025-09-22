Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3AE156F5E
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523519; cv=none; b=ROzfAhenbIfApcjuGRbCinK9HjuHXke2Nsj4JH3mZoAGd/kvkpUZUPZJDiZYUvcftKvQGvPBDNpfydN2HOfBS5OmVFlwtHao3Akwj/ueMMPBDEIZ+ayInKdGGv+bOWqzZGOvK0A9ly2j33+TWP1L7p9Z7Qf960xeC+ac70r7lp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523519; c=relaxed/simple;
	bh=WKoNp1m1LguBSPMUxFyssGnY7WelyBSixdM+cHjnGTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XxDJGyHEKXe6GL0+owqp+t0oI+iukIL6Nd830uIK6TFREdpHB+bai3LSRkCcCpEo1gUer4Zq3xlXJ3eRBFOwo4WJHwRtU7DM6DHsr281IAzXHCmPft/GnopILv5C96YVxRc37G8PP/ncuwE2jjdK2My3BjUp96wHKg7xU8CEF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54bbf3329c1so231625e0c.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 23:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758523515; x=1759128315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2pT7nU31KC3yAr9S8YEwrTsIGl6TmmeSEMqmYUADM4=;
        b=oRtH9Bb+KOUpI9oXYWsqlV1NBuJWog03bnav8AizfJSFSpM4no7+3nP2Sm1oGq4nxy
         o+yindKykblt1kBR5omHXGXPOO5aPB3e2FbsIs1C/EbQq6BMoL559uHbqGG+Cs3/Nwi2
         oI/qFZNp/ZCBgZMN6Y+YdFqv2yd+GEqrYK4ocWv1Q59XIATTgIHd72Ho3D40KuY9jAe5
         Gh1aOQUI+Xkk0HwWRIPe/B0DyI/lbVgn93X0sNUFXXgJmbEA8yflvTAQoho4T8ExtQ6J
         O71mKfVFmHS2tc3KPrpPSeVzAxfRGfzbXo97xptm2c8Yb3PKrDam20C0yOnPP9RHUkR9
         8RRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBfQurMO1hpr3064EDwScA41tEqMNG8K/V/Pn/oHeLSv/RwDRLYb7dGWWlxnM8EcPkOYqPcOZWdYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG4RoQM2ysNN/RhN2M6FlUuYorWIdJnX1gKPFRDx4JhtQv1Cva
	10UzfdWFOgH0SaPt3gKqoZ7pcl7+sLu33vYrkl3kZbxcrgmuN+P7AFtVgBzOuY5R
X-Gm-Gg: ASbGnctfFXblmvNRaAltNr3i29w2K1SPfT9wbs6LhsHrWucIsW3+vy2XB1o4zJM2KY4
	VjvV2k3vwD8qasvf3LPBiWF0Dw+pBMDOprR7fHu9PI6EhQx71ufbTEMnEgWLme4ISR3WuFE6fWE
	ADKhmJahxebno5cGp+TXU+lKP3kzqeGD/6fRT0QP8Ko88KMjnMsUYBlh53vyGGTdwJhjWDS4B8x
	mLanODWJw9wKMqKRgUO9nvy4gU8OESzivjhDAkG8BmsqM/xb4vFiHKPTthQ6+lsW0bBAoKOtrSi
	XgSbLnrQ4ghqUa1vLdPR4n8D59M60jQeUSv30X36Sp8kF1P+rG5sB2bJTOktyg+542lORBCOsQf
	rJQaFKvJJMMFeW7ALrQtM96kUzRTOsz797t9L7re/LKtYRwgpw255j+3L8jxU
X-Google-Smtp-Source: AGHT+IEROVCpW7dXHSnAFKfedC8Pujq8iyQQySwfaTdwVzfGHOdpsETKF5417izVCKACXF/Q3yOm7w==
X-Received: by 2002:a05:6122:8009:b0:54a:612c:ca7d with SMTP id 71dfb90a1353d-54a72270eb7mr4099529e0c.5.1758523515562;
        Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bc0141d54sm117132e0c.18.2025.09.21.23.45.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5565a83f796so3306195137.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Sep 2025 23:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYmmDFw3kXrLpjS6R6l/XUDtqtooPrDITF1hx3HA7lgYCGtX4yLDBlRtzByz2cWMRErWLJkTyjtBA=@vger.kernel.org
X-Received: by 2002:a05:6102:6d0:b0:58f:1e8b:a1c1 with SMTP id
 ada2fe7eead31-58f1e8ba864mr2544747137.2.1758523515209; Sun, 21 Sep 2025
 23:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <CAMuHMdXN2=0KRhBy-pW_ah7mL6iU+8O9pGD20dhSxk4-5R5ckg@mail.gmail.com> <066d5882-89d4-4d10-a054-4d0fdec88cd7@mailbox.org>
In-Reply-To: <066d5882-89d4-4d10-a054-4d0fdec88cd7@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 08:45:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFOfmFn--DygQX+YWCHv-08kzajxy4EW1EE+aJ3s2Dsg@mail.gmail.com>
X-Gm-Features: AS18NWBvewPp6Spu2fbQeSe_GnNCFEAMv65KCUiUm_kJHXIyUoB47n-e3LDoOvs
Message-ID: <CAMuHMdWFOfmFn--DygQX+YWCHv-08kzajxy4EW1EE+aJ3s2Dsg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, 19 Sept 2025 at 14:19, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/19/25 9:21 AM, Geert Uytterhoeven wrote:
> > On Thu, 18 Sept 2025 at 17:05, Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >> On Thu, Sep 18, 2025 at 2:42=E2=80=AFPM Marek Vasut <marek.vasut@mailb=
ox.org> wrote:
> >>> On 9/18/25 1:11 PM, Lad, Prabhakar wrote:
> >>>>> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/r=
enesas/renesas-cpg-mssr.c
> >>>>> index 65dfaceea71f..7b52e8235984 100644
> >>>>> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>>> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> >>>>> @@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controll=
er_dev *rcdev,
> >>>>>
> >>>>>           /* Reset module */
> >>>>>           writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> >>>>> +       readl(priv->pub.base0 + priv->reset_regs[reg]);
> >>>> Fyi on the RZ/T2H and RZ/N2H SoCs which uses the same driver we need
> >>>> to read the reset register `7` times and confirm [0] (as mentioned i=
n
> >>>> the HW manual). So after reading do we want to confirm the bit is
> >>>> set/clear?
> >>> This is interesting, I wonder if the readback is something more commo=
n
> >>> to this reset controller.
> >>>
> >>> Why 7 times ? Is this documented in one of the HW manuals ? Are those
> >>> public and can you share a link to them , with the specific chapter o=
r
> >>> page I should read about this 7 times read requirement ?
> >>>
> >> Yes this is documented in the HW manual [0] section 6.5.1 Notes on
> >> Module Reset Control Register Operation:
> >>
> >> 1. To secure processing after release from a module reset, dummy read
> >> the same register at least seven times except RTC
> >> and LCDC after writing to initiate release from the module reset, and
> >> only then proceed with the subsequent processing.
> >> For RTC, dummy read the same register at least 300 times and for LCDC,
> >> at least 100 times.
> >
> > Ugh, the number of times depends on the module to reset :-(
> > Do we need #reset-cells =3D <2> to encode the number?
>
> This does seem like an reference manual issue and will be updated.
>
> However, it also seems if this encoding of per-reset properties is
> necessary in the future, it would be better to have reset property
> tables (similar to clock property tables) in the kernel instead of
> encoding the per-reset properties in DT?

Yes, the background task running in my brain had come to the
same conclusion ;-)

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
