Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE7F2765DF
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774598726; cv=none; b=IxV3ogRaIo5nYcmJRh7cdWniWTtnJhYPx6bD6UEnoaShajhb8mLoFoux5AbLPvRqlxZLMeCaDSXqRq7PSgHsdJ37I0ECJ7gHFcLdok6FZpGnEWVt/8e6oObJYONtPL9CdyTtIuWaNzcSv9khC4hG1aOHOv7WNrPoBXCQOkbujXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774598726; c=relaxed/simple;
	bh=LsuoM6vSS2icn4IcCYbHnTFkI9szULOyzJ6/FpfPSuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kc6l5d6YOvoIJwZkCUINn/ca4Xw8pcJbwW6xRxKmG01O4mO8hMdASjVPOPt0OcK6rHx/Y7X516MPJOmlwEmjEVQnsc1TU5RZn55w4ou/I9xrWK9EzwYjtFaQkfbdC+FCCoyyjrxevIttUkrvuDgVPxoXWy4Riqpi1Y5dRPsKfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d7d50516e9so1112479a34.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 01:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598721; x=1775203521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHzybmIOhEZ6f1NrVP3jgghQyfbqKSz0qw+kQmDQIR0=;
        b=Qd8YHIbJB+st+rUzLDBeIu2JS4L36siY4KnkP2bgW0Y1chpEXUj0gbJtKtd2UsLE1E
         D38FfyejeNC8p3+hJxgxpfpsM20rGH4srBOhB0AY3znZfpR8nN+r41ogn5hstdIqI6v6
         lcODUfRBI2LAvi+u0L0H3cI45D0lbdgiBFxpmdXVAcxI87z3S/W6NHwgh1pbDUMfdamE
         W0SyNQtlorLaMqntj4VB6eWR7lqLUIdtJa+u7u2jNgQrwpaChH03CxzHwXgHobhsWkKb
         iJd/lymGrj43UtZGj8XS7ooExed2UhWjvbsbE1y/AJ/r222hf+jpOhmW1VcpkcYkP1fE
         zOag==
X-Forwarded-Encrypted: i=1; AJvYcCVh6lnUgpxY5AuMFwiiLe2c8HXtrQtzMpO1tBjWTE8aZ2iAsR1TSPAwy8Htsx62WsJLUvgLwBGQw8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx38foigKk4+NUJxE7Qk+6C+4myWk7vurDe5sncCHfFOKMmL+sq
	WyR0LAc2BlW5uXzhqKLIP9HVa4Npv06lDVznrMxig9LuiSW0p9FV4hbdNW/tN+80tc0=
X-Gm-Gg: ATEYQzwrzJDlUhixiJEHJxoKzqrVLnUEFvqS3s0+kx6ZWZe4JmDDKl0G2FTuwVLbVYz
	vmtq5KFDeGRh5qpr5OtYowSo+xL941wz9ai0kBIpfsYmC4sesiRBmnX+0LhxOnoD0y4dzpTtO1Z
	7NZLt3U8b4tcyPI1dmt6WIkZQ4BSUnIwSfa0WPRmR1te+JfshlAdl91mhommFi+nunWzvKt6iOf
	WDcZJgX6Q9FZZaPZbmrQRuUyhsq0hyIBdLLLz0krDfstbH2dmRGCZGip3G1sMiXk7hE4vOh5r2p
	Zj5zqBBF2RSot5YbA+Nh2oXylbehL+nypx5troVH2PS3QmXdmFotWShulQP13x0lNadYCslMrrY
	koVhW44h0OnMdeo7ubDo0B4dD61Dt+Ls4epscnqBwfwAuMjFV3UGgSMpCIQdWmhuhBW+Kv7r4jp
	Fd0Xcw4rLehGKtoHuJyudGS6R8luXKkNTfRgoNM8wmFwlKQdsY5NgUJHNsgVjS
X-Received: by 2002:a05:6830:3690:b0:7d7:ecfc:76d6 with SMTP id 46e09a7af769-7d9faee63c2mr772067a34.17.1774598721430;
        Fri, 27 Mar 2026 01:05:21 -0700 (PDT)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e680456bsm4909973a34.0.2026.03.27.01.05.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 01:05:21 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-41c0aae84e5so1321138fac.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 01:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK40Yh2S78PMvxYVVB8eoH3eJgU14IW8H7vrObES+VmMXTrgiA50QXp9KC+4wCJ6inQZncHKogFXw=@vger.kernel.org
X-Received: by 2002:a05:6102:560b:b0:5ff:d1c8:a85e with SMTP id
 ada2fe7eead31-604f930a02dmr530378137.32.1774598416378; Fri, 27 Mar 2026
 01:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-5-john.madieu.xa@bp.renesas.com> <CAMuHMdVbP5Bbr9KuxoEb48zUvubT3CN7sC9oVat2NcNWaBwOtQ@mail.gmail.com>
 <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737720136E84FAF590F637C4FF56A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Mar 2026 09:00:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
