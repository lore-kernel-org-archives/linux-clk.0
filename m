Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83471179A3
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533066; cv=none; b=FCaoL3jtLifq4ayJd/BaOJK5fC2o6tmMRIcibnuf5sdxJ+xX2rIF+qqME/MNQSNR08xc5cTTABhD3X9aW/btlhynWHDtfvWG06hWLs5mpOFhExJ3xULHxFEnUNZbY0Xb1XwWljjTWEUSGLVS2SEYDy9q0hNS2DLfwPro8HR6Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533066; c=relaxed/simple;
	bh=ApmXkWimEbhFrJhxmnQ0tGJk1At79kMIOzPAwtwQJQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neMKTMs2yeka1oeZP0z6S5qzgdMhRBQCccBAK7RZ/dcvyIC/xy0x56WLlceWe864gAFrCVXrNXRXggvTRJQnHAiW9sWmWhi495nUi7WsVz7rJmba8qxzJXp0wNgfMb/PK/PEXma4HnpuJy9E008u4Fj19uJcf9V0z45OKRl7jGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-668d4751a3bso1386253a12.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533064; x=1775137864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56TPENpBYkVbPaYM9HCYrZsM2LvTOb5K6nYcvbleZG8=;
        b=QcuBV2UuM1bj+yad+jJY8wRyYbC6wlgGofYduXklbKFBAj76bOFZckooU/j8eAx1U2
         07QFxarxM0AdZS6aiaSnpI2LxpGEXigrJ61u9gnizoXQvJVfph8l7gigCFGfzhtJLvnY
         sJC1WE6u3DeLZScEhWvsxcyr/RaNCBjeK2dBaY0dYDhcUYGP5luzFom8hCW9hH2fgTio
         nADSb434kjzkM/Vv9mhInzl3IxeZ6R1sFroz8bAWlEdqnlTa3NDVXghQBitLiv/OB74l
         fRGqHwbkztaDnjZzHfes3yTBU43IgQDiOM82/LY48lsVXbFmnYA2MbUgOnZvAwXUkcq9
         YEHw==
X-Forwarded-Encrypted: i=1; AJvYcCX1rI4zQyiNj9tSsF7MnFoYkl/xScn2FB4vijYpiI/Wp4LDSR2mEzh2KZadmGiq4PyAATwXKZtqgms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBPtb363zM0a+a3cdT/CN8LG37bz/AtWzTZ6k0wm52KiRibsw
	+xzkrKMltQKIco+jttnoSJ3FUP1+jzzF6PKWUt73iHmXY8xr0SrB7x+fFWvOyu8yKzE=
X-Gm-Gg: ATEYQzy+vpYA6fxuV9t3LAi9s7UUixx8s01x9OPzyyhfK5lrCkb2+GSm4CkD4AuA8Q4
	hPp/EOC0FEqSwRTLTNf4rJt7pVBr78QvTnLdeCy5M1LedFi7bc3VO9DxqMJuKTVNhPBJbT5LEtm
	aUGRh2RgdUznnDXV4NfZbZLIC96Z4/FMP9LTdmlEApbsFwDMzYj3H7kTYP4gJt9K/6K2Q1CB4oO
	rMn3tB5x6yXI60WRV2zSqdLqKs0fvJDpeI75r6rArDZ7fT3fuGdkPBW9acOrOC29J5DB9l542cQ
	VX0EppgWX3dhe5vMSPTTHPmpQ0jwQvwLIlDv7f8Jh0zNNtlR7gqiI2Io4hZGSWLGg7liFhoke6A
	weJWA9ukJX2nD680ob8WG1O1nElxV4FZ72SYzZgeenRTIERzvnfY2nlrel/Jz5HvRbekIN2jvbU
	DD0LAbDG9FbAQDsAe48SAilDv8UY0U8j/eAgqBOAIgFeCEoFs172r/JdB9pfXx
X-Received: by 2002:a17:907:1b05:b0:b98:a49:a237 with SMTP id a640c23a62f3a-b9a3f161781mr526040666b.6.1774533063575;
        Thu, 26 Mar 2026 06:51:03 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef95csm117045666b.52.2026.03.26.06.51.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:51:02 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66b1019bb55so140579a12.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtZgn5PbcAJCu2pZkMRVHji1jCPiJs72pQjL+LyW/GmTSh1U1quZ39rCnweK5peE8eZ9RsBFHE+So=@vger.kernel.org
X-Received: by 2002:a05:6402:5294:b0:660:a2df:ad1 with SMTP id
 4fb4d7f45d1cf-66a8262758amr4825424a12.7.1774533062546; Thu, 26 Mar 2026
 06:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:50:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrn6XVmnE=QeF4ByJc6=_AV=-0hbhG6DK2mjzyzzV2QQ@mail.gmail.com>
X-Gm-Features: AQROBzC4WZlINfrg7Ep9cwJ-vM8or7JcDcyPMGLbIWeq-F-wcEtFpIaRMEEqRBk
Message-ID: <CAMuHMdVrn6XVmnE=QeF4ByJc6=_AV=-0hbhG6DK2mjzyzzV2QQ@mail.gmail.com>
Subject: Re: [PATCH v8 02/11] clk: renesas: rzg2l-cpg: Add support for
 critical resets
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Some reset lines must remain deasserted at all times after boot, as
> asserting them would disable critical system functionality with no owning
> driver to restore them. This mirrors the existing crit_mod_clks mechanism
> which protects critical module clocks from being disabled.
>
> On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
> some peripheral interrupts to CPU.
>
> Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
> allow SoC-specific data tables to declare reset IDs that must never be
> asserted.
>
> Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
> resets and deassert them. Call it both at probe time and during resume to
> ensure critical peripherals are held out of reset after power-on and
> suspend/resume cycles.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
