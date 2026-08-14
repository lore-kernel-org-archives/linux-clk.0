Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7FB45DF67
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710741; cv=none; b=JQNYCRwOgnqZCVE6kXDBVEgH4LVKMbpO37yZoUT0msJhB/gtFWLUUmvs//l1g/o9jDA2O9EhUM+dWmBDGS8/pC393xb7mmyX117cLKbSnWaPlVmlHo9BAZyxNrkkgbPPBmXUC8Kf15BWl/PLvHR6s3VIBoLzZh9vyWwulQtkUGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710741; c=relaxed/simple;
	bh=sxaBBBN0zEuMV865K0dBZi/0kgS7VdceuSbNoNUPIq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONqDggzbcsNs4xlsYDtHI3Vc4PBPBCdYEanGenp1kiB++Vl9EIe6241PImb8IKXewuyS7O9Tzcn9qlXn/bnQEKMoQws98PU7thPAVpScrX18UgzTwregp+icEt9fWdjz0ZWDJlQ8yWmwim3tsvyoCOpTyLV04UseS8GW9r5cNwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1275181a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786710737; x=1787315537;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MwFvu+QAfOdqUmiQz3HyTrV8yaD0qjlQFuANuOajKio=;
        b=my7M2NdGcTop87PcS2hQqPZh+PfYQ+kNjfwHOUuYgNNYZMmSm9RZPGjGxM1QEDM8vv
         VlBAWYNUUbauWRlA6sxUdDEsYSBB3Wo1JbTXh8IoWgJHiBPLWup5ytVa/vB+eLr8bn6W
         gJPz0v9gGCZuR/iZX3ewMWtZmgqT+GyOKmA+alKqvSB5+zZqmHQUS9xy88zjb1HKghb2
         Jd+3Fd7shUQr0NKxHIC6jpdFG09hCSr8U7/zMiuEAHpXsJOztgUaqKW2VMzN6SuHY0BO
         1oxbXvRqZJYYA+ABkWdqANW6IiLRzP4XUsnuIaK7B2NIy8yqdBh88oK4n11bw74jxuyn
         FVDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWppQdrzEUYbqFNdzmccudafgKYPgJCeuQiyMGT6BenrsDOsytVugjJhaEfvx2shrRIdFMr+77Yj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIVZ/9VXL5qDgPUxsdQAJzZ2I1uWVS+nL3yI8Vua+kUuBF83R1
	nMaoYnxhKJT48KE2aKJ33WSzw1WRysO3zNQqByt3Lf/mqFwxBBZBJvR5ccK2OYwPwRU=
X-Gm-Gg: AR+sD13NnsAxoIGAHXv/z3r27/OkFEaoBQG7ohGtVn6xYsn267RZnt+SFnwPwc3QOmO
	v/fHBGFibJh96NiRHiuns3Yx41oejaCghennkFId0gkvLuFAN+T8Su0o8uVkE/oYhAPbzl48RTa
	3gdRFobQTxhNKer9EI6Y6eActHCcQx7HshWNOvZ6fktex/k2oJ5HFuIL6j7MvrpKRwiGK8CLPow
	B9lggqAmzu/7llyR7uhYJ9swloteDFU2zXkaugXUmLOapRXsBr53AIhz9PfV3Qs2Ei3dc3NRTXN
	uKJY5PBK9BoXBF60fHEVk8iLi1WGPjS4XiWzDa+2cqjOHNE06P5t1eZVjOdCNEbgSC/kxWj/kax
	DWaKPpP8k/StZxB3fZzC2EpylAwyyIaxkV+Y25Vlzpur0KsXdCQzmt9sJDEnpOLmqyv2WumLyor
	DTSCqJ5vgd2IHlri13oa4Ce7YmFIQg0TNIlZZrjnU2hD0mxafJ0gYBoAOS5xz0GxiTy3tn+yzBt
	QiJf9eVm5yAFvYNi41YDGSw1w==
