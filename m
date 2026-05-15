Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC3135AC1D
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831368; cv=none; b=hsXOX8CNbaWiN2ApiIvyNsW9h9WdsOp9rKcQle1hK2j0uwSGL7O+ArEx/43IvvxgFh+EvVGOjquIdnCdmT2eeZ3TQT7xIkxh/c32+4PZshxuZinKTeomneePqlho3GDXomjy91bf7II1V7CMXXNA68PdT26vBnCBqsaEQAVtAzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831368; c=relaxed/simple;
	bh=IF78aL4qhYcYFoQ/xoUYLUDn+1jiumlt7gMiBumVb88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbIZjT+GSx81ff+YaAlugzTzrZ8l2rB3XoiOpnhAXWhAZWvsDdMFzfJQbflT9W15u33Cod1Sy+Q7Gi68jTh7kt2VuUmh7XxN5qxOb4mQ1CS337WNCZwde8eiJIvJCD8zKBLyb4ItSbMhakWypDqvyi+GJkKZQiUFevxa1H8eCpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57512b86273so5439000e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 00:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831366; x=1779436166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAZHu6XpvwN5l5f2FSQxtIsJfHFz80+bclBZd6bS4os=;
        b=LZDBlyfi2sifcWfGy/shw8Usd1LzYTBkG6qF2/eRbO+3kc3F6hmUKQYd7q76gzX/Ed
         lgYYD7/ze5cTeifvPFowtONzVBIgVcu7EKLnoScMY/EahS970gjxgeXgbSIOvW3wD/AD
         KXk9QIArL1C2BWIgKR2wbO/7Z5m++xjzLh/URnmwgecvD2nR8CiZHSSct94pv2eR5iMe
         OFbrVkjLBbgY2QmaQXCo6CfXSghl5aB569zH5R5QngdBczNqjaFbEURZHshL4/uSGodE
         uanTKxXDIU0/hRIHc+Qibmer3TPWyC4Gp13N2Jm6zGD6TDD7Y+VEYbypfmPgBxORfOiP
         m1iQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Fcmh/z43+PIOb+aB06yWpK0oES5wzMoQULf0i3XGA6uP1gsmavw7rEehhbxMzcfq6XKYUURQmnpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2dAO8bgkocFZLZQ24pgXM5GXcah4ycHuO3ZHpPTrl41gCdOrv
	9jvSfFhTqpVjpo02VMLFu7QLBDKkppOOlmbos/jw9v6FVeOPyGm3DNZHQAe8Ynro
X-Gm-Gg: Acq92OFthuhwHbBlxCx56UoPFfQoVn48mH6aDpM2we86fdqg57IPA6A2bvi4kWo07hG
	0atf3nR25ocrYgHJAxVmBR2KyJklo/ZA3W+FZmHKIvBf2HTHwqobOW6VQqALCpyQ04HCqzV5uZV
	xXjh2fNKSocM3mzNMlOHf1kxCtuB+3st/vwGeHiwgmbFtMByjZkCBzrsLKqIRYRUsTJ3HRZzmHr
	nthoF0QfI5Nj+PtutKEeTCVw0x0dONst+g3LL7CM6id1lPhlVafmBr89gnuKPs09iEg1pj9XGdb
	vzbP9YPFE+kPYKCWVEUEf09zRcsalfiic4blsG1dVobABLZE/J0LkAxYLjOs0d0TgimL0v+uTlb
	u1UbmVvfTeJ8v2mjZ4K1qLPM0dR94uHyqbeSyUUs2IiuLoCKX3HyPDtxsHYA+9EykF08PyL+o2Z
	s4TfbAWmHgG8MwTdZJ8wLt9PCDREEpSyLI1YxKFpq0NMwkMYAoLyDVtJUW6gwF
X-Received: by 2002:a05:6122:3405:b0:575:e7e2:9c31 with SMTP id 71dfb90a1353d-5760c0ab5a5mr1725266e0c.10.1778831366487;
        Fri, 15 May 2026 00:49:26 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5bfb6sm819083e0c.10.2026.05.15.00.49.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:49:25 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-63127c440ccso5418467137.3
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 00:49:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/f+D2Vk6gZDWi53N5i4K3PHVbHapY65dSeirpeJorWVGwpKkUWEgU0HYNv/iE1NpT9JBOi5Nyfpr4=@vger.kernel.org
X-Received: by 2002:a05:6102:3f05:b0:62e:63e8:427b with SMTP id
 ada2fe7eead31-63a39a5f9e4mr1494077137.0.1778831365156; Fri, 15 May 2026
 00:49:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com> <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
In-Reply-To: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
X-Gm-Features: AVHnY4KQ6u1JetcDt3qGv1sa7SAF13W-c5qtL3drtJoKYhKLpQQVXnl4eLgch0w
Message-ID: <CAMuHMdVTgQp9WRiFpLX+pP7kOGF2v6oButALPu1B8QkYhVyvJA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

On Thu, 14 May 2026 at 14:25, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c

> +
> +static void rcar_dsc_atomic_enable(struct drm_bridge *bridge,
> +                                  struct drm_atomic_state *state)
> +{
> +       struct rcar_dsc *dsc = bridge_to_rcar_dsc(bridge);
> +
> +       WARN_ON(clk_prepare_enable(dsc->clk));

Who don't you use pm_runtime_resume_and_get() instead, like
rcar_cmm.c? Then you don't need to get the clock at all, and the driver
will keep on working if the DSC ever ends up in a power domain.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
