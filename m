Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2534F46C
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763466651; cv=none; b=KCpTAR25jxbQGnsE0epdB612r89+IsquphZUtNxHEBWlyRD5DyuTwIIl7nLTGcblyTn0wFudFQ2yNt/VDcu8aZ50cPhgl8BiEBJqXWgN829mpm1rHZZFs+cpnXG/sBorm/kGU+CoeHGiiZNlPzqtk4ugEV7l9ODSvEoOElpXKQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763466651; c=relaxed/simple;
	bh=YRvnJRQgguturEitgT2Mfhc/Mr4HW2ItzObR9HfQKyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZNf3veoZcNdtvIMw8bkErsiwyRdQckSsCXGlDSL+PVGYQYfbJ52vOKQyh1qJLNi9Y0ibjxIm8f/Xuqt7nqot3lIynH4Nc5N0d5Ql12d1uKqFsoPckcl1GNm9IXjSbrPCdgUHZ5qzBILzrpoXXsrdBQQaNt1kYGK0vKS+G7NXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2ePFjcG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2ePFjcG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3720e58eso4988825f8f.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763466646; x=1764071446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dvlVzeTZOL3SeM1Ld6pZdy3YbDlbCykL8GrXDIYLsA=;
        b=Z2ePFjcGTnm45oXvU/lJLpFp/CBY9QOQzA65F/XLBl2iziZweCkPes8sbHQwL3OPAn
         9dl5994AH8mV7Bv8y+JXrM7q6nUkiayX8kPEcIXCKV5yclALYtqKf9rnHOq846HBmQil
         tpkb3PQ1zbir5z6W4U/1C/q1WE9SD0HUInHeMbbM0ewp+ZqPKhRsSBpzaMnVZxEazVUQ
         WrtyUPquhC3WuSOHf/v8SU2HxX24IqGY+raw3oP8Irq6i6MemDcRdpln+opBtHXyXVI0
         hooZm3MkVvsm17/ukdimVS6kB6OhzaHoonhvjjuOB6MFDCx9N9Ztzlfuh36jxm/XpqM6
         4mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763466646; x=1764071446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3dvlVzeTZOL3SeM1Ld6pZdy3YbDlbCykL8GrXDIYLsA=;
        b=TOI3VQS55sH8Qjv4MQZUIhz3CyBa996dzzdhBKcYtDZrqUgIPuIhrJVuZXVoxj6CVI
         A7HsNq0mSHWivyz5wh5sCjJU9HLqN8nUaW2auLHM/5uK9HNh/vy1A1v5XQdeOnjSU6uH
         vNOy0H19QCDBYeO+xoSQAn36tLLF8+UBuEkRUjZXVoh/3F7LxmECcswLcHlPszyZNa/G
         jrYb5H2h5xkmO41N7wAdsEOn+S1usEI5j0TL+IkOKWHoiTDjOqQl7ZeYOjvC+PdnjArN
         5m/oIAolhPwF0a0arqLZo5u7BUk/4VCYfZJ5OEGcXD6tjss7h/jWmiymZcaAuPRLDfLa
         jgBw==
X-Forwarded-Encrypted: i=1; AJvYcCVH5I6qGwqf9jqNU+P+JoOMxf++hgyimgmY64sSvXg54GWdGPIXJqSvCotyFXu5mHXi7psw8uoMerk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1It7AzrVVKgKtIqNZ+IJNgJA+75JjES7KAKXJ/+O16Xn3XWn+
	jUoDjKdciB6QuW0LNyyNQcfmzEJdeXoYqq4BMI0Z5WniE4bM0iO5f0bmP1dWybZnNXsQLZ6ZKTJ
	6jg+oX4FGYgyK/Uz3frkTlV5qHseHrs0=
