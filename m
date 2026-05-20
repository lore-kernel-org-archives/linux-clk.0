Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D13A4F35
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264555; cv=none; b=MJMxHFDqHqHBLXDU5NHUpi0Ksp6zDahtT0bQzOxL38FI+KB3ACFzet/BRngKOTME9XfAddjezNkdY/AHFbTRW6r7UDyX/i8/4YyRhvQ6QOUpCqbsO5MMtvIbAeZJJRHMTopuQiE4KvrnYJBGaxPI2vP+p8X7oHasrANcRGvTrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264555; c=relaxed/simple;
	bh=43paf5cDb3CO+Z9mDkg/D4V5hF13GuV8SaLe2Di137w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cq/IDllrFTaxsnLd+2kzkfuy9Ha1BSwY9j7ub7/RRikTT2pWMf9dHnIsDmQEpkR5SrR6wexHukyf0Xax36+S2y4hM3BrGuMoVN7+8PhD0WrUxhW/iOIU9Vv/cWvruzStXBrlEYxTJsBBCKMjwwfYQ6g73932bbZm7FoVgXKjL/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6314c3818baso3560153137.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264552; x=1779869352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98iWXm37oeIZJPcRwOA5t0U2vMQXmomEgxuUhcgETnA=;
        b=hXs5Uhtpcyi0qdzDrBgVKhEa57P8Ro58ThdB1f/MW2/WIWtl/ChFF40c2xnMB4v/dw
         X+S3RM+1/E0LG9m/+tpLz8qdLmHi6+4FpT1F4sJTAMUM2HA7QGeRdt5Ky4ObCB+X+CxM
         PVzDBkiSVu7jvbpsdQbZXhKQ3EDUyEZ/J2ffhXYrW0zG6zJiomOTcMuu4czpLUdX+jgt
         4pgcRclitnlesXC/JTqIdJ+KI0ebp4ZJjMkSuk/objPfubDl8FMdZxz484n+GPih4SW9
         au6RAF5Vqf90UpHm7tVkX2QxwKasxrtVgrcjLAD33Vt1nRxFImj9HuFHFDYhqQSIaPJY
         ai1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9wFOlMvgRWjqClGG9XktbsIhJxauriSSULYncyMMWyTfVOGkT2y/tdJylUybTL0ImmnQtxvPuEptA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvj3VY+RjPUW8Ky4VHVgppQ3B1DZrbo7zWxiKJeFp7wmtuuKgr
	l9xWHUoSLdoS8G09f4Cy7O+CQF1TuT5Onr8DHjByKPf5/vV29U5lelxhz7ruw3U8aIE=
X-Gm-Gg: Acq92OHOK0jEzvTXvfUQmfxNEW1ZmWn2MA1P82n+9RxRYFifEYqBD0eueymCF0NgAS8
	ogERuiu5MlOJY8wrxnyUwfRVGKmGmeVpHJna0pGlMbZ251zh6KYrJ9JOHD/RUm3Hm5Qktc5dUCF
	t+ZC4iDFLHd+mD9mhCzhIdYUHWpQlVtz9KNvYlzVbuoFwZH5r8MM+LkwIR+Bz1b2yawt6O4OfWf
	hhui7rpcEljDwz6OgwhK/XEEH/YKI6OJJAWiGcfTiYUxYrDljFDT+BeulMrUeNuCGBti4kHhKfR
	cJaeb1a6DhSdpO//lsQWvleLj5nuYzrIYaXEMg6NaNq0cP6tZZ2eavLDaM5V1euBusju3EGEkMl
	2dHrdXTsFIfkQSFW09t7U1v1Lf1nnqVMynV9vMATxWdbzv/hfVt5EwNT1HvlGp4qIkVPxKYjgY3
	4DRV4r2NdpvSsUtiFo5rBfwRF3YpTimtPmrJqA8Kpx872+6s9tg+JMDYHwJ31Hy9/X1ZB5OqwgT
	gg=
X-Received: by 2002:a05:6102:2910:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-63a3996686emr12098528137.0.1779264551895;
        Wed, 20 May 2026 01:09:11 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2f8aed0sm8040911241.8.2026.05.20.01.09.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 01:09:11 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5751a9020faso3476452e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 01:09:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9p3FxryD9HWniotgZIlEo4H0DiqwEk8ct8gqW8c3Nx39GgAXDt3pFpPy2hrotPXrMs/Qc9IqjoWxY=@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:632:a084:c0f7 with SMTP id
 ada2fe7eead31-63a3ef80e90mr12544737137.17.1779264551194; Wed, 20 May 2026
 01:09:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com> <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519141518.389670-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 May 2026 10:09:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5MO=Yd_vWeMe4R52XNPQW=8qAH0te+62SeMBx3g3SGg@mail.gmail.com>
X-Gm-Features: AVHnY4Jdv__xMD4uqX0rmclGKJdz7gNLxB1vTLBnb24KZE9jBc4jZp50p-9Si-A
Message-ID: <CAMuHMdV5MO=Yd_vWeMe4R52XNPQW=8qAH0te+62SeMBx3g3SGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: rzg2l: Simplify SAM PLL
 configuration macro
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 May 2026 at 16:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the PLL146_CONF() macro and its associated CPG_SAMPLL_CLK{1,2}(n)
> helpers with a single CPG_SAM_PLL_CONF(stby) macro that takes the PLL
> standby register offset directly.
>
> This removes the implicit coupling between PLL index n and register layout
> and eliminates the now-redundant GET_REG_SAMPLL_CLK2() macro. The RZ/V2M
> PLL4 definition is also updated to use the new macro with its explicit
> standby offset (0x100), removing the local PLL4_CONF define.
>
> No functional changes.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Rebased to renesas-clk.

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
