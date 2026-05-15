Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2123EF66B
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832744; cv=none; b=UoKlrfrkcFJMaKu2TZVzMkm3ppwlbm9zFSLUdNX1LvDRr66zrXv3JRbb7VWMYt2fCbV/PbUjsOhITLMrw6ybWyRGYkvkceFDJTgV0bQaMFaps9h5Hy+mlKZrWrL2rWNya0AjF4MnhgzeS7h3eLdrJdlxCguG0KFOriQ9ttEqyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832744; c=relaxed/simple;
	bh=JnpkHgeRaLIklyrr/tYaJR4akkRsVCzKpHaRqDOKORg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjPgqfv8d22B8IZgj2brGBJXwT6ZYBaWdX5wgZ3fXwm2x6fo80uWmls7IEdk7NmF55qVrWHCiQ4av7iKJwv1/BdgUP+rOtRja0ANpWDhQwCpbQcY/GFgctN2kk3HVPgThnS2YumonsXLIdhODuRDV9DD+0Jd3EMCedYYcRjre/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bcd730e090so41580965ad.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778832743; x=1779437543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTMs9H2zcG/hkZo7rCavYzdXjSvd0E+3ghPib3tFoJI=;
        b=Ox5PRWQNPXAza3rpthknQCt1NAtRuMWv0/1n4aZvA+6Wf3viEdZ2WE6rkmhz9/cYwj
         MGNCBzEc23rN20JxvJnRszgkXUEiiO8ORknnItzfJTpJkY75drY8qR8MLbjiP+n+2q0h
         pIt5QLvIvY77+BpYnHVAy5yhe76BNIo7dRw2Rzgbr/p7Ij6NsuDRCc4V+f8X1tLhqk4y
         FAwgP/uCNJ90Smz61q/gErao1d+/ECvwEzusvkP3ArIDGDMKsmlrEkFQIijaTphRrmy4
         cjxQiBzNJwMO1fjzUFpsnfWa74fbRnajgoUEqE8wnNkDEpDEwRu6bAhB0TRLy8r8LK3n
         l5QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IDO3NHY80dwz0symIKj0PWOS3xUScWYozc38QwClEw/0HgrhdRpOEpn+9BgUISMXvn14UT0Cuwic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8iDpc3Mu4t4tGMfUWL8+NUgcRgyU4Drv+R4KtCgLUrszy/T+2
	IvL79hUsPYKY7pDoe2x6L2ZZ+/wp6Pmcw9x3g6T9tThw7XRC1GKWx4jwbxcmgLOo
X-Gm-Gg: Acq92OGNzbZP4q6yL0ApTyzBGSs8BRlNPJSjbOzr6VtL3skiVRyYczs0WL4Up82TSvU
	Sa6rGX7rpDkKNvJyOcYG9sleqBDhWLDJPEJC3BOtwk0iL+/iBwT7TeDV0RL6Tel+eUueZbTQdak
	u7/AXsuCvvfAK6e4RzyEc15OuYmfMBBTj+G/JbwOcc3ityYshCjQ7ohdX9BD0+zgWOgfg5Ut9AV
	7HMN43yb1C3vb3awVaWd64ytqc6b1NropH/2AyRKyg2UCArwOe9fpP0lmYLInIrnRZEOzMVX4Bx
	OTDv+8IQ6a/d1FpZlUU34g4g3CWbL+jhIz2vii0N2SW432btF4v5m5cyHg02WIwilbjNuQvAHHd
	G0Y4UMSfyoh1aBdccGlcFJOyBtZsd5KeSNgw9Q09yeLyPmI72xP2nX1rdJurcSRoqBBjaBJw5oo
	c1y4FXfv+6sGmvpukeX7v+VKdc0wx75M6zbNeMyh3mswf6fq8TlWczIrZuNCa6Foq61l+oCFJSP
	A==
X-Received: by 2002:a17:902:ef0b:b0:2ba:e8fa:898e with SMTP id d9443c01a7336-2bd7e96cb9fmr40428795ad.39.1778832742744;
        Fri, 15 May 2026 01:12:22 -0700 (PDT)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2cesm52742495ad.14.2026.05.15.01.12.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:12:22 -0700 (PDT)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30246cfd41aso3724118eec.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:12:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9LyqtxiBt6nETtEACziXwhzou00Y4YijSHdI6IqaJ/jibj0y65uwH+9BTsH6SX3W/zUAueCXumV5g=@vger.kernel.org
X-Received: by 2002:a05:6102:f94:b0:631:5ef5:8325 with SMTP id
 ada2fe7eead31-63a3d93b73cmr1247586137.8.1778832352115; Fri, 15 May 2026
 01:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
In-Reply-To: <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:05:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
X-Gm-Features: AVHnY4IeYtwx3NtqULFNQ1UNiQVfhuhx7vVBY8D7FKyQ3HU9Ed8VUzHO4jOvKfs
Message-ID: <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> > On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> > <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>
> >> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> >
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >
> >> +
> >> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >> +                                  struct drm_atomic_state *state)
> >> +{
> >> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >> +
> >> +       WARN_ON(clk_prepare_enable(dsc->clk));
>
> Ah, just missed your comment and sent the v2.
>
> > Who don't you use pm_runtime_resume_and_get() instead, like
> > rcar_cmm.c? Then you don't need to get the clock at all, and the driver
>
> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> on Renesas?

Runtime PM powers on the power domain (if present), and starts
the device by enabling its module clock.

> > will keep on working if the DSC ever ends up in a power domain.
> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> driver that just needs to enable the clock when the video pipeline is
> enabled.

Funny, I would say you are overcomplicating a dummy driver by adding
explicit clock control ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
