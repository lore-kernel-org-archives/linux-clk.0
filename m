Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56553D565E
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777898800; cv=none; b=LfDcae/mZkQgPMm2a53IF/5bS7hb33tCu59eJwz1qGrIF3a1KdFoV/iG2Q9A2pFWYDmXqoaXWjt/6kLVsq2fFci3ABufvZzO2yng3Hubn1oOVsHQmv1wxLkiaG0BJ1GkdXGGKc2RmhTK7f8FuAMtmhbV19PbkLbAMQkDwWUwNAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777898800; c=relaxed/simple;
	bh=mf48U3dZmpqt3p7RmvGUUMOB0UHyUtn3OAbikvFAdqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfx2/DAWf8P938MPBUjUmm06fxo8Tchjs/yG25Y04O92WjEwCq7ihJ3nPD68BjPr+uFOjFIegvD7WB7AxxhMOMy+GXTHZG5X1zh0TeBlG751SBX1zO/z1Uittppce8I01cW8CthtJCYa9nAn5T9crsM6rbIkd9grX7/o9W05ET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6966f99716fso1975319eaf.0
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 05:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777898796; x=1778503596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znJkm+yheaBiOtiXBHrScjCf5aNJhz18eCP9uLN0zvY=;
        b=cN0yho8mqX54wUikEpmAH+vopeRtXHw952lYpc1tYfQkENCPZpmgLqGGHNhkL0N5t9
         vm14P0sqGODXppkv9/eTyLajMeg4Mlz3swEyDimMwZ0uJ/7XwRuFrpTS12VY1v25quBs
         GaZHXAtTfmehPskrX+Jy1F16z9wm9a6LQba9uEefTVBJLZI2wY6Hn3vS3+60YgExObA2
         CruRT/IUumPFZpcrAp3Sx2k1RagTJdYlvPZj/tNg5VTNgYwnyBo4Gsy3TNlxRudrKFH2
         h8QQkO64IpwnIXHUlb1uNO0EQMFd7C5n516Tk70tnwKlwSYpLuygTrv6rkjAy+v6q0P7
         oK0A==
X-Forwarded-Encrypted: i=1; AFNElJ8Bp31jp/d4YtafP/AciUnDGYvy+Yz2r9pyEB2kgZnEnAcvvAnJ8FrjaqMu34UeC/z4nNW9rKIJh9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1KfrcWtEqJyKL6jPl4FxIcmfJPWaOEZhZdgxS1XF/w3k7P3Zv
	pX5JklplmATjD6yGh7Kdas7h17XA6Z6/g72/0ePH09O4ylZUfo1bKH8IAO96QgKS
X-Gm-Gg: AeBDietWI+o+nnW0w/TwdtFWBT3lcmMu5lBJBkfdpWzjegG3amQ7PibXCCVBQsjJ3QP
	/zmnjKHh+raUGbZbcTI4Ogle0exyS/gFlxWhp+0uLAxi3KPTLXUBDynmWvqR44WM9hUOSj/iAYE
	uquszVKSER+h0ovxnpz+yqxQ4JVhKIi20DZ89YdZb12wLVC2ISQNdPdZ0YsbM6S4vRRTBNsDFAG
	RfPkGVmuJhVVkmiqXGluTJJ+4cZR5JP5QwlSCBetU10DNzT6e5fnb5SFA+rDhPxd6Yig+h+4BTT
	4JQTFUGodoiFeLFdwYpNleaAMyP7gXmjUWTtImbnDt9tMwQN0DNZuTN82S3QyJKK1CFIkJkK+g6
	aFbz0S23+FpnFDWmgY24X5iu2PwYjA8pt+lHzb3fOLuXjCDKyo7F3M+tr8hGL9NidShGntSzxSk
	L0up3z7PtBbgMMIMc6FFTgtUTz/NtYbhv7YpCgofnQUZneXzJGxwCHNt0wG/gsl9LmOyvthtyAa
	08jsiaXTw==
X-Received: by 2002:a05:6820:f022:b0:694:991f:62e5 with SMTP id 006d021491bc7-69697df95e7mr4172689eaf.58.1777898796026;
        Mon, 04 May 2026 05:46:36 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69689479359sm6515487eaf.7.2026.05.04.05.46.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 05:46:35 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-685017d0fbcso2170277eaf.3
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 05:46:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9VCDGTh7eg4tTqu1jVqbajLPB/VoGPJErjFzONWyOYqhfyNddtubfE0OC/IGAo8sXpt4j/zBXdDH0=@vger.kernel.org
X-Received: by 2002:a05:6122:130a:b0:56c:da22:6921 with SMTP id
 71dfb90a1353d-5750c5281a9mr3577419e0c.5.1777898480344; Mon, 04 May 2026
 05:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 14:41:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
X-Gm-Features: AVHnY4LvtR9sYYwFkbyXTFSDx7n1q3qDBs-g1S0RCiV3vvmXtOpqt-05ZZXwFh0
Message-ID: <CAMuHMdUqdEZaK4C2zNjZ3Rh0TaiLrROUeWK-R5WZU+ULpArBrQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/21] Add support for DU and DSI on the Renesas RZ/G3E SoC
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 8 Apr 2026 at 12:37, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
> interface found on the Renesas RZ/G3E SoC.
>
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
> of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
> and Display Unit (DU).
>
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks for your series!

> Tommaso Merciai (21):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

I have queued these in an immutable branch, targeted for renesas-clk
for v7.2, and for consumption by the DRM patch(es) that have a hard
dependency on the addition to include/linux/clk/renesas.h.

>   dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0 and DSI support

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzg3e-plldsi-tag

for you to fetch changes up to 272a6e2ad164094045af520299b5df3ce1763061:

  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
(2026-05-04 14:03:08 +0200)

----------------------------------------------------------------
clk: renesas: rzg3e: Add support for DSI clocks

RZ/G3E Clock Pulse Generator PLLDSI limits, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Tommaso Merciai (8):
      clk: renesas: rzv2h: Add PLLDSI clk mux support
      clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
      clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
      clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
      clk: renesas: r9a09g047: Add support for DSI clocks and resets
      clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets

 drivers/clk/renesas/r9a09g047-cpg.c |  84 +++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 181 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  12 +++
 include/linux/clk/renesas.h         |  20 ++++
 4 files changed, 297 insertions(+)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
