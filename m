Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550745FFDF
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710862; cv=none; b=GXkn/Q/Zs5Hz8ONv9/8+F7psSeTSeDNybt82335Db35E1yc5kznU44hkOBkiuG8hb3gMwwX/B+nhJ8fYLxXB6zhkX+pLV4lRGsp5U3CeZ5YBBuTx4lybbYGCtYhcsdyGLa7v5PaoJZ/01ukmh1vWsWtkwXoMQyAVBsmhmwga9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710862; c=relaxed/simple;
	bh=8fm1wQqNdK8Pqh1xZ0Yz/MAvNolCHkHoVBPeugbRbLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKhZOxmJ2jTTsiZTM5G/wbTolrdES/YwbDh00jAx8LxbzhKPrsTzlJsJTuicPVMyx7frz7/0PFVxw7Jo898+UqnQagWwuVzx3e0Nx0RJQ+h46f432fkfM2ULZq28qgNSsJ40y/M4iE8HqpLlPYWHWY/0+zdODKRePml5y8/eME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so1436909a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710859; x=1787315659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5jTjhdgDgezOGQJNdD5S+MhkhGYZML4+d+xIz3mpVms=;
        b=aGD5zkEIatVgYopLc8KPprcGAzt5b6R2Cm3Cxa0p5RqbdkEj+kUD83AT7cv1fJwHCD
         s7XW6xdAxm+UL+lEZwnovziKjya+iex7B+aO9mkTUj4vRiNJDlEqnTcF6Xq56NAsjNwk
         bIsAskMVFSE7NxR+sGNEClwEgUbQTgOBhHricTmKLgkD/DqdXTRhPKPaf8BYsELqxGiv
         kBWN/fR6hAmOQLUEt2+S77DKRwsBkgUNfRRsLn2VOU5SvoGS39+XFCw2i1SFZIrGlWxH
         KJZWU7S6oauruObFmm1UbeylX0sYlGlbPNEmaa8MLiz3Spzf1q3zvSQS279e7mkNOcwf
         pFwg==
X-Forwarded-Encrypted: i=1; AHgh+Rrb1s/D5iyjqiEotMPNnhw/FrYcxfYpPd5jxR/JrecZd32CcsJ8S4TXTace9fZyxupLEGOaLWf4K94=@vger.kernel.org
X-Gm-Message-State: AOJu0YycEJ9kt0SEtYgW3VYRVjvbU1ujoBzCMkVN2vITSKdm8dY7yRLr
	fv5a2kf1KKhsA9y8yN2J+/v2sW5ZVkmGpeL0z5dZLXL8VTfWseMahqj2JwFVCuTp2RM=
X-Gm-Gg: AR+sD124b7se4MUnCJr6WkUoDVxVCi7uO29EFY6giAyTPDsS9lKY6pGxEWgFxLBTl5I
	W/eGG8pmvrCA9ES2xbkyX1DHd0773Df+4lYjDSzfy67BvQ/sivArmvFj9QOFsA0YIgBTLEwCLT9
	g5/7Tj/ExUEOoyK1aSl0wgmZM7jtZ71O4K8n+DBYtMwkQxD4n7nMNe34HHybmq1CvdVSSMY8EQn
	8Fr59iodq5Paq4rdXA2uiObiL24HKKRlDaRM3Ra1SqCql0pE/x46+gXQO4chtSxA5O16S9kcjHY
	QY3bDcFpDX57JsMAzwfUTMcfK1Gn0nW2uo9ht4qsenXErfAmYu+KnBk6zDzaoQ1rr7iZapJGw7o
	WFYa6rbBEVSyNrv5ADYDMwBi054NVSfu892jPxt1zfMrPqn9NZ/68wTN1g2ECeBmLq5g7JR379l
	Fd8HJCRT2cXyRHXxVyqw5SILAkH2CZ22ZKKC+EYHthf5ZblPnsOuFXIlh2I+AidohvGzya33egS
	JbhvnfI07+gF2dH2olBzL1Mk4wYtrLRjMT+
X-Received: by 2002:a05:6402:52cc:b0:698:e614:e4bf with SMTP id 4fb4d7f45d1cf-6a38a83c062mr2254112a12.0.1786710859104;
        Fri, 14 Aug 2026 05:34:19 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38c9d5f49sm740103a12.2.2026.08.14.05.34.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:34:17 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so1436764a12.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:34:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RptKLGP0s7kvNNnJ1kOWWVyMJZ6wHaqZ881gmV2tWpMkjjX7eYA/E9UJ/Pqmw5cwFagMkg0Sr/ah+w=@vger.kernel.org
X-Received: by 2002:a05:6402:c286:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a38a96199bmr1711549a12.10.1786710855432; Fri, 14 Aug 2026
 05:34:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:34:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
X-Gm-Features: AUfX_mz94vfWwhgBn2FgWCEksiaALpbjVla2lJItINWmnEhbnvNVKgSFjzFn1qk
Message-ID: <CAMuHMdWu5AQM_x+0JviyhHpA_8GrvOs4cjtMtavUz+JVuYvE-g@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] clk: renesas: rzg2l: Add support for divider flags
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Aug 2026 at 20:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for passing divider flags apart from clock flags from soc
> specific clock drivers.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Collected tag.
>  * Fixed a check patch warning by using (_div_flags) in DEF_DIV_FLAGS
>    macro.

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -112,6 +112,7 @@ struct cpg_core_clk {
>         notifier_fn_t notifier;
>         u32 core_flags;
>         u32 mux_flags;
> +       u32 div_flags;
>         int num_parents;
>  };
>
> @@ -168,11 +169,18 @@ enum clk_types {
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, \
> -                .core_flags = CLK_DIVIDER_HIWORD_MASK)
> +                .core_flags = 0, \
> +                .div_flags = CLK_DIVIDER_HIWORD_MASK)

This can be simplified to:

    DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, 0, 0)

I will do that while queuing in renesas-clk for v7.4.

>  #define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, \
> -                .core_flags = CLK_DIVIDER_READ_ONLY)
> +                .core_flags = 0, \
> +                .div_flags = CLK_DIVIDER_READ_ONLY)
> +#define DEF_DIV_FLAGS(_name, _id, _parent, _conf, _dtable, _flags, _div_flags) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
> +                .parent = _parent, .dtable = _dtable, \
> +                .core_flags = _flags, \
> +                .div_flags = CLK_DIVIDER_HIWORD_MASK | (_div_flags))
>  #define DEF_G3S_DIV(_name, _id, _parent, _conf, _sconf, _dtable, _invalid_rate, \
>                     _max_rate, _clk_flags, _notif) \
>         DEF_TYPE(_name, _id, CLK_TYPE_G3S_DIV, .conf = _conf, .sconf = _sconf, \

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
