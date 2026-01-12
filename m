Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D4E311588
	for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225253; cv=none; b=TFTQKT1iFYzfNYMlM2v6DvhIIS53lTst8y9slrbhS2DiLnvFEOk1dmm3PT4JIXfM9Ho2b37qLQQbDQz/DIukaekAyrIlIsncebtIVYpAXaIdr+CAELMnynZWXDq6YUCK5bk6eUe/yrIfThhKZutsqQOJ+WDjhxqkxZrN9YeAQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225253; c=relaxed/simple;
	bh=9yBqdyrTqxi+3IyjZow+5t2Zev5EGWYpylLGOmF6JTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c6IsFoTz3cTvwuOoZ2FLksuVY+Cmf00v0JiEZ7fmncjENaaj9sk/gfYoGOIwZEtUVXmkp17B7MCkyMfFnMN4yE997a9cS3nRNbXHHnDHpyZOcIMN2R0JPBXIaxFLp58JlyAMmNhfOl/aJ3vErczyMRYIDkVKDXbBREEWO+kOFwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4503ee5c160so4083330b6e.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 05:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768225251; x=1768830051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mw1aKltaSTC5rf8Ujw6cZSHrtgE4MMBQjtQaAe26qy0=;
        b=FTDen2pd+JKUxsj0QRs/w5GpcThIcnMpybokeZic4y+2Nz0vliLhPPAjWBFKMtYl5h
         yFMkOaZQ+M42KlTY1zFYtSmv2fA7ksBF1POPxlszr7yliHFjGUv/xClnMs6M8z2fPh09
         eVO00udklTh7M0wvjiuRx8KtSss66T/q2lvirxgkeyzt5K4QfYiRzokYHjJAIaEYHk1I
         glByxf04GazM10OFQB7ei/MsjYNvLG59sCaYpx6pkbyKLABlXLQXGJXveMMFAtqCZtRo
         XzBWIM2QxsQc4h6KuQCUP6pL5MpFCGvEb2/Vs+PR66MFP4barhacX2/pQUi+SiRW9Fws
         4BIg==
X-Forwarded-Encrypted: i=1; AJvYcCWfpwFOvqCusCtPKk7x8SyOUk1xGK74c/iCe4ofUBnKXVLDYHZeQy78E7Q0yOXvV0AOraNKhSSsRag=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWzApQQnIHdN+VJquNWDtT+5zIm/SyB4e0+qG6ilwwYAAiB0u7
	i2OIEXG0C/eNRwuAkRHUw7KOYTeJF5ZSeiu543efgoCbRzGSl51in1kzIZ3DANbs
X-Gm-Gg: AY/fxX5o5zuwHD1w0abKMbx+4+J0GONBDRrgH2EL2H+WmtbGldAn0RqqTpFTsyQMH2l
	wjKLRJ+Y5jF+IngVjfqxLG944mQ47rC8MAd4ZJhZZWT3ajC3tNlpjfKnSduljF8dEO9GChBfHy6
	fJmpyJowR5qcVO1/4ZsOwC4ca1WSs+v16DVqvto0oZ+7dWOv1/RhwPAfzOdKkP4MfPEeYJV/fZ3
	d3ZTrFA7GOW+BfNPF+o3gp3xGWzoKUbPtwmcjXEZ6n49we5UeQ5gLMzB+43uVzXUzf1ftX8H56/
	xX/LH8tcKzzg8SsZjLar0wRoHASOsh2sJXPVUlXaf8pkL3GtTUQBVeYXEFanQKl09SGp3LhULeM
	7Ixg4IXYMKbfUWrLXKb9RPaO+RmBXxfr4LukL46W9LdrEpWFOLlJxQnwKzAQqYdgnXs2b5ZWhuk
	UvMiqs0AXETqUkptYK36WMAbTldlv42QHUmPJGpIIfBwRlmS+EtqnlHoMJQdc=
X-Google-Smtp-Source: AGHT+IFtj321NkSGZXbzvkg24jybrPzf6zno4MbyXI26jonk7sAx8FUcuZ/GyHFFV+VVDN1cL005Mg==
X-Received: by 2002:a05:6808:1306:b0:450:ca65:ef59 with SMTP id 5614622812f47-45a6bd4ae89mr9754887b6e.30.1768225250953;
        Mon, 12 Jan 2026 05:40:50 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a76abe858sm6053164b6e.9.2026.01.12.05.40.50
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 05:40:50 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3f4f9ea26aaso4868099fac.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jan 2026 05:40:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXYrl5z6qIAZPqB1zACSC9XoOnXKUxEc7TXVWd13gr10dHj8KKC3LxKx7E7280NBLHjAaJsiZlISpU=@vger.kernel.org
X-Received: by 2002:a67:e716:0:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5ecb5cbba6cmr5928342137.3.1768224845221; Mon, 12 Jan 2026
 05:34:05 -0800 (PST)
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
 <aWTYS9BjWn2bY5Lz@tom-desktop> <CAMuHMdVdntJrcT8d4sCBXdnYr1m3X7s-_58KBiEDV5+GAW353A@mail.gmail.com>
 <aWTiKQFBZT4hpaG_@tom-desktop>
