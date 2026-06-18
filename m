Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACB42F39B5
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 08:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770833; cv=pass; b=gC5z+/Deu7L1eAYgd4HmphJottiykniLGdVn18ZInQRR5G1DmVMVUVaYynyseG4TD45c9gyMY+9S7a19TzTtgNty8JjaP76n9dvJcR2nW4Jfh+Nytq7i/RFLGJbHVREqv7ytmq933aR+yA5079iabNqfEp8w+Dy1KnJzk07hUYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770833; c=relaxed/simple;
	bh=fiMoFb2yDwUTE2GdMx5xeBoU/9rZgzEwoxvoMoWxtos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=un1lZD2/YGJpeF4fDnCmWfuSAOKPxYXWytfII8Zg18qY3h50o91qGkkXN3ZaydHfOderXNX6os5TNknIm/isxVG72M2MEds1OBhEtpOJMRhBmQLjg5L3gAitZ7xmInZo268nZPRP/CDc0Gfo8CrWkMCgjGBp4x5AtEaaDJIqlLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT7cVVSQ; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT7cVVSQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef41adbc1so543026f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 01:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781770828; cv=none;
        d=google.com; s=arc-20240605;
        b=Bt7RdC2R43i9ykkmqILHgWOwcEgl4/ZLu8XXidUjp1TDHesiMR4YLDOYzDh3RLn5kX
         5SkgMeIFt11nlKmBF6o5THuD7Ug08aWDCSYCmtDsjZ7b1tL+mnHVZco2RROdFPMhViwg
         l1WfKwV0nRVm/KE6/kM6ZgO0CPlzLZqI8jTUYWGS9TLQyc4xswkwzgP5WzaerEqgz7yB
         GNGDZZ29djm+mTUOJ6cqMzACdQtUnHevOWcn00ywwvun6EZKk3bU8Vqbyt9bYzRllsQO
         1BUqZQvcNG/XhvydPXTZyn74wYKzf52py25WNoNVrX26PAqfXllkzxr7Eyt1fzEXQ9nP
         VWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        fh=bCqUF0gSRdWdpb+mgyu49k4pmGEn0K52qFZ9kDqwv3k=;
        b=GLETQUP7wep1kOhc35xV1z9AQn/BQ6BhOY21M5eixlr2TD69kjpN13UQ453i7pZr/4
         kUP+EItFIF+eHn+17KtDk0vzEiFyQdgnUsCCHPezbq9IfoGt86DIY5B4y6Dc4G8vUhd1
         ptW66uVylX+plDGebMQ4B7aUN69lRSJf78fj3ONbHcewMnfFbQZoAonj6K327bA2R+qo
         v3YoF5nUbeaDx9w0yFGst5Ak7TgZR/dkZ2DFzJt+RJhQwFdzYfi6kAafnBu7AMTNpbgM
         olKOnijorjI9TzY5GA0iLURfdo9MEo3aIDh0jMqCuccKZIsPZWqJtfo3kXb9rb4Qh2iR
         iF8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781770828; x=1782375628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        b=QT7cVVSQZuAz6NuccHVwpkgY9DFYs6yKNBeHevouBsdjzS7z+B8iw4w07VYXdAFOiJ
         F5OEvV0tvnB8ddk+rXKzOFDDhHzNZGqixLtC2hLgfTY5hDWH/SHAR8xil0G4bOFR5Zdq
         ybhdJpE9SNDVr75Ra3aCbjlt7gigNzP84luuAYfAlIrKDRNRKi9llaAv9EWAtGqmIm3y
         9SQVkyd6kMFDeDYxMhA6aSdXO420bAkxKSccEFcLzdEoBOTzcWyWKnBpPZfw+cfCnwp8
         vyBcnO3mLslou8IE+8zn5UWjha9V04DoJ2PvS6XNwBxElAzqbOW4woSnmGqSOyJyUioB
         bZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770828; x=1782375628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jmxp3UYQzWdAJNffCvhOnFb1/BbRExCkHu3N92bH3tM=;
        b=X/Il7DS5FZKBjc8UovkncE2SYvQar8Fe7UIazBJ1BoPAGGZtWE3coN2Rv3f8jRfcuA
         GT80IKhZbHKtkwDjZHOFdtI4h8Vkpn5/SQ2l9gt6Pekve/Pa6tFTWWbIEqQh2M3HV6t7
         FBlPR1lJAZV4ucSMGi4nFRSndNtJYqg4v3kyyewv3Vyzys5fBJvL4kTdru8OizHWnZFl
         KrJhkHRHdznJrmzDcvTmQIVUrRsgY/YIGAyJ7Uf1tE7tU2BcHyuINeWCvOapc2qLjyux
         2cgSv2/a8wEnpSbnkoPv2+xeGq1K198vl9AVBk0YcCHszcuB8ZGGxLULqwGJ2hUBx/tk
         Bo5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+IfPF9hG+/wx66u0NANrGb9BvA3ovwBhOC3kfcx3pcqeq7qNuH55nRjqYXvlAFa7kHnChlkhTSyeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwckGM+1mveRjTS9XK9dAxjWmfEvts3av15Pum0DMn7u/ipgK3u
	LG3pdHKPeQ0ijZhADbrk3WOpQwAkMqBODqDbZe0MW+oBqaAQOKlMwDv2W/SGHwIN/CqcS1bwBlZ
	GasMJuGMz83XSJwBWJ98i8LBCK/FRb+Y=
