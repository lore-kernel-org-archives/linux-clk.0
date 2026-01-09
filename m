Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F0F23EAA5
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983961; cv=none; b=TC8c3sik45FGpDVbQNS/T7iPf/AxSEV5rVKfixV8+iaNVE8S16jc3MaKQp2WCrdRzyhRrwRSw+7ffOMsksVYDmMszDmM6mle/edt0I9cGQEslzSyVASOd4bXbr4NtksPl7gm79Tui7uXSl7o84GKdarecgdslBcZQ9eHIgNggwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983961; c=relaxed/simple;
	bh=Kd7pnWcr1R/4wNYYYEHmfzxHiMMS+c6SRBDRjLB+8IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C15fLv5a8jogkmfTc8nFonVMOhM+7VFoXJt8hgwWwdoLrpPxE2wduZJX2aWya7iWEn0VdctTKiFHZHsiS0WhV67xZHW9IFG/Rz4si1eXDBTOgaGdSQB2OQxV2L5OmGiCBEaaSey/rbrcGeyYXd0FNRC/BdEykz5QZhg0ePXRLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5636dce976eso323516e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767983959; x=1768588759;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmILYhqvOyXlRgf5EHBu2pb/ojQMIlgBjR7Z/UbB1kA=;
        b=YunNaDJLoEDSa5bSsSK8GTiJ68j9O+BPZ/oEc71zxPjO8NNX5htaxRV6J+N1eFA3Da
         tYFBy/bQr1bV6ORyyfcIiV7GcmCu2cE0ZOIXzxJYOl1wy6+ZDx/UFApVvzUMKFaBz4kQ
         OSgjOFikGhyTsxohDqTlwOfTRlESEWTRvnEd811ExnO0Kq8XDR3YZCAg16Zzi80GnsJ1
         U2+eS2XXEv1WrT1r/iP4xoPsG385NZDtGv2LvBoumClLU+FUBp9BLcbnI3Nwn3Su5c8V
         6n3jNAazXiqUZlezAkFYHEvAcXmUHFQlQMG5bZLSu8UedamVI3P5x9tY3+NIdVyJtkcK
         vAkA==
X-Forwarded-Encrypted: i=1; AJvYcCX95JqTa12Rq/nEkVwzOkqKkWGNel16aM3KvIZ1MI2TvxF7WdQiu3CwXGhiqKn3q4s1Dk7u7yBnK7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdzOL9oOOHkelkLTYkvr1TvkwXAJx02yvK+qj1LK13zRXyVES
	FyKzOvjLerpjG4oll9fntKsiizPsBwJJgg1FtgQaXfO569OsjMcuKgNxtjEr4nQU
X-Gm-Gg: AY/fxX5gBpjOMj7oaVwkF5d8eUx/i+4Q/ki4XubRXOXP+1pLMFrm0hddA6OwWcBMFFl
	sNXgfgcnXWWjRGlx7HT+5xBRPWJq2HcXUcx3UKtn4pe5tjSZAgRRi8fBHoNEBgntGTBmVwTdku9
	qIY6oqSzgD7/aRm1upsFb/ercwCj8OdbtjPc2C7wmWrZd0gbnqvFtJ2seJaNE3QzMZy2G761Bma
	0oFS59mVEuDtUCsw5ZodCQ0nrkHwhd37HAR1FiTfMDMI5C2/2fe3XIEV9L8XhgfeSIRWd7uXDU0
	S5AzdM2utDLhPAmAnRBA85EViq+jY+N5Qdvw9mBQu7JQhmZtHi19R0WZvgyEELJHJLshF6ZeMJE
	mBxoVxQg13xl5QV3wdcbRitT15qj977xIrlUC+oBzbqp79WSTSYxULOLKLFzyvfT/dz9o3t44NC
	p0+XNEBS6esBx+jAu9ZtSoPtri7/5c7wR92YfSdQoV2N7EK2Vn
X-Google-Smtp-Source: AGHT+IE+0h9HGON9jqcIMPF9OhxM+m0FGWVpfhuLByvlW33+t6VQWlFuUTVw1UZYXnhovq6wVMK1Uw==
X-Received: by 2002:a05:6122:220c:b0:54a:a3b1:db63 with SMTP id 71dfb90a1353d-5634637dcfbmr4105720e0c.6.1767983959421;
        Fri, 09 Jan 2026 10:39:19 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a20a183sm9859275e0c.9.2026.01.09.10.39.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:39:19 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eea75115ceso1104583137.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 10:39:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjYS80/uewpaG/zOFtotnVigCPv2Tog70iQ3oriK5t9Zmyn0Vvmn2YMxt7ZjYqnq7FQvWFe7RqIuA=@vger.kernel.org
X-Received: by 2002:a05:6102:3909:b0:5ef:a1ea:bd33 with SMTP id
 ada2fe7eead31-5efa1eabdebmr1058605137.9.1767983958883; Fri, 09 Jan 2026
 10:39:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
X-Gm-Features: AZwV_Qioy5rAVOHURSXprxm6XZTivhCttyw7ug7KaU5R8GoCdbMVCMnDP5LwuYc
Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
Subject: Re: [PATCH 07/22] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
> to enable proper initialization and control of the DSI hardware.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -486,6 +486,18 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD("cru_0_pclk",                   CLK_PLLDTY_DIV16, 13, 4, 6, 20,
>                                                 BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD("dsi_0_pclk",                   CLK_PLLDTY_DIV16, 14, 8, 7, 8,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk1",                  CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk2",                  CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),

Please move this below, to preserve sort order (by _onindex/_onbit)

> +       DEF_MOD("dsi_0_lpclk",                  CLK_PLLETH_LPCLK, 14, 11, 7, 11,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_pllref_clk",             CLK_QEXTAL, 14, 12, 7, 12,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
>         DEF_MOD("ge3d_clk",                     CLK_PLLVDO_GPU, 15, 0, 7, 16,
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("ge3d_axi_clk",                 CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
