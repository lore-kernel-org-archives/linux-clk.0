Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E958434405
	for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 15:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698093; cv=none; b=mBmmU/Ei4UuGCYTEo0LmwhaAh0bBcPFFouI4FYIU6S0FwnWBdDdNpz7aluBPmqu3g2RqLRYqDYFKQyUrx4JfrvmxywY05Ryyf6lWgUw3Cmdh0V3B+gP1YBRffsvG55OcFSTgUoO6HXlT6h6k/oQSMjAgnJN0OOB0WDOlTqd0zo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698093; c=relaxed/simple;
	bh=CFdTAzR79yXfBDC1ONgb8EApFd6MY6Wqry/8rdfiwAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRHjkaynJGnG61CfMMQ1mBLOzqczCNfBsEFu8iRGpRNaB1JapFV+1RO1UXdJrjcrbo8thyqAwYwXysHIBXO1Iwda5+j/D3LPQ4KbqZcLnrQl5QnR1fCwsnhkjhzwSbb60bQVnQlIeGXebM0BJbTDklm9O+FHMhUNy9PH3+kadOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bfaa014978so299296e0c.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783698091; x=1784302891;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2U6x/iww/H8ZEzzPTn1u443SVDkdUDkemPt2sl91mi8=;
        b=a0lXylMh3dfE+VjRGoXXErsfDDsMs8Miat2ePteSap7BisDMMETOcyQ/EgYaF/BKQL
         sd+NX7lVAIVZbGgTSnuX2Ffb+rtUzI+qpQkaUmFVG+NsxWtZFnzNJemnH2y88WrCkNjC
         i23CB9SUdUTyDkOSPRS1B3URK6kcfWE2wlh6qhjoHTAtvFeeaKIgZfQeoGyoRTN7VV1w
         htudz63Nz6TNNjtGma3FSz1XbA8OTiV7EVq/l78jPJGXL35B3KTOMqbiSmQhZmA2QGRV
         gPGQLPPZHq5HDkzff2BHY6kOsPWjmPGdvA9JuzwZiVpv13DXpFhUIIlJHrAkwAO0yl14
         A95w==
X-Forwarded-Encrypted: i=1; AHgh+Rp1mp8wr62C7AwevSw4ufRyPVoKsSFcRtJJSf1EyAEVTAb2eyL2zCPBoA1BKgkX3rHPdBhC5+KxrPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7IY7GrneqyKp8ea79Ce97ogIpr+zIIYkybySH2pfjjisMHn8Q
	iLE6rZqu+6UEeRNJZX5uvhvlCt/cqm/+mMQGaGhwP8sQynTVrWyAW/gwQd67idXa
X-Gm-Gg: AfdE7cmMXaRHMOtJpebjBjsCiO4aWl6hJzOB0fCW+ktbe0o201ilnnYxdg/ODK3SBlB
	SsqJfgc9jyX4nJYnGQxEbSU8CNP2idIxhO8GlsUMk+A9Oo8zOHJHbWdVtd1/Vm121qz93nIZxq/
	BgUilgBBUnlQHcIDV7pNsWnk5fg9UTrXDDRufbCjoHqaaoY8R0fGL05DiWTD0nc910DCCqzXggp
	ci/6LMo1JKEFa9ZnFR9m8+WVPxYqdxpi2JjFvokcHFn1GtGIW2YXPBPGnjad1GCMrfk2xSkKnxT
	k+CqqhGsygE1soedqrLadnGbhiqJ4RNrodcycR/Wp/oHrmPTIBUd9fPS+as8qj8KK6iHzutUE2A
	mvIO8HyxZwob+jLaKWBmGUB2MlhzsCWDg23pbK9penX67HXxQ1mSlZDT6zvGiCI02Y8g3K8GOCg
	lrfuoP8FQp9tiGKhw/h5OQ7F4f3CfZwEdYz89FHOKe+nYe/al3Yw==
X-Received: by 2002:a05:6102:8001:b0:728:53be:7c87 with SMTP id ada2fe7eead31-744e0035e28mr7522673137.7.1783698091147;
        Fri, 10 Jul 2026 08:41:31 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6dea737sm5414887137.9.2026.07.10.08.41.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 08:41:30 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-73770fd1cd9so357434137.3
        for <linux-clk@vger.kernel.org>; Fri, 10 Jul 2026 08:41:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpYo8r6AxYOprSzMGbruY6/xoSjyGF46pvBoIwz2fgvvmnH7+z7UcoMFUxhPIqsQB9+YXVuCaECpsU=@vger.kernel.org
X-Received: by 2002:a05:6102:292a:b0:73e:c6a0:331 with SMTP id
 ada2fe7eead31-744e0047e5emr7225411137.10.1783698090391; Fri, 10 Jul 2026
 08:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com> <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260619164030.380098-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 17:41:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
X-Gm-Features: AUfX_mxkEJXMxlF996XBRlIvUc3IV1GcyKh0Tq2bOtqByG6LoBoIxI64SOtetRg
Message-ID: <CAMuHMdU9EtPKbhLB3rmH5SCpwxkuEM+1eFRHmUi+UBzDWQAPdA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: renesas: rzg2l: Add support for divider flags
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 19 Jun 2026 at 18:40, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for passing divider flags apart from clock flags from soc
> specific clock drivers.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
One nit below...

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -112,6 +112,7 @@ struct cpg_core_clk {
>         notifier_fn_t notifier;
>         u32 flag;

I think the time is ripe to rename this to core_flags. Or at least
add the plural "s" ;-)

>         u32 mux_flags;
> +       u32 div_flags;
>         int num_parents;
>  };
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
