Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE97380FC0
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 20:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781727469; cv=pass; b=E3OYOgs4xsbpZ+ZlK5h25F4GbNkVfLHcQDK7QYsQ4/9GC2JpDcJGIhLEMx6/F5aoBfeLdJN7PecRMb+vj0BotucolcWJxhhlu8KS2Lqp7NBp8o7Jk0tt5l/KvT4zEtEzsWdwuxgkxd4WgfvKiQaxjM0bGAgLqkY4FoFIiD74wMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781727469; c=relaxed/simple;
	bh=Q9Tg5HXtBgjaBlJcgN82i6LPP5PISH66DDdSazi6cU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGWx4frTVlh7wGaGwHpjzX8G/EdpPQEVly/wquBFQTMy+PaFEg2WwsQdO77CL5YtGwcQG7yaXRhdAlrUjpqEfosMOOAG63aLrkXokC/nt/ouKBnfSLNgwdisMx/CMMaBcGRdkMVwqtbxdmpc4lLNB5MuaNMthwUEYcohseuHE7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCn5o+MH; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCn5o+MH"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46019b190b6so164302f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 13:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781727466; cv=none;
        d=google.com; s=arc-20240605;
        b=adU0zso39L2KY89LkhiUmrBF06VTp6vFXjX5aq3+NbFKcv93O+nJ8fm2MZ+KiFyG34
         ny7rjIz72srvACBqvdP6hYitD5rPI+RD8xV7CoO9nrViqQZ2e0CDXCV4M8QOS92HNmeE
         RI1j6fsiawdEmwtX6wxsmFlJGUOITYcffgq6lW47MLKDl0GX3ioIEdc9VJme4llBeGZ2
         83HGw+KP1GAi9oW5JstdctXACh3cdW6Zycq5nVwB9ic1NGoagH4mROwG4cy8NOqdnUxS
         7w1C2n+tHZijUPMUjBZ3bNEmtusjdMY7eFwDzQov+4WxPpqcFKbGkZzy+nDWQp2ExsKf
         acVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        fh=6JScnLPJws+cwKIXWimZ0/dw0WQKAOyqIPQCl4nly0I=;
        b=SEIK0l6qzEwedXpoNsalZQja6+W6HGpq8PgOsNkw/yoD9boWDyPQm5sMtSWskumKKD
         yw0I31Fz2fmhqy0W4+vTJFgpZqW7j6rBpNFei9BzwNp3LkYu6Qg8LoYGkPdHdw8HS2hY
         okYvJKop8aykFYLhIp2z15B4XtvqfikQBlQWHKFYMsKksscf0mSpnTDL+q4AUHyFgRMT
         5f3NF1OtkNTGQ4U/B8JVaIvUZlqn0iOloahoKYzdhI8HYN7zHlNkbG4pxTW8LUbyNKbO
         LWmoEUcqUuVfFfWnaXOxvDC1SdHwpS6ChfiGsJL0upKWiQEyA7EeGL6EByrfln5fl9R3
         gFyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781727466; x=1782332266; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=rCn5o+MH6S/4HWuqYm4hJHfhmmTGZN6OpcAuGGIcW9ZFhkonUtPh+hufxTVhUxeICK
         iVqOxP3xUf8gn05TMnwP95gnoJsnvulceVBZlI8G1eJLIZuYHU2jBqnxlS2cbc4pM19J
         P20RAENfZT7JPUlpanxvIOInd9MSMcXhDV1BpV2pFcgo//snA9Zx29PaU/FVVlvy2+lt
         rUyJWEiNu5ipEhlgfSlnvRgdKD9J9Rt/kEeTLJrMgUepf79VWousmIu9m4w5yKkqYMOu
         GG1WUHQzaLFdvHi74A+COu6xdH7fLXCI3/x8Hgmwfd+aiNHeKQ2NoyJ/SQT1e81sq7sO
         QJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781727466; x=1782332266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsYzT66cFvufnd7Au9sNej/2PPNzlF41Kwc6pMqOTLk=;
        b=DGIEEpTbBJjqvsvFAYetOOLhsmilbWL+xUm/vTsMm3YMYzaYQeHrr6KSL4wvPLsEGa
         cfe0rdDFVh7oUDu26ZYCLtmnU64roD05MuC2LkIKfPeq5pS3LSmggtQFzQVsBnZQPDBU
         DcsKCtWcXSb6HRezo8QIIs5cX4yqjT5tYaTW9LXrJLkVMWPeYyUuas3UqEeDA+T0cDYq
         eAVTr1QBguhorSk4PsazupCVNzQ+h5cP6j6Lwk8nLg49ne3ysZr90wNyxMLWlxm0sMSE
         R2ZaBpY8KKLsrDNXtkTZ8wXZs2VDdmVzK0RTlZU3ER0BMgyA6SL6cUUOKC90nBO3gXZD
         Y0aQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rYuZIKMM/rxWE8IFLswmRlTuZLFJmDfWdppQVdwIT7nx3TeLTMQe8zUD3Rq+eh+9sSN9fJB2t1os=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOd/0h3xdKsIN8GTTx75DBulXwTPWYfURUXg+Q5uNqKCP/MPrG
	T30ubR4A9IZC6ynWvcU4nl8Ugdt0WvasJI5SKqd5J0A4e3VZwWEOdMs+6A2M2JlyFap3h2WSLhv
	55s41Jnnq1T8awZN1RoMlAmWGd0LJG+k=
