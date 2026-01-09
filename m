Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFDA21D3E2
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981912; cv=none; b=b9SqyZyIV4fCIriIbQfYKga5aHoXaCokHvcueS3FAgdmOLjNFG2TJylcwLHI6GCV6A7YMuzEHYf031tE77fyqzqcUQjtsXjfscijjVs1L4+jJSaOjTubB5w7jc70qXL91cjmkB+knM8DnE3bq5C9yCmybt7gnrIZbF4y31L3OWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981912; c=relaxed/simple;
	bh=aoZqnjQwng885dzaO4ZMxyctN6RO9r34MuHFdtOF6zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8LkVAHqV4bR/zoRrwsw9F/S0C2SdeJ/YHVbV7KuyTWFwX1sxn83rTAxLV+546Ul0M/mIIsFvFwP0cRG+QQFV8LpzlMu/5PMds1/wD0J/qPQf9ixdL4vSdsnSUdkgV2GYFeinLsI0GE5TR68iHaLaYOk+yiNpHc8EtgZzSCnMSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso47836761cf.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767981910; x=1768586710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SQS2qWJh+KMy2hwJnXtSg0hFzLccGsX0DfWg2V7M8U=;
        b=M/YAGAbsiti6ulN7sj3Fxif8pF0VT+g5DON0XX6FEg6YaPPB8PD8oX+GYgpMh4BU/Q
         qCEPlOijFBP3LBGxXXCbXsBl3jhXoj2NVjj6mDDjJHy+t7TK4rE+UPIJaEPwmfPgn3mZ
         8K1j0frJbfHAglES/7cZu7jdRjw6OHha3sb1HtkKJ/anZCBQXy2203WQr8//fyIfic/x
         tvleD0nJd2YhX1YXPPGclq5yNgz0wH0IvE4PU+o/gsBDjk3zN0FigyHTnRbx6dDqvKRz
         Z8kFvDcnO5GQuaAuUpP20S24ElNoW1VvJdo5t0lnC8xMrcnpRY1UaWidx/BPF/MeJIkM
         fPZg==
X-Forwarded-Encrypted: i=1; AJvYcCXU60aZLFapnNAP6JTVV7m7aKGcLuE70DJjjhwZLt9WaRvLyhKr+8l+XekdSi97g54HPcLP18JpQ1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2MFd8mIM0YGetlJx8XsGDIR7lCc8RRS49s7Lj3H/uMdvq0sF
	XhHFrVQi1l5kDoVyD4lgNxBTcemf3+Q0Sfm9vG40FRU5n2I02KIzuarJLieNs/9N
X-Gm-Gg: AY/fxX4X8iGYwDv2WsKY4/SFThEX5tALnPfm6vsxmA6P3IQRig8LREVvb1oZGe1wIxQ
	8ZmimACSj6pgctfb5jBvqsGrSSzcPmUSreCQeWHWJt5ulYpV1EZcBUuc6PQokia39ci4onvZOTG
	qTVLeBG7Z9PWqNdc81n1m3fFuYDyf7S/UeZowpYDoSit7CL17gz3F8Z8QGgnho23CVBnpOdncx6
	jRpoWX3paRgfKdEVc61ErbXwc9HWyWKpkwxJc/wz+xtJmK2gY1Hb/xwA0dcZh9CjcStylP0+psZ
	g3b1HvCrlCPHvl4E32X3Qi/gtYqvBWREZviSYqXhVbobfPvOpf++pD/mHWDceEclWbnv5cEI+cO
	GGPaS2QKu+T4M4JQJWcvmLsI/7TawDfwWCRc1d1PmukGB48lnJJbHr2r7XS8lMRyHNUI3ZlZU+R
	Wt2697DgIalecziG3IKLiAwoOFuHgJrFxBqR+hp8BDiqUWcP1W0ZuUDRSS4S5K+Ds=
