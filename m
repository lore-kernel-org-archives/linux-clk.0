Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7330EF92
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906501; cv=none; b=a4umZoI0eCC0B+Nprws9eZR1Bz0L4po9RhjhPsQTAL5RjKmAJ+SUv+R4vHEZc1i6BrBw77oqp1lR8PwNaCYqPvgwh1V3XTB2HFR1W3+CrUxgsh9rdJb/4safBFkymsXYFEBtwXeUbWOxIDVEa/j/V3MrffmuNkR6yQjALNSfJJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906501; c=relaxed/simple;
	bh=Hq04kObq93XXeS9LDB/6/XRdQpPQjLswZ5QaoZ+rGI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQCjzkY/39ox7jp7RjEeXAFs77kdj7itF6edOaLhK9qrF06D034C3+7m26Ao4rUK8kB8iy4TbybT/u4ICVpBbmk813tHPmykkQbTYUJO8bsI0dhsvJYOBvVGVUx7duh1P2tY0r9pgWPN5jbonhZu10XotTGIfQcArSRaLvwF+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5637886c92aso305330e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 00:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906497; x=1774511297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30ZEsEZbPQ/xc3vgTCQIDJesXJzH1HlBQIStDOgSems=;
        b=d6TfVowUdSMejl7B7nfCXqnMKv1U/BlcWuxBSzALbCA7LnAM10FC698QgWKI+aGj5U
         Ccuq2NFdQr5x4YBnG7hgiaq6XCQafVZVYV7pHGNrgqX6ZmF6TPXNmGECUlKLtwOVfbxG
         se/ROnAL6mSOGAkNicB3nEhJ7WFScnsQfZZY3kLjxPLmMNRS0OYKCb6ta4CVM923wJhP
         9iCGRLy3RyWMrx9nAVtycxHCptzzrUsGt//dUU5ZdwzPzpyv+YMD3dQKhvCThPXWynoJ
         cLE7X4YTIGp3+LAp2HzYXWi4s7gxEgylphM064eB4ESxkbnyciS3VqrJSyQSDbvpf5GQ
         P2hA==
X-Forwarded-Encrypted: i=1; AJvYcCW+5drUaWkxH/QK2a7LCc+zRH95n+VeugT9PCTHbhpASmQUlF7qSrJ4kOc1pUt31LvXqYqZDa4etaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2GY2eQitPow5Qk67ctc3L29OVtB6tXCsN7pSiWSvLYcXF+fV
	d3cK53vnOUnYfW34Lprpnnm88CTplzuEqP3nZzA4us2aIgZ2A2FDMxM3pxPY6iqZ
X-Gm-Gg: ATEYQzwGzNmlADDbDE+sdDJqB5RcXf05ueiWkv0WPeia46RyuhM8r0mN2juAlf7H6OW
	yYbKjgcwGCu4iGaBM3uy2OYH0nKPu8sGFc48SJ/+Tf939/AmQviDDpsinY+ztXNKbxquSqb9tRN
	GIhXFmXbk1QJVUEUfHaU2b4JizSNGpnG3SKwTAy6IkAzbttF1rSme6cpyBjXogWUxJ6A3aMTSjk
	L1I084Ut15Cxp7n32c4zpa2rmFgxg/6vWHVcA0jRdz3DoP74xnf7s4X7F2PLACodB7OVRy8+uNb
	gsxpIrw1OA1NJ49dMUxENam0tjhVlaf6FTrNuJ8Iw6hYFHq3befqbuMU9ssYJu7FR5gpjFlqUNT
	YKBdxzTK9uRmiYktbHArvbOgSzKgdfCpipTtubyAADPZ7TORgwgvwngzBQrXRkyGLbNEQXrvio5
	pbtbuEmXgRG7yFevx3k5rawl+SmY+VLdhxMD+UJfritVsiByUFdkRVyRLwtqkxCjJQ
X-Received: by 2002:a05:6122:83e5:b0:559:5ef5:b196 with SMTP id 71dfb90a1353d-56ba71c8419mr3478930e0c.13.1773906497027;
        Thu, 19 Mar 2026 00:48:17 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ba705cb2asm3336500e0c.14.2026.03.19.00.48.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:48:16 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56af73db66bso235696e0c.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 00:48:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuhzETgG+oqxPDcJww/qV3Uuwdne4ZLFEUY67qf+Zz+CIowNrJD/oOHYVj3S8HkdUkeWp3PMndyaQ=@vger.kernel.org
X-Received: by 2002:a05:6122:133:b0:56c:c71a:e09a with SMTP id
 71dfb90a1353d-56cc71ae292mr1737576e0c.14.1773906495768; Thu, 19 Mar 2026
 00:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
 <20260318084151.122674-5-biju.das.jz@bp.renesas.com> <CAMuHMdXmM-mGiuJmF9CSv5DkSDT17eJZPOP-y8SoE6OdhYdwBQ@mail.gmail.com>
 <CAMuHMdU=2i=cDYoYnWztMt2aBRHqfh_66E82LD0gR8baL4XRmQ@mail.gmail.com> <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113462B4D62B13F22516EBDED864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Mar 2026 08:48:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
