Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952494;
	b=1q4kjw2zkbxRpMgLyVrtFkRnIy7ZtrfLP6DDlkLh9qTxTrMco8A0tfUEkoAXt3HrKan4
	 a+8hErMMvgBeg6s7VvOajE8Qhv7Mzs8mCqLOP5KC0PkTyVYT+t8+H6+wwCnhCb6+LRJN8
	 pow6J6bTdngI0owbSghF0jvx2DIhUjfPbI+yfjzwKmERNQJJ6ZyUPNSPrdxPbvVdqF4gX
	 3S02ISFeDTj1tNmsIqT8JKzwkkEUs+15v8F8WICpKRcW/piCAJD93kch2bT7D4Tm37yMw
	 3GBHLgUVD3yfSWvBQ+VIedpdjIn/KwUqPS0JSm/+JIw1HNAUsUHW/StGELhjg8RwRGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952494;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9n3N1yIikpCYIu+X6VsuHby7yUa6y7Py3MWjLaVcKX8=;
	b=pfh+2XF8uhuY3PzJTrlqOc07RnYZ3e2iAqiJqJSwuTR6NHKsZg3+NL7+glqVC6B1Dqik
	 TEk0UgNgFb2l9sRdRkEHa8oeSIrdMzefSrsfdS3UGsHoGqXnx7j13XVwRAlZibiNqGZgN
	 dNPWQVEWk9by2qpfRcXq97R8bU4o8x+gFdZYPU7NRoXuNVnJVDb+4HtirMWjOD94bf2iE
	 Mxl0MUuBrZcpN1C6kiXadaZIAz5JTwgufmgdY+g0j12UrI75Dkn/9mTffHamYp0GHd7d5
	 65RW9GdvKCYBUH5IylwW+kOZmDyCwOXswNxfUqkVdx8tqbv3Q7mGeJNOyQorMzHKtbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9694606A329
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 08:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9694606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99806b7d89aso1411378241.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952493; x=1794557293;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9n3N1yIikpCYIu+X6VsuHby7yUa6y7Py3MWjLaVcKX8=;
        b=BVgsw0eMxKAfA+Rxqfc6VFMaWNsqvTGh1dBBlvN3DKaBR7SwZJFwMJ/FTSg9CcaFta
         81Qpb29ahoqLUBIWlNGPMQIer6g+YTqU2yTZK8cK36mWrR4svF9LGbw3CD/YjQKyyhkV
         GYHJt/ZyGauBrnNLhqJRoKJoCXUI72hIqpGIIiPhrHWbxg+6/gud7MD5ps2xx61ccWrT
         AUbFXVZUCmvpojPqdKZTx+UuSc5jvEFX0OEzHN1p5XXON7ZgRGoJ1MfczEuKrJOm/JD5
         Q8iRgEnY0niFyXWLt+aRme4h8y9G6uoFSojjN4iDEJz2oyU5Os638IDA/jTY4zUbDiTZ
         ZrSg==
X-Forwarded-Encrypted: i=1; AKwUvBxuXAP0RXCF98/zurfrdWnR4dYWIMPZWukPuUD6qfHAUmtqbqrUOpiPTMM/K1XjIm98+OI1BONCUkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z942HxAkgZ9R0rzDxkRbhs04OKmxvX67MkYaieY4MD7OUtBkKhh
	5Ll3DVlhOyHFgIi3j78p4eQ9FQkLHtuuqP9n6EDmKfwbu69s+41YWEpZWPkq+B8CMBk=
X-Gm-Gg: AYBFou1v4NaH5QbC4Qm5dDXmm6LNFz8Eq3FhNBd+sbOPZV8Y98MkEDpJKueTU1HmrDF
	MRXJOy8gxnAw1VQ8Y/b3XThMnoBErpzww5V2Apl9XX3yUvqEULw1Y1uri1ZBiqGlfBswLwu3g4y
	6sZdQBKu45bA82hlWSNx0boL+Cc7wX6MN+DXQTKFQ2UF4PEaETZs8EtTwXJGWfjabawekT5S5eH
	hLH1esl8UfBHlbVJdTvxkAr/2pwDN0TZVQymaTlYdJCcMqB+gQP2+lvmWng81SwA1fdjYCftti5
	lnOqr5Q8EtWTWE6zfSBSiWDLEaG7cyLGAHzTvx/2i6IKHPSojBU0Fgu01Amw/5RvtWUM/AgaL3t
	qptfqqe6MNUjgF+vtInPIIj93XtQ2cAJXlmuueZ/XIr56V67E6Fi2RCv5vREgwwyad35OgJvcjJ
	Z7FhwL1+Y3I3rg30LS8uHG3b9qiGBcvR+qgGJSalwFXGgb0cBytFUPCLEbdwmYvmcRmZN7KwM02
	nZf2Tn3kcg5I7WzBaEPu/SYvk6Orqw7raeUDFtQuVQTw0rQZ2CpFZF6qmL/eP3ueJUADbpkBXlL
	bx3v7QvxVHMxVQjbzpM3fbMbPoxnswNPjbMRQ/m4SkcpkeE4mpd2i2nkXeX5ngEg1A==
