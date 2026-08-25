Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9A42640C
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660903; cv=none; b=EXR58OoPW7KW3Rn6JHgQ5NOcdtp2eD5cWYd3taDCu6aQlIxD6H+EctrZKfDeI2O7ewkoin5qX82K/Bn2BcyBFaJCLGfgleZ5euu0bJHPMfn/LNibhP3H2r+xfDqmwz6dWYhp5JUhXGpNdANqqq84PO1P3GWgVFuEg9sT1N9OIDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660903; c=relaxed/simple;
	bh=ok07ERH/NwgqhzqDl0baL8HLrodhlClduOLX6Z5TrNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jnf0dCG/XQ67lGCPpjVDeB2+o3kANrJGeRO8Blgpc2gWPecyMWM7gmqvnG9MgXbkBd35iBt7SteMwVBAtTnIUX1SYWtuoNvhctlIJYFubYuo34u1wkf6zEJbOzVSMOYp9RkwrWWB6EIecbfYvA7m1LtS/uC7wzoA85VwvE7OugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so1882399e0c.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660901; x=1788265701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PcH15y8twR6KC4dsUQbRnnIWb4o2clyuM/4NKdId/5Y=;
        b=jGZoScEOE8RZutoymB4kYLCK9CWzWchNftnvJl9EbgVi0zmJZQuuOaENrO12PbIdBg
         PTLj7/buhipMM8i22NlrPcjmel6HYiDyP8b/nAtWE5+Q8dNBc4V219vID0q5z86vtiHh
         JAcULr2nF+w68F1hggva+6893F1fQYQNg2eGO3OUkCp1DJLenVz/xoYuMf6e9Hbtw+5t
         lNhOUfsSrC5mMbJlGvF+LtvtDHe0N9AWeuh9zWP2HLaaFETLaAwAy6pqPc0hslsZj9Rh
         9SLCKeQ9uKjyIROS4kDzTSKDwCgL2qdGBuFejFpLiKZGrqnvHFwNvdoQIre2EE0PGYvI
         AqDg==
X-Forwarded-Encrypted: i=1; AHgh+RrgOhxu7ZjKF+5hkNNCPyW4GqFJIq26H/7CSR1SlnS3VG4YrNFcKlpfpeM/ZRWLtdYTOgxuD7tj/Fo=@vger.kernel.org
X-Gm-Message-State: AFuF++nkbmsJAGGQOT3c6DRFTPJFsVC5dgm8vjmh9oRNefgrIQnuRobY
	lhcsm2s8kC6G3ljUBNmPz6aLJZFAt0kJoQYdzT3ucM9Ip+qlQBPZA0HlBSQddbybp0M=
X-Gm-Gg: AR+sD10ODUOLrqZyCtJ/t+E0lBElqrT3QeafqhB7YCmJjRSLoyAtp0UgM2jadGcDEEj
	XxyAcBj0qejE/pvqLxNgpcj1AvQh10xfmSCXOUcfK6WpHIhHXqy6HSh/fYw6Al38FIikkbHxJIu
	3iafqm9gRSJdfOkKOrE6zEPTzGHtNCe/LmkL/0sNPD1OPoM+8ANwr+womaYgsz0RZDonEY9FHFT
	C7g2UmZLS+0JWFOMi/KqFJnvuzGlnfRe7qkUbjtx9t9oIH0/ju54J0b+94QhIUotWpO16x0i8Rc
	gim1v7TRVtJVeFtZhcOJXvv7KkbatuIeGtLXgRRsRGoDLgvz6iHhkSZcZSP+DeWdZJf49i8l586
	CaP0g0kJLsYNclLQMp9CpNc/z24+c88S5c/y3UhpSG5oR4THDslWn5daUx1/BGAMEP20FpQhDSq
	0xt/HSHfuNATuAU57QqflRFm90BV/gALKDN7Afm5QwB38+F5IHChc+5tH4wncxg2q2y4UZlS2C1
	OPeo5HOEjAdB6bx/J8k2Gp/rg==
X-Received: by 2002:a05:6122:46a0:b0:5c5:d531:2f4e with SMTP id 71dfb90a1353d-5c5ff7f198amr12826988e0c.5.1787660900848;
        Tue, 25 Aug 2026 05:28:20 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623d2fab6sm5912026e0c.5.2026.08.25.05.28.20
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:28:20 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-77bf892b496so867682137.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 05:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqkdCGbG1Emjx0oYNX+4V2oT/WbOox4wpd3zBsIasViPxSpz7I6mgrV2v8e00Ml0w+3D3uimKTcf4I=@vger.kernel.org
X-Received: by 2002:a05:6102:5094:b0:781:7ce2:1896 with SMTP id
 ada2fe7eead31-7817ce23603mr428191137.6.1787660899827; Tue, 25 Aug 2026
 05:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260817192540.423994-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:28:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
X-Gm-Features: AcwNN1UWpDCFj0N_VaU-Rs-_PsGCZWtHQVesPIowDRB6pC65FgGL5i3thBl2XoE
Message-ID: <CAMuHMdWmoHO2BETYFrKT68D8+Ma_t4NYiFZ=DyXnT-HeCJq8yQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: watchdog: renesas,r9a09g057-wdt: Add
 CPG/MSSR syscon support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> resides within the CPG/MSSR block rather than the WDT address space
> itself.
>
> Previously, this was handled by including a second register range in the
> "reg" property. However, this is architecturally incorrect as the CPG/MSSR
> block consists of two distinct regions (0x80280000 and 0x81280000) that
> contain registers for multiple peripheral blocks.
>
> Since the CPG/MSSR block is a multi-function block, introduce the
> "renesas,sysc" phandle-array property to allow the WDT driver to access
> its control register via this shared regmap.
>
> Mark the use of a second "reg" entry as deprecated in favor of the
> new phandle-array approach for SoCs that require WDTDCR access.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
