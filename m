Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C303298CB7
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042384; cv=none; b=cI0Qfn5Zr/Xs+F1Iwob6gQKunP1qXn8dgMVLhYB+ZnPt4KU3fRhx8lj7VS0iZqd0fij4U/DJZ3H77IUarVFjQ3q20ZrjhO9rjbMGbrpY3gEI5QC5MZlIBZHFCJztp7+7oTexRUS5J3b9QQCuPddsqQW9gk9/bXT/7Hm9IxH16K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042384; c=relaxed/simple;
	bh=va4WxH64kPG8XCl6w3KCXlFAiPzGBJtiTtCajxRETjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxDSk0sAaBeyrq1cmyBTNTHka/44agcZXhOtSmwyLUpa0TJ3QuUC1HEufVxzfwnjqopWlERIFUVCQveKlb3mleKw3jo2YQC0NrhI5gvlP9EM8YAskC3+ok1R3vYVXYzsID/2ID/HpBET13K81kV4JLqYKBcb4amF7byiBvNezpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bc6356624so5450142e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 03:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761042381; x=1761647181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDNH9pDF9LBAisWYpnrCUtwA+9hrIVu2UeAytlJC/r0=;
        b=bvlWMGS+QCoifrPg3oNEX7emjV9wHuc3fs2Rdnl4g+cEwSbUohmcfKlSH63ptd+I7n
         dQ5JC9gsS0rukW63t2MSUmZeUxi2yHraMYeadhcaJxCrL6TVzkAYEtQZRZtesdp30A7M
         0NPxy8PsGhVjah0XUQxquboF7QM6CDZCkJA2yWamDJwaZaNntcHqAXbgU7c5VgeZ6VPE
         yU1UlpBE+8QRxafCq/aVj6KifJU15kbdxIEc0VtirlwWjl5vaIur9Lfqb2/Cl/oo9mTW
         BTduotJxLsX+hMZE/v29y5cTZIj/ed7cgc5EizHCAc1+zze2n3dxzukQVqIhqXS5vJ/w
         3kBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2G+NSDvq+kJ18D6o4JRrLZyuJvWzq83O24Eh8rPaBYZZ5TuRds4uotjJijEy650QcxyANlJexQxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XRGcwvTHcTTkiU8oDWrlSbzt+cAfWCdrImUsAPMwztl2KdA8
	KSovyazo93XKTNDIBi2lJk0XGtzl5Z/65tGASk4zT+KB0ueV494+wmxDrk2zXxg/
X-Gm-Gg: ASbGncuDRm6czAEFatu47mQLdkz7guIDwxIJuv83KqcK+/1cdEq880PMxa+l5YDg+gL
	iuQvTTgp2KaNszKOdNMgmlLXT9wCL2XVZEPaVoI/okIXDTgNXOem1257HH4SuqO1GAC21x5jeq3
	cb7Ek3BTJE4kM3PM0f/VGU33OJ0xHbd3u6nRBIuroj0SwV9K+f1PkgINahtVJZq/L93NTOSOkeZ
	TYQKy/KMJtchi6M3k8feoOGybVzYG0EJ0MAgvz3rlwT9bdDi+ebYLUsKRFiyMSijVm+uL7kgQ1G
	e+mm/P69gWefaZT9m+xfkY9L+NKJ7ocRvEg/cCQ0HTxy89gcvUrB1n5GWpv9sFBaJn1041dwxtq
	rkg1SOoSyoXFXbIXP7H3RvJIxuUUkCuSAbQRZ7dBFKaNct6EAKvloyCtknarmOJKtfKSjhKMaAK
	9StstF9iDvINcL5q4ai/WuoKQnnfBEYtyV4XYWSQ==
X-Google-Smtp-Source: AGHT+IHDOn0w3dyLq/cfblXIf/ecL61l1CkFZQeDfK3iACSABx8pe62vZUA1sJ3S9qFGzC6H0SFlOw==
X-Received: by 2002:a05:6123:db:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-556401f5b3cmr4675189e0c.3.1761042380889;
        Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55661f9e8bdsm3215356e0c.10.2025.10.21.03.26.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5d5fbfca7e2so4549603137.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 03:26:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnBTivGQ/ZWisR1wpdSbRtQNBz7YVWzk+PBySc39W4837catM044Y/6D1x2bX/3sdixhUZYTKwxbo=@vger.kernel.org
X-Received: by 2002:a05:6102:e08:b0:529:7c2f:ceb5 with SMTP id
 ada2fe7eead31-5d7dd5035afmr5261434137.1.1761042379969; Tue, 21 Oct 2025
 03:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 12:26:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
X-Gm-Features: AS18NWA5TDVRnTdlKeYEusciZZnf69CtVCQ6CEB6928Ztx_Tex5oqUI1hZkbQkE
Message-ID: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar et al,

On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> This patch series adds DU/DSI clocks and provides support for the
> MIPI DSI interface on the RZ/V2H(P) SoC.
>
> v10->v11:
> - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> - Updated rzv2h_cpg_plldsi_div_determine_rate()
>   while iterating over the divider table
> - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> - Added Reviewed-by tag from Geert for patch 2/7 and 3/7

I think this series is ready for merging.

> Lad Prabhakar (7):
>   clk: renesas: rzv2h-cpg: Add instance field to struct pll
>   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
>   clk: renesas: rzv2h-cpg: Add support for DSI clocks
>   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
>   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
>     RZ/V2N
>   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC

As this touches both clk and drm, let's discuss the merge strategy.
My proposal:
  1. I queue patches 1-3 in an immutable branch with a signed tag,
     to be used as a base for the remaining patches,
  2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
  3. The DRM people queue patches 5-7 on top of 1.

Does that sound fine for you?
Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