In-Reply-To: <aWTiKQFBZT4hpaG_@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jan 2026 14:33:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
X-Gm-Features: AZwV_QipiAWkh5RwyVe2WxFleu8eNUYqxvAWPYb1wspLI2J-Wc5fAFHMdZBQFTI
Message-ID: <CAMuHMdV4hkcU6v4v9kSddyOftZnExZ6B5Q9DykRig1rosDT8bQ@mail.gmail.com>
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

On Mon, 12 Jan 2026 at 13:00, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Mon, Jan 12, 2026 at 12:35:15PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 12 Jan 2026 at 12:18, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Fri, Jan 09, 2026 at 06:59:12PM +0100, Geert Uytterhoeven wrote:
> > > > On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
> > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > > > > > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > > > > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > > > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > > > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > > > > > >
> > > > > > > > > To accommodate these differences, a SoC-specific
> > > > > > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > > > > > RZ/G3E SoC.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > > > > > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > > > > > @@ -28,6 +28,7 @@ properties:
> > > > > > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > > > > > >
> > > > > > > > >        - enum:
> > > > > > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > > > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > > > > > >
> > > > > > > > >    reg:
> > > > > > > > > @@ -84,6 +85,13 @@ properties:
> > > > > > > > >            - const: pclk
> > > > > > > > >            - const: vclk
> > > > > > > > >            - const: lpclk
> > > > > > > > > +      - items:
> > > > > > > > > +          - const: pllrefclk
> > > > > > > > > +          - const: aclk
> > > > > > > > > +          - const: pclk
> > > > > > > > > +          - const: vclk1
> > > > > > > > > +          - const: vclk2
> > > > > > > > > +          - const: lpclk
> > > > > > > >
> > > > > > > > Why are you creating completely new lists every time?
> > > > > > > >
> > > > > > > > No, come with unified approach.
> > > > > > >
> > > > > > > The intent is not to create a completely new clock list per IP, but to keep a
> > > > > > > unified clock definition that can scale with feature differences.
> > > > > > >
> > > > > > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > > > > > DSI input ports.
> > > > > > >
> > > > > > > Because of this added capability, the hardware naturally introduced an
> > > > > > > additional clock.
> > > > > > >
> > > > > > > Can you please suggest how to handle it?
> > > > > >
> > > > > > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > > > > > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
> > > > >
> > > > > Testing a bit your suggestion
> > > > > we can do:
> > > > >
> > > > >   clock-names:
> > > > >     oneOf:
> > > > >       - items:
> > > > >           - const: pllclk
> > > > >           - const: sysclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >       - minItems: 5
> > > > >         items:
> > > > >           - const: pllrefclk
> > > > >           - const: aclk
> > > > >           - const: pclk
> > > > >           - const: vclk
> > > > >           - const: lpclk
> > > > >           - const: vclk2
> > > > >
> > > > > Then later into the compatible if switch we can do:
> > > > >
> > > > >
> > > > >   - if:
> > > > >       properties:
> > > > >         compatible:
> > > > >           contains:
> > > > >             const: renesas,r9a09g047-mipi-dsi
> > > > >     then:
> > > > >       properties:
> > > > >         clocks:
> > > > >           items:
> > > > >             - description: DSI PLL reference input clock
> > > > >             - description: DSI AXI bus clock
> > > > >             - description: DSI Register access clock
> > > > >             - description: DSI Video clock
> > > > >             - description: DSI D-PHY Escape mode transmit clock
> > > > >             - description: DSI Video clock (2nd input clock)
> > > >
> > > > All descriptions belong at the top level. Just add the 6th one.
> > >
> > > Please correct me if I'm wrong but if we move up:
> > >
> > >         - description: DSI Video clock (2nd input clock)
> > >
> > > To the top level description we will have 6 clocks for G3E and 6 for
> > > RZ/G2L. With that I think dt_binding_check will fail ("is valid under
> > > each of") because of the oneOf.
> >
> > RZ/G2L and RZ/V2H need "maxItems: 5" in their if-sections.
>
> RZ/V2H -> maxItems: 5 is fine.
> RZ/G2L -> needs 6 clocks no?
>
> Please correct me if I'm wrong.

Sorry, RZ/G2L indeed has 6 clocks, as it has sysclk.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
