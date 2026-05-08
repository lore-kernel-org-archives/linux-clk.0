Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEB33F8A2
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228785; cv=none; b=tQJnABl9vG9HEdaYB+rITUeIaDRcOT88Y5B3lUuakH2+3RzQPABnsTvJPItES9TPZwu633u1kOOPqrKnwZ2bHP0z6/RTpaB0ClhZuHaiQW15y2rnGytNMjAFFYnDw42lxferF+Dhgo/+jSTWslgfUISZ/kDzVQ6tSkW0NPxxhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228785; c=relaxed/simple;
	bh=OF+KbbPBry4fiTqCO/A0vEBAM9IFzJmbWYXTqxwsniM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9M+BEZ4DDUB7nfT+jbkFOJXwdtK5CXHnikF7OPmKPa356ZDBQVNNbhsiO1WpOgc99IxTMLXdbnhkAz1c8IrfJxdBACdNfaa3if4f1WnJfWSnlbYrChn67lJxTbF5Da5SOQJHst630NyRPzCSDfEwiZa9VTB5l5z1EUkkHRzhZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-575124e716fso656129e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 01:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228783; x=1778833583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUNwtFp7LXv7nOLjMf/BlzJYT09wzG6WamyTo0Ov/no=;
        b=JcNT5cYSMzB91ou9LRjzF1fdRz2Uk04XWIMTDUl6v5wwGlED8+B+1R635Q3HPmppxM
         M+xB1E4rJAZYa8aJ5Q+uiHQ7cRcBtrOc7IRIYksBC8XYlMJA12SLSfwggXwOPP1Ljs9D
         /ojKffq7g0xcAvoXXVjEcT7ATulUXFg3xiH32wrm3rL1av4iIr20MRSwBYWz0TsgprR4
         bmBsjuSMrCv1fzTT9PVECXAWgWCAticGko/JtHvgoYCoxFxgZHeSp1C5cy59ubt6DeVk
         NA5Hof5X/ss9WLRcOgAM5z28O2HR0vWBWLJMlZVkdtv4rQK0YjpG8kmYnWCITjhi9L8S
         KdcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/n2oseonkxlItBfXpUX2bB8TpEMyujfeRW5MktGJiOcfuVwFZJ9QYLk6GS6vyxikgNLJIuc6kVorA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzga74jk/2tOn/EZfaB9iV5mk1RJfFiwPGplZhsjC6vvRIw21ur
	Zp1Eb4iHq76Dry20CD4bhZN5fKYVNhsbRo491Fp5BTm5idQPX9op364HhpWfsJBKnSk=
X-Gm-Gg: Acq92OHUBANSfPTS1Wa4FTjJFWenut2O8BPgCb5h1q02gyrtYx2gK20rw99cpDuEcJO
	2klwqqS+lPw0HNWlGf61Or+IcC4W7Y5QIawzULm12rziXCqiymI+tvwAzJOiU8EkTUehV8FYu9F
	CdwI/6H2ONl2CsJV0woGjldI0sRVLiFi/qFpahBS7+nONnTQlZs2WmKixkAzDZ9oLy4SDg5KzM/
	uQ5CumcbWpOAlvp1wo31esQxWM8TP/qH0KzBFVtPUe0u/nIDjeOXkT1Yjwp1r+4c5fxublGnt2Y
	1S2Zr+HJVqW84IushY1plh7qiHYBr/233Jd7C/tJWle9qhnTrHp93hGsdgjuDJaclHFT8mV4f+3
	1O2N6wia7obmElzpFuMpqkTM/TcIOlAb5Z+w8tt9f2mmmazyywaCeatLZQ4h70uaK6oTMpf/fUB
	odgZSr6OtxzggwLPtJM99+nkpnBJQMVfbc80uSzJvT1LJ2sXJOM1wchfWfV44K
X-Received: by 2002:a05:6122:6583:b0:56f:1c32:bd07 with SMTP id 71dfb90a1353d-575594ce54bmr6515345e0c.2.1778228782588;
        Fri, 08 May 2026 01:26:22 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-574a6c6d4e8sm14443073e0c.11.2026.05.08.01.26.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:26:22 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6221c7251d1so631983137.2
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 01:26:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+BNK681/ozYYDEcWFXrMK7CiCqXJnLEYgRWmGMocZtya8DXMHMmG4Kn37CVQMdwTO18iwY54lFAV0=@vger.kernel.org
X-Received: by 2002:a67:e709:0:b0:604:ec90:ba14 with SMTP id
 ada2fe7eead31-630f8ee2fa0mr5929351137.11.1778228781677; Fri, 08 May 2026
 01:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776793163.git.geert+renesas@glider.be> <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <bf83a028-3ef3-482a-9ce3-8aec16f6ebed@mailbox.org> <CAMuHMdWN2zaZrY2jKKXpNqrP8xSqc-uJTr-siTBgaA=-EY_4BQ@mail.gmail.com>
 <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
