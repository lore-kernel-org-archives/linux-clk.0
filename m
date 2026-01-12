Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785681FECBA
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768218096; cv=none; b=oD8ElFtfb4jjUgeutvNdEWDV/0VMhE8ktOG0ggnGgvWJZrpCFEwgqPCrC1pzZGauIqVc28bXnAZ4Owec7gfIRMYkKAWeuhe/p63tx8vy0LHC908qwW8PUDI5KiN1M+JKhnHVMPJPbISEqiWufUOWLcG5/x90nHZhr40UxeZsH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768218096; c=relaxed/simple;
	bh=e8sL06nXoNEupuikp31TvXrN3i392xMPCHbyF8xMO04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7JC2f23czgB56RBPT4tFbNoIESc+OXUvhIw6hyG/XFmt1J962uFIkhpr1wGsWfv1X1IS1WMaZ+V3sRuy/wRcM3jUuALwDTnAAAv+Rq9gJ4hfUyYah4YJAQpCVbyazdgtYkL9+aCh4ewCQDUWVh3XjjPs/xMGd5EifrX57n8YIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a2ad13c24so60906546d6.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 03:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768218094; x=1768822894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCwZy8nplNPe4SBnl4QbdPCHxaIVjw84NdLZ03XKiqs=;
        b=H4LvohdLSxiyMgMWtXn1+2mDxDFMAgfN3iCMIBWG99dECGydkX+IV/kxc/kEg/pG/3
         DvjOYr4LOwQK2iejI98nWshAZgeqLhFDsTfb0kCs1p+pUVzQsfI9NfQ+13N2srMy9lx/
         OZvSmHRI3XMrIyT/OlF3u6qeWIvmAUMLyhh+mWjdDqgOuqV4vNeCIePkMRGjgxsb6WjF
         V0HwOsA7oTAs5ZuUT0pUO/iaRXHu0Ax/10Odu8hXkkWyCNOA9lbpom7NlBMB3kyds9lE
         TPJ9vtTqqTfsK1EOyyYChtYtcBfvQgVIwd2LEcYsBTOd8Dv1hGw57nXUwN5mUSZ3d+i6
         CylA==
X-Forwarded-Encrypted: i=1; AJvYcCUYgUBgctUM3/MBZHIgUcAPIpJ/VAdgRM/smReXe7R9pPKDSPlrvWvr7CjaTwvBRhppa+26XETgeJA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwloWfiOPZbAYw3lWFVEKSTxpQCArEtiy85waWP83g/vKbwyeqF
	E8GpN9mNFmnJ6xW/I0Oh5jXVBkkM1hFrxVSlMm5fUFIqDQGJu4jMRjZPDSeRI9by
X-Gm-Gg: AY/fxX53UT7l8GH956jk9Ul0AwXGan/XgHyse29YsTm4GSCZQTAz1IBGj47GXiyq37s
	FbHuVaIYeMTynMRuhJEGpJ4Q+PpzGuGEPw2Meczv4a7uEbqe3nBJTNRDTV4nEMu6qQrWYIg4aGX
	W26rEBVR2kWbEKCddspX2or5gNUennCGFXCvbPpHOE3tWJFjLYDCn218ygmNcA8ozELndmI5WMI
	Cw8sNZ8k+ZT0KQ/aL4IaQOIS3fx4AnNy4hVRrbS9iNcJaZmsrMu4jFR/urYSUqvQno/iQeLukTw
	0ZYk0rtFVOEOc8fyjJm/sYTD6ozpHBL5/iQC48pWLFRdmi1EHsF9kDOfXTwYAf4ZqqM/HVNkzTW
	nSBCrFWBrpn+TD6GECB/71JXJrTVInu9l+Khot0ITPPStTqA+8umtnuPYVdvwYultifkcHE+xwb
	hvhyf/BH2q31Q+xggxNol4um6OYzfEU4O6mIZE5A8czzcm7slE
