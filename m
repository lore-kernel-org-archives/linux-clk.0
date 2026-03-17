Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE5B3EC2CD
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765639; cv=none; b=YkcOEs6HewmbbEAGxFNau8SyG5TZADL6mPHQsW81OL57TDdVofFiDnRKHXbovSAHEXw4IFYg/+X2hP4irWU42ryf4/5bpa4EBsqSDD5Nn57QIPKa26wa5MFgzen51mjO1vVxYBeRE7mdDJMkr8MSwZHaPPNjJnhK4oJTRajVIh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765639; c=relaxed/simple;
	bh=W/LXxawnUy5QbMBSVSPPXzCeSWIGPaKFW9NiSKQMkSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qm8eaAAXVWmHST9Sg9xR+PfTbB8aAOAm1GWa0FaYbgR7mhr2PSzSeMANALs9JxCsD5Qp5lOjET/I58rm2eJj8w6xpWgVLpBOca7Xn+fCLPlWCG/V5SDB46W0/MDBZZE0sQdxPF9rXLy8iXcyJ4gu3dKk4uD0YDYRtEDCj24AgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-950de852f31so630652241.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 09:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765637; x=1774370437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsFPqGNbq+eb2XKkYK5oZMuSao00ukUspWcqW4wmr98=;
        b=DkKlF499nRslvgoWN/s/k1cTZrX4TAPp24RMjfzV7OYdRmfT9DuiQGirDI7SS01E6H
         swoP/2jq1VkS0KS/IKtrCmd66rr8fZcFacnvNJkIwQ9KOJJeZrnxXjVVUPCWXT/7h8ty
         V7rPaPxMlo5K+20HQuQqpH+7peZF+oK3Oo6caorJKBKnWw+O/cVW2BrUlEGH8ytuEnaH
         71S4UO/Md8bYhQih8A69zTXsbvMSbh7I1mPyLLRd0LGNt5gPAIt+L6hGqiog4+gGCIxh
         a0ut8oVh/6tJQbcmShdzrR/1MSrfweUnPBs7ZzwxKW+DRFMdW2Eitf/SHSd4MTTXP8s/
         DZuA==
X-Forwarded-Encrypted: i=1; AJvYcCX1D3MBjAHZ5YOftFcNNlzaP3fnhh4CAbZge3zDPMDiO7VkpxoBoaG/Q2wkWlmCf4qMUNac3S4jQxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+BJicAjU6cLcXWQC56zgXoOl6MMFb7rHpx+g1uI3pBvvpz/D
	kdBZlLozN0w93gRStFoyD7fk2D2myD64+APP9bT2D30V/Yk4P16ybSYosqqX+k2znOE=
X-Gm-Gg: ATEYQzzrhSG4yJwP9404/2xOprP4KknQiC7BQ4atDWvB5TYPDjlRtKn0zvrRzdRGPeN
	bfEhku8aQtyLxUtnksIe0JHWo3Un+aNKMn6HMAjAKFhrcUpb8NccTi/hJJ7a/8pOr+O/2YIH30/
	UKDc9RrtSAdcM1ny3cRtcTcV9LiUyP1YnFH250xanwE7EUNweR5w47a02CsaDUT2/SPePRxXqeT
	ijnd8CDvX7kPTfxD1/QcNqaIruDE68DAdRUTXQrLe8ik8ZZLnZhJxSgV/vfub5I296cCPFuxZtu
	Zx2myX3Y6h15zBlfkgBz85Gn+EeqnkkOgJoyUDBXKvC30gpe4akx5Q8G91AIQ1oIzmzBI6e+6Yr
	jnGZ4250o66ND/McsyqqPRWUsk9GyAUDCkGycbLnNIiGBxxaImV5HvwmqqrXha7C+VhFbAcNsfI
	7sDijypOjAUoRmx9TnlV7Dqkl2t937eMW9m7CP3qM2fyerwkrna+d4z2oI8Bux
X-Received: by 2002:a05:6102:cca:b0:5ee:9f76:1ab with SMTP id ada2fe7eead31-6027d0bb01dmr203959137.5.1773765636558;
        Tue, 17 Mar 2026 09:40:36 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deaa379asm8794752137.8.2026.03.17.09.40.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:40:36 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5ffbd778410so1588840137.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 09:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBHwEejMOoiS4MRUl27rdboo7wB3FXtbvgstXXF5pBPZMb7L6c+9fW/IMg7SiRKzqHfktTQ7stfLs=@vger.kernel.org