X-Gm-Features: AaiRm516m6RPC7PwV0xruJw-z5uax23l18idJqkrg-9rcrHX9hU2xMW25nLWINE
Message-ID: <CAMuHMdVtsK0wZJENtF4qM2K4zh_J9EtOfds+MMBG4FSw2Y1Bqg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module
 clocks during resume
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 18 Mar 2026 at 18:06, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 18 Mar 2026 at 15:54, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 18 Mar 2026 at 09:42, Biju <biju.das.au@gmail.com> wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > After a suspend/resume cycle, critical module clocks may be left
> > > > disabled as the hardware state is not automatically restored. Unlike
> > > > regular clocks which are re-enabled by their respective drivers,
> > > > critical clocks
> > > > (CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG
> > > > driver must take responsibility for re-enabling them on resume.
> > > >
> > > > Introduce struct rzg2l_crit_clk_hw to track critical module clock
> > > > hardware entries in a singly-linked list anchored at
> > > > crit_clk_hw_head in rzg2l_cpg_priv. Populate the list during module
> > > > clock registration by checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.
> > > >
> > > > On resume, walk the list and re-enable any critical module clock
> > > > that is found to be disabled, before deasserting critical resets,
> > > > ensuring the correct clock-before-reset restore ordering.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > > > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > > > @@ -130,6 +130,12 @@ struct div_hw_data {
> > > >         u32 width;
> > > >  };
> > > >
> > > > +/* Critical clk list  */
> > > > +struct rzg2l_crit_clk_hw {
> > > > +       struct clk_hw *hw;
> > > > +       struct rzg2l_crit_clk_hw *next; };
> > > > +
> > > >  #define to_div_hw_data(_hw)    container_of(_hw, struct div_hw_data, hw_data)
> > > >
> > > >  struct rzg2l_pll5_param {
> > > > @@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
> > > >   * @info: Pointer to platform data
> > > >   * @genpd: PM domain
> > > >   * @mux_dsi_div_params: pll5 mux and dsi div parameters
> > > > + * @crit_clk_hw_head: Head of the linked list critical clk entries
> > > >   */
> > > >  struct rzg2l_cpg_priv {
> > > >         struct reset_controller_dev rcdev; @@ -186,8 +193,26 @@
> > > > struct rzg2l_cpg_priv {
> > > >         struct generic_pm_domain genpd;
> > > >
> > > >         struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
> > > > +
> > > > +       struct rzg2l_crit_clk_hw *crit_clk_hw_head;
> > > >  };
> > > >
> > > > +static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
> > > > +                                          struct clk_hw *hw) {
> > > > +       struct rzg2l_crit_clk_hw *node;
> > > > +
> > > > +       node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
> > >
> > > This ends up allocating quite some memory to store just a single
> > > clk_hw pointer.   Alternatively, you could use an array and size,
> > > and grow that using devm_krealloc().
> >
> > Upon second thought, you already know how many there are upfront, thanks to
> > rzg2l_cpg_info.num_crit_mod_clks? You even already have an array (but it's __initconst).
> >
> > > Another alternative would be saving and restoring all clocks during
> > > suspend/resume, like renesas-cpg-mssr.c does.
> >
> > Another alternative: rzg2l_mod_clock_init_mstop() already iterates over all module clocks during
> > resume, so it could be modified to also force-enable all critical module clocks.
>
> Looks this is simple. I will send next version based on this
>
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index f9e4af7f49d0..eeafbfe3c725 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1601,8 +1601,11 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
>                  * module is in invalid HW state.
>                  */
>                 scoped_guard(spinlock_irqsave, &priv->rmw_lock) {
> -                       if (!rzg2l_mod_clock_is_enabled(&clk->hw))
> +                       if (!rzg2l_mod_clock_is_enabled(&clk->hw)) {
> +                               if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> +                                       rzg2l_mod_clock_endisable(&clk->hw, true);
>                                 rzg2l_mod_clock_module_set_state(clk, true);
> +                       }
>                 }
>         }
>  }

Looks good in principle, but there are a few gotyas:
  1. rzg2l_mod_clock_is_enabled() does not return the hardware state
     if there is a sibling (but that may not be an issue, I didn't check
     the actual critical clocks),
  2. rzg2l_mod_clock_endisable() takes &priv->rmw_lock, so you have
     to move it out of the scoped_guard() to avoid deadlock,
  3. You need to move this to the top of the loop anyway, else it
     doesn't work for critical clocks without mstop,
  4. Probably you want to rename the function.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
