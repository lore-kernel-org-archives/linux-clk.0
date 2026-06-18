Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E04D35E926
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767059; cv=none; b=KI4hNQjAIPXJPk/QbpV8s4b1v05D57cRJwmHyNup3gSPyvNgTPrBP60cQVmAdXmP3gO90k5xyWHUAE3sHF4Qi94BAQqUdqa04Cfg7HRQlhuu3gOYXX4gTU6JZp1j6e04F5cKSiEx2eqLZX6yE0bw4Plh3nipYbFzpAyAH3yeK1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767059; c=relaxed/simple;
	bh=tfbcEFHyRGxmt/ZNMjfmkNiTbtmi4aiIGAAer8bH9z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVAYoEi+BidjWl8XAHdqlkYT/lUMY5Q6U2MatOcO9xMuIgw8quhYwlUfCZGIhQbBO6KwTcW5uNtqHjdIRMUms4GkqitTIlj82bONn8BmIhLLJkgvqFNAp4evAeypnbbWBwpqbbHdNdbqAGNhNFD1j3DRDfHCoh94oxTotrYiHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ab0377d0b2so206930e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 00:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767056; x=1782371856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzQ4TuItSjjDfqcY5h5uPw4axpJfO2Kzm9zj8eN9JJg=;
        b=R3pTTuGjxjF0dd3bzMxzB9F/p62G800l9UYiZhojBUNrG7MbW+R6CfFWJnIz4aybub
         NcgFiuGSqjUEfA8thSuVfKrxikY+eTzS7LV8RcnU6/nY3QXu568BKDtOBMFMnFycmeQg
         ma8zW/gHRYPR+llNbsPmZ4tcxrMZHGhbUW8/L19q4pdXcSsyI6bXdUW4oo1VRYyjduaT
         L0BagMCFBAyqfpEcd6G4nNfhZjbAgYu+Fb7AjncT7OszJV9CPij1Qj8HSp3CQ0SdCG6Z
         EiiYsHgeZcO9wGPeECVWqJZUuZlv65+XZrkrvSWNHYSRKg15An9TuT1etgsuM8oAtml6
         sHFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LPv0T4IxfokWOGCUnEe1o+Nrh4yR6MPaYyObLX+03DarKkqgQUAq0fA9xgjBexy247yp/mHJp2ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBOLJC5xzY+iZguRdb1j3NxeN7tK6LgkpNfiNIAJzx3h5fwLgx
	E/Jk3rQCWqZzVwRfMsKGznigbWCOsrwsMdGj8IRUoQFsvLzAtdSAOynSPcnrN2lY
X-Gm-Gg: AfdE7cnG+jx2TpmeKvyKfY2XqZdqMb6vqNqV2LdshSrOgccLb6NoAy9LNSeY3MZDse5
	dRFL/0/CY0DVl+FReZnuNTyB31HABaDRQ6GqLb6d3bN8Ov7H/SeuCHUVhmYKetavodWBbncOVzr
	Cw9x4rDUIUjRrcCX2uI9vt2blRh2e8g3nXZNAmY8TSTbrUpOIdXxH14TKERd2LlP0TYexFRM+zo
	kxE6v5r/ReGwdASJQLuZD5EnVFfRu2fAQd5pFOEos1X0vOrs6J10AUYK1o9Ibomoz5X6nPcl7vB
	aDSCGQhSWi/zJFJrZiDfdKWjqJZNQxQ98+hSV3dZaD/+Bw3IhCM7x3YXCJd8LRDVV2NViNaiS53
	AldTlGMs0TI8oPxwZMICyzyB3VOG6nFzcoDnRaGWE2zbS6JdgqmeDG109cRPpiJggKH7ryEqsG0
	W8u3fkOsSL0mF1q+7RexFh91yurvy71u33obsaQLHabW6QNP49e4XeI8EHo+0E
X-Received: by 2002:a05:6122:65aa:b0:59b:1012:3f42 with SMTP id 71dfb90a1353d-5bbbe70433bmr3485467e0c.10.1781767056395;
        Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac4d6sm10315182e0c.13.2026.06.18.00.17.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6cd01f6c11aso210008137.3
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 00:17:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9nnHZF3Cxco+PQXbIjsWfFYcK1xuObbPuyZeNM2fVvfgOOnRN3c1CXZXAjIk7uHghoEZlBTzJ1caA=@vger.kernel.org
X-Received: by 2002:a05:6102:3f51:b0:635:1bc8:3563 with SMTP id
 ada2fe7eead31-7246cde4ab6mr4100174137.20.1781767055966; Thu, 18 Jun 2026
 00:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615104845.4122868-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWBeaTB4QK5vvB0CQm+yrX1ps3V2EtFu0Q4a0JG_94f7g@mail.gmail.com> <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
In-Reply-To: <CA+V-a8uixCr+LZ+2SrX1b2p3nNwkq8=ctdpzx=BF9OcR9eJW1w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jun 2026 09:17:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
X-Gm-Features: AVVi8CdwNDnTBvDYfJRjdNKhkzB68fOeQnOFgapo4u-OWjhPO9Gwwv76NFhl4Qg
Message-ID: <CAMuHMdVx_SS0w=x4H3WUb4BdnOXQOxboeFZwmvhP31HLoQNNkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference
 frequency for calculations
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Wed, 17 Jun 2026 at 22:17, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Jun 17, 2026 at 10:48=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Introduce a per-SoC PLL reference input frequency parameter to avoid
> > > relying on a hardcoded 24MHz constant during PLL configuration math.
> > >
> > > Add an input_fref member to struct rzv2h_pll_limits. In the core
> > > calculation helper rzv2h_get_pll_pars(), derive the base input clock
> > > rate from limits->input_fref, utilizing the conditional ternary opera=
tor
> > > to fall back to 24MHz if the struct field is left uninitialized (0), =
and
> > > drop the obsolete macro RZ_V2H_OSC_CLK_IN_MEGA.
> > >
> > > This abstraction permits the reuse of the common PLL divider logic on
> > > newer SoC platforms like the RZ/T2H, which feature a 48 MHz PLL refer=
ence
> > > clock input instead of the 24 MHz signal used by RZ/V2H(P), without
> > > disrupting existing platforms.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/include/linux/clk/renesas.h
> > > +++ b/include/linux/clk/renesas.h
> > > @@ -53,6 +53,9 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8=
 divider, int target) { }
> > >   * various parameters used to configure a PLL. These limits ensure
> > >   * the PLL operates within valid and stable ranges.
> > >   *
> > > + * @input_fref: Reference input frequency to the PLL (in MHz). If se=
t
> >
> > "in Hz", as pointed out by Sashiko.
> >
> Agreed.
>
> > > + * to 0, a default value of 24MHz is used.
> > > + *
> I'll also replace `24MHz` to `24000000 Hz`.

Personally, I find "24 MHz" easier to read.
Counting zeroes without thousands-grouping can be hard...
https://lore.kernel.org/CAMuHMdUp3fOkAttk2FKJTh5svaiMwgu4JZ8utPeHghU4TQLE-w=
@mail.gmail.com

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
