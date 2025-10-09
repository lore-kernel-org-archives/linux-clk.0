Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8976B2D77FF
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015019; cv=none; b=QXWdqYzJdAR+O8WX1kT0um3Ie6JAiQUiaSaJMIYMg/d53Y4USr1AcbcydZy88C5ZzuW6lyD+BAKFKEUPCzL5YbO/AsKFgCG3+a32fYXA9rVmMMHRa60sw/4Zizr4GoblISGKwgMDbCe072QerEHlbB6Ao2Xb27TG+G+9M3B9KIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015019; c=relaxed/simple;
	bh=4bGkbKr/BNDRtyM3ktButr5lP4Fuyu+QNRcAebYeltA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAPyPmhO5fWY2jnBQL+dw9QLB+mNmu9rCjM3Z9kCKe+gYz03WmGlSKQpH4IcSORG910uo6RL/oPxPnHbR5whplt83/5PyDgTDaFZcPLTnH9asAUb/T/0cvbmIwhK06AKWIWZbfTO9/HxYkM7A4YnMvtjFK10+HECsU1HIj9XG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXQYosKY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXQYosKY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso757434f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 06:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015015; x=1760619815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zla+EsFG4nzRnArXGImEQSCTyHGK3J4mv7lfg4FYjWQ=;
        b=SXQYosKYU7Rih933lGVfSxkmWUdJhkFRZUGjdT9lLxhgsR7f96KI6JMXx0/vOaYWEi
         xU7lS+DINxfSgmKirH7hrymeofS1pBKWvGaTCLlfzc41SJ3JZjJKT2E1bZ6iTGgZBfTi
         4S/cDY8QN/dzJvCKbcz7Gy0a1Kp3+Cz7K+QVE33lqBIqfYYp6zd3459vcKQzovfKdu4w
         mugYaXZdcCRIW+hncb5NOvIGRQKc3H4FNb1ApTTrnRyh0hLLgQML6y1Id7+jknWKgAPy
         77O1hX99LUU6xi6cygYZH/GNeXYigF7lug/T1KgvWGx9XUVbRiZGheBRwN/h4o2ViEij
         ZxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015015; x=1760619815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zla+EsFG4nzRnArXGImEQSCTyHGK3J4mv7lfg4FYjWQ=;
        b=wigP9BaDnPANKOFvoDIV5g4dpas4VOxaYxSr3Q+OsJuZw6ZWKW14ThGgEdH1rEHMco
         HCnrR1ea7fmihi6j5iC1j64NlyxA/gHR1M+H29BkBvvL+vV6NeQMvEfz7JQP5kPz+Fnd
         54427ykpe8pwOsjx98ZJK82AyOlEXDSzFi+lmGCWpaJgZ1OwGdTuaHivLkaBjXCXOBP8
         RffsANNo7ugoxl1BODpiHDYXiKNbnXylPv5TyATn8s7NQ/s1E/S9otJ1RN4C5KD9bIcR
         Unru9oJxnJoEy6RP11giI7pmXCQpIxvTx9sq2FEACRaIdRdGbts5nJWW71iJ96296Cza
         RjIg==
X-Forwarded-Encrypted: i=1; AJvYcCUpSy5JVzQw8X2n8OPPxXSy2N0/pl73QVRlkOE6Nuszuyf79oG4/J5CMOZjJO339Wwd+CYaQ+E4enk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyspr3ozUbkx3GHmiv512JivugDDOHRlg0e85Ai8z7SxsFpi1tS
	ZOyp/EyBX8MNT+xYe53dk5WPKPdgKwAg8prSQyBGhJ0hf2VAOafmv/m97O7uEYQ0L6iALKMfsmf
	TzUz5KdKN32IFLdI6/ErdBVLJQPULNQA=
X-Gm-Gg: ASbGncse/2PPPU72J/9OmbeiEzJZxJyXVty2gt3I88VuYzEMuMvivUJ+LENQJha/RHz
	48Dc94H96Bha1ZG6Men1N8TBYwP7Z4h++2JlAJ1AyLEmDn3ZU+8XXdIYbUhBMaEmx+n9hbsTsZx
	R5IE+MU8ABzUYPGVUA1o0WIzxD+eh4Oo5UwmDEoYsSmHvaCWkrLDcG1pztl0ETnJ2ZQhFSAb31t
	aTHmHW52Ro7ITHtkb2HZcUecxy57HgHiagxpuQ1lZZOv8+N0oS4BZjKRUvLDPv6iy1Z+8YHO+Y=
X-Google-Smtp-Source: AGHT+IG/ELPHmCCIZvciJbhA0k36idMhkGgCEPRr06+VPS042eX0V2JX9JR4zJTZ7TPW7Buub8nsqgeW9JGjesjwXe0=
X-Received: by 2002:a05:6000:2681:b0:413:473f:5515 with SMTP id
 ffacd0b85a97d-4266e8dd718mr4549664f8f.48.1760015014251; Thu, 09 Oct 2025
 06:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUugFOOvHqjRyoPErh6rqpVuAS_Yr6mGqerKT0VQ-Y6KQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Oct 2025 14:03:06 +0100
X-Gm-Features: AS18NWB5J7UqnUnaUM9kOBg5egFn9pDXfiyyxgzQNRfPJ7AfsT8nEGf8oxH6wq0
Message-ID: <CA+V-a8t7AQH5LpJaMgq9FUnA6qiUH=d5ngp0qr523BUWu88d+A@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Oct 6, 2025 at 1:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add MIPI DSI support for the Renesas RZ/V2H(P) SoC. Compared to the
> > RZ/G2L family, the RZ/V2H(P) requires dedicated D-PHY PLL programming,
> > different clock configuration, and additional timing parameter handling=
.
> > The driver introduces lookup tables and helpers for D-PHY timings
> > (TCLK*, THS*, TLPX, and ULPS exit) as specified in the RZ/V2H(P) hardwa=
re
> > manual. ULPS exit timing depends on the LPCLK rate and is now handled
> > explicitly.
> >
> > The implementation also adds support for 16 bpp RGB format, updates the
> > clock setup path to use the RZ/V2H PLL divider limits, and provides new
> > .dphy_init, .dphy_conf_clks, and .dphy_startup_late_init callbacks to
> > match the RZ/V2H sequence.
> >
> > With these changes, the RZ/V2H(P) can operate the MIPI DSI interface in
> > compliance with its hardware specification while retaining support for
> > existing RZ/G2L platforms.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> > v8->v9:
> > - Updated Kconfig to select CLK_RZV2H
> > - Updated to use renesas.h
> > - Added reviewed-by tag from Tomi
>
> Thanks for the update!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > @@ -19,6 +19,7 @@ config DRM_RZG2L_USE_MIPI_DSI
> >         depends on DRM_BRIDGE && OF
> >         depends on DRM_RZG2L_DU || COMPILE_TEST
> >         default DRM_RZG2L_DU
> > +       select CLK_RZV2H
>
> As the kernel test robot has already told you, this is not a good idea.
> RZ/V2H support is optional, just rely on (dummy) rzv2h_get_pll_*()
> helpers returning false if CLK_RZV2H is not enabled.
>
Agreed, I will add static inline helpers in renesas.h if !CLK_RZV2H.

Cheers,
Prabhakar

> >         help
> >           Enable support for the RZ/G2L Display Unit embedded MIPI DSI =
encoders.
> >
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>
