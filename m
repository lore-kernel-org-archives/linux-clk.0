Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E42D7DD5
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 16:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443959; cv=none; b=hgOcgUaAmTNzXbMg7pDn19/Fo7Z8Ant5IBcsnHcYpOQRCxJmpfue3B31v4K0jTvnKNT1QyMgTcleigF2KyKSF8JSup4wjCrmc+1eJWwsqmVuapJZLAg5BNlGZDvq0ehb9//Tju/PvTlAbnh4rHHnWeHh3+uo+ycX92SXjxXX8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443959; c=relaxed/simple;
	bh=ZVEYPIdz79RWr1ln7aRsRkIDCN/em83Z6vA1u5GyPPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMoMtbYTia+RSeXAD5Ag69QQKL3DwRKVZgBr3vHXc5qX7RefWlUwZeG6rxQJtTcLiMhzwF9Mzvsz4CLN9fM18VR/BnXHSgeVcO1tmbat7+BK9QmYXxCyk1HelNawT1gbAIf8QnkXmBuBdOc0f3Qho4cOA59IdGW88hnSxha3TYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56373f07265so3649266e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443957; x=1770048757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qznwophNIFvx/Vkp694TKOz6iGJDGxAq1XnuuR3raPY=;
        b=RAuNz5eVAb0/YXSW8UFaDe1BTE8QvsVNDezUKp9Jztzd1R47CohoJEW46MqMQCp4UB
         3UgNj2Fy8s4XdurX5EzSBdNaZOBsKlsdBMkyx3yXeTxaYr2LDesvXzv/JQXgYBu5ijHJ
         LvvFs6e17r67UQZVUaejefFaNWc7cycsHA0IAps3B1jJjkl6aiyDG88h4yWMfbMvqfsn
         FunhrYRvCOr5GQZIQBKp1a6CT7frFNdo9vci8WleWZ7G9FFGm/yoXMbPwKuJbCJZEH+1
         mg70TbThjpFl6xGWdo+W//yym2xilntkp/Hp/9JMks3dtzq3WxwDI1abdDD0KEWrRahN
         Wk2w==
X-Forwarded-Encrypted: i=1; AJvYcCWUyoBqav6j+4IvHYi+AM3vcL0C9eggmaxSjknf0zHMkMYuoe8RT0fozMjvbo1jYytVZ+mdT1cXA1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyM79H1EpuSTbXoWtIsRhwX9eUXoh3wunxm0l1wxWTLBaN71y
	bCB7znmIa2GTLQbJS3kYZqwtSBoOm41KRnjd9kqYGLkSd5TR6ihBMUeaTYRaq+N7
X-Gm-Gg: AZuq6aIaVbRZMW/VZVXmtQutf8X2cgbClJONPmdaIjmz0citSkjh/3xFg3y5f0ttypa
	Q6OBPB6K5h7Q7Dgf/VAiJGpwRANutktnZWLaRfxR8+LXSo/3UmiINFoixpTxMxam8Dd1whEKDkp
	IqV9KgI/LVYjGjKi/khI4y04W3D4BK93RMZJMxWeJQMg1x0z6FOqw9c/nTZkgzVSt/B0JXfUyv9
	z9/u8TvXPP1B5gnCaBv3o+8pfr8+Kjh2QKnB+nFcCOOj1rCwsvSIkjthoMexC+fNsUmWdge27QF
	LSUzJ1kwnFvaM9zxj+3sTDkmqQkwPnAlTtn25N95ak+1RCMDuJDeKBrFiS9TjJtwCSuSl0EPbHr
	XZNsrPjyjKFLeQAGtvRR34g1Rd06lZDKr5RvueUi+D/rMOTb4M89xiRSqrcE3dIst93zcz1iV+q
	b1p3MjN7M7xIskFfUzymhwjFrYHvG//gf2I9k7nkWxcEeBbZKk
X-Received: by 2002:a05:6122:1d03:b0:559:79d8:27a5 with SMTP id 71dfb90a1353d-5665c6dd713mr1511192e0c.0.1769443957235;
        Mon, 26 Jan 2026 08:12:37 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa632e3sm1821114e0c.4.2026.01.26.08.12.36
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:12:36 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f548b7ab61so2182958137.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:12:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWu0UEVPRh5kFu1qoj2JCHz85KnWKrfqDOW2hZbpONzhSkc8iS8grCON1xRpbS20szcVwAPZET90io=@vger.kernel.org
X-Received: by 2002:a05:6102:ccc:b0:5f5:3f97:58df with SMTP id
 ada2fe7eead31-5f5764a857fmr1465004137.27.1769443955874; Mon, 26 Jan 2026
 08:12:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com> <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260120150606.7356-4-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 17:12:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVB490OOVY6B2Y6DORnWoc0LYvafLKAoRSOqFFP_nybOg@mail.gmail.com>
X-Gm-Features: AZwV_QjuRevvHvM3o_QLjPDxA4Vw5PVnFEn2Vv2g6csusKMTyFdOTWDc-v6Wjt4
Message-ID: <CAMuHMdVB490OOVY6B2Y6DORnWoc0LYvafLKAoRSOqFFP_nybOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: versaclock3: Add freerunning 32.768kHz clock support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Tue, 20 Jan 2026 at 16:06, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Versa 3 clock generator has an internal 32.768kHz oscillator that can
> be routed to the SE1, SE2 and SE3 outputs. This patch exposes it as a
> fixed-rate clock ("vc3-clk-32k") and makes it available as a parent for
> the SE1/SE2/SE3 muxes.
>
> The 32.768kHz clock is only intended to be used when explicitly requested
> (i.e. when a rate of exactly 32768Hz is set). Selecting it as a fallback
> for other rates can cause issues, for example in audio configurations.
>
> To enforce this, introduce a new helper function,
> _vc3_clk_mux_determine_rate() which rejects configurations where the
> 32.768kHz parent would otherwise be chosen implicitly.
>
> Two new fields are added to struct vc3_clk_data:
>   - clk_32k_bitmsk: bit mask for selecting the 32.768kHz oscillator
>   - clk_32k_index: index of the 32.768kHz clock in the mux parent list
>
> They are used by clk_mux callbacks to select the appropriate parent clock.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/clk-versaclock3.c
> +++ b/drivers/clk/clk-versaclock3.c

> @@ -1038,6 +1087,14 @@ static int vc3_probe(struct i2c_client *client)
>                 return ret;
>         }
>
> +       /* Register fixed 32.768kHz clock */
> +       clk_32k = devm_clk_hw_register_fixed_rate(dev, VC3_CLK_32K_NAME, NULL,
> +                                                 0, VC3_CLK_32K_FREQ);

If you have a system with multiple versaclock3 instances, I believe
this will fail for all but the first instance, as clock names must
be globally unique.  Upon closer look, this is the case for all
other clock names in this driver.  See e.g. commit f491276a51685987
("clk: vc5: Allow Versaclock driver to support multiple instances")
(and subsequent fixes) for how to solve this.

> +       if (IS_ERR(clk_32k))
> +               return dev_err_probe(dev, PTR_ERR(clk_32k),
> +                                    "Failed to register %dHz fixed clock\n",
> +                                    VC3_CLK_32K_FREQ);
> +
>         /* Register pfd muxes */
>         for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
>                 clk_pfd_mux[i].regmap = regmap;

 Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
