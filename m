Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E8273809
	for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564200; cv=none; b=HJMofJ9uafVJN+dk1QBoJkkuneed9dry+B+B1MJlhQ0puMkEB3k8qb1ADx4akxXdHkftx5knudBoFZl3fAquhMzfUqgYggivKC+0QIwPEQbk1BM4yMltx7V6wvuIXIxFINmUDG3LJw6FpX2g4znXbJe/UnTu3XZ7tDS76JdOrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564200; c=relaxed/simple;
	bh=LCFinbYaaa5T1vbOy/YjHc9/jV/eLUmsdTmf3uq5Qlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAR+UTpMCNHEj0Qj0Mzhc11n8aBAIM3G87yhsKON0c+Zz0ZXNxycKEPb4AI0nFJaw7XYKYTqMIFzq54Tn651GthygZ+VTHEUXq0iFqfCQhv0M+o64q8dNCGB3RKXVs+77JyWGTi6IsDtEBUioJtkjA/UKrGU/TgrRpPzzoVWE8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5d967b66fedso2695065137.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564197; x=1762168997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgNtIcnn6eENaUFz3K0ARDS/soEXQSArUyONWZnfjlQ=;
        b=XgW0glH4Hj/Pjv8J/4Tn2GY9a7arsgrSZrXAf/1Geq0tA4XQ8+c5lE0B6AelT8lN9A
         j5i/xrxFUnDmJP9GGoS/TA+HMY7rjSjVJdqck6uY704NhsKRDBjnvtqoigOabu7fuyhE
         uou6RP6TZWXjCdKWdqv7UFbDiyIiG8CNTVXIeRA7qd1XhrHXZ3Ag7iVzYMbc0LjxTLy3
         orjuh1VbgY7uB+OqeWFWJDgHMjVeiJRwlAhvNrkn0G7KMDRzEQqm8DmciopKoZG5OpiG
         Rp1MqiaziRv01P27/B1cjSv8Z+WRrrGAczCPQX1sxvyuhzTaNV+Xdnf57aXc4jaeOGaZ
         9zFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3xPDyxLdsJ6WOsxyujLbisjBo4yTab66bf91fujqJZY8vWfs+3/ZWiUfcQWp6vB9hzAiLApx/Mes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7Jx1a1V7PA4tz2nHKvipEUJGNId1aXFtBLxYvO5AeoKAjkaO
	mWWcVYCI4pnxXRj+CVuhNCRVYMxchOPbC1LqOHV+UUgYUNRWGJMrt32ARLB8Bue/
X-Gm-Gg: ASbGncuh6V0yO9UHfCcnEMF/RFfJeE7PMX6WTL6ga34KK5EXqS9e+RglIBQJmK1c5Gv
	E68VcXp8yTuyHG16XpGgYhygqAwNpgH74InSD42natnOoXHIPXCJ9ls1o6Cew6+vkAQBQV9K0YC
	TgX56lvh404xu5A6yPyti3+PGcxfKQD6cR/g0yDYpMcpqx/yS3LBUS6G3Xw9lSgTK2O2ZksGv0C
	M2IpQiGyyBgh1M+RLi17m+7BRkQlwCngN8FhN/bz/kkqGCVtTzKXI82/3sXTr+Fe4/vHmZXq46G
	zPOOK41hug51hLPIGPn+iVF5KGOKnnbcqzV/uwmGbdovurxJ/6vxoaXRFcDlS181DbDJS3KrWfD
	E3z1qV274x6XgjoQIXOzp0FiXeHymnncEVBcHwNioTuef0qVIwh1AA2sydREDnueyfPK63CZsQE
	auAwV7WcCeF4b5Y6wFZPx0ZmpNwmAt7H88W0RAMg==
X-Google-Smtp-Source: AGHT+IF+rKq1MyBJ4ie2pzpJwfIHXCp7gt8aMfWFxt8z2nBZtlwUJ7wnR885rx3Hj1nM4V9pPFM6Fw==
X-Received: by 2002:a05:6102:5126:b0:5d5:dbbb:5b86 with SMTP id ada2fe7eead31-5db2e550528mr4424472137.25.1761564195297;
        Mon, 27 Oct 2025 04:23:15 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db4e56f7e5sm2593871137.9.2025.10.27.04.23.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:23:14 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5d967b66fedso2695025137.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Oct 2025 04:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDjg9KpPfkykxFCZ0j9chib9kqoH9Y8K0d3rVRxBEbCp6tj3Kt7Y50GccKfTA7TrrwElDK79P8+8s=@vger.kernel.org
X-Received: by 2002:a05:6102:2921:b0:59d:458d:b629 with SMTP id
 ada2fe7eead31-5db2e58fe50mr3946640137.30.1761564193435; Mon, 27 Oct 2025
 04:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com> <20251021184502.GD19043@pendragon.ideasonboard.com>
In-Reply-To: <20251021184502.GD19043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Oct 2025 12:23:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
X-Gm-Features: AWmQ_blPQXHDdcv3HEZmR70Xe3WDxqjStucPirJolGtaGc9WMslN79O8Z1NYVMM
Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > This patch series adds DU/DSI clocks and provides support for the
> > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > >
> > > > v10->v11:
> > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > >   while iterating over the divider table
> > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > >
> > > I think this series is ready for merging.
> >
> > \o/
> >
> > > > Lad Prabhakar (7):
> > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and =
LCDC
> > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > > >     RZ/V2N
> > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > >
> > > As this touches both clk and drm, let's discuss the merge strategy.
> > > My proposal:
> > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > >      to be used as a base for the remaining patches,

Done:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzv2h-plldsi-tag

for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:

  clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +010=
0)

----------------------------------------------------------------
clk: renesas: rzv2h: Add support for DSI clocks

RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Lad Prabhakar (3):
      clk: renesas: rzv2h: Add instance field to struct pll
      clk: renesas: rzv2h: Use GENMASK for PLL fields
      clk: renesas: rzv2h: Add support for DSI clocks

 drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++++=
+++-
 drivers/clk/renesas/rzv2h-cpg.h |  26 +-
 include/linux/clk/renesas.h     | 145 ++++++++++++
 3 files changed, 672 insertions(+), 11 deletions(-)

> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,

Done.

> > >   3. The DRM people queue patches 5-7 on top of 1.
> > >
> > > Does that sound fine for you?
> > Sounds good to me.
> >
> > Biju/Tomi, are you OK with the above?
>
> The plan seems good to me. Note that you won't be able to push this
> yourself to drm-misc as committers are limited to pushing linear
> branches. We need an ack from the drm-misc maintainers, and one of them
> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
