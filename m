Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCF02FB0A4
	for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208012; cv=none; b=VBRPhhKGfo4ADDgzacyav2cmstzbvTodnyZ+e7iqVtXHyj63p6YkmWRypIxj/3xJd5EaAoKa65qYxeLOUNNZrXQp3TcQx8WLynZFN8AD8sfONzClVlOvT6Yrv1KJ+AWupV4ZyYT2afPMDyITDjCx/Uif78Fr6dfrV/xgTzB61TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208012; c=relaxed/simple;
	bh=riOWBoniluYmZkJSNiPD51TALJtz2J5b6wiQtNSND7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UL4X4JwPcF2eqxoAYOuUoft2b8UTQq0Obc7X/wI1M3ei/F//dtxtj3VcYLf1cx2l7gfHf+tdRfHrgE8A2YBFX3xpavqKRWxj423Dh2/WDCwBnZ0RApWaz+Voj9sYlVTro8s+eonAji5XoOxPozkA4cosMLpemOJQHJ+iVVmAfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a2754a7f6aso681192b3a.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 01:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208010; x=1761812810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECYIxuT82Q/NafhPkuUWEytQEjZXJcXQfJX7HoJHHBY=;
        b=arH6k1stypPIluLJBSowJ43+a52ytbM92XX6GDodFsSsgIVANcXg5shshq9ykZQ7gV
         +CkIWbGLiRpVuXrywDH19rldES3wUI4DEMr5snf78mn0m6eU9KnjaElZpKg2rMNY276X
         vADnGRwrRptSA5hb/NQpydrcEODKtigIDNf7sPyKFSyC4dMoiL4tINMb72xccKgUTkGG
         txrdkqPAdcSTzwAyZ31ejYjBKpfk1sAkhseigmR0FnhWiTvWGVQmAgU4rKsSbIQkX91Z
         kEnaOZuVMHKG5TNAjgQXYNiupzSJQWfub33o2QP8IedOeY+6minMk67kLGyBA1jPHYJo
         9bxA==
X-Forwarded-Encrypted: i=1; AJvYcCWfmWqbdl1VU6WtL0LAWOmwSMirwx607dWdU/JOotx1EyfC0o/APzU28+YouhiG7gwkf/2gLcoRfkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVRblhag5p4M2u50uon6JyUTwwRy8pdZNCOT2Pc9XPz0juSmr
	ZlqwJHSlRBhGROJm6dW6UU1LBIcsnzLrkPQd9vTh3RZqMNXJnYchrTmr3DCfJUFe
X-Gm-Gg: ASbGnctamb9nHq9CiWzdd7wSqV7mo47aDoFKoSQxhuYOsmysDoy9gB80y5E6quEvVUw
	9oW+dccWor50X1YF/rZ3EKsDevSHIS2PNfVRPQO+f/BQlvFEl7Hm6y9e737yLo3OUssBkUBtDCq
	DhvhIrWu/2HRdJ6+TFQOcHtG0FSz07Xq+BvrZioxDxI2Tp8GaLnILZjeDnFTRkzWJ/WHYjFMSdW
	BvTZ4YTjQukhwdEaleqiDPGCaUOaRFQHABcQnheQglHFgLM/38Btrld+oPrh8eQBJO7Aiwzleim
	4fRGqi+xiYU3rKlNK5eJNrTzPtxCUlBn38o2kljZW8G9zqLLBgve0h8DBxnMUXVCY1d8huDfApV
	PKtsHhDuAkorSDGqXRKZyErGdUVZy3h5rpUV6UbtXdxmQFEZCMxMPF/sgg9jwCcSScZCly6faeq
	aooJH1FdhSDXNAVTPOkPfO/xmJf6lurnD8/EFv2zcVWyhY0wEB
X-Google-Smtp-Source: AGHT+IFz0uZCX3+vYv06SonH010S537ZSNMfEX8IY+r6Bi27fHwMQfwylJxVFyI7zjuajqAZP7TQVA==
X-Received: by 2002:a05:6a20:3ca5:b0:2ca:83e6:938b with SMTP id adf61e73a8af0-334a86383c7mr35530530637.45.1761208009655;
        Thu, 23 Oct 2025 01:26:49 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e349b8sm1369977a12.35.2025.10.23.01.26.49
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:26:49 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33f9aec69b6so766873a91.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 01:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeGfYq9R0ehpDrkMI1PDu7s4/9NvRditza6QKe6Y49PYCRHPdBZR4BUI6becfxMJOnXwZkFFU0/B0=@vger.kernel.org
X-Received: by 2002:a05:6102:5110:b0:5db:27e9:933e with SMTP id
 ada2fe7eead31-5db27e9988cmr1196188137.38.1761207652096; Thu, 23 Oct 2025
 01:20:52 -0700 (PDT)
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
Date: Thu, 23 Oct 2025 10:20:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
X-Gm-Features: AS18NWACo5Ab6gaObSrlb5u0ift86EnuHySc5nm6Ey8p5bDoFaPy9DC0cq8vSBg
Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
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

Hi Laurent,

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
> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
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

Do you mean new commits must be in a single branch, or drm-misc
itself must be linear? In case of the former, 5-7 can be applied on top of
my immutable branch, without involving a merge?

> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

Note that another change to include/linux/clk/renesas.h,
and thus a dependency of drm on clk, is coming in
"[PATCH v3 0/2] Remove hard coded values for MIPI-DSI"
https://lore.kernel.org/20251022235903.1091453-1-chris.brandt@renesas.com

Would it be worthwhile to wait on/speed up review of the latter?
Thanks!

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
