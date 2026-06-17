Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF008380FD2
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690780; cv=none; b=id3xDa+fxsEkiN+54s3+A2WwlCAGvQTuUcv10sum9/MilcfIpFnAhW4DkHd4z//QMVoodVFxGwpDsXayK9uCqbDZb0MQ08OhnF890V53tZb1MFQOw7ziNJBj+vgAmxyOgOCReaSsTNGBVdE660/7YBFc/SlyjqjptQz4cCZEunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690780; c=relaxed/simple;
	bh=NBj1YiJugs3AlafyrUeHVh/u6KhoB/ett9CLqIWPL7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrThqceBJFeoc2br0KH7UDPuz/hO6gLRH7gIBCPFvs88NmVEGkPPlPiX+MWDOzTQN3IqjClMpSKho8EjmniChZjL5V/e4xtZnvZ794Mg/fiVy48XqY08TUaOFTPwQp9+PBT89wnvC1FL2FXJsbVxOsd/budz40NCZzdrCcpGrPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59f8a140a51so3591513e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690778; x=1782295578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/VaeWQDm3vXVlskudp+NZaXeXqiWlY2esM7Su4qAUzM=;
        b=WzMlNiwpspxHCtWv8TJoW+1f/zov0cqzdwjF5+39vi6p+WJNk5agcYaZMiqE/POVC9
         PU6gHx9jR66CozhRadVSVbopOFVBeiOUp9irPSmj4F63/d4W/z01X/OjDX7pY5X3Dsw6
         ZCWCwkYWOHxQZI0E3gooVhZ8F4adQcW6stmABreR0Xyx/+3dJoChb+o+1UGyBc1WsdA4
         qVllKkMNyg1b4HLGU9UQF5j6L0xS/orKCJbiWCgDhSuimRcOocDRbQoovczKeetLrd9Q
         bKdpUGZ4zgBvmEDKkyqAHntuuwEP1jkrjZ+Luq2n6pNSuqovwOG8HHFOXBOLGFT8g+Bg
         t0YQ==
X-Forwarded-Encrypted: i=1; AFNElJ9N7AVtBHDn1ARLhrBGxihWrbzJE2bIkb4hJAI1/iPgOthBkap0YtzjtvfQJkRIi9TxcHxjvGIP4K0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBAWqwmS8+Gv9OZF2ixu+ejrxfXkTeaPe5A4UljxSQPzWfESzZ
	ThFEozUz8kcLrWur1djH0OgPpcFmCIh/k/Z4NTiJ5MBX+BVwTYwWDVe0THTTg2bq
X-Gm-Gg: AfdE7clBKcjH+58fZyRId2aY3Ag6u/RObyKQ8UnUr/RF2tEUpUX2gyTLe+TxchD18U2
	PClQJx6fjxrqKn1myA+bIDUnUtCJhgOQeXf7KPv9DLKNTjMZZRmwDXoaRu3p0HzwsMcMm4KSR65
	BwzWFP8dbbHQP267yxp/ou1OGr0H6qi5FKVAlAM0vYxDe2QWa104aM43vh0u2/G/Szi6k5VZq/z
	xCKiNHt617p4j2TR047R/SGhhpm7bn3eZSMz07oKVfL7qr6bl2hNFCPqOKlMza0y4DGJEPTnDfc
	KtP5tnKEN6E4GMTuTM9RYB42ZOutOd2K+vW2q1SlnbaNC52ZQmjJ6RsYV29WexjmFcct7+KlK2h
	92aFcoFXNmjD6Xn4DIejNvSv2xPh8moK7rSVe1EQ9LNijlUwSEqDX5bsRJ+r8FESQyKH5OBEFoN
	2q0MGvqHz60x68HStfIkMMCh1erqj9hyR8prEm1OOg/YrVpd53sQ==
X-Received: by 2002:a05:6122:3c4c:b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-5bbbe60247dmr1492824e0c.10.1781690777810;
        Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbca9bcc34sm205340e0c.6.2026.06.17.03.06.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96387efc30aso3622433241.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 03:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+/6o/DzM75T/o7bD4SZ/z/skifkcejVLveRj6l5tcyDfNKDGZTFFEiOeJiVlXVQkEAWRq9t0vrtPY=@vger.kernel.org
X-Received: by 2002:a05:6102:688f:b0:62f:3e1d:a55a with SMTP id
 ada2fe7eead31-7245cfe81c8mr1616278137.2.1781690777077; Wed, 17 Jun 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 12:06:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
X-Gm-Features: AVVi8Cets1-ArzRwsMw_T-p_ZzilvzmMs96iuC7Y-2iJnpSKywpmvUNNJpZxE04
Message-ID: <CAMuHMdXWakkMRf_kEZfyhpNoZnnOY30mZ07cgNMHyvMZBLHJSQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 12:48, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - In r9a09g077_cpg_lcdc_div_determine_rate() made use of
>   clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