X-Gm-Gg: AfdE7cnSTHPEJcjj9etdN6vrvEyjSQ0p96zIGU6scsemnjkWXvTP+kWPpmiOOmJ+6u9
	45AEkdxUjIPH8wSNiDDiCHcHKDd1oobpUbqzngJz2ORsAhsiSMDc473Mfi3bZzILnFG2gCzXfty
	SwCfhFViy4JMho5TExyy0oXqK9ojYFIcm1skbpbq9r8p3eQNyyVBaJU98XhQAVEyfK3Oqb6sFQq
	Ttc4IZT+zZnXU8kvheeDPLjECXdsotIuD+IM9pe9LzlRvk2Xb0akMkAgjS5fswfmg/f/gZgU8kz
	MLjF2RzFSIrn4v/ziB+6ArR7jPzpi5XAo7W0ewKNNdXVG0O+Ky5L0GsBZLztZvufHlPjXQ==
X-Received: by 2002:a05:6000:608:b0:460:64e8:2553 with SMTP id
 ffacd0b85a97d-463ab7024c1mr1161137f8f.4.1781727465727; Wed, 17 Jun 2026
 13:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
In-Reply-To: <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 17 Jun 2026 21:17:19 +0100
X-Gm-Features: AVVi8CcvqvFDB97cccuGqXXMZPwXSO4sA5oZyLX7YfroXbBiGEnNUoByjqYmvPY
Message-ID: <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
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

Thank you for the review.

On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce a per-SoC PLL reference input frequency parameter to avoid
> > relying on a hardcoded 24MHz constant during PLL configuration math.
> >
> > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > calculation helper rzv2h_get_pll_pars(), derive the base input clock
> > rate from limits->input_fref, utilizing the conditional ternary operato=
r
> > to fall back to 24MHz if the struct field is left uninitialized (0), an=
d
> > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> >
> > This abstraction permits the reuse of the common PLL divider logic on
> > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL referen=
ce
> > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > disrupting existing platforms.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * various parameters used to configure a PLL. These limits ensure
> >   * the PLL operates within valid and stable ranges.
> >   *
> > + * @input_fref: Reference input frequency to the PLL (in MHz). If set
>
> "in Hz", as pointed out by Sashiko.
>
Agreed.

> > + * to 0, a default value of 24MHz is used.
> > + *
I'll also replace `24MHz` to `24000000 Hz`.

Cheers,
Prabhakar

> >   * @fout: Output frequency range (in MHz)
> >   * @fout.min: Minimum allowed output frequency
> >   * @fout.max: Maximum allowed output frequency
> > @@ -78,6 +81,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 d=
ivider, int target) { }
> >   * @k.max: Maximum delta-sigma value
> >   */
> >  struct rzv2h_pll_limits {
> > +       u32 input_fref;
> > +
> >         struct {
> >                 u32 min;
> >                 u32 max;
>
> The rest LGTM, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
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