X-Received: by 2002:a05:6102:4186:b0:602:6c69:eec7 with SMTP id
 ada2fe7eead31-6027d320cb1mr178012137.23.1773765635951; Tue, 17 Mar 2026
 09:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com> <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com> <TYCPR01MB113329C33FF3CF8832B9FB1498645A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB113329C33FF3CF8832B9FB1498645A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 17:40:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWVmD7oBHOfooH6r5Gm5aVi+cU3+cbFsbGV=t7vhmL3Pg@mail.gmail.com>
X-Gm-Features: AaiRm51rq9Qm7mO42ai5bG3MUeyB3Sk3xPiht1eExfZaJrMLrFCMT9PE1Npi9uk
Message-ID: <CAMuHMdWVmD7oBHOfooH6r5Gm5aVi+cU3+cbFsbGV=t7vhmL3Pg@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 13 Mar 2026 at 15:35, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 5 Mar 2026 at 16:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Tue, 3 Feb 2026
> > > > at 11:30, Biju <biju.das.au@gmail.com> wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > Document the device tree bindings for the Renesas RZ/G3L SoC Clock
> > > > > Pulse Generator (CPG). RZ/G3L CPG is similar to RZ/G2L CPG but has
> > > > > 5 clocks compared to 1 clock on other SoCs.
> > > > >
> > > > > Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clock,
> > > > > module clock outputs, as listed in section 4.4.2 ("Clock List
> > > > > r1.00") and add Reset definitions referring to registers CPG_RST_*
> > > > > in Section 4.4.3
> > > > > ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
> > > > >
> > > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > ---
> > > > > a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> > > > > +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.ya
> > > > > +++ ml
> > > > > @@ -28,19 +28,30 @@ properties:
> > > > >        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
> > > > >        - renesas,r9a07g054-cpg # RZ/V2L
> > > > >        - renesas,r9a08g045-cpg # RZ/G3S
> > > > > +      - renesas,r9a08g046-cpg # RZ/G3L
> > > > >        - renesas,r9a09g011-cpg # RZ/V2M
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > >
> > > > >    clocks:
> > > > > -    maxItems: 1
> > > > > +    minItems: 1
> > > > > +    items:
> > > > > +      - description: Clock source to CPG can be either from external clock
> > > > > +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> > > > > +      - description: ETH0 TXC clock input
> > > > > +      - description: ETH0 RXC clock input
> > > > > +      - description: ETH1 TXC clock input
> > > > > +      - description: ETH1 RXC clock input
> > > > >
> > > > >    clock-names:
> > > > > -    description:
> > > > > -      Clock source to CPG can be either from external clock input (EXCLK) or
> > > > > -      crystal oscillator (XIN/XOUT).
> > > > > -    const: extal
> > > > > +    minItems: 1
> > > > > +    items:
> > > > > +      - const: extal
> > > > > +      - const: eth0_txc_tx_clk
> > > > > +      - const: eth0_rxc_rx_clk
> > > > > +      - const: eth1_txc_tx_clk
> > > > > +      - const: eth1_rxc_rx_clk
> > > >
> > > > Are you sure about these four clocks? On which pins are they input?
> > >
> > > From Figure 4.4-5 Block Diagram of the Deformed Clock System (4), page
> > > 789
> > >
> > > These clks are external source clks connected to CPG_ETH_SSEL mux for
> > > selecting rx/tx clks.
> > >
> > > In RGMII case, currently on RZ/G3L SMARC EVK:
> > >
> > > For Tx: we select DIV_ETH0_TR (SEL_ETH0A_SET) For Rx: we select
> > > ETH0_RXC_RX_CLK_IN (SEL_ETH0B_SET)
> >
> > Sure, these clocks are indeed shown in that Figure, and referenced in the CPG_ETH_SSEL register
> > documentation, but where do they originate from? On which pins are they supplied?
>
> Figure 6.3-1 Block Diagram of the Ethernet Interface
>
> and
>
> 1.3.3 Clock Pin Specifications
> Table 1.3-3 List of Pin Functions (1/2)
>
> For Rx this clock is supplied by PHY on the RZ/G3L SMARC SoM Module.
> RZ_ETH0_RXC is the pin.
>
> For Tx this clock is supplied by the SoC(RZ_ETH0_TXC)

OK, thanks! So these are fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
