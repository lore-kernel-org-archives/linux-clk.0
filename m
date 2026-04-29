Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B372EA498
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777457426; cv=none; b=kcMpIlV41eL1pcmmTTzEvO5pVHCmiZblRli4rd3J9uAtLItD4QkSw2IYoWc9M5M9FEonDCNzdzW6xs6OlSHSBmFvMe+YiKPijymms++DRt1+05JPC27W5xNeJJukznLbVjEMwfilBr1O+pIYowduRmzgOQ7VPTftwhelzi9UTY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777457426; c=relaxed/simple;
	bh=a58EuFGZxQ5yCYnA9qrvXyLI+dMZJByadlX6j/LFqVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqNv6JL+VmlC6Aj7txw3jkQkLYrJha8JlsXx+zBHw9LeSXIWeuZZVzfre5jUBjEszwySbHVIFMFzhYKZZeMN3yY1MoQo1/qC7q1W6BFw8+XGYc/c9OyetfwVpKz3zO5+iwlVQywBypMQQWp5D48xdBrEvfo3+p0ivFU15TUulxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95697b46831so6667110241.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777457424; x=1778062224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlgSQf9TVaIeapbi36V5Bh/+HrPzPP7kpOmKArKJl0Y=;
        b=gQsUMsibAWP+I/zd4cDJsw5gCt/yqrayPsd2uh77BkDGY1yfvJgkKMrePyDq9mrhNL
         5SZBS2Zl+CP0osqPuSIRO/kSxe6N9XVe/BO0mDZJdJRE+iWhsiTZcbjyA/7Ob3mAgR1I
         8+Fcpz9AJsRtV8SvEv1kKOIolc0wMbeXklbwhwyhkOeInST81M7VkUnRa8v+vbjOU/MH
         Hjr2oHZyNAiuEUyEDppw1bB0H3jtiShpSeAeB26WS2XJD2m0t8OkMhL0ItDuZvy9SRR/
         5MGlG+i6pYmy0CDScTniyZx8rEx6CeqxqWf7/3i1KCLoyWkIlAdVXojN/kn++p9gQZXj
         JgwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eyPIt4F8ndXB4hSRHGu79qkxZO55xP+iLT/wD7jp2anoERDofQIurKsi7Vf90yypBEIOEzF1LZ5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcPDAXVzUmDTMGmwOBC73HPkXsYyjT7pGQA9pWzgFToSv/+VcS
	CYu5YzAqJtY+gNHbvO6XgbOLb7prRaXorXhxApv3PX6dT6RwD7OiR1XYENK7X0Gm4Zo=
X-Gm-Gg: AeBDies3LeXFHolhUs3SVnIkDdb/ijC1h14U66BqmTB7U6nCbRuzJC6VZ+5DanPuw7g
	BHfBAYTf0bZQQUOHTM5bseroCOzQnF9HW92HwYYIkEb6n3X+5IIe9plafTTVyy8Do35Rv7WMG7q
	zfYMN89TgLoW30FL0GGTPa5QnYWFwTbagCawqtXCNzjhxUlKw/ICdqI60DNGB+jJybhmou4E0pb
	Lt2wkjaK3NDKR4eqnCzeE1N5iwQCVlK8l6gSH2siThA/F+JaQM0c6wLDsBXDAbzupclp7Z4GLqJ
	8eLXY/1neTAh4QN0E6PbUuR6H7T5jBrkb2MGcVZxPMPgRRYftjkOhaO/H6F9w/9uiErX5mUHxTl
	FTtVlKpU+FYsaX7cdlEjeLLQYRKr/2gHquYMT95lSl+PmhRsCPB+dZQ/Us0TUW4ErFqlb2lklIb
	QxawkqOXjaOrUxWhqnZetRGd1++zK7PY0dv5m/GWB4oBunvC65+ohaOmajL6iRzT6HkslQyJU=
X-Received: by 2002:a05:6102:4a8b:b0:605:25a4:97fe with SMTP id ada2fe7eead31-6280adbe294mr3083087137.21.1777457424106;
        Wed, 29 Apr 2026 03:10:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6298433531bsm761791137.9.2026.04.29.03.10.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:10:23 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95697b46831so6667097241.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:10:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9YdB+kgyiv5HrcGnm1G+RA6cCP0cU9TkZpNr7w1U8Y5CJWlWk8TlHWfSMfeJE8YUgqbPdeisb0Uls=@vger.kernel.org
X-Received: by 2002:a05:6102:5808:b0:5fd:f2ad:c653 with SMTP id
 ada2fe7eead31-6280a4a8859mr3233756137.16.1777457422707; Wed, 29 Apr 2026
 03:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 12:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
X-Gm-Features: AVHnY4JG2nQR3icySEfGRtnnQzDT9zHNQTQkbpTpvtHZyLM3-S0niXuSWkJz0jc
Message-ID: <CAMuHMdUHKQwX43=c9JR67=x1EvWzdHTiXdUnPV2bDKU7PV_EnA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/rcar-du: Add support for Renesas R-Car R8A779MD M3Le
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support the Renesas R-Car R8A779MD M3Le SoC. This SoC is
> similar to R-Car R8A77965 M3-N SoC, except the HDMI port@1 is
> not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -564,6 +564,30 @@ static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
>         .dsi_clk_mask = BIT(0),
>  };
>
> +static const struct rcar_du_device_info rcar_du_r8a779md_info = {

Assuming for this review we do need a new compatible value...

> +       .gen = 3,
> +       .features = RCAR_DU_FEATURE_CRTC_IRQ
> +                 | RCAR_DU_FEATURE_CRTC_CLOCK
> +                 | RCAR_DU_FEATURE_VSP1_SOURCE
> +                 | RCAR_DU_FEATURE_INTERLACED
> +                 | RCAR_DU_FEATURE_TVM_SYNC,
> +       .channels_mask = BIT(1) | BIT(0),

 "BIT(3) | BIT(0)", given R-Car M3Le dropped DU1, not DU3?

> +       .routes = {
> +               /* R8A779MD has one RGB output and one LVDS output. */
> +               [RCAR_DU_OUTPUT_DPAD0] = {
> +                       .possible_crtcs = BIT(1),
> +                       .port = 0,
> +               },
> +               [RCAR_DU_OUTPUT_LVDS0] = {
> +                       .possible_crtcs = BIT(0),
> +                       .port = 2,
> +               },
> +       },
> +       .num_lvds = 1,
> +       .num_rpf = 5,
> +       .dpll_mask = BIT(1),
> +};
> +
>  static const struct of_device_id rcar_du_of_table[] = {
>         { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
>         { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },

I also don't know where "M3Le does not support 4K output." (which is
a VSP2 limitation) is to be handled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