X-Gm-Gg: ASbGncvS0n9w5cgw2tKMcT+y6MohFfJ0tu8AJNg3ltrzaoU8PXledwjNUGlEnLmvGpo
	k75wHmfXU779eN7sW93VbJbyqVEpG98LGLYToZNSdWVgdYZIlc4WhMDmzj1nxP1G6Mq5qGrgePd
	ysgi1lEzKYCUOs5X9ZSjxck/jdfn9KZKbbzs5Ms9ONSco9gTvAi7tPL4IgbJyegqFB1GMMs29Dq
	ry0xRreGm8o0RxcO53PMTFht1gTUK8fUUUbmbLjW37NCgWza8K2GY3kXhAun0fCa/u93UBWQ3Gg
	jHYWB6/njDj5f6A7JnvSMfMYBulr
X-Google-Smtp-Source: AGHT+IEBEKeO2bU9AocfEk+Htq/TSXCk60FbpZ0ZYLaYz3dvQxmRCANeaq3rrPQuzWW4G28xtGF7ejVCsUjv5/CqkFA=
X-Received: by 2002:a05:6000:2405:b0:428:4004:8241 with SMTP id
 ffacd0b85a97d-42b59382195mr15731333f8f.40.1763466646273; Tue, 18 Nov 2025
 03:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com> <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
 <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com> <20251118113434.GA22495@pendragon.ideasonboard.com>
In-Reply-To: <20251118113434.GA22495@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Nov 2025 11:50:20 +0000
X-Gm-Features: AWmQ_bmJ-5wRZxj7MbmQMhRNDbiK7VXawO483M5C_HjqRzY3YZWOZRnXXVy1Z6s
Message-ID: <CA+V-a8uz2Y2qNtHvGSzkoj2bJPQkuUKSxffqx9=Rwr88LZXM6g@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
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

Hi Laurent,

On Tue, Nov 18, 2025 at 11:34=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 18, 2025 at 11:21:12AM +0000, Lad, Prabhakar wrote:
> > On Mon, Oct 27, 2025 at 11:23=E2=80=AFAM Geert Uytterhoeven wrote:
> > > On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart wrote:
> > > > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > > > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote=
:
> > > > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > > > > > > This patch series adds DU/DSI clocks and provides support for=
 the
> > > > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > > > >
> > > > > > > v10->v11:
> > > > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patc=
h
> > > > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > > > >   while iterating over the divider table
> > > > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > > > >
> > > > > > I think this series is ready for merging.
> > > > >
> > > > > \o/
> > > > >
> > > > > > > Lad Prabhakar (7):
> > > > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DS=
I and LCDC
> > > > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(=
P) and
> > > > > > >     RZ/V2N
> > > > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) So=
C
> > > > > >
> > > > > > As this touches both clk and drm, let's discuss the merge strat=
egy.
> > > > > > My proposal:
> > > > > >   1. I queue patches 1-3 in an immutable branch with a signed t=
ag,
> > > > > >      to be used as a base for the remaining patches,
> > >
> > > Done:
> > >
> > > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1d=
f56787:
> > >
> > >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers=
.git
> > > tags/clk-renesas-rzv2h-plldsi-tag
> > >
> > > for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd=
94:
> > >
> > >   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:0=
3 +0100)
> > >
> > > ----------------------------------------------------------------
> > > clk: renesas: rzv2h: Add support for DSI clocks
> > >
> > > RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> > > driver source files.
> > >
> > > ----------------------------------------------------------------
> > > Lad Prabhakar (3):
> > >       clk: renesas: rzv2h: Add instance field to struct pll
> > >       clk: renesas: rzv2h: Use GENMASK for PLL fields
> > >       clk: renesas: rzv2h: Add support for DSI clocks
> > >
> > >  drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++=
+++++++++-
> > >  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
> > >  include/linux/clk/renesas.h     | 145 ++++++++++++
> > >  3 files changed, 672 insertions(+), 11 deletions(-)
> > >
> > > > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> > >
> > > Done.
> >
> > Can you please pick up the DSI patches.
>
> We can't, this has to be done by a drm-misc maintainer as it involves
> merging a non-fast forward branch instead of pushing commit directly on
> top of drm-misc-next.
>
I see, thank you. Talking to Geert we are closed for v6.19 as the
SoC+board changes have not made into v6.19. Probably we can wait for
the next cycle and Biju should be able to pick them up.

Cheers,
Prabhakar