X-Google-Smtp-Source: AGHT+IFHJy3K3nJtMpfKUh6zBvZ8ewzL23GC0me2kUQx5Lv/kd/GohvYwsuz5eSGQ6OUUfIO2voEpw==
X-Received: by 2002:a05:622a:261b:b0:4ee:1e6d:2834 with SMTP id d75a77b69052e-4ffb4a3e7a5mr144349091cf.82.1767981909936;
        Fri, 09 Jan 2026 10:05:09 -0800 (PST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffc17c288csm35144881cf.29.2026.01.09.10.05.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:05:09 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso47836591cf.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4b2qhWqZoLSQ7kBq5WVIChweJAtqyKLC7y4c1E2h2XKbNRxIt1h5WXgOnhYF2CEKPh2KHTjQniRc=@vger.kernel.org
X-Received: by 2002:a05:6102:c11:b0:5db:1fbc:4462 with SMTP id
 ada2fe7eead31-5ecb6904fc1mr4710351137.31.1767981564119; Fri, 09 Jan 2026
 09:59:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
 <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com> <aWE8ikhsthB_0VQV@tom-desktop>
In-Reply-To: <aWE8ikhsthB_0VQV@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 18:59:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
X-Gm-Features: AZwV_QifanvuoW-_irwZsNnFdMvbLRSaB3vvL73nICwAcFv_-LTwhwad0tEOl0o
Message-ID: <CAMuHMdWGf7MgFzxjuea8agZgSyAMzXwFYO22NmRZ7i1-VPzqFw@mail.gmail.com>
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

On Fri, 9 Jan 2026 at 18:36, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Jan 09, 2026 at 05:22:02PM +0100, Geert Uytterhoeven wrote:
> > On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > > > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > > > or vclk2 as DSI Video clock, depending on the selected port.
> > > > >
> > > > > To accommodate these differences, a SoC-specific
> > > > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > > > RZ/G3E SoC.
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > ---
> > > > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > > > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > index c20625b8425e..9917b494a9c9 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > > > @@ -28,6 +28,7 @@ properties:
> > > > >            - const: renesas,r9a09g057-mipi-dsi
> > > > >
> > > > >        - enum:
> > > > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > > > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > > > >
> > > > >    reg:
> > > > > @@ -84,6 +85,13 @@ properties:
> > > > >            - const: pclk
> > > > >            - const: vclk
> > > > >            - const: lpclk
> > > > > +      - items:
> > > > > +          - const: pllrefclk
> > > > > +          - const: aclk
> > > > > +          - const: pclk
> > > > > +          - const: vclk1
> > > > > +          - const: vclk2
> > > > > +          - const: lpclk
> > > >
> > > > Why are you creating completely new lists every time?
> > > >
> > > > No, come with unified approach.
> > >
> > > The intent is not to create a completely new clock list per IP, but to keep a
> > > unified clock definition that can scale with feature differences.
> > >
> > > The previous IP supports a single DSI input port, whereas this IP supports two
> > > DSI input ports.
> > >
> > > Because of this added capability, the hardware naturally introduced an
> > > additional clock.
> > >
> > > Can you please suggest how to handle it?
> >
> > Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
> > Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.
>
> Testing a bit your suggestion
> we can do:
>
>   clock-names:
>     oneOf:
>       - items:
>           - const: pllclk
>           - const: sysclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>       - minItems: 5
>         items:
>           - const: pllrefclk
>           - const: aclk
>           - const: pclk
>           - const: vclk
>           - const: lpclk
>           - const: vclk2
>
> Then later into the compatible if switch we can do:
>
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: renesas,r9a09g047-mipi-dsi
>     then:
>       properties:
>         clocks:
>           items:
>             - description: DSI PLL reference input clock
>             - description: DSI AXI bus clock
>             - description: DSI Register access clock
>             - description: DSI Video clock
>             - description: DSI D-PHY Escape mode transmit clock
>             - description: DSI Video clock (2nd input clock)

All descriptions belong at the top level. Just add the 6th one.

>         clock-names:
>           minItems: 6

Exactly.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