X-Gm-Gg: AfdE7cn1tDiAdjy++KsDhn1YgDOUkf4UnoyZ6disi/C4//bgfMIXUD0mj+cKgIkmKKw
	8hp7PL7P/2s5YSDNgXFaetOQKn6Z5phcFQ493Vr8FKhCznL2q0cRfQR03Zn/81lftQJNhHFYqrc
	d3eg9gX+Rr352GCKBUYML9ucz7gETr76vqhVjNEq40AaeHOPrBpweD+eWu8UYDmZd86k088cueY
	FWuRstOkinqcdAxu7CjLrVc6UmbtcEfu+hG2C8mrNe+soP1PEQRZCxWDghKmebmiryE5zW6Ujku
	diFz2L5J/mbVZngZkbU0Qjwmld+36TdpgVlsYwcYMu2y80TSQczRq81KQ00I9zRhLd0J93N+t17
	haL7VYT2qXUhfQQI=
X-Received: by 2002:a05:6000:22c9:b0:460:2eee:4e21 with SMTP id
 ffacd0b85a97d-463ac0a944fmr3916466f8f.17.1781770828175; Thu, 18 Jun 2026
 01:20:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
 <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com> <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
In-Reply-To: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 09:20:00 +0100
X-Gm-Features: AVVi8Ccg4AT8n1omfHvxVoN0Ah5TcPCtg6-Pb4o9uNtxeqlzJVr2zsf7kYawbAk
Message-ID: <CA+V-a8uLoOdFcMzE=1=TDRhQjf7ffy9C=gzOgNf55HpAJ3_+zA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jun 18, 2026 at 8:18=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 17 Jun 2026 at 22:17, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Introduce a per-SoC PLL reference input frequency parameter to avoi=
d
> > > > relying on a hardcoded 24MHz constant during PLL configuration math=
.
> > > >
> > > > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > > > calculation helper rzv2h_get_pll_pars(), derive the base input cloc=
k
> > > > rate from limits->input_fref, utilizing the conditional ternary ope=
rator
> > > > to fall back to 24MHz if the struct field is left uninitialized (0)=
, and
> > > > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> > > >
> > > > This abstraction permits the reuse of the common PLL divider logic =
on
> > > > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL ref=
erence
> > > > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > > > disrupting existing platforms.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/include/linux/clk/renesas.h
> > > > +++ b/include/linux/clk/renesas.h
> > > > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(=
u8 divider, int target) { }
> > > >   * various parameters used to configure a PLL. These limits ensure
> > > >   * the PLL operates within valid and stable ranges.
> > > >   *
> > > > + * @input_fref: Reference input frequency to the PLL (in MHz). If =
set
> > >
> > > "in Hz", as pointed out by Sashiko.
> > >
> > Agreed.
> >
> > > > + * to 0, a default value of 24MHz is used.
> > > > + *
> > I'll also replace `24MHz` to `24000000 Hz`.
>
> Personally, I find "24 MHz" easier to read.
> Counting zeroes without thousands-grouping can be hard...
> https://lore.kernel.org/CAMuHMdUp3fOkAttk2FKJTh5svaiMwgu4JZ8utPeHghU4TQLE=
-w@mail.gmail.com
>
Agreed, I will leave it as is.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