X-Received: by 2002:a17:907:934a:b0:c15:deea:a178 with SMTP id a640c23a62f3a-c212a33b977mr232132366b.25.1786710736824;
        Fri, 14 Aug 2026 05:32:16 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c21233a18b0sm99749666b.8.2026.08.14.05.32.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:32:15 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1275127a12.2
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 05:32:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqxAtgixwkv5FVuMpnJhak4nrxRf5+SfrLh5ug3AautKqjNQTRLFvavETP0iwW57Q+Sn9/kfBAQtOY=@vger.kernel.org
X-Received: by 2002:a05:6402:2352:b0:6a1:e8f4:8236 with SMTP id
 4fb4d7f45d1cf-6a38a9b342dmr2549519a12.21.1786710734920; Fri, 14 Aug 2026
 05:32:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com> <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 14:32:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
X-Gm-Features: AUfX_myLNki-Fq81a3NfDSUS9sVpJd6vtqPz5Vj64H1v1xbp8C0TezxjP2g5L3I
Message-ID: <CAMuHMdViJB2qvzbOkX7exqpq7gF4tbBcNYMHmCmEXHSh6AYfew@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] clk: renesas: rzg2l: Add DSI divider clock support
 for RZ/G3L
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
> Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
> SoC, which requires a different divider implementation than the existing
> RZ/G2L DSI divider clock.
>
> The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
> DIV_DSI_B, where the effective divider is:
>
>   rate = parent_rate / ((1 << div_a) * (div_b + 1))
>
> DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
> and DIV_DSI_B is a linear divider with values in the range [1, 16].
>
> Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
> rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
> the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Introduced the macro DIV_DSI_{A,B}_SET and used inside
>    rzg3l_cpg_dsi_div_recalc_rate() and rzg3l_cpg_dsi_div_set_rate()
>  * Simplified the divider to "(div_b + 1) << div_a" in
>    rzg3l_cpg_dsi_div_recalc_rate().
>  * Replaced the data type u32->unsigned int for the variable divider in
>    rzg3l_cpg_dsi_div_determine_rate()
>  * Moved the declarations of the loop counters inside the for()-statements
>  * Updated the comment sections in rzg3l_cpg_dsi_div_determine_rate().
>  * Updated loop logic in rzg3l_cpg_dsi_div_determine_rate().

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> +static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
> +                                           struct clk_rate_request *req)
> +{
> +       struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
> +       struct rzg2l_cpg_priv *priv = dsi_div->priv;
> +       unsigned int divider = dsi_div_ab_desired;
> +       bool divider_found = false;
> +
> +       if (dsi_div_target) {
> +               /* Calculate DIV_DSI_A and DIV_DSI_B */
> +               for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
> +                       unsigned int div_a_tmp = 5 - div_a;

So div_a_tmp is the actual value of div_a... That is confusing, so I'll do
s/div_a/i/ and s/div_a_tmp/div_a/ while applying.

> +
> +                       for (unsigned int div_b = 0; div_b < 16; div_b++) {
> +                               divider = (div_b + 1) << div_a_tmp;
> +                               if (divider == dsi_div_ab_desired) {
> +                                       dsi_div->div_a = div_a_tmp;
> +                                       dsi_div->div_b = div_b;
> +                                       divider_found = true;
> +                                       break;
> +                               }
> +                       }
> +               }
> +       } else {
> +               dsi_div->div_b = 0;
> +               /* Calculate DIV_DSI_A */
> +               for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
> +                       unsigned int div_a_tmp = 5 - div_a;
> +
> +                       divider = 1 << div_a_tmp;
> +                       if (divider == dsi_div_ab_desired) {
> +                               dsi_div->div_a = div_a_tmp;
> +                               divider_found = true;
> +                               break;
> +                       }
> +               }

This is basically the same code as in the other branch, just looping
over a single value of div_b:

    unsigned int div_b_max = dsi_div_target ? 15 : 0;

    for (unsigned int div_b = 0; div_b <= div_b_max; div_b++)

> +       }

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
