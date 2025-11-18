Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856434F252
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464902; cv=none; b=iGD3XnFfZOadYWWoPqr+hWCd0nxjuDLi1KtkSldOC3Sfcjbq+pSoQKjW1CIEjmkaE/57SObNr8DJuyhJzCC+pH5q0Nxa3awd6ZdQIi2QjN0g+8Txuup541k5hrLA/IF+cJim3q05DQ7LPWXT/ATn8IlBg3lf9106iXkv4bYG46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464902; c=relaxed/simple;
	bh=EuhxRA+knsyPVuJt7F4wqQw9y3Vk4rK+C1Og9Af4F84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZXjQh/2gvqa123szS/OxNlUGBJFbbHaDHF6qGwqLm04rTOXltMo/MbnPGev1ezj99inn+Ztt6z7Lavz3g64f5X8HdoaF64mX8VszdCH7MnSlOdcl2SFVH40nIJby43R5koAWx/xmj4il16B5C21ekWvfwf3UhJggbbCrE9pjHhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzJQNUOv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzJQNUOv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so3756949f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763464899; x=1764069699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
        b=fzJQNUOvtv8CHTbpiVWXmtPbyklUgz4em8fHHyqSiz7WAmqKujoNQw/5/YBw3697KQ
         kciYsGTzEjX++uwNmHD2YRmbu7PQwYIY4FanjrP79h25cNnfjU9dWqSVUJDFIgFOQgJC
         pAzOGT6P46nMrUuuTkWM9sKqsJnGC7oDW/dnaWcr5Udw0I3Cv6qSXLy34qZRBfjxg568
         maXwrLq3bxSvpM9sjgm/u08016Q2wOPyTsReB8kpZE8lKDgA1yhn1wcibLXzxxXGQuw2
         L6htTbciGjI4Ijox1YZccQn+1PnwOIAeigDQI8GT0I5Xnrqh5PUCKDb75AxY2Bm20SFS
         QPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464899; x=1764069699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
        b=kremOhOOwLfyPQxZb1N0ZKOr/Lq8M1TlR5u1Qb7ZPFyHZJvxsV5M8IqWnzSDOnI9ln
         3ai9k3m7F1WdzOiqmd3pB6wWZHZcmCpWwjFDJznQsEZH4Zh6xbJPg98bU0FfZhSf/20Y
         2pSe1N4x/WXWEDG1deo7poh3QgSqU7FAaLCIhjdRyUGKqPRm4M/Qfu0FA8ENPvHOVrp8
         ccU0GvHSJg1xUSGJnKPUd7LSK1qq0ivL7gPkRYllf3SI38Lq8HQl85fyFqeVS0xWeDXz
         8dka+1QtXQ+Y8si245Snh2Gh+rCwJ76eSGJLhQDmcLhgXJEOuxV+SRX0HMSDfWzRzdH4
         LVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7MAoDBj4F3Wd1tVRTArvNaiDTvTbGrYiikaDVPMqskJfIRCfUyB19k2PZDPt3hgiQi5jCyTzYbPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzBsLCf5Ttbh4aF/9FyTb06l6Cf0E6giendDzvu/t4PjZFNNK
	75clZNatyhITtt5Eqhh7gYQfzeulz3Pr4TNbEs1N+pxg178Zw3JdP2Q5D9T/R9XLH07CqmEh9/4
	rwG+/6G2mX+YZDbBoejo+jD5xjFSSaXk=
X-Gm-Gg: ASbGncuEPwwgbO+ARa42MDiWBXOeHCJcxb6SEO0GswGldk47EmxB0Hj+NeP+5ZkRN8Q
	A4qh327zEhYPGXyea3rJV2KR7ZbrvNc7i2P/NJDoHb9CYpLZR8S+nLatN3g50SdRgj0e/i/xxxx
	WvpcVPVmC3j4xrMRqdukVh2wY9oY32ZcA3k6V5kqOU6c/64dutAFKr6t4zWKlZloJV0BgO1IvOQ
	BTeK3O+bZrB8XWFJnk7MRU45kL6+vKeOffUA3rfmrdRibnR3kwtk+TK5zTbWGHufi20HBxXnxqf
	//jMXcF3vB54v7q8gvPL3DHpJwlK
X-Google-Smtp-Source: AGHT+IGANyPdqzYmfFEaFVGhyAXfuxeoDjl23RYIriV6FF/16VMTynZc4LvP1liBFBcOfFF1lFTyu84kN1+K1m6YB6o=
X-Received: by 2002:a05:6000:178f:b0:429:cc35:7032 with SMTP id
 ffacd0b85a97d-42ca8bd18c7mr2818838f8f.23.1763464898795; Tue, 18 Nov 2025
 03:21:38 -0800 (PST)
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
In-Reply-To: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Nov 2025 11:21:12 +0000
X-Gm-Features: AWmQ_bl1DwIS-3Ab86i8VXMJ8kC7jPBYyZty6PEvVtZX5ppN0ByYyuYIgaFMugg
Message-ID: <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Laurent/Tomi,

On Mon, Oct 27, 2025 at 11:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com=
> wrote:
> > > > > This patch series adds DU/DSI clocks and provides support for the
> > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > >
> > > > > v10->v11:
> > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > >   while iterating over the divider table
> > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > >
> > > > I think this series is ready for merging.
> > >
> > > \o/
> > >
> > > > > Lad Prabhakar (7):
> > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI an=
d LCDC
> > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) a=
nd
> > > > >     RZ/V2N
> > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > > >
> > > > As this touches both clk and drm, let's discuss the merge strategy.
> > > > My proposal:
> > > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > > >      to be used as a base for the remaining patches,
>
> Done:
>
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/clk-renesas-rzv2h-plldsi-tag
>
> for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:
>
>   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +0=
100)
>
> ----------------------------------------------------------------
> clk: renesas: rzv2h: Add support for DSI clocks
>
> RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> driver source files.
>
> ----------------------------------------------------------------
> Lad Prabhakar (3):
>       clk: renesas: rzv2h: Add instance field to struct pll
>       clk: renesas: rzv2h: Use GENMASK for PLL fields
>       clk: renesas: rzv2h: Add support for DSI clocks
>
>  drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
>  include/linux/clk/renesas.h     | 145 ++++++++++++
>  3 files changed, 672 insertions(+), 11 deletions(-)
>
> > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
>
> Done.
>
Can you please pick up the DSI patches.

Cheers,
Prabhakar
