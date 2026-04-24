Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DAD339863
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014577; cv=none; b=khC+d499YI5ah5wil+9GYQhy06YTrlF+c/hG1GQdovGrVhjEM8sb5J+743M9UjIogwQ5jn8sml7uSSKt9PzqXHJ9v+anTsm17siFikqx1JUbHojfLGX9vrJp9gsJZr3V4sdPyuiN3qBWgFJ6mLm5FIXzNKuNvlioyoVdkK6wa4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014577; c=relaxed/simple;
	bh=GkpWGZCRoVZNIZOsBR6Vl09IGJoiPmQO5lO1FmzI5Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGoZCK723NR+Q233ZcRdMyPnAmYoGv91ma90PD337xJeOdNSwEcPOlANmr5jBkVHSzvkKGaRwMEsCCb8CuE/aB8A+m2wmCTObcK33Vj8BN2Reu7kmH8z1y825ZkOdSAEbKK8nvyLynSlXXrHHXADE9qUW1j8SpngueYF1uisHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso7287706e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014574; x=1777619374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPkYSejnXmw9q4iGicOigyxcdYu5HJtYWp9F83ylei0=;
        b=i31xmiyvHLaDkxBPEx6Eco0Yxe1QbH7v0Waweo7rkUojhPkP0ocr5klEyWyRZhuf/h
         x2DxG+mMh+pPoUSThp/MAma/JLcR8DmDfP7j2NEMAgLibAarNIcXFo4AZirVMbUnePy4
         bK6A2JXPMa5f+u6Xjv51438dZUvAsJB33wuREuWD5Ftr6OuI9t+Jkl33Pik1psTSt7EC
         s6E0GvCip7rTVO1q54+edCLDwSdItKGz63e6LYLh0WbX+pjGSBP6c/dZV8WXCaLwOFzv
         HGESQVhhFWxn17pX2BPWx512EwToAYFkH6Ij/loLns2imEZm9WgZC/4i2qkHJTDbVoNH
         u0yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hTMq6H0nwDOlxdSPylnbb4IEnO+Rup3pKUWaZ1sZUlAw5Ar3MQMaGz3qYc8zAYv2L/mt/18Lvs3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxctPAwPKPTY3Eg3UPVO9AX2W+xzIZI71HGag8JFW5BQU4GX491
	0nJpWPn0BHnyiLEXadsYP841Gal41mOfruYEZELRmHfeS1dQroNbquG2IGcun+rYrq4=
X-Gm-Gg: AeBDievUplAPryvGOe7D8o2zHH4jufQykJIBVYwEqQRLNnCMFpG7lRdGNOvQ0UiOgs7
	F1J3Btw2zbe35pdFJsR/8FH17XTvyk5a/dQdSQ3Yk5dccySjtYLPvjlWbQTPtJiUs3+JJ3eljdy
	mByoMFzS0Zkq0iFpGf7UHspSRI72A9PTGLZvBOzS9I5j3FE71LlUNejiZvu4PQyXyoCwOF9CjjZ
	f5XNwehprUFwQoTg9xagDULfhzH93GPD+vfBlkUACvmNl412tr+gbQTREdmN2sJOJu76+8KfdRq
	lX+eQOdi8m+yeVKRy/tPcgK2e85D97CS80PYuuYX77FbuqhDmBbcOjPHtfFzouUqHLswxWus1SO
	QZIq7otSsB1RDMdtMNTS5uCsJFtmfxH96nKtPjsIGA0ynUDbic7OsER4bOPzxu+My6Bxtsp6MUM
	AkLam2kguXomDCb4sn4HdZ/NxzrcHXo8BdKJ7WAd7+INphDHo0ohOZDs6+jNsTY6rvaynso3E=
X-Received: by 2002:a05:6122:4a11:10b0:56f:22ad:f5c9 with SMTP id 71dfb90a1353d-56fa5814bcbmr13449677e0c.2.1777014574364;
        Fri, 24 Apr 2026 00:09:34 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93513c6sm13718401e0c.17.2026.04.24.00.09.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:09:33 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so3635923241.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 00:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WVmdtAT5NBF8q9hKfDPe3FB24ZmzATGBl940FcJhLYTck2nV4UcPe4rYhYwj6OAzSbWxYu8rVOMc=@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:611:a5b6:f4d3 with SMTP id
 ada2fe7eead31-616f73fa0e4mr15265032137.22.1777014573418; Fri, 24 Apr 2026
 00:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-5-biju.das.jz@bp.renesas.com> <CAMuHMdU4wqFCNobN7mkMNCArP41cGmnbEi5cmuc576EdUL6+bQ@mail.gmail.com>
 <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1133200E7FF04200635988BF7862A2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
