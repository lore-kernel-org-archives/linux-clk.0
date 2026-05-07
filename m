Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF6736655B
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 12:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157999; cv=none; b=fNokjZSamNUp6DthGJvewhMg+3Mi/047rvQcFg/TPVWjPWWexVqtTBELsCE3TIJKcneuJbeEB3nVM5+eDXrSbMa53K8PY42LIx5a+SiFQCN7rFU1ZOAnEngxjLW4G8ww0s9lGumbLHGFSLAIzTmHq1SXki2FZ0OPc3pB77wwrG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157999; c=relaxed/simple;
	bh=WQcsCfXBVgz/c/y5hkF2s/14dwVl7k3U3PuuA9anBr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gd7xLkvaWF0r3GsTeWQLI75EYvBnrHF8eLepxfsxzkJ9rEFk6tImf/21aULburuE3BeVyfZNx4BUcVsHw4k6yykrhBSdHkzypnPNVvink4sBDjdfG+GEj/oIg1Qq/bUckieDa3KqHbkly5cyDPU0FgozekNIlhb+o/0u3+Ei3hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b936331786dso96895066b.3
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157997; x=1778762797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMoCH2XgRGmeYWuHVMU3wW5pIafd9En9VI/xZpgNjvI=;
        b=K987Xw98Sbp4h+kmMokVpS7HxoxTJCmPkUi52YEHFnsDy3gh1sLj8NZPnFwKJ7Ft+1
         S7ti42OiuHYraUOToku3VxNlTwtkPtuq40ct+fKdzj1mTVKmvwq76VOakT/fE+cmyDNU
         L4K9XtBQGKuRD0sWbW7E4ED4d2SFV+hBWhN/bGiBy6qbTqp+va51znOqVzU4M3uPSfox
         u4ODM2KFt/DRhDES+bNGbF85iW+8OtCfmNWemD2saPWLqwPRJdxCtTmcxE0TrLybx2XZ
         oGMuD6bQci0JqYfJXi/O/9JQ5dwqhGE3vPFA+tkd59ufZILD64ywvgSArW7wq3C+I+xd
         I2Zw==
X-Forwarded-Encrypted: i=1; AFNElJ9tjBkMcfxJCwQNAIlF7pSpXaHvNsKQGrBUFmA+2k7DOVlnTmjANQZBgu+inQ1CrrT9mlZrXKS1J+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgk6Nvi3UNMOw+ZvWfqJtJgvraP3XSEHHSUdIA3l+CRO7qVuaO
	7IXdyzSwQYAiB5VkRO7kk+fMfE7kcOo51oi3LRnr3xw3mcvEmuq4DMuNpncm3LdKXcs=
X-Gm-Gg: AeBDieu7Lhj4lP0BBP8W0sDGQ6BF9mQK2jDKjIPXHzM+/nL1MBZu3ufgizVhqAGCov+
	DACTmvGVQsxwYcX095XAqonvbZFhrOZleqaRt+wRihfh+P9XUTBa45GBTWb4f6aCdZUR8m4sp2v
	hFA/UIpRl35HpYDbtwuaz4vLqucHWXDDj3jMaRK8ELqXfdTi4wYAmKqkY6KsXmTXpcI4S3ThfJR
	5NdnLRT3wH6Y+zwLiDet9ZU8OWgP01LZf3rFVBe7cnbnksKYr9UOG+9tQufjrxYT8hBo6k2dQEI
	v1ZWaBAQ0v1AG7/gM3PFwn3i7LjiPdCqtMokg6OVfLoHJtFkYJhAoVhSdyPXtfc1RjzOBrDZcIE
	SvjHHIG7+h+PsmzwtkjGbA1yyUA36Ffdi4nPfAI6lCOiLW6x7Y03aZ7UCfUukmwIC1OHdJUlWFe
	mwEoCLPfJ0bNEk38LSulvFNKvBqxWGLihpJvon+vyZHWvlpkC6C/O6Zv8t+olsjQKQOERTKSA=
X-Received: by 2002:a17:907:1b1a:b0:bb8:fd89:4a30 with SMTP id a640c23a62f3a-bc56d1373c0mr488824566b.31.1778157996159;
        Thu, 07 May 2026 05:46:36 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc83364e33bsm79918466b.31.2026.05.07.05.46.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:46:35 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso585358a12.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:46:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/2PW2L5crGJ009DgeaMwN/uDLQvIR6S+3ojdqM1GFsMRo5+dQb92sKWNgENWxjlJI2Z7l8OEKsKnc=@vger.kernel.org
X-Received: by 2002:a05:6402:46c8:b0:67c:7618:7c2e with SMTP id
 4fb4d7f45d1cf-67d63d8550fmr3393847a12.8.1778157992777; Thu, 07 May 2026
 05:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
X-Gm-Features: AVHnY4KZhHToYCwxjA3QFx4b-ubcRlYhXK1ceM_rJBkJvo-JZ4N6lUhOd36bIiI
Message-ID: <CAMuHMdV6KBSzVWZ_zSu+_p9MCK7=ZCv9hbKTo90w7n9C4nJJdA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a08g046: Add RSPI clock and reset support
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset definitions for the three RSPI (Serial
> Peripheral Interface) channels on the RZ/G3L (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -168,6 +190,7 @@ static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
>  static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
>  static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
>  static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };
> +static const char * const sel_rspi[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };

OK if I drop this line...

>  static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
>  static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
>  static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };
> @@ -199,6 +222,9 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
>         DEF_MUX(".sel_rsci1", CLK_SEL_RSCI1, G3L_SEL_RSCI1, sel_rsci),
>         DEF_MUX(".sel_rsci2", CLK_SEL_RSCI2, G3L_SEL_RSCI2, sel_rsci),
>         DEF_MUX(".sel_rsci3", CLK_SEL_RSCI3, G3L_SEL_RSCI3, sel_rsci),
> +       DEF_MUX(".sel_rspi0", CLK_SEL_RSPI0, G3L_SEL_RSPI0, sel_rspi),
> +       DEF_MUX(".sel_rspi1", CLK_SEL_RSPI1, G3L_SEL_RSPI1, sel_rspi),
> +       DEF_MUX(".sel_rspi2", CLK_SEL_RSPI2, G3L_SEL_RSPI2, sel_rspi),

... and s/sel_rspi/sel_rsci_rspi/ while applying?

>         DEF_MUX(".sel_eth0_tx", CLK_SEL_ETH0_TX, G3L_SEL_ETH0_TX, sel_eth0_tx),
>         DEF_MUX(".sel_eth0_rx", CLK_SEL_ETH0_RX, G3L_SEL_ETH0_RX, sel_eth0_rx),
>         DEF_MUX(".sel_eth0_rm", CLK_SEL_ETH0_RM, G3L_SEL_ETH0_RM, sel_eth0_rm),

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