X-Received: by 2002:a05:6102:6e88:b0:7b1:3ecd:3d8d with SMTP id ada2fe7eead31-7d2869bb014mr2086573137.7.1793952492677;
        Fri, 06 Nov 2026 00:08:12 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ecc650fc3dsm838924e0c.15.2026.11.06.00.08.11
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:08:11 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7c33cc572e6so306691137.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 00:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzwBirRNc6HZogEB3q5uPvG4RDsOleOp8ga9Ss4bZ7sestEL2OAlfV1TOtFvDp+Ttqep1AErycPGVk=@vger.kernel.org
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id
 ada2fe7eead31-7d287354e7cmr1863139137.42.1793952490879; Fri, 06 Nov 2026
 00:08:10 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
 <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com> <TY3PR01MB11346986F12DEE0E3370264C386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346986F12DEE0E3370264C386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:07:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWiCM3JXmqTzKCAPoZgNa2ouUgF0a739Vm2UDmjC23zow@mail.gmail.com>
X-Gm-Features: AclHuK_SUotAyJZdKz7d5Cmpgoj7rV-v-BlqVYe7acZYOqsrJWZuNWbULoxF0Eg
Message-ID: <CAMuHMdWiCM3JXmqTzKCAPoZgNa2ouUgF0a739Vm2UDmjC23zow@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Nov 2026 at 08:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > The 4/7 duty cycle of the LVDS path comes from the division by 7, not
> > > from the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.
> >
> > Note that the latter is not true in general: if an odd divider looks at both edges of the parent clock
> > signal, the output will have a 50% duty cycle (assumed the parent has a 50% duty cycle).
> > If an odd divider looks only at rising or falling edges, the output will indeed have a non-50% duty
> > cycle.
> >
> > > Report it from a dedicated LVDS divider clock type and let the core
> > > walk up to the selected parent through CLK_DUTY_CYCLE_PARENT. The
> > > reported values do not change, the mux keeps selecting the path, and
> > > its duty cycle constants go away.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> i.e. will queue in renesas-clk for v7.5.
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> >
> > > @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
> > >         return &clk_hw_data->fix.hw;
> > >  }
> > >
> > > +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> > > +                                                   struct clk_duty
> > > +*duty) {
> > > +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> > > +
> > > +       /*
> > > +        * An odd divider cannot generate a 50% duty cycle: the output stays
> > > +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> > > +        * of 7 gives a duty cycle of 4/7.
> > > +        */
> > > +       duty->num = DIV_ROUND_UP(fix->div, 2);
> > > +       duty->den = fix->div;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> > > +                                                   struct
> > > +clk_rate_request *req) {
> > > +       return clk_fixed_factor_ops.determine_rate(hw, req); }
> > > +
> > > +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> > > +                                             unsigned long rate,
> > > +                                             unsigned long
> > > +parent_rate) {
> > > +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate); }
> > > +
> > > +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> > > +                                                          unsigned
> > > +long parent_rate) {
> > > +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate); }
> > > +
> > > +static unsigned long
> > > +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> > > +                                         unsigned long
> > > +parent_accuracy) {
> > > +       return clk_fixed_factor_ops.recalc_accuracy(hw,
> > > +parent_accuracy); }
> > > +
> > > +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> > > +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> > > +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> > > +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> > > +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> > > +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> > > +};
> > > +
> > > +static struct clk_hw * __init
> > > +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> > > +                                      struct rzv2h_cpg_priv *priv) {
> > > +       struct clk_init_data init = { };
> > > +       struct clk_fixed_factor *fix;
> > > +       const struct clk_hw *parent;
> > > +       const char *parent_name;
> > > +       int ret;
> > > +
> > > +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> > > +       parent = priv->clks[core->parent];
> > > +       if (IS_ERR(parent))
> > > +               return ERR_CAST(parent);
> > > +
> > > +       parent_name = clk_hw_get_name(parent);
> > > +
> > > +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> > > +       if (!fix)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       init.name = core->name;
> > > +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> > > +       init.flags = CLK_SET_RATE_PARENT;
> > > +       init.parent_names = &parent_name;
> > > +       init.num_parents = 1;
> > > +
> > > +       fix->hw.init = &init;
> > > +       fix->mult = core->mult;
> > > +       fix->div = core->div;
> > > +
> > > +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> > > +       if (ret)
> > > +               return ERR_PTR(ret);
> > > +
> > > +       return &fix->hw;
> > > +}
> > > +
> > >  static struct clk_hw
> > >  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> > >                                void *data)
> >
> > Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*), perhaps the time is ripe to
> > add odd duty cycle support to clk_fixed_factor?  As duty->num can be rounded up or down, I am
> > envisioning two new mutually-exclusive fixflags parameters, e.g.:
> >
> >     CLK_FIXED_FACTOR_ODD_DUTY_DOWN
> >     CLK_FIXED_FACTOR_ODD_DUTY_UP
>
> For Renesas it is 4/7 odd divider
>
> For other vendor SoCs it can be 1/7 .. 6/7
> So not sure CLK_FIXED_FACTOR_ODD_DUTY_{UP,DOWN}
> applies? I believe if it is generic we need to pass
> both Nr/Dr for the duty cycle.
>
> I may be wrong. Please correct me if it is the case.

Right, some dividers may use other duty cycle values.
Looking at users of clk_duty, there don't seem to be many
that could make use of this...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
