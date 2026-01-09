Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F295CDF1
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767975739; cv=none; b=ZWLL3mi8AeJT9cMy48VacD99NBftb+XEKOKULYdM/9vWBWWvoT0vKqeJQsBvdehrzDJZUkm+mvLNhF8+oVREkRvyqTRYDDOo2Gmon+7fbpPQtZcmZt0Glxhwjsfku6SX2sALP1nYBXIo3mfThPJoKISrunq5KfQO97Mjx7R9aRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767975739; c=relaxed/simple;
	bh=q2Kww8jxXcJ9Zpyd/LZlLagNoFIlkoKqu9nlzf+mRgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVFDG5pGgsH+Ncid24b68h2hknA59Pm02ILy7ra/ms1iVsF60iZLKHPoJdwdwxX+p/SrN6Tb7bwgJzJBdPgA4eKQturgowQcvhjLmta+JylmvzI6JA0hyJ/OXEBB16jxZu4kJm3sHvVQJadWadcR0mCIfq42WOzncHL4mfpHeFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5636f0cf5c3so217151e0c.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:22:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975736; x=1768580536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZubT71CRwOcTCIzcYS6e5AdXUs3dXA6+1fPYpwtqxhQ=;
        b=sqLOHQ5nlJqcB+JlTVadzW8tC3SEHohhp8cauCTEzY3zBVY24ZHo2py/nuuKgXd+CB
         TjEdwBf6xkRlQd9pKWwbU4Y4pmStDzZZNyjDbjRb3uJJ+Dic4712poL2vpwjSJK1EcVU
         HKQXSe6zvAuek7EdhepaxMfbpwXuwUITk7mAH9416aJ18HGZDPgG+ggumqTc/dAMZ0rs
         WjR/cWwKv9osPbgqTuN2SzPSBVcUkIf4b9K1rJVIKRcQeasoIzCFar1GJGEA+zwaaJN6
         kZ/3fA+X5L0asPEBATzxpCfHaU/SIgdDznW2F4LCXo6rcjf1hrFJqd1+plbeVOM4wcMh
         tbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUepKnUQg5/DNlW0ttb5AnEPmrbOJdd3sxZzojYTUHDHpv39h3eJr2DFm2G+Tp7hbNEuA8f5CsbKKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ndMxs0U+CPowtchuUEL9ScAV6wg77ZpUt2uWuaBFbzumgRP3
	70NcPLImltAQytkHYcK6Udez2tVPsu/Xj70GXMG8cBOuC4N1/iFhaaeZhJQbzx7r
X-Gm-Gg: AY/fxX48kcApSaxPCMVv2TVryDsC9uYlkT4cE64Wb7stz2wewhN2XDbA9sijSqu6hwY
	fUoo4FMcsSiEclZKvHNjPaKDFCtgcdVn1RGcpo41g/F6cWy1ftatnhUcQ0/gtvpDghKyWaG60aa
	AovbdSC59fFMTLiUt63v4MQEW2pRVIXYrOwSkdt6X5M4V55Qn/b9eJ/zFQJVgzNWFEuUE+uORRX
	7EmeiTgzC7JCwv5Y6FI4C/74RQAGoE1yNI8I+EfZ6P07MRJ59k1fRej0fbopcLDfUFdh3wsoVry
	Sl9+5K4Mbn3WG1Y6CI6xqQqwdBwrjdFLRCMWf+wmCQq6qB8rVsxxPNe96wBZuEp9oYQpqUZ2Bzw
	k9SQ3/nCqXBCILCdtnB76PPKBliWjElQe/mUZbsDKgY6j/mrbX8lv1soJsjCqrJIT4CrICZzbnP
	+AzvAVLeRbfLlhPt2qKnDxTzhqpilD3535kTguNJkmLakzYSwW
X-Google-Smtp-Source: AGHT+IEg3Vn6lTy4LL0840O80ziQbHIwrAdiKi1mhkE/09sCsrJ7H2tNwYW3l4XijtMu/LxTX+sBLQ==
X-Received: by 2002:a05:6122:3b18:b0:563:5070:ab40 with SMTP id 71dfb90a1353d-5635070acaamr2581139e0c.14.1767975736009;
        Fri, 09 Jan 2026 08:22:16 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm7779849e0c.17.2026.01.09.08.22.14
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:22:14 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ed0a9cbb3fso1919569137.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:22:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2UGJNEQo7KkrUrTLCftW3N0U4RT+3dygbu1o/qHSjOgmw5s/i/xMXaJkk4UGlawGLclIP1WiNUZw=@vger.kernel.org
X-Received: by 2002:a05:6102:161e:b0:5e5:5ed7:60af with SMTP id
 ada2fe7eead31-5ecb90b08d7mr4011067137.38.1767975733803; Fri, 09 Jan 2026
 08:22:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <1c7657d6c06d99bc2f90251995ad272b5704717d.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <42bbdec7-ce6d-417c-a13d-ce0a6782bc9a@kernel.org> <aWEnfJonv4egKhXo@tom-desktop>
In-Reply-To: <aWEnfJonv4egKhXo@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 17:22:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
X-Gm-Features: AZwV_QiF7IGNds3nroCU8C4Y7nT5yUExjbtpCqViVpA_Mph5jGaVHbhMlWChdXg
Message-ID: <CAMuHMdUm-yHkRw0k42pfq9BD8urLO7rqF2yD7s2JbkMFpRTQwQ@mail.gmail.com>
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

On Fri, 9 Jan 2026 at 17:06, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Sun, Nov 30, 2025 at 09:24:57AM +0100, Krzysztof Kozlowski wrote:
> > On 26/11/2025 15:07, Tommaso Merciai wrote:
> > > The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
> > > the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
> > > or vclk2 as DSI Video clock, depending on the selected port.
> > >
> > > To accommodate these differences, a SoC-specific
> > > `renesas,r9a09g047-mipi-dsi` compatible string has been added for the
> > > RZ/G3E SoC.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > ---
> > >  .../bindings/display/bridge/renesas,dsi.yaml  | 120 +++++++++++++++---
> > >  1 file changed, 101 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > index c20625b8425e..9917b494a9c9 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - const: renesas,r9a09g057-mipi-dsi
> > >
> > >        - enum:
> > > +          - renesas,r9a09g047-mipi-dsi # RZ/G3E
> > >            - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
> > >
> > >    reg:
> > > @@ -84,6 +85,13 @@ properties:
> > >            - const: pclk
> > >            - const: vclk
> > >            - const: lpclk
> > > +      - items:
> > > +          - const: pllrefclk
> > > +          - const: aclk
> > > +          - const: pclk
> > > +          - const: vclk1
> > > +          - const: vclk2
> > > +          - const: lpclk
> >
> > Why are you creating completely new lists every time?
> >
> > No, come with unified approach.
>
> The intent is not to create a completely new clock list per IP, but to keep a
> unified clock definition that can scale with feature differences.
>
> The previous IP supports a single DSI input port, whereas this IP supports two
> DSI input ports.
>
> Because of this added capability, the hardware naturally introduced an
> additional clock.
>
> Can you please suggest how to handle it?

Keep on calling the first vclk "vclk", and add "vclk2" at the end of the list?
Then RZ/V2H can specify the first 5 clocks, and RZ/G3E can specify all 6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
