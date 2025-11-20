Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F074C36921B
	for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651945; cv=none; b=nPGpL5f1gbBhKLXKhTSb/9X4N/GZoHOSHsEBf/I78jk24SqKihHvYFZyVz8nHSnRfdy/hpAfB5a8a3bqnnBB/sCS6j7r2MczDAs2s+y3sLbNPNPxiTyR/MHeAmxl3vgANdm7uwbYniISjAdxk7/ErfoSMpk7ukkDJlohnGJ5x78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651945; c=relaxed/simple;
	bh=x0YfausT0dtVh0geJfG+pdQ/lVBO/GpRPd2bsgRYwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKSmc1A9eZkbeNfE/zQylRvNaNXnwaz7l698hRUBlN5537fa7SHjsWZq3JjjLIOSCyxxmGrVr144MP+rakiMnwQLhAarjrFGT6qtKKT2RZPlF99YHxopVLyPnWoV6CH+gExNvEafKjMUgUgyAptgYhA9q1kJDBDhuzIXkKM5s9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so357554137.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 07:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651941; x=1764256741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub9l6qBIoXlIUbnmglQ/dhIf5gsVEoXOGghpcNa1o2o=;
        b=WhOwmJHL1aPipNqiodi+cQoDQOzaz9R/NO8HMRxQTkM8dYbPHfWhB+xOb7L/W48Iru
         IrwUsHE6zQaSUsKQTZwVDOh5Q047gaTVsGcz00f/K5eQDyfcOq0vmlLq/NJTvSMYHdhi
         q7rD827lACG2s4tHhT0gAHGNmOdJaeEhQCDIYzwpYVGef8C4HqHK+fEN5/xxN4pdZrSR
         ljFeCrB/RPhDfJMT2ruB/dh6vEbQjNpSiewTaG9Uxod3rQ8h63k2bWWX9Pp620oZiTLS
         JyhMEKVBqQXPhIJvE34ag0Ajet0ZolblAHhsXowz2SWUOdY3HAqur0KMdZwdQ5djBAHN
         O9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsCEoSwuP3S0vFaypsKKpJ6FJFs+laJntRJb4aPRkgEhTd0qlYOmRGvpDWB4PGBikw5Z9HzXkombI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ScP2hMvnHZACjZBVYVK+REixJOG1ETpjr7KrF14ud8oTaTQ3
	VDx2ECY3mT3FptU+FDMkzrkYgldIKlhXyez3nRZr1D4Vkyl5aEEsf62C0jou5XEx
X-Gm-Gg: ASbGncvb/Hdm7VzrFSRHTkIscXOirDD0SSN4nMOBif7rZWCPr3cJXUVPMWmUYqbGWVf
	2S5UWhNscVaWRMkNqOBX6LswHfGOOC0yms/JrLJEQ1q+sZUE4J/PCQsjzdDQKOs/ST74claTVAx
	n8wWc21R1AfbqDGH1eSjc58+FHotG3eDadzBs81OPo1xC8D0Hs0q0U+N2ITJ23v9yzouTUiNjA8
	nLcD0SPD6A7SL7Yw/EQQJQWf6Um+oE+wg2sRDfwTOaJGPv+fNXwTS+IDGI4JBhpADeR5NvbGbUx
	+slm7SFpGhvujJ3Rqb9OcZxzZSFn1v0DHn/KN/Hxh9dLwqqWlAs2zuhd/5sHZR36+0QmyzMyUJP
	6C3yepSSFTmZ0b0ya7poUQEIZmwmaOLF3Z7+W7KH7TOm3wHgKJfbdYtSW6hIKyk30ryJWTfr6gT
	JtQkJs5sNa6CJjLxEfpkCTyxjRed3WK+LEwIdWjgamrr09tuJOfk+0
X-Google-Smtp-Source: AGHT+IH6DAnEKP5tuI3rjecZxw31uHofq40dRvaABay4sZtIumsQjPuYjtIk63NF25swEVFU0DnXoA==
X-Received: by 2002:a05:6102:6895:b0:5d5:f6ae:38ce with SMTP id ada2fe7eead31-5e1c87551cemr641522137.45.1763651940933;
        Thu, 20 Nov 2025 07:19:00 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c5621d03asm1064082241.6.2025.11.20.07.19.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 07:19:00 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dbe6304b79so391039137.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Nov 2025 07:19:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXnveZ8v2x0Sy5shAUNv/ZXcRgfYItfKUEdEwIS26kuJYr7VKRv7PF6qR2+jN4jAMHw8KvA7BFLlts=@vger.kernel.org
X-Received: by 2002:a05:6102:50ac:b0:5df:b507:acc4 with SMTP id
 ada2fe7eead31-5e1c81dd242mr686147137.15.1763651940149; Thu, 20 Nov 2025
 07:19:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com> <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
In-Reply-To: <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Nov 2025 16:18:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
X-Gm-Features: AWmQ_bk9X-7xje-hq15MNOmoQx3jV91rBDyxVCLaD3AFsFSCe_bv9qxDdxdRCY8
Message-ID: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate restrictions
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hi Hugo,

On Thu, 20 Nov 2025 at 15:47, Hugo Villeneuve <hugo@hugovil.com> wrote:
> On Tue, 18 Nov 2025 21:27:43 -0500
> Chris Brandt <chris.brandt@renesas.com> wrote:
> > Convert the limited MIPI clock calculations to a full range of settings
> > based on math including H/W limitation validation.
> > Since the required DSI division setting must be specified from external
> > sources before calculations, expose a new API to set it.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -16,6 +16,11 @@ struct device;
> >  struct device_node;
> >  struct generic_pm_domain;
> >
> > +enum {
> > +     PLL5_TARGET_DPI,
> > +     PLL5_TARGET_DSI
> > +};
> > +
> >  void cpg_mstp_add_clk_domain(struct device_node *np);
> >  #ifdef CONFIG_CLK_RENESAS_CPG_MSTP
> >  int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
> > @@ -32,4 +37,11 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unused, struct device *dev);
> >  #define cpg_mssr_attach_dev  NULL
> >  #define cpg_mssr_detach_dev  NULL
> >  #endif
> > +
> > +#ifdef CONFIG_CLK_RZG2L
> > +void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);
> > +#else
> > +static inline void rzg2l_cpg_dsi_div_set_divider(u8, int target) { }
>
> Maybe use:
>
> #define rzg2l_cpg_dsi_div_set_divider(...) do { } while (0)

I assume you are saying this in the context of the kernel test robot's
report?

Static inline functions offer more safety. Just s/u8/u8 divider/ should
fix the W=1 issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