X-Google-Smtp-Source: AGHT+IGSBdhIqEXLgPYfFchplEc/qvEocyB9aDAs7WvI1cZs7qxeiNkhDcBBrC5MhSrR6Vl78MUZig==
X-Received: by 2002:a05:6214:5a0a:b0:88a:2b12:f746 with SMTP id 6a1803df08f44-890842a452fmr267618656d6.56.1768218094343;
        Mon, 12 Jan 2026 03:41:34 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077280fd3sm134219096d6.55.2026.01.12.03.41.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 03:41:34 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a3d2f3299so75536486d6.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 03:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUjfeXCU3/2qg35KNUGjBNw2DpBTBjriguyWHZbGhtEm2rJvPteCJ4KXP8kipMKE19BR4es5YsAz0=@vger.kernel.org
X-Received: by 2002:a05:6102:6058:b0:5ec:c528:4dd3 with SMTP id
 ada2fe7eead31-5ecc5284f7amr6284383137.42.1768217726081; Mon, 12 Jan 2026
 03:35:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
 <aWE8ikhsthB_0VQV@tom-desktop> <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
 <aWTYS9BjWn2bY5Lz@tom-desktop>
In-Reply-To: <aWTYS9BjWn2bY5Lz@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 12:35:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
X-Gm-Features: AZwV_QgqmWBfwmu_212Rxj3vjBBvkBDNMwpqCH0FZHQJKUGeDVAXwigjiGPPHlA
Message-ID: <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
Subject: Re: [PATCH 09/22] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > >
> > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > RZ/G3E SoC.
> > > > > > >
> > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > >
> > > > > > >        - enum:
> > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > >
> > > > > > >    reg:
> > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > >            - const: pclk
> > > > > > >            - const: vclk
> > > > > > >            - const: lpclk
> > > > > > > +      - items:
> > > > > > > +          - const: pllrefclk
> > > > > > > +          - const: aclk
> > > > > > > +          - const: pclk
> > > > > > > +          - const: vclk1
> > > > > > > +          - const: vclk2
> > > > > > > +          - const: lpclk
> > > > > >
> > > > > > Why are you creating completely new lists every time?
> > > > > >
> > > > > > No, come with unified approach.
> > > > >
> > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > unified clock definition that can scale with feature differences.
> > > > >
> > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > DSI input ports.
> > > > >
> > > > > Because of this added capability, the hardware naturally introduced an
> > > > > additional clock.
> > > > >
> > > > > Can you please suggest how to handle it?
> > > >
> > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > >
> > > Testing a bit your suggestion
> > > we can do:
> > >
> > >   clock-names:
> > >     oneOf:
> > >       - items:
> > >           - const: pllclk
> > >           - const: sysclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >       - minItems: 5
> > >         items:
> > >           - const: pllrefclk
> > >           - const: aclk
> > >           - const: pclk
> > >           - const: vclk
> > >           - const: lpclk
> > >           - const: vclk2
> > >
> > > Then later into the compatible if switch we can do:
> > >
> > >
> > >   - if:
> > >       properties:
> > >         compatible:
> > >           contains:
> > >             const: renesas,r9a09g047-mipi-dsi
> > >     then:
> > >       properties:
> > >         clocks:
> > >           items:
> > >             - description: DSI PLL reference input clock
> > >             - description: DSI AXI bus clock
> > >             - description: DSI Register access clock
> > >             - description: DSI Video clock
> > >             - description: DSI D-PHY Escape mode transmit clock
> > >             - description: DSI Video clock (2nd input clock)
> >
> > All descriptions belong at the top level. Just add the 6th one.
>
> Please correct me if I'm wrong but if we move up:
>
>         - description: DSI Video clock (2nd input clock)
>
> To the top level description we will have 6 clocks for G3E and 6 for
> RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> each of") because of the oneOf.

RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.

> > >         clock-names:
> > >           minItems: 6
> >
> > Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
