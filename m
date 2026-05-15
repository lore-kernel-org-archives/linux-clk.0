Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335494218B3
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835233; cv=none; b=vFItxOA9cLRaomZrYGpFr1VMIYr6afEzsr/P5cc2qTAmezTAj+RWzzTKQgXCgLphnKfEmsgk2/HuIoCn3QxT5xWTCKAABNhvpbvWjQagmWwU5Em1ms2k5XdvKdZ7VJfYdFiJHmiTDELpg/CDAgPQZDAu3gOTEhGndF4L9AWoLZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835233; c=relaxed/simple;
	bh=5yHoGKC4E/Rf7XOzxXWV+p/WVrFvuJccWmdeQGZVtoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmnE+nt5OhOV5acxQWFluhehYYMyURfR4fsWr5Dtu7TtdS69O1besnDNmAeTzroqOH7q7w9tZZkV2oOSlcsfpc3pxiparDEQWMvOUI0hLzoBUaqIrmxSHt8yaOM1WU4MSdOpWLiLK47XGim8M3BioUbATHx0rzJrU8JzFTWQD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba4a1a0325so61092215ad.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835231; x=1779440031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVgJPqzdVEsAMlVw8p1sldLEqlhvUsFX5k1afv6GStQ=;
        b=JKoDjMAs1Xml8vtQp5g+1Xqm5DqTkiQm0XXk63Vh+Z9EER7fpWgHy8mxcJ2RNcSLA1
         BU1Eys8cfc8YaLXDiDlE1MJijezKkcP5a2PCBxVMwI5ra4TIZuGys3g/lH7T/eztK1W9
         jNKvS6Sp1/yEEfLRJTSJLmfmG1pymeoYRCGYFX+wSk3DdiwVMfqcbhr8mt7ruTOTTxxV
         uJvhkepKpREYVhvmFNvu0bMx6nW/Xlu4gjYsj/WhgzJwPxYr0acIN6ZDH+i14n/dOv0D
         pDY3yiZKNexfkV7yNtD1GxHm01bmZ5qQdfX4ZbskIhxtNHPgyZvaNPXXwCrTr1vUfufE
         KxLw==
X-Forwarded-Encrypted: i=1; AFNElJ/r8bCeURet5tc86c2xZa26oFZQjRQgXpubKcoTEVU0m7/DRTRk3PsIUQ7O9d1OT0yWSNXgrZzW4Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW7U9MEny4FjLt1evfPnDwsA3xaz8qSu9tcUwWrGjLHCw29Uta
	i8SEaQ9Qm+X8vEnvVPptumv569YGBs74Nhmw+YUyw5sBzRe923crzkEDbJp7lubl
X-Gm-Gg: Acq92OGm+3Y18/1UGVaEOyrWHJ/6F4xD6cMYlewHjEu7Aw9p2tWbH+t88zLsgnTpba3
	KJXMLOQngxn4f/TD20Eh6svYhXwEG3g3gU1m+gFSOx67YxPaxCMsE0Dud0VoVx3KJO/iN5gdKo5
	exsTBtZxwy9qSLcGrK2JzXzs2WB3chgqBF3dV7xN0rkrb5vMMYDdhnk9NtrqNw4/DcdVIDAAo8x
	oxaquHho/Nw3A/TdrtvuIrO0uJprA0ZYtvkKgDzek1ODegyBEePAMOmUsxBezTbBTtnpxvFwLyj
	aqnty+U3AwRLr08x5JCOsFb5eRrTwzFyoDbOACQfarYR20dJHhFXJwbrvY8bgKGzeHL/TYJvaKF
	a/wfDxeBgmwJ0eZRCBGokJFbhwrxsLKaUCU40KiyyWoCPSZCwBEyG7Ux4conKhHhgxhUQ9shcte
	qnkkEa2YDk5WFbceDve5hVwxUSjZcy47ftT3q9DRc9J9/kmZrnYFDlz18v83cb4Ac2
X-Received: by 2002:a17:903:2490:b0:2b2:5840:809c with SMTP id d9443c01a7336-2bd7e77aec6mr25703015ad.1.1778835231359;
        Fri, 15 May 2026 01:53:51 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe47c8sm51604605ad.51.2026.05.15.01.53.50
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 01:53:51 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c796163fac5so6636050a12.1
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 01:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ81xgTOF7ipRXbevG92fSs6nys1KeCYCbF6U7+4O1hWVCJcpGhx174HFiK1Vi22Uu5vS/xdk58151A=@vger.kernel.org
X-Received: by 2002:a05:6102:358e:b0:62f:34db:9474 with SMTP id
 ada2fe7eead31-63a3ee86884mr1297663137.20.1778834878086; Fri, 15 May 2026
 01:47:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com> <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
 <6db159d9-56af-4d79-a1f1-9d5a6349b5ac@ideasonboard.com> <CAMuHMdVL9s=EHbw38kBzEVGa5-LawVY4YBUfSMA-6U+i3OSrbw@mail.gmail.com>
 <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
In-Reply-To: <d7447f51-c2f7-4947-9fd0-ac0d45027c59@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 10:47:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
X-Gm-Features: AVHnY4JCOAjr3bsj3LmrYGms2JUgvp1AhIShwYqx91e-BUfZ61J5zvr2A9mA72E
Message-ID: <CAMuHMdUS9jrsjqqPRKXJa9978kj1aYZ9aPrepv5kueiHGGLkCg@mail.gmail.com>
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

On Fri, 15 May 2026 at 10:17, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 15/05/2026 11:05, Geert Uytterhoeven wrote:
> > On Fri, 15 May 2026 at 10:03, Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> On 15/05/2026 10:49, Geert Uytterhoeven wrote:
> >>> On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
> >>> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
> >>>> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>>
> >>>> The Renesas DSC Display Stream Compression is a bridge embedded in the
> >>>> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> >>>> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> >>>> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >>>> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- /dev/null
> >>>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c
> >>>
> >>>> +
> >>>> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> >>>> +                                  struct drm_atomic_state *state)
> >>>> +{
> >>>> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> >>>> +
> >>>> +       WARN_ON(clk_prepare_enable(dsc->clk));
> >>
> >> Ah, just missed your comment and sent the v2.
> >>
> >>> Who don't you use pm_runtime_resume_and_get() instead, like
> >>> rcar_cmm.c? Then you don't need to get the clock at all, and the driver
> >>
> >> Hmm, why wouldn't I need to get the clock? What does the runtime PM do
> >> on Renesas?
> >
> > Runtime PM powers on the power domain (if present), and starts
> > the device by enabling its module clock.
> >
> >>> will keep on working if the DSC ever ends up in a power domain.
> >> I can add runtime PM. I just felt that it was overcomplicating a "dummy"
> >> driver that just needs to enable the clock when the video pipeline is
> >> enabled.
> >
> > Funny, I would say you are overcomplicating a dummy driver by adding
> > explicit clock control ;-)
> Well, now that I know the runtime PM does magics behind the scenes, you
> are right =).
>
> How's "module clock" defined? Is it the first clock in the clocks DT
> property?

It's the clock pointing to the cpg device node, and having "CPG_MOD"
as its first cell.  Usually it's the first clock.  Note that e.g. the
DU is special, as it' is represented by a single device node with
multiple module clocks (and multiple (but less) resets), due to the
tight integration between the individual channels.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