X-Gm-Features: AQROBzDUtnf3dn_P3bYBr8jBd6qU4D0kn93fKzIi5hCr6LiSyquO6mvHq-_4xdc
Message-ID: <CAMuHMdX-S3V=+1JCEj6PAY=w3KNzMyPJfvaHZ8U86z8C6aELAw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 23 Apr 2026 at 13:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH
> > > 0-1) IPs found on the RZ/G3L SoC. This includes various dividers and
> > > mux clocks needed by these two GBETH IPs. Also add tx, tx-180, rx,
> > > rx-180, rmii, rmii-tx and rmii-rx clocks to r9a08g046_no_pm_mod_clk
> > > table to avoid enabling both normal and rmii clocks by the PM framework.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a08g046-cpg.c
> > > +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> >
> > > @@ -86,6 +140,17 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
> > >                     500000000UL),
> > >         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
> > >         DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
> > > +       DEF_FIXED(".pll6_div10", CLK_PLL6_DIV10, CLK_PLL6, 1, 10),
> > > +       DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
> > > +       DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
> > > +       DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),
> > > +       DEF_MUX(".sel_eth1_tx", CLK_SEL_ETH1_TX, G3L_SEL_ETH1_TX, sel_eth1_tx),
> > > +       DEF_MUX(".sel_eth1_rx", CLK_SEL_ETH1_RX, G3L_SEL_ETH1_RX, sel_eth1_rx),
> > > +       DEF_MUX(".sel_eth1_rm", CLK_SEL_ETH1_RM, G3L_SEL_ETH1_RM, sel_eth1_rm),
> > > +       DEF_DIV(".div_eth0_tr", CLK_ETH0_TR, CLK_PLL6, G3L_SDIV_ETH_A, dtable_4_200),
> > > +       DEF_DIV(".div_eth1_tr", CLK_ETH1_TR, CLK_PLL6, G3L_SDIV_ETH_C, dtable_4_200),
> > > +       DEF_DIV(".div_eth0_rm", CLK_ETH0_RM, CLK_SEL_ETH0_RM, G3L_SDIV_ETH_B, dtable_2_20),
> > > +       DEF_DIV(".div_eth1_rm", CLK_ETH1_RM, CLK_SEL_ETH1_RM,
> > > + G3L_SDIV_ETH_D, dtable_2_20),
> > >
> > >         /* Core output clk */
> > >         DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2,
> > > G3L_DIVPL2B, G3L_DIVPL2B_STS, @@ -94,6 +159,21 @@ static const struct cpg_core_clk
> > r9a08g046_core_clks[] __initconst = {
> > >                     dtable_4_128, 0, 0, 0, NULL),
> > >         DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
> > >                     dtable_4_128, 0, 0, 0, NULL),
> > > +       DEF_FIXED("HP", R9A08G046_CLK_HP, CLK_PLL6_DIV10, 1, 1),
> > > +       DEF_MUX_FLAGS("ETHTX01", R9A08G046_CLK_ETHTX01, G3L_SEL_ETH0_CLK_TX_I, sel_eth0_clk_tx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHRX01", R9A08G046_CLK_ETHRX01, G3L_SEL_ETH0_CLK_RX_I, sel_eth0_clk_rx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHTX11", R9A08G046_CLK_ETHTX11, G3L_SEL_ETH1_CLK_TX_I, sel_eth1_clk_tx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_MUX_FLAGS("ETHRX11", R9A08G046_CLK_ETHRX11, G3L_SEL_ETH1_CLK_RX_I, sel_eth1_clk_rx_i,
> > > +                     CLK_SET_RATE_PARENT),
> > > +       DEF_FIXED("ETHRM0", R9A08G046_CLK_ETHRM0, CLK_ETH0_RM, 1, 1),
> >
> > Shouldn't the parent be CLK_SEL_ETH0_RM (i.e. before the 1/2 or 1/20 divider)?
>
> Oops, I missed this. You are correct.
>
> > > +       DEF_FIXED("ETHTX02", R9A08G046_CLK_ETHTX02, CLK_SEL_ETH0_TX, 1, 1),
> > > +       DEF_FIXED("ETHRX02", R9A08G046_CLK_ETHRX02, CLK_SEL_ETH0_RX, 1, 1),
> > > +       DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
> >
> > Likewise, CLK_SEL_ETH1_RM?
> >
> > If you agree, I can fix this up while applying.
>
> I Agree.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2, with this fixed.

> > > +       DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
> > > +       DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX,
> > > + 1, 1),
> > >  };
> > >
> > >  static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = { @@ -107,6
> > > +187,50 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
> > >                                         MSTOP(BUS_REG1, BIT(2))),
> > >         DEF_MOD("dmac_pclk",            R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
> > >                                         MSTOP(BUS_REG1, BIT(3))),
> > > +       DEF_MOD("eth0_clk_axi",         R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_MOD("eth1_clk_axi",         R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_MOD("eth0_clk_chi",         R9A08G046_ETH0_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 2,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_MOD("eth1_clk_chi",         R9A08G046_ETH1_CLK_CHI, R9A08G046_CLK_P1, 0x57c, 3,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_COUPLED("eth0_tx_i",        R9A08G046_ETH0_CLK_TX_I, R9A08G046_CLK_ETHTX01, 0x57c, 4,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_COUPLED("eth0_tx_180_i", R9A08G046_ETH0_CLK_TX_180_I, R9A08G046_CLK_ETHTX02, 0x57c, 4,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(2))),
> > > +       DEF_COUPLED("eth1_tx_i",        R9A08G046_ETH1_CLK_TX_I, R9A08G046_CLK_ETHTX11, 0x57c, 5,
> > > +                                       MSTOP(BUS_PERI_COM, BIT(3))),
> > > +       DEF_COUPLED("eth1_tx_180_i", R9A08G046_ETH1_CLK_TX_180_I,
> > > + R9A08G046_CLK_ETHTX12, 0x57c, 5,
> >
> > Inconsistent alignment (more below).
>
> I tried to squeeze it into 100 columns. Maybe I should have split this into 3 lines??

No please. I'd rather keep it consistent with the other lines.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