In-Reply-To: <fa28c6fe-484c-4133-824e-649c52ef2200@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 May 2026 10:26:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
X-Gm-Features: AVHnY4JJUxMOqvyoeb-hr7ynluUAgTja2N2yaP-Ep1K9EfNyRckxSh-cxJzmeNw
Message-ID: <CAMuHMdUU=RohST4LDDD27W5dj=HwJFApMcDpsXATQ1MaMH-tUA@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 7 May 2026 at 23:36, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/7/26 9:37 AM, Geert Uytterhoeven wrote:
> > On Thu, 7 May 2026 at 00:58, Marek Vasut <marek.vasut@mailbox.org> wrote:
> >> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
> >>> +  '#power-domain-cells':
> >>> +    description: |
> >>> +      - The first power domain specifier cell must be either the Module
> >>> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
> >>> +        datasheet,
> >>
> >> I agree with this part.
> >>
> >>> or a Power Domain number, as defined in
> >>> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
> >>
> >> I do not understand this part, please see end of this email ...
> >>
> >>> +      - The second power domain specifier cell must be the module number
> >>> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
> >>> +        in the high nibble, and the Module Reset Destination bitfield index in
> >>> +        the low nibble.
> >>> +    const: 2
> >>
> >> I am unsure about this part.
> >>
> >> There are multiple MDLC blocks, AON, SCP, HSCN, and so on. Each MDLC
> >> block contains multiple Module Power Domain Gating registers (MPDGn) and
> >> multiple Module System RESet register (MSRES) .
> >>
> >> I do understand and agree that the first power-domains-cells cell must
> >> be the identifier of power domain within the MDLC block.
> >>
> >> However, I do not understand the second cell. The MDLC bindings already
> >> contain reset-cells, which should be used to refer to a reset within the
> >> MDLC block. Resets within the MDLC block are operated using the MSRES
> >> registers. Why are resets conflated into power-domain-cells ?
> >
> > The Module Reset Destination bitfields in the MSRES registers are
> > 2-bit wide, and control both Reset and Module Standby.  Hence the
> > same register bitfields are referred to in the power-domains and
> > resets properties, through the module number.
> >
> > Module Standby controls the clock(s) going into the module,
> > and is modelled as an SCMI clock (SCP_CLOCK_ID_MDLC_*) by the SCP
> > firmware. This is very similar to how MSTP (Module Stop) clocks are
> > handled on earlier R-Car SoCs (except that the SCP_CLOCK_ID_MDLC_*
> > clocks have a zero rate :-(.
> >
> > Summarized, the first cell is the power domain part, and the second
> > cell is the clock domain part.
>
> Thank you for the clarification.
>
> Since there are up to 32 MPDG registers, and 256 resets, can we encode
> both into a single cell ?
>
> (mpdg_register_offset << 16) | (reset_bit_offset << 0)

We could.  I did consider it (with a shift of 8 cfr. 256 modules),
but see below...

> I cannot tell whether this is much better, but it at least ties the PD
> components (power domain and clock domain) into a single value, which
> matches reality a bit better. The current split power domain and clock
> domain description in two cells gives me the illusion that it is
> possible to mix and match power domains and clock domains in DT
> description, but in fact the two cells are strongly tied together.

They are only tied together in the sense that a module (hardware block)
is part of a power domain, and has module standby (clock) control.
Some power domains are backed by MDLC hardware registers,
others are not, hence the need for the additional definitions in
<dt-bindings/power/renesas,r8a78000-mdlc.h>.
I am not aware (yet) of modules that are part of a power domain,
but do not have module standby control. If these exist, we
need an additional definition (R8A78000_MDLC_MODULE_NONE?) in
<dt-bindings/power/renesas,r8a78000-mdlc.h>.

Due to this separation, and due to a possible future need for expansion
(R8A78000_MDLC_MODULE_NONE, MDLCs with more than 256 modules, ...),
I went for two cells.

> If we cannot encode the two into a single cell, maybe we can at least
> have some sort of macro for this, e.g. this (0xff as no MPDG register
> bits for this block):
> #define R8A78000_MDLC_PD_HSCIF0 (0xff << 16) ((0x5 << 4) | (0x3 << 0))
>
> What do you think ?

I (and I believe the DT maintainers) are not so fond of defines for
numbers that can be (more or less) just read from the documentation.
(and 0xff should be R8A78000_MDLC_PD_APL?)

> > So perhaps I will clarify like this:
> >
> >        - The first power domain specifier cell is the power domain part, and
> >          must be either the Module Power Domain Gating (MPDG) register index
>
> ... for power domains which are backed by MDPG bits, and which can be
> controlled in that manner ...

OK.

> >          (0x00-0x3f) from the datasheet, or a Power Domain number, as defined in
> >          <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>
> ... for power domains which are always on, and for which there are no
> MPDG bits which can be used to control them ...

OK,

>
> >        - The second power domain specifier cell is the clock domain part, and

Upon second thought: s/clock domain/module standby/

> >          must be the module number (0x00-0xff), composed of the Module System
> >          Reset (MSRES) register index in the high nibble, and the Module Reset
> >          Destination bitfield index in the low nibble.
>
> I can understand this.
>
> >>> +  '#reset-cells':
> >>> +    description:
> >>> +      The single reset specifier cell must be the module number (0x00-0xff).
> >>> +    const: 1
> >>
> >> [...]
> >>
> >>> +#ifndef __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> >>> +#define __DT_BINDINGS_POWER_RENESAS_R8A78000_MDLC_H__
> >>> +
> >>> +/* R-Car X5H MDLC Power Domains */
> >>> +
> >>> +#define R8A78000_MDLC_PD_AON                 0x40
> >>> +#define R8A78000_MDLC_PD_SCP                 0x41
> >>> +#define R8A78000_MDLC_PD_APL                 0x42
> >>> +#define R8A78000_MDLC_PD_CMN                 0x43
> >>> +#define R8A78000_MDLC_PD_ACL                 0x44
> >> ... what do these numbers represent ? Shouldn't those be register
> >> offsets from MDLC MPDG00 according to power-domain-cells ?
> >
> > These are Power Domains that are not backed by any of the 64 Module
> > Power Domain Gating (MPDG) registers in MDLC blocks.
>
> I suspect that might not be entirely correct for all of them, please
> read on and see CMN below.

Thanks, looks like R8A78000_MDLC_PD_CMN should be dropped.

> Let's take PD_AC00 , AP core 0 , as a domain of interest. My
> understanding is, that the domain structure for PD_AC00 looks as follows:
>
> PD_AON {
>    PD_SCP { };
>    PD_APL {
>      hierarchy is SYSSS
>      always-power-on
>      PD_CMN {
>        hierarchy is CMNN
>        power-gating-bit is MDLC_CMNN 20
>        PD_APU0 {
>          hierarchy is SYSSS
>          power-gating is done by APMU
>          PD_ACL0 {
>            hierarchy is CMNN
>            power-gating-bit is MDLC_CMNN 16
>            PD_AC00 {
>              hierarchy is CMNN
>              power-gating-bit is MDLC_CMNN 0
>            };
>            ...
>          };
>          ...
>        };
>        ...
>      };
>      ...
>      PD_HSCIF0 {
>        hierarchy is PERW
>        power-gating-bit is MDLC_PERW 23
>      };
>    };
>    ...
> };
>
> With this in mind, I think CPU 0 DT node should refer to the PD_AC00
> power domain this way:
>
> cpu@0 {
>    ...
>    power-domains = <&mdlc_cmnn R8A78000_MDLC_PD_AC00>;
>    ...
> };

So we do have a few modules (I found a few more) that are part of
power domains, but do no support module standby.  One more reason to
decouple them in power-domains.

However, CPU cores are controlled through PSCI (the slightly less evil
brother of SCMI? ;-), so
Documentation/devicetree/bindings/arm/psci.yaml applies, too?

>
> The MDLC driver would pass the PD_AC00 domain ID to matching SCMI power
> domain management protocol call, or, for bare-metal MDLC driver, would
> have to internally encode PD hierarchy, walk it, and apply PD operations
> in each step.
>
> I think even for SCIF/HSCIF, the power domain reference should be
> something along the lines of the following description. The MDLC driver
> should internally encode that R8A78000_MLDC_PD_HSCIF0 is a sub-domain of
> R8A78000_MDLC_PD_APL .
>
> serial@c0710000 {
>    ...
>    power-domains = <&mdlc_perw R8A78000_MDLC_PD_HSCIF0>;
>    ...
> };

R8A78000_MLDC_PD_HSCIF0 is a not a full sub-domain, but merely standby
(clock) control inside the PD_APL clock domain?


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