X-Gm-Features: AQROBzBkJOmSHv5z_VHomTtftX1LPSPJAufke2TB95A8lqe7V-8DI3QQuxsJ7o4
Message-ID: <CAMuHMdW5W7bWa7CBYNoQqOKQVogmmnCbt1u8RREc_7p+0fNGmg@mail.gmail.com>
Subject: Re: [PATCH 04/22] dt-bindings: dma: renesas,rz-dmac: Document
 optional DMA ACK cell
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Thu, 26 Mar 2026 at 23:42, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 19 Mar 2026 at 16:55, John Madieu <john.madieu.xa@bp.renesas.com>
> > wrote:
> > > Some peripherals on RZ/V2H, RZ/V2N, and RZ/G3E SoCs require explicit
> > > ACK signal routing through the ICU. Document the optional second cell
> > > in the DMA specifier for specifying the ACK signal number.
> > >
> > > The first cell remains unchanged and specifies the encoded MID/RID and
> > > channel configuration. The optional second cell specifies the DMA ACK
> > > signal number for peripherals requiring level-based handshaking.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > Just a quick head-up, as I haven't read the actual secion in the
> > documentation yet.
> >
> > > --- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > +++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
> > > @@ -63,17 +63,27 @@ properties:
> > >        - const: register
> > >
> > >    '#dma-cells':
> > > -    const: 1
> > > -    description:
> > > +    description: |
> > >        The cell specifies the encoded MID/RID or the REQ No values of
> > >        the DMAC port connected to the DMA client and the slave channel
> > >        configuration parameters.
> > > +      Use 1 cell for basic DMA configuration.
> > > +      Use 2 cells when DMA ACK signal routing through ICU is required
> > > +      (RZ/V2H, RZ/V2N, RZ/G3E audio peripherals such as SSIU, SPDIF,
> > SRC, DVC).
> > > +
> > > +      First cell:
> > >        bits[0:9] - Specifies the MID/RID or the REQ No value
> > >        bit[10] - Specifies DMA request high enable (HIEN)
> > >        bit[11] - Specifies DMA request detection type (LVL)
> > >        bits[12:14] - Specifies DMAACK output mode (AM)
> > >        bit[15] - Specifies Transfer Mode (TM)
> > >
> > > +      Second cell (optional, when #dma-cells = <2>):
> > > +      bits[6:0] - DMA acknowledge signal number (from ICU ACK table),
> > > +                  where 0 is a valid signal number.
> > > +                  Required for peripherals using level-based DMA
> > > +                  handshaking (SSIU, SPDIF, RSPI, SCU, ADC, PDM).
> >
> > How do you expect this to work? #dma-cells applies to all DMA consumers of
> > this provider, and these SoCs already have DMA users relying on #dma-cells
> > being one.
>
> Indeed.
>
> > In addition, you cannot have optional cells: if #dma-cells is two, then
> > all consumers must supply two cells (of course we could switch all of them
> > to two cells at once).  However, as zero is a valid signal number, we
> > cannot use that as a dummy when no DMA acknowledge signal number is needed
> > (we could use e.g. 0xffffffff instead).
> >
> > Is there any other way to provide this information?
> > E.g. could we have a table in the driver that contains this info for the
> > (presumably few) MID/RID values that need it?
>
> There are actually 89 entries, and I could identify 3 peripheral
> group with linear ACK assignments. Thus instead of static array
> we would get a simple function handling 3 req_no ranges.
>
> Something like:
>
> /*
>  * Map MID/RID request number (bits[0:9] of DMA specifier) to the ICU
>  * DMA ACK signal number, per RZ/G3E hardware manual Table 4.6-28.
>  *
>  * Three peripheral groups with linear ACK assignment:
>  *
>  *   PFC external DMA pins (DREQ0..DREQ4):
>  *     req_no 0x000-0x004 -> ACK No. 84-88  (ack = req_no + 84)
>  *
>  *   SSIU BUSIFs (ssip00..ssip93):
>  *     req_no 0x161-0x198 -> ACK No. 28-83  (ack = req_no - 0x145)
>  *
>  *   SPDIF (CH0..CH2) + SCU SRC (sr0..sr9) + DVC (cmd0..cmd1):
>  *     req_no 0x199-0x1b4 -> ACK No. 0-27   (ack = req_no - 0x199)
>  */
> static int rz_dmac_get_ack_no(const struct rz_dmac_info *info, u16 req_no)
> {
>         if (!info->icu_register_dma_ack)
>                 return -EINVAL;
>
>         /* PFC external DMA pins: ACK No. 84-88 */
>         if (req_no <= 0x004)
>                 return req_no + 84;
>
>         /* SSIU BUSIFs: ACK No. 28-83 */
>         if (req_no >= 0x161 && req_no <= 0x198)
>                 return req_no - 0x145;
>
>         /* SPDIF + SCU SRC + DVC: ACK No. 0-27 */
>         if (req_no >= 0x199 && req_no <= 0x1b4)
>                 return req_no - 0x199;
>
>         return -EINVAL;
> }

Nice!

Note that you can use ranges in case statements:

    git grep "case.*\.\.\."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
